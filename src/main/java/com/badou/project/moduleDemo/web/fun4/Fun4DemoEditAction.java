package com.badou.project.moduleDemo.web.fun4;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
import com.badou.project.moduleDemo.help.AttachImgCaches;
import com.badou.project.moduleDemo.help.CommonAttachByAttachId;
import com.badou.project.moduleDemo.help.AttachImgCaches.AttachImg;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduledemo/Fun4/Fun4demoedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduledemo/Fun4/Fun4demoedit_form.jsp
 * @author xiangsf 4013-1-18
 *
 */
@Controller
public class Fun4DemoEditAction extends JsonEditTemplateAction<Fun4DemoEntity, Serializable, Fun4DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;   //一个类的唯一标志
	@Autowired
	private IFun4DemoService Fun4DemoService;
	@Autowired
	public void setFun4DemoService(IFun4DemoService Fun4DemoService) {
		this.Fun4DemoService = Fun4DemoService;
		super.setBaseService(Fun4DemoService);
	}
	
	/**
	 * 在页面上显示图片
	 * */
	@Action
	public void downloadGoodsImgCache() throws Exception {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			String tempId = request.getParameter("tempId");
			CommonAttachByAttachId commonAttachByAttachId = new CommonAttachByAttachId();
			String imgid = commonAttachByAttachId.findTempIdByattachId(tempId);
			AttachImgCaches.AttachImg goodsImg = AttachImgCaches.getImg(imgid);
			OutputStream outStream = response.getOutputStream();
			if (goodsImg != null) {
				response.setContentType("application/octet-stream;");
				response.setCharacterEncoding("UTF-8");
				response.setHeader("Content-Disposition","attachment; filename="
								+ (new String(goodsImg.getName().getBytes("GBK"), "iso8859-1") + goodsImg.getSuffix()));
				IOUtils.copy(goodsImg.getIs(), outStream);
			}
			outStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action
	public void downloadTopicImgCache() throws Exception {

		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			String tempId = request.getParameter("tempId");
			AttachImg goodsImg = AttachImgCaches.getImg(tempId);
			response.setContentType("application/octet-stream;");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ (new String(goodsImg.getName().getBytes("GBK"),"iso8859-1") + goodsImg.getSuffix()));
			OutputStream outStream = response.getOutputStream();
			IOUtils.copy(goodsImg.getIs(), outStream);
			outStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private File attach;
	private String attachFileName;

	public File getAttach() {
		return attach;
	}

	public void setAttach(File attach) {
		this.attach = attach;
	}

	public String getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}
	
	// 临时保存上传的文件
		@Action(interceptorRefs = @InterceptorRef("fileUploadStack"))
		public void uploadGoodsImg() throws Exception {
			HttpServletResponse response = ServletActionContext.getResponse();
			try {
				String tempId = ParamUtils.getParameter(request, "tempId", "");
				if (attach != null) {
					InputStream is = new FileInputStream(attach);
					attachFileName = attachFileName.substring(0,attachFileName.lastIndexOf("."));
					tempId = AttachImgCaches.storeImg(tempId,new AttachImgCaches.AttachImg(attachFileName, null, 0,is));
				}
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out = response.getWriter();
				out.print(tempId);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
			}
		}
		
		
		@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
		@DispatcherResult
		@Override
		public String edit() throws Exception {
			String id=request.getParameter("id");
			if(StringUtils.isNotBlank(id))
			{
				Fun4DemoEntity fun4Demo= Fun4DemoService.get(id);
				if(fun4Demo!=null)
				{
					request.setAttribute("smallIconid", fun4Demo.getSmallIcon());
				}
			}
			return "edit";
		}
		
	
}
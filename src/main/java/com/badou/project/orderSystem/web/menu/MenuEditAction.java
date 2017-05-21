package com.badou.project.orderSystem.web.menu;

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

import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
import com.badou.project.orderSystem.help.AttachImgCaches;
import com.badou.project.orderSystem.help.CommonAttachByAttachId;
import com.badou.project.orderSystem.help.AttachImgCaches.AttachImg;
import com.badou.project.orderSystem.model.MenuEntity;
import com.badou.project.orderSystem.service.IMenuService;
import com.badou.project.orderSystem.web.form.MenuForm;
/**
 * 点餐模块
 * <p>对应的请求路径是：${context}/orderSystem/menu/menuedit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/orderSystem/menu/menuedit_form.jsp
 * @author
 *
 */
@Controller
public class MenuEditAction extends JsonEditTemplateAction<MenuEntity, Serializable, MenuForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;   //一个类的唯一标志
	@Autowired
	private IMenuService MenuService;
	
	@Autowired
	AttachFactory factory;

	@Autowired
	public void setMenuService(IMenuService MenuService) {
		this.MenuService = MenuService;
		super.setBaseService(MenuService);
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
			response.setHeader("Content-Disposition", "attachment; filename="+ (new String(goodsImg.getName().getBytes("GBK"),"iso8859-1") + goodsImg.getSuffix()));
			OutputStream outStream = response.getOutputStream();
			IOUtils.copy(goodsImg.getIs(), outStream);
			outStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Action
	public void downloadImg() throws Exception {

		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			String tempId = request.getParameter("tempId");
			InputStream is = factory.downloadFile(tempId);
			response.setContentType("application/octet-stream;");
			response.setCharacterEncoding("UTF-8");
			OutputStream outStream = response.getOutputStream();
			IOUtils.copy(is, outStream);
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
				MenuEntity menu= MenuService.get(id);
				if(menu!=null)
				{   
					request.setAttribute("smallIconid", menu.getSmallIcon());
				}
			}
			return "edit";
		}
}
		
	

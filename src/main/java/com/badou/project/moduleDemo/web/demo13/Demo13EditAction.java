package com.badou.project.moduleDemo.web.demo13;
import java.io.File;
import java.io.OutputStream;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.help.AttachImgCaches;
import com.badou.project.moduleDemo.help.AttachImgCaches.AttachImg;
import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.kpi.dictionary.DictionaryLib;
import com.shengdai.kpi.dictionary.vo.Dictionary;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ui.ligerui.struts2.JsonEditTemplateAction;
/**
 * 功能1示例编辑
 * <p>对应的请求路径是：${context}/moduleDemo13/Fun2/Fun2Demo13edit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo13/Fun2/Fun2Demo13edit_form.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo13EditAction extends JsonEditTemplateAction<Demo13Entity, Serializable, Demo13Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo13Service Demo13Service;
	protected Demo13Form demo13Form;

	@Autowired
	public void setDemo13Service(IDemo13Service Demo13Service) {
		this.Demo13Service = Demo13Service;
		super.setBaseService(Demo13Service);
	}

	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@DispatcherResult
	@Override
	public String edit() throws Exception {
	 
		String pname = DictionaryLib.getSelectJsonByCode("PROVIDER_NAME");
		String pid = DictionaryLib.getSelectJsonByCode("PROVIDER_ID");
		request.setAttribute("PROVIDER_ID", pid);
		request.setAttribute("PROVIDER_NAME", pname);
		return "edit";
	}
	
	
	
	
	@Action
	public void downloadTopicImgCache() throws Exception {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			String tempId = request.getParameter("tempId");
			System.out.println("--temp+"+tempId);
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
	protected String versionApkId;
	

	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editAddUrl", location = "demo13list_detail.jsp")
	public String editAddUrl() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		versionApkId = request.getParameter("versionApkId");
		return "editAddUrl";
		
	}
	
	@Action(interceptorRefs = @InterceptorRef("pageJsonStack"))
	@DispatcherResult(name = "editUpdateUrl", location = "demo13list_detail.jsp")
	public String editUpdateUrl() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		versionApkId = request.getParameter("versionApkId");
		
		String resourceVersionId = request.getParameter("resourceVersionId");
		demo13Form = new Demo13Form();
		Demo13Entity instance = Demo13Service.find(resourceVersionId);
		demo13Form.setEntityToFormProperties(instance);
		return "editUpdateUrl";
		
	}
}

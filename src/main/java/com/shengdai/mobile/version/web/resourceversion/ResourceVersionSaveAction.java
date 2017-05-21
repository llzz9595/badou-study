package com.shengdai.mobile.version.web.resourceversion;

import java.io.File;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.base.support.struts.used.BaseSaveStrutsAction;
import com.shengdai.global.util.bean.BeanUtils;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.service.IResourceVersionService;
import com.shengdai.mobile.version.web.form.ResourceVersionForm;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demosave/save.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class ResourceVersionSaveAction extends BaseSaveStrutsAction<ResourceVersionEntity, Serializable, ResourceVersionForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2987551277598686619L;

	@Autowired
	private IResourceVersionService resourceVersionService;
	
	private File attach;
    private String attachFileName;
    private String attachFileContentType;
	
	public ResourceVersionForm resourceVersionForm;
	
	@Autowired
	public void setFun1DemoService(IResourceVersionService resourceVersionService) {
		this.baseService = resourceVersionService;
		super.setBaseService(resourceVersionService);
	}
	
	protected static final String REQUEST_PARAMS_PREFIX = "SDdetail_";

	protected JsonReturnBean returnBean;
	
	@JSON(name="rbean")
	public JsonReturnBean getReturnBean() {
		return returnBean;
	}
	
	@Action(interceptorRefs = @InterceptorRef("fileUploadStack"))
	public void resourceVersionSave() throws Exception {
		PrintWriter out = null;
		try{
			out = response.getWriter();
			
			returnBean = new JsonReturnBean();
			resourceVersionForm = new  ResourceVersionForm();
			this.setResourceVersionFormPropertiess();
			if(resourceVersionForm.getId()!=null&&!StringUtils.isBlank((String)resourceVersionForm.getId()))
			{
				resourceVersionService.updateResourceVersion(resourceVersionForm, attach, attachFileName, attachFileContentType, null);
			}else{
				resourceVersionService.addResourceVersion(resourceVersionForm, attach, attachFileName, attachFileContentType, null);
			}	
			
			returnBean.setHasOk(true);
			returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
			returnBean.setBean(resourceVersionForm);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
			returnBean.setHasOk(false);
			returnBean.setTip(JsonReturnBean.TIP_FAIL);
			returnBean.setMessage(e.getMessage());
		} finally {
			if (out != null) {
				out.print(JSONSerializer.toJSON(returnBean));
				out.flush();
				out.close();
			}
		}
		
	}
	
	//下载附件
	@Action
	public void downloadFile(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String resourceVersionId = request.getParameter("resourceVersionId");
		try {
			resourceVersionService.downloadFile(resourceVersionId, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//删除附件
	@Action
	public void deleteFile()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String resourceVersionId = request.getParameter("resourceVersionId");
		boolean flag = false;
		try {
			resourceVersionService.deleteFile(resourceVersionId, response);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject jo = new JSONObject();
		jo.element("result", flag);
		PrintWriter out = response.getWriter();
		out.print(jo.toString());
		out.flush();
		out.close();
	}
	
	/**
	 * 将request中参数值设置到form中（按form中属性一一对应，不包括集合），
	 * 同时将返回一个Map对象，该对象是转换后的request.getParameterMap(),去掉了ligerui应用中特殊的前缀，
	 * 使用时不再需要该前缀获取值
	 */
	
	protected Map<String, Object> setResourceVersionFormPropertiess(){
		//如果有SDdetail_前缀的数据,需要去掉该前缀
		Map<String, String[]> reqParams = new HashMap<String, String[]>();
		Map<String, String[]> srcParams = ServletActionContext.getRequest().getParameterMap();
		String[] values = null;
		for(String key : srcParams.keySet()){
			values = srcParams.get(key);
			if(key.startsWith(REQUEST_PARAMS_PREFIX)){
				reqParams.put(key.substring(REQUEST_PARAMS_PREFIX.length()),  values);
			}else{
				reqParams.put(key, values);
			}
		}
		return BeanUtils.setProperties(this.resourceVersionForm, reqParams);
	}
	
	
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
	public String getAttachFileContentType() {
		return attachFileContentType;
	}
	public void setAttachFileContentType(String attachFileContentType) {
		this.attachFileContentType = attachFileContentType;
	}

	public ResourceVersionForm getResourceVersionForm() {
		return resourceVersionForm;
	}

	public void setResourceVersionForm(ResourceVersionForm resourceVersionForm) {
		this.resourceVersionForm = resourceVersionForm;
	}
	
	
	
	
}

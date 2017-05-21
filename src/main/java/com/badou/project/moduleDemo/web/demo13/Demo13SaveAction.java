package com.badou.project.moduleDemo.web.demo13;

import java.io.File;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.base.support.struts.used.BaseSaveStrutsAction;
import com.shengdai.global.util.bean.BeanUtils;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demosave/save.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo13SaveAction extends BaseSaveStrutsAction<Demo13Entity, Serializable, Demo13Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 2987551277598686619L;

	@Autowired
	private IDemo13Service Demo13Service;
	
	private File attach;
    private String attachFileName;
    private String attachFileContentType;
	
	public Demo13Form Demo13Form;
	
	@Autowired
	public void setFun1DemoService(IDemo13Service Demo13Service) {
		this.baseService = Demo13Service;
		super.setBaseService(Demo13Service);
	}
	
	protected static final String REQUEST_PARAMS_PREFIX = "SDdetail_";

	protected JsonReturnBean returnBean;
	
	@JSON(name="rbean")
	public JsonReturnBean getReturnBean() {
		return returnBean;
	}
	
	@Action(interceptorRefs = @InterceptorRef("fileUploadStack"))
	public void Demo13Save() throws Exception {
		
		PrintWriter out = null;
		try{
			out = response.getWriter();
			
			returnBean = new JsonReturnBean();
			Demo13Form = new  Demo13Form();
			this.setDemo13FormPropertiess();
			if(Demo13Form.getId()!=null&&!StringUtils.isBlank((String)Demo13Form.getId()))
			{
				Demo13Service.updateDemo13(Demo13Form, attach, attachFileName, attachFileContentType, null);
			}else{
				System.out.println("saveAction");
				Demo13Service.addDemo13(Demo13Form, attach, attachFileName, attachFileContentType, null);
			}	
			
			returnBean.setHasOk(true);
			returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
			returnBean.setBean(Demo13Form);
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
		
		String Demo13Id = request.getParameter("demo13Id");
		
		try {
			Demo13Service.downloadFile(Demo13Id, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//删除附件
	@Action
	public void deleteFile()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String Demo13Id = request.getParameter("Demo13Id");
		boolean flag = false;
		try {
			Demo13Service.deleteFile(Demo13Id, response);
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
	
	protected Map<String, Object> setDemo13FormPropertiess(){
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
		return BeanUtils.setProperties(this.Demo13Form, reqParams);
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

	public Demo13Form getDemo13Form() {
		return Demo13Form;
	}

	public void setDemo13Form(Demo13Form Demo13Form) {
		this.Demo13Form = Demo13Form;
	}
	
	
	
	
}

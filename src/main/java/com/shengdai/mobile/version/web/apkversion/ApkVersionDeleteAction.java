package com.shengdai.mobile.version.web.apkversion;
import java.io.Serializable;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.base.support.struts.used.BaseDeleteStrutsAction;
import com.shengdai.global.Globals;
import com.shengdai.global.util.StringUtils;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.service.IApkVersionService;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
/**
 * 功能1示例删除事件
 * <p>对应的请求路径是：${context}/moduledemo/fun1/fun1demodelete/方法名.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class ApkVersionDeleteAction extends BaseDeleteStrutsAction<ApkVersionEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4569198397073810141L;
	@Autowired
	private IApkVersionService apkVersionService;
	@Autowired
	public void setFun1DemoService(IApkVersionService apkVersionService) {
		this.apkVersionService = apkVersionService;
		super.setBaseService(apkVersionService);
	}
	
	
	protected JsonReturnBean returnBean;
	
	protected Serializable ids;

	public void setIds(Serializable ids) {
		this.ids = ids;
	}
	
	@JSON(name="rbean")
	public JsonReturnBean getReturnBean() {
		return returnBean;
	}


	/**
	 * 执行删除前事件，交由应用实现
	* @Title: exeBeforeSave 
	* @return void
	 */
	protected void exeBeforeDelete() throws Exception {
		if(logger.isDebugEnabled()){
			logger.debug("action do nothing before delete!");
		}
	}
	@Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	@JSONResult(params={"root", "returnBean"})
	public String delete() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			returnBean = new JsonReturnBean();
			if(ids != null){
				String vs = ((String[])ids)[0];
				String[] values = vs.toString().split(Globals.SEPARATOR_COMMA);
			
				//级联删除
				if(ids != null && values.length > 0){
					for(String id : values){
						if(id instanceof String && StringUtils.isEmpty((String)id)) continue;
					    ApkVersionEntity apkVersionEntity = apkVersionService.find(id);
					    apkVersionService.deleteFile(id, response);
					    apkVersionEntity.setApkUrl("");
					    apkVersionEntity.setAttachName("");
					    apkVersionEntity.setFlgDeleted(0);
					    
					}
				}
				
				super.setPkId((Serializable[])values);
				super.delete();
			}
			returnBean.setHasOk(true);
			returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
			returnBean.setHasOk(false);
			returnBean.setTip(JsonReturnBean.TIP_FAIL);
			returnBean.setMessage(e.getMessage());
		}
		return "delete";
	}
	/**
	 * 执行删除后事件，交由应用实现
	* @Title: exeBeforeSave 
	* @return void
	 */
	protected void exeAfterDelete() throws Exception {
		if(logger.isDebugEnabled()){
			logger.debug("action do nothing after delete!");
		}
	}
	
}

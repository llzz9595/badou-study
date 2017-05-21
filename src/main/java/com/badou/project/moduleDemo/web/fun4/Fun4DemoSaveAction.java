package com.badou.project.moduleDemo.web.fun4;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import antlr.StringUtils;

import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
import com.badou.project.moduleDemo.web.form.Fun4DemoForm;
import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;

import freemarker.template.utility.StringUtil;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun4/Fun4demosave/save.do
 * @author xiangsf 4013-1-18
 *
 */
@Controller
public class Fun4DemoSaveAction extends JsonSaveTemplateAction<Fun4DemoEntity, Serializable, Fun4DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun4DemoService Fun4DemoService;
	@Autowired
	public void setFun4DemoService(IFun4DemoService Fun4DemoService) {
		this.Fun4DemoService = Fun4DemoService;
		super.setBaseService(Fun4DemoService);
	}
	
	File[] attach;
	String[] attachFileName;
	String[]  taxName;
	
	public String[] getTaxName() {
		return taxName;
	}
	public void setTaxNames(String[] taxName) {
		this.taxName = taxName;
	}

	public File[] getAttach() {
		return attach;
	}

	public void setAttach(File[] attach) {
		this.attach = attach;
	}

	public String[] getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String[] attachFileName) {
		this.attachFileName = attachFileName;
	}
	
	@Action(interceptorRefs = @InterceptorRef("fileUploadStack"))
	@JSONResult(params={"root", "returnBean"})
	@Override
	public String save() throws Exception {
		try{
			returnBean = new JsonReturnBean();
		
			String imgid=request.getParameter("imgId");
			String pkId = request.getParameter("id");
			List<Attach> attachList = null;
			if(attach!= null && attach.length!= 0){
				attachList = new ArrayList<Attach>();
				for(int i=0; i<attach.length; i++) {
					attachList.add(this.getAttach(attach[i], attachFileName[i]));
				}
			}
			custForm=new Fun4DemoForm();
			super.setCustFormProperties();
			Fun4DemoEntity fun4Demo=new Fun4DemoEntity();
			custForm.setFormToEntityProperties(fun4Demo);
			if(pkId!= null){
				fun4Demo.setId(pkId);
			}
			Fun4DemoService.saveFun4Demo(fun4Demo, attachList, imgid);
			returnBean.setHasOk(true);
			returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
			returnBean.setBean(custForm);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e);
			returnBean.setHasOk(false);
			returnBean.setTip(JsonReturnBean.TIP_FAIL);
			returnBean.setMessage(e.getMessage());
		}
		return "save";
	}
	@SuppressWarnings("resource")
	private Attach getAttach(File file,String fileName) throws Exception{
		byte content[] = null;
		Attach attach = new Attach();
		InputStream is = new FileInputStream(file);
		content = new byte[is.available()];
		is.read(content);
		LogonCertificate logon = LogonCertificateHolder.getLogonCertificate();
		String suffix = fileName.substring(fileName.indexOf("."));
		attach.setName(fileName);
		attach.setFileContent(content);
		attach.setFileSize(content.length);
		attach.setExtendName(suffix);
		attach.setGenPersonId(logon.getUserId());
		attach.setGenPersonName(logon.getLoginId());
		return attach;
	}
	
}

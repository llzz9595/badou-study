package com.badou.project.moduleDemo.web.fun3;
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
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IFun1DemoChildService;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoForm;
import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;
/**
 * 功能1示例保存新增事件
 * <p>对应的请求路径是：${context}/moduledemo/Fun2/Fun2demosave/save.do
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Fun3DemoSaveAction extends JsonSaveTemplateAction<Fun3DemoEntity, Serializable, Fun3DemoForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IFun3DemoService Fun3DemoService;
	
	@Autowired 
	private IFun1DemoChildService Fun1DemoChildService;

	@Autowired
	public void setFun3DemoService(IFun3DemoService Fun3DemoService) {
		this.Fun3DemoService = Fun3DemoService;
		super.setBaseService(Fun3DemoService);
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
		
			String imgid=request.getParameter("type1");
			List<Attach> attachList = null;
			if(attach!= null && attach.length!= 0){
				attachList = new ArrayList<Attach>();
				for(int i=0; i<attach.length; i++) {
					attachList.add(this.getAttach(attach[i], attachFileName[i]));
				}
			}
			custForm=new Fun3DemoForm();
			super.setCustFormProperties();
			Fun3DemoEntity fun3Demo=new Fun3DemoEntity();
			custForm.setFormToEntityProperties(fun3Demo);
			Fun3DemoService.saveFun3Demo(fun3Demo, attachList, imgid);
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
	

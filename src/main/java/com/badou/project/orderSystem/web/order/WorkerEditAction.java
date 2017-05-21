package com.badou.project.orderSystem.web.order;

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
import com.badou.project.orderSystem.help.AttachImgCaches;
import com.badou.project.orderSystem.help.CommonAttachByAttachId;
import com.badou.project.orderSystem.help.AttachImgCaches.AttachImg;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IWorkerService;
import com.badou.project.orderSystem.web.form.WorkerForm;
/**
 * 点餐模块
 * <p>对应的请求路径是：${context}/orderSystem/order/workeredit/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/orderSystem/order/workeredit_form.jsp
 * @author
 *
 */
@Controller
public class WorkerEditAction extends JsonEditTemplateAction<WorkerEntity, Serializable, WorkerForm> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;   //一个类的唯一标志
	@Autowired
	private IWorkerService WorkerService;
	@Autowired
	public void setWorkerService(IWorkerService WorkerService) {
		this.WorkerService = WorkerService;
		super.setBaseService(WorkerService);
	}
	
}
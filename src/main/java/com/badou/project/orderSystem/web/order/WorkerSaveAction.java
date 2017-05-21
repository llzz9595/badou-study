package com.badou.project.orderSystem.web.order;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.GlobalConsts;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IWorkerService;
import com.badou.project.orderSystem.web.form.WorkerForm;
import com.shengdai.base.support.struts.JsonReturnBean;
import com.shengdai.factory.InstanceFactory;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.ParamUtils;
import com.shengdai.global.util.StringUtils;
import com.shengdai.global.util.param.ParamBooleanUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.global.util.param.ParamDoubleUtils;
import com.shengdai.global.util.param.ParamIntegerUtils;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ui.ligerui.struts2.JsonSaveTemplateAction;

/**
 * 保存新增事件
 * <p>对应的请求路径是：${context}/WorkerForm/order/Workersave/save.do
 * @author 
 */
@Controller
		public class WorkerSaveAction extends JsonSaveTemplateAction<WorkerEntity, Serializable, WorkerForm> {

		/**
		 * 
		 */
		private static final long serialVersionUID = 5580776894637809336L;
		
		private String orderId;
		@Autowired
		private IWorkerService WorkerService;

		@Autowired
		public void setWorkerService(IWorkerService WorkerService) {
			this.WorkerService = WorkerService;
			super.setBaseService(WorkerService);
		}
		
		@Action(interceptorRefs = @InterceptorRef("baseStack"))
		@JSONResult(params = { "root", "returnBean" })
		@Override
		public String save() throws Exception {
			returnBean = new JsonReturnBean();
			try {			
				orderId = ParamUtils.getParameter(
						ServletActionContext.getRequest(), "id");
				if (StringUtils.isNotBlank(orderId)) {
					updateOrder();
				} else {
					createOrder();
				}
				returnBean.setHasOk(true);
				returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
				returnBean.setBean(custForm); 
			}
			catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				returnBean.setHasOk(false);
				returnBean.setTip(JsonReturnBean.TIP_FAIL);
				returnBean.setMessage(e.getMessage());
			}
			return "save";
		}
		private void createOrder() throws Exception {
			custForm = new WorkerForm();
			super.setCustFormProperties();   //从前台参数中设置参数...所以这里
			
			WorkerEntity worker = new WorkerEntity();
			custForm.setFormToEntityProperties(worker);
			
			this.WorkerService.create(worker);
			custForm.setId(worker.getId());

			custForm.setOrderDate(worker.getOrderDate());    
			custForm.setOrder_Time(worker.getOrder_Time());
			custForm.setCREATE_TIME(worker.getCREATE_TIME());   
			
		}

		private void updateOrder() throws Exception {
			boolean validGoods = ParamBooleanUtils.getParameter(request, "valid",
					false);
			custForm = new WorkerForm();
			super.setCustFormProperties();   //从前台参数中设置参数...所以这里
			WorkerEntity worker = this.WorkerService.find(orderId);
			custForm.setFormToEntityProperties(worker);
			this.WorkerService.update(worker);
			custForm.setId(worker.getId());
		}
		
		
	  @Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	  @JSONResult(params={"root", "returnBean"})
      public String remove() throws Exception {			
			returnBean = new JsonReturnBean();
			try {
				HttpServletRequest request = ServletActionContext.getRequest(); //取得HttpServletRequest的对象
				String orderdate = request.getParameter("orderdate");
				String opinionDecoder = request.getParameter("ordertime");
				String dateTime = StringUtils.isEmpty(opinionDecoder) ? null: URLDecoder.decode(opinionDecoder,"utf-8");
				
				List<WorkerEntity> list = WorkerService.querylist(orderdate, dateTime);
				
				for(WorkerEntity a : list){
					a.setStatus("已撤消");
					WorkerService.update(a);
				}
				returnBean.setHasOk(true);
				returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
			}
			catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				returnBean.setHasOk(false);
				returnBean.setMessage(e.getMessage());
			}
			return "remove";
		}
	  
	  @Action(interceptorRefs = @InterceptorRef("baseJsonStack"))
	  @JSONResult(params={"root", "returnBean"})
      public String comfirm() throws Exception {
			
			returnBean = new JsonReturnBean();
			try {
				HttpServletRequest request = ServletActionContext.getRequest(); //取得HttpServletRequest的对象
				String orderdate = request.getParameter("orderdate");
				String opinionDecoder = request.getParameter("ordertime");
				String dateTime = StringUtils.isEmpty(opinionDecoder) ? null: URLDecoder.decode(opinionDecoder,"utf-8");
				
				List<WorkerEntity> list = WorkerService.querylist(orderdate, dateTime);
				for(WorkerEntity a : list){
					a.setStatus("已确认");
					WorkerService.update(a);
				}
				returnBean.setHasOk(true);
				returnBean.setTip(JsonReturnBean.TIP_SUCCESS);
			}
			catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				returnBean.setHasOk(false);
				returnBean.setTip(JsonReturnBean.TIP_FAIL);
				returnBean.setMessage(e.getMessage());
			}
			return "comfirm";
		}
	}

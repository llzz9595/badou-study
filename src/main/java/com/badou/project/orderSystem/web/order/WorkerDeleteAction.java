package com.badou.project.orderSystem.web.order;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IWorkerService;
/**
 * 删除事件
 * <p>对应的请求路径是：${context}/orderSystem/order/workerdelete/方法名.do
 * @author 
 *
 */
@Controller
public class WorkerDeleteAction extends BaseJsonDeleteStrutsAction<WorkerEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IWorkerService WorkerService;

	@Autowired
	public void setMenuService(IWorkerService MenuService) {
		this.WorkerService = WorkerService;
		super.setBaseService(WorkerService);
	}
	
	
}

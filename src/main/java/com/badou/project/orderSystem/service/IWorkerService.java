package com.badou.project.orderSystem.service;

import java.io.Serializable;
import java.util.List;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.common.page.Pagelet;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.web.form.OrderForm;
//import com.badou.project.moduleDemo.web.form.Fun4DemoTreeForm;
/**
 * 点餐模块业务层接口
 * @author
 *
 */
public interface IWorkerService extends IBaseSpringService<WorkerEntity, Serializable> {

	void saveWorker(WorkerEntity worker, List<Attach> attachList,
			String imgid);

	Pagelet queryByParams(String params);

	List<WorkerEntity> querylist(String orderdate,String ordertime);
	List<OrderForm> querydetaillist(String orderdate,String ordertime);


	
	
	
}
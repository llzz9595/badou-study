package com.badou.project.orderSystem.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.common.page.Pagelet;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.orderSystem.dao.IWorkerDAO;
import com.badou.project.orderSystem.help.AttachImgCaches;
import com.badou.project.orderSystem.help.AttachImgCaches.AttachImg;
import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.badou.project.orderSystem.service.IWorkerService;
import com.badou.project.orderSystem.web.form.OrderForm;

/**
 * 点餐模块业务层接口实现
 * @author 
 *
 */
@Service
public class WorkerServiceImpl extends BaseSpringService<WorkerEntity, Serializable>
		implements IWorkerService {
	@Autowired
	private IWorkerDAO workerDAO;
	@Autowired
	public void setWorkerDAO(IWorkerDAO workerDAO) {
		this.workerDAO = workerDAO;
		super.setBaseDAO(workerDAO);
	}
	@Override
	public void saveWorker(WorkerEntity worker, List<Attach> attachList,
			String imgid) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Pagelet queryByParams(String params) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<WorkerEntity> querylist(String orderdate,String ordertime){
		
	    List<WorkerEntity> list = workerDAO.querylist(orderdate, ordertime);
		return list;
	}
	
	public List<OrderForm> querydetaillist(String orderdate,String ordertime){
		
	    List<OrderDetailEntity> list = workerDAO.querydetaillist(orderdate, ordertime);
	    List<OrderForm> form = new ArrayList<OrderForm>();
	    try {
	    	 for(OrderDetailEntity e : list){
	 	    	OrderForm o = new OrderForm();
	 	    	o.setWorkerName(e.getOrder().getWorkerName());
	 	    	o.setCreateTime(e.getCreateTime());
	 	    	o.setMenuName(e.getMenuName());
	 	    	o.setPriceSum(e.getOrder().getPriceSum());
	 	    	o.setRestaurant(e.getRestaurant());
	 	    	form.add(o);
	 	    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return form;
	}
	
}




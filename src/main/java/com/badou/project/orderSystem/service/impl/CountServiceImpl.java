package com.badou.project.orderSystem.service.impl;
import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.common.page.Pagelet;
import com.badou.project.orderSystem.dao.ICountDAO;
import com.badou.project.orderSystem.model.CountEntity;
import com.badou.project.orderSystem.service.ICountService;
/**
 * 业务层接口实现
 * @author 
 *
 */
@Service
public class CountServiceImpl extends BaseSpringService<CountEntity, Serializable>
		implements ICountService {
	@Autowired
	private ICountDAO countDAO;
	@Autowired
	public void setCountDAO(ICountDAO countDAO) {
		this.countDAO = countDAO;
		super.setBaseDAO(countDAO);
	}
	public Pagelet queryHistory(Date orderdate,String ordertime,String workerId,
			double priceSum,Date createTime,String status){
		return countDAO.queryHistory(orderdate,ordertime,workerId,priceSum,createTime,status);
	}
	
	
}

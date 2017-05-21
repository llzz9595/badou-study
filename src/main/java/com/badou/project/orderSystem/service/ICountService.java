package com.badou.project.orderSystem.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.common.page.Pagelet;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.orderSystem.model.CountEntity;

/**
 * 点餐模块业务层接口
 * @author
 *
 */
public interface ICountService extends IBaseSpringService<CountEntity, Serializable> {
	public Pagelet queryHistory(Date orderdate,String ordertime,String workerId,
			double priceSum,Date createTime,String status);
}
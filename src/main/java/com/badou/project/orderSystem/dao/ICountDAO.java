package com.badou.project.orderSystem.dao;

import java.io.Serializable;
import java.util.Date;

import com.badou.project.orderSystem.model.CountEntity;
import com.shengdai.base.support.hibernate.IBaseHibernateDAO;
import com.shengdai.common.page.Pagelet;
/**
 * 菜单对象对应的DAO接口
 * @author
 *
 */
public interface ICountDAO extends IBaseHibernateDAO<CountEntity, Serializable> {
	public Pagelet queryHistory(Date orderdate,String ordertime,String workerId,
			double priceSum,Date createTime,String status);
}
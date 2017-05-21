package com.badou.project.orderSystem.dao;

import java.io.Serializable;
import java.util.List;

import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.shengdai.base.support.hibernate.IBaseHibernateDAO;
/**
 * 菜单对象对应的DAO接口
 * @author
 *
 */
public interface IWorkerDAO extends IBaseHibernateDAO<WorkerEntity, Serializable> {

	List<WorkerEntity> querylist(String orderdate,String ordertime);
	List<OrderDetailEntity> querydetaillist(String orderdate,String ordertime);
}
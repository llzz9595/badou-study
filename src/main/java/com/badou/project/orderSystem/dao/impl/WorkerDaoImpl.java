package com.badou.project.orderSystem.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.badou.project.orderSystem.dao.IWorkerDAO;
import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
/**
 * 菜单DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class WorkerDaoImpl extends
		BaseHibernateDAO<WorkerEntity, Serializable> implements IWorkerDAO {
	   public List<WorkerEntity> querylist(String orderdate,String ordertime){
		   String hql = "from WorkerEntity as od where od.orderDate='"+orderdate+"' and od.order_Time='"+ordertime+"'";
			Query query = this.getSession().createQuery(hql);
			List list =  query.list();
			// TODO Auto-generated method stub
			return list;
	}
	   
	   public List<OrderDetailEntity> querydetaillist(String orderdate,String ordertime){
		   try {
		   String hql = "from OrderDetailEntity as a where a.order.orderDate='"+orderdate+"' and a.order.order_Time='"+ordertime+"'";
			Query query = this.getSession().createQuery(hql);
			List list =  query.list();
			// TODO Auto-generated method stub
			return list;
		   } catch (Exception e) {
			e.printStackTrace();
			}
		   return null;
	}
}
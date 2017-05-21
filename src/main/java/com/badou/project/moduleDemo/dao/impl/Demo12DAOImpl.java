package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.badou.project.moduleDemo.dao.IDemo12DAO;
import com.badou.project.moduleDemo.model.Demo12Entity;
import com.badou.project.moduleDemo.vo.Demo14DetailVo;
import com.badou.project.moduleDemo.vo.Demo14Vo;
import com.shengdai.base.query.ICriterion;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.QueryParam;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.common.page.Pagelet;

@Repository
public class Demo12DAOImpl extends
				BaseHibernateDAO<Demo12Entity, Serializable> implements IDemo12DAO   {
	

	

//	模糊查询
@Override
	public Pagelet findPages(ICriterion criterion){
		if(criterion != null && criterion instanceof QueryCriterion){
			QueryCriterion queryCriterion = null;
			StringBuilder hql = null;
			List<Object> objs = null;
			try{
				 queryCriterion = (QueryCriterion)criterion;
				Class<Demo12Entity> _clazz = getGenericType();
				 hql = new StringBuilder().append("from ").append(_clazz.getName()).append(" t where 1=1 ");
				 objs = new ArrayList<Object>();
				 int n = 0;
				for(QueryParam p : queryCriterion.getQueryParams()){
					if(n == 0){
					hql.append(" and ").append(p.toQueryString());}
					else
						hql.append(" or ").append(p.toQueryString());
					n++;
					p.addParamValuesTo(objs);
				}
				if(queryCriterion.getQueryOrderbys() == null || queryCriterion.getQueryOrderbys().isEmpty()){
					com.shengdai.global.annotation.DefaultOrderBy orderby = _clazz.getAnnotation(com.shengdai.global.annotation.DefaultOrderBy.class);
					if(orderby != null){
						hql.append( " order by ").append(orderby.clause());
					}
				}else{
					hql.append( " order by ");
					int i = queryCriterion.getQueryOrderbys().size() - 1;
					for(QueryOrderby o : queryCriterion.getQueryOrderbys()){
						hql.append(o.toQueryString());
						if(i > 0) hql.append(",");
						i--;
					}
				}
			
				return super.queryPagedResult(hql.toString(), objs.toArray(new Object[]{}));
			}finally{
				 queryCriterion = null;
				 hql = null;
				 objs = null;
			}
			
		}
		return this.findPages();
	}

//	sql语句查询
	
	public List<Demo14Vo> findBySQL() {
	
		List<Demo14Vo> result = new ArrayList<Demo14Vo>() ;
		try{

			Demo14Vo demo14AD,demo14We2;
			demo14AD = query("ad");
			demo14We2 = query("we2");
			Demo14Vo demo143 = query("lps");
			System.out.println("demo14------0-"+demo14AD.getCustomer());
			result.add(demo14AD);
			result.add(demo14We2);
	        result.add(demo143);	          
			return  result;
	            
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }return null;
	    }
	
	
	

	private Demo14Vo query(String cust)
	{
		Demo14Vo demo14 = new Demo14Vo();
		demo14.setCustomer(cust);
		for(int i = 0 ; i < 7 ; i++)
        {
     	  
     	   String sql = "SELECT sum(a.goodsSubMoney) as subMoney,b.customerName as customer"
	            		+ " from demo12_orders_detail_lps as a ,demo12_orders_lps as b "
	            		+ "WHERE a.orderID = b.ID "
	            		+"AND b.customerName='"+cust+"'"
	            	    +" and to_days(b.CreateDate) = to_days(now())-"+i
	            		+ " GROUP BY customerName";
     	   Session session =  getHibernateTemplate()
	            		.getSessionFactory().getCurrentSession();
	       Query query = session.createSQLQuery(sql)
	            		.addScalar("customer",Hibernate.STRING)
	            		.addScalar("subMoney",Hibernate.INTEGER)
	            		.setResultTransformer(Transformers.aliasToBean(Demo14DetailVo.class));
	       
	            
	            if(query.list() != null && query.list().size() >0)
           {
	                Demo14DetailVo detail = (Demo14DetailVo) query.list().get(0);
	            	setMethod(demo14,i,detail.getSubMoney());
           }
	            else
	            {
	            	setMethod(demo14,i,0);
	            	
	            }
        
        }
		return demo14;
	}
	
	private void setMethod(Demo14Vo demo14,int order,int subMoney)
	{
		switch(order)
		{
		case 0: demo14.setSeventh(subMoney);break;
		case 1: demo14.setSixth(subMoney); break;
		case 2: demo14.setFifth(subMoney); break;
		case 3: demo14.setFourth(subMoney);break;
		case 4 : demo14.setThird(subMoney);break;
		case 5 : demo14.setSecond(subMoney); break;
		case 6 :  demo14.setFirst(subMoney);break;
		
		 
		}
	}

	@Override
	public List<Demo12Entity> findOrder(String s) {
		// TODO Auto-generated method stub
		
		String sql = "select * from  demo12_orders_lps as a where a.creator = '"+s+"'";
	  	   Session session =  getHibernateTemplate()
           		.getSessionFactory().getCurrentSession();
       Query query = session.createSQLQuery(sql).addEntity(Demo12Entity.class);
		return query.list();
	}

}

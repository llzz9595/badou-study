package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.badou.project.moduleDemo.dao.IDemo13DAO;
import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.vo.Demo15DetailVO;
import com.badou.project.moduleDemo.vo.Demo15VO;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;

@Repository
public class Demo13DAOImpl extends
					BaseHibernateDAO<Demo13Entity, Serializable> implements IDemo13DAO{

	
	public List<Demo15VO> findBySQL() {
	
		List<Demo15VO> result = new ArrayList<Demo15VO>() ;
		try{

			Demo15VO demo151,demo152;
			demo151 = query("br");
			demo152 = query("rice");
		
			result.add(demo151);
			result.add(demo152);
	        		          
			return  result;
	            
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }return null;
	    }

	private Demo15VO query(String cust)
	{
		Demo15VO demo15 = new Demo15VO();
		demo15.setGoods(cust);
		for(int i = 0 ; i < 7 ; i++)
        {

//			System.out.println("cust-"+cust+"-i-"+i);
     	   String sql = " SELECT sum(a.goodsSubMoney) as subMoney,"
     	   		+ " b.NAME as goods "
     	   		+ " from demo12_orders_detail_lps as a ,demo12_goods_lps b"
     	   		+ " WHERE a.goodsName = '"+cust+"'"
     	   		+ " and a.goodsName = b.name "
     	   	     +" and to_days(a.CreateDate) = to_days(now())-"+i
     	   		+ " GROUP BY name ";

 

     	   Session session =  getHibernateTemplate()
	            		.getSessionFactory().getCurrentSession();
	            Query query = session.createSQLQuery(sql)
	            		.addScalar("goods",Hibernate.STRING)
	            		.addScalar("subMoney",Hibernate.INTEGER)
	            		.setResultTransformer(Transformers.aliasToBean(Demo15DetailVO.class));
	       
	            
	            if(query.list() != null && query.list().size() >0)
           {
	                Demo15DetailVO detail = (Demo15DetailVO) query.list().get(0);
	            	setMethod(demo15,i,detail.getSubMoney());
           }
	            else
	            {
	            	setMethod(demo15,i,0);
	            	
	            }
        
        }
		return demo15;
	}
	
	private void setMethod(Demo15VO demo15,int order,int subMoney)
	{
		switch(order)
		{
		case 0: demo15.setSeventh(subMoney);break;
		case 1: demo15.setSixth(subMoney); break;
		case 2: demo15.setFifth(subMoney); break;
		case 3: demo15.setFourth(subMoney);break;
		case 4 : demo15.setThird(subMoney);break;
		case 5 : demo15.setSecond(subMoney); break;
		case 6 :  demo15.setFirst(subMoney);break;
		
		 
		}
	}

	@Override
	public List<Demo13Entity> findByName(String s) {
		String sql = "select * from demo12_goods_lps a  where  a.name = '"+s+"'";
		   Session session =  getHibernateTemplate()
           		.getSessionFactory().getCurrentSession();
           Query query = session.createSQLQuery(sql).addEntity(Demo13Entity.class);
		// TODO Auto-generated method stub
		return query.list();
	}
}

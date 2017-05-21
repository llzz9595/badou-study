package com.badou.project.orderSystem.dao.impl;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.badou.project.orderSystem.dao.ICountDAO;
import com.badou.project.orderSystem.model.CountEntity;
import com.badou.project.orderSystem.web.form.CountForm;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.common.page.Pagelet;
import com.shengdai.global.util.convert.DoubleConvert;
import com.shengdai.global.util.convert.StringConvert;
import com.shengdai.kpi.common.page.MySqlPageQuery;
import com.shengdai.kpi.common.page.ResultSetWrapper;

/**
 * 菜单DAO实现类
 * @author 
 *
 */
@Repository
public  class CountDaoImpl extends
		BaseHibernateDAO<CountEntity, Serializable> implements ICountDAO {
	/**
	 * 通过客户id查询该客户的历史订单信息 并按订单号和销售人员搜索,如果登陆者id是销售人员
	 * 则只显示该销售人员的历史订单信息,如果登陆者id不是销售人员,则显示全部历史订单信息
	 */
	public Pagelet queryHistory(Date orderdate,String ordertime,String workerId,
			double priceSum,Date createTime,String status){
		    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			try {
				StringBuffer sql = new StringBuffer("SELECT ");
				sql.append("   order_Date,");
				sql.append("   order_Time,");
				sql.append("   COUNT(workerId),");
				sql.append("   SUM(priceSum),");
				sql.append("   MAX(CREATE_TIME),");
				sql.append("   Status ");
				sql.append("   from order_info");
				sql.append("   where FLG_DELETED =0 ");
				
				if(orderdate  != null){	
					if(ordertime.equals("全天")){
						sql.append(" and order_Date = '" + f.format(orderdate) + "'");
						
					}else{
						sql.append(" and order_Date = '" + f.format(orderdate) + "'");
						sql.append(" and order_Time = '"+ordertime+"'");
					}
				}
				sql.append(" group by order_Date, ");
				sql.append("order_Time,");
				sql.append("Status");

List<Object> params = new ArrayList<Object>();
Pagelet pagelet = new MySqlPageQuery(getConnection(), sql.toString(),
					params, new ResultSetWrapper() {
						@Override
						protected List<Object> convert(List<Object[]> objsList) {
							 List<Object> list = new ArrayList<Object>();
							 SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
							 SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
							for (Object[] objs : objsList) {
								CountForm countForm = new CountForm();
								countForm.setOrderdate((Date) (objs[0]));
								countForm.setOrdertime(StringConvert.convert(objs[1]));
								countForm.setWorkerId(StringConvert.convert(objs[2]));
								countForm.setPriceSum(DoubleConvert.convert(objs[3]));
								try {
									countForm.setCreateTime(f1.parse(StringConvert.convert(objs[4])));
								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								countForm.setStatus(StringConvert.convert(objs[5]));
								list.add(countForm);
							}
							return list;
						}
					}).executeQuery();
		return pagelet;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
	}
}
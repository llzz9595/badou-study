package com.badou.project.orderSystem.web.form;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.factory.InstanceFactory;
import com.shengdai.global.enums.SystemBoolean;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;

public class OrderForm extends BaseStrutsEntityForm<WorkerEntity> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6227752468574948125L;

	
	/**
	 * 逻辑删除标识
	 */
	protected Integer flgDeleted = SystemBoolean.NO.getKey();
	
	private WorkerEntity workerEntity;
	
	/**
	 * 预订下单日期
	 */
	protected Date orderDate;
	
	
	/**
	 * 下单时间
	 */
	private Date createTime;
	
	/**
     * 下单人
     */
	private String workerName;
	
	
    /**
     * 菜单名称
     */
	private String menuName;
	
	
	/**
	 * 价格
	 */
	private double priceSum;
	
	/**
	 * 所属快餐店
	 */
	private String restaurant;
	
	/**
	 * 下单时间
	 */
	private String order_Time;
	
	
	public Integer getFlgDeleted() {
		return flgDeleted;
	}

	public void setFlgDeleted(Integer flgDeleted) {
		this.flgDeleted = flgDeleted;
	}
	@JSON(format="yyyy-MM-dd")
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getWorkerName() {
		return workerName;
	}
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}
	
	@JSON(format="yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
//		System.out.print(createTime.toString());
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public double getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(double priceSum) {
		this.priceSum = priceSum;
	} 
	
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getOrder_Time() {
		return order_Time;
	}
	public void setOrder_Time(String order_Time) {
		this.order_Time = order_Time;
	}
	

	
	public WorkerEntity getWorkerEntity() {
		return workerEntity;
	}
	public void setWorkerEntity(WorkerEntity workerEntity) {
		this.workerEntity = workerEntity;
	}
	
	
	/***
	 * 将entity的数据设置到form中
	 * */
	

	
}

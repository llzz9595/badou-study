package com.badou.project.orderSystem.web.form;

import java.util.Date;
//import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.orderSystem.model.CountEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.global.enums.SystemBoolean;

public class CountForm extends BaseStrutsEntityForm<CountEntity> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6227752468574948125L;

	

	
	/** 
	 * 逻辑删除标识
	 */
	protected Integer flgDeleted = SystemBoolean.NO.getKey();
	/**
	 * 菜单名称
	 */
	private String menuName;
	/**
	 * 菜单价格
	 */
	private double priceSum;
	
	/**
	 * 所属快餐店
	 */
	private String restaurant;
	
	/**
	 * 菜单id
	 */
	private String menuId ;
	
	/**
	 * 员工id
	 */
	private String workerId ;
	
	/**
	 * 员工姓名 
	 */
	private String workerName ;
	
	/**
	 * 菜单id
	 */
	private Date orderdate ;
	
	/**
	 * 菜单id
	 */
	private String ordertime ;
	
	/**
	 * 菜单id
	 */
	private String status ;
	
	private Date createTime;
	
	
	
	public Integer getFlgDeleted() {
		return flgDeleted;
	}

	public void setFlgDeleted(Integer flgDeleted) {
		this.flgDeleted = flgDeleted;
	}

	public String getWorkerId() {
		return workerId;
	}
	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}
	public String getWorkerName() {
		return workerName;
	}
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
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
	@JSON(format="yyyy-MM-dd")
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public  void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@JSON(format="yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
//		System.out.print(createTime);
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	@Override
	public void setEntityToFormProperties(CountEntity instance) {
		super.setEntityToFormProperties(instance);
//		this.createTime =instance.getCreateTime();
		
	}


	@Override
	public void setFormToEntityProperties(CountEntity instance) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		Date date = new Date(System.currentTimeMillis());
		
		instance.setMenuName(this.getMenuName());
		instance.setPriceSum(this.getPriceSum());
		instance.setRestaurant(this.getRestaurant());
		instance.setMenuId(this.getMenuId());
		instance.setWorkerId(this.getWorkerId());
		instance.setWorkerName(this.getWorkerName());
		instance.setStatus(this.getStatus());
//		instance.setCreateTime(date);
		instance.setCreateTime(this.getCreateTime());
	}

	@Override
	public String toString() {
		return "CountForm [id=" + id + ", menuName=" + menuName
				+ ", priceSum=" + priceSum + ", restaurant=" + restaurant
				+ ", flgDeleted=" + flgDeleted + ", order_Date=" + orderdate
				+ ", menuId=" + menuId+ ", order_Time=" + ordertime 
				+ ", workerId=" + menuId+ ", workerName=" + workerName
				+ ", order_Time=" + ordertime+ ", createTime=" + createTime
				+ "]";
	}

}

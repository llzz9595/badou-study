package com.badou.project.orderSystem.web.form;

//import java.util.Date;
import java.sql.Date;
import java.text.DateFormat;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.orderSystem.model.OrderDetailEntity;
import com.badou.project.orderSystem.model.WorkerEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.factory.InstanceFactory;
//import com.shengdai.brms.order.model.order.Order;
//import com.shengdai.brms.order.model.order.Order;
//import com.shengdai.brms.brms.BrmsUserHelper;
//import com.shengdai.brms.brms.beans.UserBean;
//import com.shengdai.brms.workerForm.model.CustomEntity;
//import com.shengdai.brms.order.model.OrderCustom;
//import com.shengdai.brms.order.model.OrderCustomAddress;
//import com.shengdai.brms.order.model.order.Order;
//import com.shengdai.brms.order.model.order.OrderSaler;
//import com.shengdai.brms.order.model.ordercode.OrderCodeStrategy;
//import com.shengdai.factory.InstanceFactory;
//import com.shengdai.global.Globals;
import com.shengdai.global.enums.SystemBoolean;
//import com.shengdai.kpi.util.AddressHelper;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;

public class WorkerForm extends BaseStrutsEntityForm<WorkerEntity> {
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
	 * 预定日期
	 */
	protected Date orderDate;
	private String order_Time;
	/**
	 * 菜名
	 */
	private String menuName = "";
	
	/**
	 * 菜单id
	 */
	private String menuId = "";
	
	/**
	 * 价格
	 */
	private double price;
	
	/**
	 * 所属快餐店
	 */
	private String restaurant = "";
	
	/**
	 * 下单时间
	 */
	private java.util.Date CREATE_TIME ;
	
	/**
	 * 下单id
	 */
	private String order_id;
	
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
	
	public double getPrice() {
		return price;
	}
    
	public void setPrice(double price) {
		this.price = price;
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
	
	@JSON(format="yyyy-MM-dd HH：mm: ss")
	public java.util.Date getCREATE_TIME() {
		return CREATE_TIME;
	}

	public void setCREATE_TIME(java.util.Date cREATE_TIME) {
		this.CREATE_TIME = cREATE_TIME;
	}

	
	public String getOrder_id() {
		return order_id;
	}
	
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	public WorkerEntity getWorkerEntity() {
		return workerEntity;
	}
	public void setWorkerEntity(WorkerEntity workerEntity) {
		this.workerEntity = workerEntity;
	}
	
//	public WorkerForm(){}
	
	/***
	 * 将entity的数据设置到form中
	 * */
	@Override
	public void setEntityToFormProperties(WorkerEntity instance) {
//		super.setEntityToFormProperties(instance);
		this.orderDate = instance.getOrderDate();
		this.order_Time = instance.getOrder_Time();
		this.CREATE_TIME = instance.getCreateTime();
		this.id = instance.getId();
		for(OrderDetailEntity detail : instance.getDetai()){
			this.menuName += detail.getMenuName() == null ? "":detail.getMenuName()+";";
			this.menuId += detail.getMenuId()  == null ? "":detail.getMenuId() + ";";
			this.restaurant += detail.getRestaurant() == null ? "": detail.getRestaurant()+";";
		}
		this.price = instance.getPriceSum();
	}

	@Override
	public void setFormToEntityProperties(WorkerEntity worker) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		if(worker == null) worker = new WorkerEntity();
		/*字符串类型转为date类型*/
		Date date = new Date(System.currentTimeMillis());
//	    DateFormat df = DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM,Locale.CHINA);
//		String dt = df.format(date);
		
		//清空detail表
		worker.getDetai().clear();
		
		LogonCertificate logon = LogonCertificateHolder.getLogonCertificate();
		worker.setWorkerId(logon.getUserId());
		worker.setWorkerName(logon.getUserName());
		worker.setOrderDate(this.getOrderDate());
		worker.setOrder_Time(this.getOrder_Time());

		worker.setCREATE_TIME(date);

		worker.setPriceSum(this.getPrice());
		worker.setStatus("下单中");
		
		OrderDetailEntity detail = new OrderDetailEntity();
		detail.setOrder_id(this.getOrder_id());
		detail.setMenuId(this.menuId);
		detail.setMenuName(this.getMenuName());
		detail.setPrice(this.getPrice());
		detail.setRestaurant(this.getRestaurant());
		
		detail.setOrder(worker);	
		worker.getDetai().add(detail);
	
	}

	@Override
	public String toString() {
		return "WorkerForm [id=" + id 
				+ ", orderDate=" + orderDate
				+ ", menuName=" + menuName 
				+ ", price=" + price 
				+ ", restaurant=" + restaurant
				+ ", flgDeleted=" + flgDeleted
				+ ", order_Time=" + order_Time 
				+ ", CREATE_TIME=" + CREATE_TIME 
				+ "]";
	}
	
}

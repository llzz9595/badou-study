package com.badou.project.orderSystem.model;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
import com.shengdai.global.annotation.DefaultOrderBy;

import java.util.Date;
/**
 * <p>该实体对象一般来讲，映射数据库表
 * <br/>命名规则：应用功能名称+Entity
 * <br/>按业务实际情况继承<package>com.shengdai.base.support.hibernate</package>包下抽象实体类
 * <ul>
 * <li>com.shengdai.base.support.hibernate.used.AppBaseFullEntity</li>
 * <li>com.shengdai.base.support.hibernate.used.AppBaseEntity</li>
 * <li>com.shengdai.base.support.hibernate.used.AppBaseEntity1</li>
 * <li>com.shengdai.base.support.hibernate.used.AppBaseEntity3</li>
 * <li>com.shengdai.base.support.hibernate.BaseHibernateEntity<br>
 * </ul>
 * @author
 */
@javax.persistence.Entity
@Table(name = "ORDER_INFO")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="createTime desc") //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")
public class CountEntity extends AppBaseEntity1 {

	/**
	 * 
	 */
	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 员工ID
	 */
	@Column(name = "workerId", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String workerId;
	
	/**
	 * 员工姓名
	 */
	@Column(name = "workerName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String workerName;
	
	/**
	 * 菜单ID
	 */
	@Column(name = "menuId", unique = false, nullable = true, insertable = true, updatable = true, length = 22, scale = 0)
	private String menuId;
	
	/**
	 * 菜单名
	 */
	@Column(name = "menuName", unique = false, nullable = true, insertable = true, updatable = true, length = 22, scale = 0)
	private String menuName;
	
	/**
	 * 所属快餐店
	 */
	@Column(name = "restaurant", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String restaurant;
	
	/**
	 * 价格总和
	 */
	@Column(name = "priceSum", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private double priceSum;
	
	/**
	 * 下单日期
	 */
	@Column(name = "order_Date", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private Date orderdate;
	
	/**
	 * 下单时间
	 */
	@Column(name = "order_Time", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private String ordertime;
	
	/**
	 * 状态
	 */
	@Column(name = "Status", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private String status;
	

	
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
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}

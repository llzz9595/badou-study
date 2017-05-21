package com.badou.project.orderSystem.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Where;

import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
import com.shengdai.global.annotation.DefaultOrderBy;

@javax.persistence.Entity
@Table(name = "ORDER_DETAIL")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@Where(clause = "FLG_DELETED=0")
public class OrderDetailEntity extends AppBaseEntity1 {
	
	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 下单ID
	 */
	@Column(name = "order_id", unique = false, nullable = true, insertable = false, updatable = false, length = 32)
	private String order_id;
	
	/**
	 * 菜单ID
	 */
	@Column(name = "menuId", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String menuId;

	/**
	 * 菜名
	 */
	@Column(name = "menuName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String menuName;

	/**
	 * 所属快餐店
	 */
	@Column(name = "restaurant", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String restaurant;
	
	/**
	 * 价格
	 */
	@Column(name = "price", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	private double price;
		
	@JoinColumn(name = "order_id", referencedColumnName = "ID")
	@ManyToOne
	private WorkerEntity order;
	
	public WorkerEntity getOrder() {
		return order;
	}
	public void setOrder(WorkerEntity order) {
		this.order = order;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
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

	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}

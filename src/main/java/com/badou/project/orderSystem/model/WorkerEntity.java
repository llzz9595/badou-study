package com.badou.project.orderSystem.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
import com.shengdai.base.support.hibernate.used.AppBaseEntity4;
import com.shengdai.global.annotation.DefaultOrderBy;

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
public class WorkerEntity extends AppBaseEntity4 {

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
	 * 预定日期
	 */
	
	@Column(name = "order_Date", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private Date orderDate;
	
	@Column(name = "order_Time", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String order_Time;

	/**
	 * 下单时间
	 */
	
	@Column(name = "CREATE_TIME", unique = false, nullable = true, insertable = false, updatable = false, length = 32)
	private Date CREATE_TIME;
	
	@Column(name = "priceSum", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private double priceSum;
	/**
	 * 下單狀態：“已确认,下单中，已撤销
	 */
	@Column(name = "Status", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private String status;
	
	/** 
	 * 功能点集合
	 */
	@Cascade({ org.hibernate.annotations.CascadeType.ALL })
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "order")
	@Where(clause = "FLG_DELETED=0")
	private Set<OrderDetailEntity> detai = new HashSet<OrderDetailEntity>();	
	
	public Set<OrderDetailEntity> getDetai() {
		return detai;
	}
	public void setDetai(Set<OrderDetailEntity> detai) {
		this.detai = detai;
	}
	public String getWorkerId() {
		return workerId;
	}
	public void setWorkerId(String workerId) {
		this.workerId = workerId;

	}

	public double getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(double priceSum) {
		this.priceSum = priceSum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getWorkerName() {
		return workerName;
	}
	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}

	@JSON(format="yyyy-MM-dd HH:mm:ss")
	public Date getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(Date cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public String getOrder_Time() {
		return order_Time;
	}
	public void setOrder_Time(String order_Time) {
		this.order_Time = order_Time;
	}
}
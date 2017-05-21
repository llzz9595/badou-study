package com.badou.project.moduleDemo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity;
import com.shengdai.base.support.hibernate.used.AppBaseEntity4;
import com.shengdai.global.annotation.DefaultOrderBy;

/**
 * 
 * Created by lps on 2017/3/27.
 * Demo11 实现单表的CRUD
 * 订单表Entity
 * 
 */
@javax.persistence.Entity
@Table(name = "demo12_orders_lps")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="createDate desc") //默认排序，该排序只针对单表有效
//@Where(clause = "FLG_DELETED=0")
public class Demo11Entity extends  AppBaseEntity {
	/**
	 * 
	 */
//	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 主键ID
	 */
//	@Column(name = "id", unique = true, nullable = true, insertable = true, updatable = true, length = 32)
//	private String id;
	/**
	 * 订单标题
	 */
	@Column(name = "orderTitle", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String orderTitle;
	
	/**
	 * 所属销售人员名称
	 */
	@Column(name = "salmon", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String salmon;
	
	/**
	 * 备注
	 */
	@Column(name = "remark", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String remark;
	
	/**
	 * 创建人
	 */
	@Column(name = "creator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String creator;
	
	/**
	 * 创建日期
	 */
	@Column(name = "CreateDate", unique = false, nullable = true, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date  createDate;
	
	/**
	 * 最后修改人
	 */
	@Column(name = "LastUpdator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String lastUpdator;
	
	/**
	 * 最后更新日期
	 */
	@Column(name = "LastUpdateDate", unique = false, nullable = true, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdateDate ;
	
	/**
	 * 逻辑删除键位
	 */
	@Column(name = "Flg_deleted", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	private String FLG_DELETED;

	
	
//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}

	public String getOrderTitle() {
		return orderTitle;
	}

	public void setOrderTitle(String orderTitle) {
		this.orderTitle = orderTitle;
	}

	public String getSalmon() {
		return salmon;
	}

	public void setSalmon(String salmon) {
		this.salmon = salmon;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getLastUpdator() {
		return lastUpdator;
	}

	public void setLastUpdator(String lastUpdator) {
		this.lastUpdator = lastUpdator;
	}

	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public String getFLG_DELETED() {
		return FLG_DELETED;
	}

	public void setFLG_DELETED(String fLG_DELETED) {
		FLG_DELETED = fLG_DELETED;
	}
	
	
	
	
	
	
}

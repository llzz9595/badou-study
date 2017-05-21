package com.badou.project.moduleDemo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.shengdai.base.support.hibernate.used.AppBaseEntity;
import com.shengdai.global.annotation.DefaultOrderBy;

@javax.persistence.Entity
@Table(name = "demo15_customer_lps")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="createDate desc") //默认排序，该排序只针对单表有效
public class Demo16Entity extends AppBaseEntity{

	/**
	 * 订单标题
	 */
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String name;
	
	/**
	 * 所属销售人员名称
	 */
	@Column(name = "phone", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String phone;
	
	/**
	 * 备注
	 */
	@Column(name = "sex", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String sex;
	
	@Column(name = "discount", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String discount;
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
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

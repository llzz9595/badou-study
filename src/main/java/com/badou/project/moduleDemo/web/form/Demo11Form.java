package com.badou.project.moduleDemo.web.form;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.badou.project.moduleDemo.model.Demo11Entity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;

public class Demo11Form extends BaseStrutsEntityForm<Demo11Entity>  {
	

	/**
	 * 主键ID
	 */
//	@Column(name = "id", unique = true, nullable = true, insertable = true, updatable = true, length = 32)
//	private String id;
	/**
	 * 订单标题
	 */
//	@Column(name = "orderTitle", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String orderTitle;
	
	/**
	 * 所属销售人员名称
	 */
//	@Column(name = "salmon", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String salmon;
	
	/**
	 * 备注
	 */
//	@Column(name = "remark", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String remark;
	
	/**
	 * 创建人
	 */
//	@Column(name = "creator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String creator;
	
	/**
	 * 创建日期
	 */
//	@Column(name = "CreateDate", unique = false, nullable = true, insertable = true, updatable = true)
//	@Temporal(TemporalType.TIMESTAMP)
	private Date  createDate;
	
	/**
	 * 最后修改人
	 */
//	@Column(name = "LastUpdator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String lastUpdator;
	
	/**
	 * 最后更新日期
	 */
//	@Column(name = "LastUpdateDate", unique = false, nullable = true, insertable = true, updatable = true)
//	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdateDate ;
	
	/**
	 * 逻辑删除键位
	 */
//	@Column(name = "Flg_deleted", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	private String FLG_DELETED;

	

//	
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
	

	@Override
	public void setFormToEntityProperties(Demo11Entity instance) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		//super.setEntityProperties(instance);
        instance.setId(this.getId());
		instance.setOrderTitle(this.getOrderTitle());
		instance.setSalmon(this.getSalmon());
		instance.setRemark(this.getRemark());
		instance.setCreator(this.getCreator());
		instance.setCreateDate(this.getCreateDate());
		instance.setLastUpdator(this.getLastUpdator());
		instance.setLastUpdateDate(this.getLastUpdateDate());
		instance.setFLG_DELETED(this.getFLG_DELETED());
	}

	@Override
	public String toString() {
		return "Demo11Form [id=" + id + ", orderTitle=" + orderTitle + ", salmon=" + salmon + ", remark=" + remark
				+ ", creator=" + creator + ", createDate=" + createDate + ", lastUpdator=" + lastUpdator
				+ ", lastUpdateDate=" + lastUpdateDate + ", FLG_DELETED=" + FLG_DELETED + "]";
	}

	

}

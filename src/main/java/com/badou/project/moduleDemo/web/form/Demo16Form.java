package com.badou.project.moduleDemo.web.form;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.badou.project.moduleDemo.model.Demo16Entity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;

public class Demo16Form extends BaseStrutsEntityForm<Demo16Entity>  {

	private String name;
	
	/**
	 * 所属销售人员名称
	 */

	private String phone;
	
	/**
	 * 备注
	 */
	private String sex;
	
	private String discount;
	
	private String remark;
	
	/**
	 * 创建人
	 */
	private String creator;
	
	/**
	 * 创建日期
	 */
	@Temporal(TemporalType.TIMESTAMP)
	private Date  createDate;
	
	/**
	 * 最后修改人
	 */
	private String lastUpdator;
	
	/**
	 * 最后更新日期
	 */
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdateDate ;
	
	/**
	 * 逻辑删除键位
	 */
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

	@Override
	public String toString() {
		return "Demo16Form [name=" + name + ", phone=" + phone + ", sex=" + sex + ", discount=" + discount + ", remark="
				+ remark + ", creator=" + creator + ", createDate=" + createDate + ", lastUpdator=" + lastUpdator
				+ ", lastUpdateDate=" + lastUpdateDate + ", FLG_DELETED=" + FLG_DELETED + "]";
	}
	
	
}

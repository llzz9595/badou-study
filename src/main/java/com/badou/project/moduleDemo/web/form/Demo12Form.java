package com.badou.project.moduleDemo.web.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.badou.project.moduleDemo.model.Demo12Entity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;

public class Demo12Form  extends BaseStrutsEntityForm<Demo12Entity> {

	
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
	
//	@Column(name = "orderNo", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String orderNo;
	
//	@Column(name = "customerName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String customerName;
	
//	@Column(name = "customerPhoneNum", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String customerPhoneNum;
	
	/**
	 * 子对象
	 */
	private List<Demo12ChildForm> children = new ArrayList<Demo12ChildForm>();
	
	@Override
	public void setEntityToFormProperties(Demo12Entity instance) {
		super.setEntityToFormProperties(instance);
		if (!instance.getDemo12Childs().isEmpty()) {
			Demo12ChildForm cf = null;
			for (Demo12ChildEntity c : instance.getDemo12Childs()) {
				cf = new Demo12ChildForm();
				com.shengdai.global.util.bean.BeanUtils.copyProperties(cf, c);
				cf.setId(c.getId());
				children.add(cf);
			}
		}
	}

	@Override
	public void setFormToEntityProperties(Demo12Entity instance) {

		instance.setOrderNo(this.getOrderNo());
		instance.setOrderTitle(this.getOrderTitle());
		instance.setOrderNo(this.getOrderNo());
		instance.setSalmon(this.getSalmon());
		instance.setRemark(this.getRemark());
		instance.setCustomerName(this.getCustomerName());
		instance.setCustomerPhoneNum(this.getCustomerPhoneNum());
		instance.setCreator(this.getCreator());
		instance.setCreateDate(this.getCreateDate());
		instance.setLastUpdator(this.getLastUpdator());;
		instance.setLastUpdateDate(this.getLastUpdateDate());
		
	}
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhoneNum() {
		return customerPhoneNum;
	}

	public void setCustomerPhoneNum(String customerPhoneNum) {
		this.customerPhoneNum = customerPhoneNum;
	}

	public List<Demo12ChildForm> getChildren() {
		
		return children;
	}

	public void setChildren(List<Demo12ChildForm> children) {
		this.children = children;
	}
	

}

package com.badou.project.moduleDemo.web.form;

import java.util.Date;

import javax.persistence.Column;

import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.badou.project.moduleDemo.model.Demo12Entity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.factory.InstanceFactory;

public class Demo12ChildForm  extends BaseStrutsEntityForm<Demo12ChildEntity>{
	

	/**
	 * 订单id
	 */
//	@Column(name = "orderID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String orderID;
	
	/**
	 * 商品名称
	 */
//	@Column(name = "goodsName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String goodsName;
	
	/**
	 * 商品数量
	 */
//	@Column(name = "goodsCount", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsCount;

	/**
	 * 商品单价
	 */
//	@Column(name = "goodsMoney", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsMoney ;
	/**
	 * 商品总价
	 */
//	@Column(name = "goodsSubMoney", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsSubMoney ;
	/**
	 * 创建者ID
	 */
	private String creator;
	/**
	 * 创建 日期
	 */
//	@Column(name = "CreateDate", unique = false, nullable = true, insertable = true, updatable = true)
//	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate ;
	
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
	
	@Override
	public void setFormToEntityProperties(Demo12ChildEntity instance) {
		super.setFormToEntityProperties(instance);
		//设置主表对象
		Demo12Entity entity = InstanceFactory.get(Demo12Entity.class, orderID);
		instance.setDemo12(entity);
		System.out.println(orderID);
		entity.getDemo12Childs().add(instance);
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}

	public String getGoodsMoney() {
		return goodsMoney;
	}

	public void setGoodsMoney(String goodsMoney) {
		this.goodsMoney = goodsMoney;
	}

	public String getGoodsSubMoney() {
		return goodsSubMoney;
	}

	public void setGoodsSubMoney(String goodsSubMoney) {
		this.goodsSubMoney = goodsSubMoney;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}
	@JSON(format="yyyy-MM-dd HH:mm:ss")
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
	@JSON(format="yyyy-MM-dd HH:mm:ss")
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	
	
	
	

	 

}

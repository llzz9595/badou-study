package com.badou.project.moduleDemo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity;

@javax.persistence.Entity
@Table(name = "demo12_orders_detail_lps")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE) 缓存配置
@Where(clause = "FLG_DELETED=0")
public class Demo12ChildEntity extends AppBaseEntity{
	
	/**
	 * 订单id
	 */
	@Column(name = "orderID", unique = false, nullable = true, insertable = false, updatable = false, length = 32)
	private String orderID;
	
	/**
	 * 商品名称
	 */
	@Column(name = "goodsName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String goodsName;
	
	/**
	 * 商品数量
	 */
	@Column(name = "goodsCount", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsCount;

	/**
	 * 商品单价
	 */
	@Column(name = "goodsMoney", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsMoney ;
	/**
	 * 商品总价
	 */
	@Column(name = "goodsSubMoney", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	private String goodsSubMoney ;
	
	/**
	 * 创建人
	 */
	@Column(name = "creator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String creator;
	/**
	 * 创建 日期
	 */
	@Column(name = "CreateDate", unique = false, nullable = true, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate ;
	
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

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	
	@JoinColumn(name = "orderID", referencedColumnName = "id")
	@ManyToOne
	private Demo12Entity demo12;
	
	

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

	public Demo12Entity getDemo12() {
		return demo12;
	}

	public void setDemo12(Demo12Entity demo12) {
		this.demo12 = demo12;
	}
	
	
	
	
	
	
	

}

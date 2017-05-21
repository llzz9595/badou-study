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
import com.shengdai.global.annotation.DefaultOrderBy;
@javax.persistence.Entity
@Table(name = "demo12_goods_lps")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="createDate desc") //默认排序，该排序只针对单表有效

public class Demo13Entity extends AppBaseEntity {
	/**
	 * 商品名称
	 */
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String name;
	/**
	 * 商品价格
	 */
	@Column(name = "price", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String price;
	/**
	 * 商品描述
	 */
	@Column(name = "desc1", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String desc;

	/**
	 * 商品的图片地址
	 */
	@Column(name = "imgUrl", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String imgUrl;
	/**
	 * 创建人
	 */
	@Column(name = "creator", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String creator;
	/**
	 * 创建时间
	 */
	@Column(name = "createDate", unique = false, nullable = true, insertable = true, updatable = true)
	private Date createDate;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
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

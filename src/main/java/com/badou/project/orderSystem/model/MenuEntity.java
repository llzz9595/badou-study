package com.badou.project.orderSystem.model;

import javax.persistence.Column;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;
import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
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
@Table(name = "MENU_INFO")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="createTime desc") //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")
public class MenuEntity extends AppBaseEntity1 {

	/**
	 * 
	 */
	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 菜单名称
	 */
	@Column(name = "menuName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String menuName;
	/**
	 * 价格
	 */
	@Column(name = "price", unique = false, nullable = true, insertable = true, updatable = true, length = 22, scale = 0)
	private double price;
	
	/**
	 * 所属快餐店
	 */
	@Column(name = "restaurant", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String restaurant;
	
	/**
	 * 是否有效
	 */
	@Column(name = "effective", unique = false, nullable = true, insertable = true, updatable = true, length = 16)
	private String effective;
	
	/**
	 * 菜单图片
	 */
	@Column(name = "smallIcon", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String smallIcon;
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getEffective() {
		return effective;
	}
	public void setEffective(String effective) {
		this.effective = effective;
	}
	public String getSmallIcon() {
		return smallIcon;
	}
	public void setSmallIcon(String smallIcon) {
		this.smallIcon = smallIcon;
	}
	
	
}

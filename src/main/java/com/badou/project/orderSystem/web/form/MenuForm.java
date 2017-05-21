package com.badou.project.orderSystem.web.form;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.orderSystem.model.MenuEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.global.enums.SystemBoolean;

public class MenuForm extends BaseStrutsEntityForm<MenuEntity> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6227752468574948125L;

	

	
	/**
	 * 逻辑删除标识
	 */
	protected Integer flgDeleted = SystemBoolean.NO.getKey();
	/**
	 * 菜单名称
	 */
	private String menuName;
	/**
	 * 菜单价格
	 */
	private double price;
	
	/**
	 * 所属快餐店
	 */
	private String restaurant;
	
	/**
	 * 是否有效
	 */
	private String effective;
	
	/**
	 * 菜单图片
	 */
	private String smallIcon;
	
	
	public Integer getFlgDeleted() {
		return flgDeleted;
	}

	public void setFlgDeleted(Integer flgDeleted) {
		this.flgDeleted = flgDeleted;
	}

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
	@Override
	public void setEntityToFormProperties(MenuEntity instance) {
		super.setEntityToFormProperties(instance);
	}


	@Override
	public void setFormToEntityProperties(MenuEntity instance) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		//super.setEntityProperties(instance);
		instance.setMenuName(this.getMenuName());
		instance.setPrice(this.getPrice());
		instance.setRestaurant(this.getRestaurant());
		instance.setEffective(this.getEffective());
		instance.setSmallIcon(this.getSmallIcon());
	
		
	}

	@Override
	public String toString() {
		return "MenuForm [id=" + id + ", menuName=" + menuName
				+ ", price=" + price + ", flgDeleted=" + flgDeleted
				+ ", effective=" + effective
				+ ", smallIcon=" + smallIcon 
				+ "]";
	}

}

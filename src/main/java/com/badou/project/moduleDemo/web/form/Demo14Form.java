package com.badou.project.moduleDemo.web.form;

import com.badou.project.moduleDemo.model.Demo12Entity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;

public class Demo14Form  extends BaseStrutsEntityForm<Demo12Entity>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String customer;
	private int subMoney;
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public int getSubMoney() {
		return subMoney;
	}
	public void setSubMoney(int subMoney) {
		this.subMoney = subMoney;
	}
//	@Override
//	public void setFormToEntityProperties(Demo14Entity instance) {
//		
//
//		instance.setCustomer(this.getCustomer());
//		instance.setCustomer(this.getCustomer());
//	}
//	
	

}

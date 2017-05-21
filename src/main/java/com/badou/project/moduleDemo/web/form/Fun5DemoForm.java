package com.badou.project.moduleDemo.web.form;
import java.util.Date;

import javax.persistence.Column;

import org.apache.struts2.json.annotations.JSON;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;


public class Fun5DemoForm extends BaseStrutsEntityForm<Fun5DemoEntity> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6227752468574948125L;

	
	private String stuID;    //列的声明
	/**
	 * 姓名
	 */
	private String Name;
	
	/**
	 * 性别
	 */
	private String sex;
	
	/**
	 * 年龄
	 */
	private String age;
	
	/**
	 * address
	 */
	private String address;
	
	/**
	 * CREATOR_NAME
	 */
	private String CREATOR_NAME;
	
	
	
	/**
	 * CREATOR
	 */
    private String CREATOR;
	
    
	public String getCREATOR() {
		return CREATOR;
	}

	public void setCREATOR(String cREATOR) {
		CREATOR = cREATOR;
	}

	

	public String getStuID() {
		return stuID;
	}

	public void setStuID(String stuID) {
		this.stuID = stuID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

	public String getCREATOR_NAME() {
		return CREATOR_NAME;
	}

	public void setCREATOR_NAME(String cREATOR_NAME) {
		CREATOR_NAME = cREATOR_NAME;
	}
	
	@Override
	public void setEntityToFormProperties(Fun5DemoEntity instance) {
		super.setEntityToFormProperties(instance);
	}
	@Override
	public void setFormToEntityProperties(Fun5DemoEntity instance) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		//super.setEntityProperties(instance);
		instance.setStuID(this.getStuID());
		instance.setName(this.getName());
		instance.setAddress(this.getAddress());
		instance.setAge(this.getAge());
		instance.setSex(this.getSex());
		instance.setCREATOR_NAME(this.getCREATOR_NAME());
		instance.setCREATOR(this.getCREATOR());
	}
	@Override
	public String toString() {
		return "Fun5DemoForm [stuID=" + stuID + ", Name=" + Name + ", sex="
				+ sex + ", age=" + age + ", address=" + address
				+ ", CREATOR_NAME=" + CREATOR_NAME  +"CREATOR="+ CREATOR + "]";
	}




	

}

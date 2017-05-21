package com.badou.project.moduleDemo.web.form;
import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;
import com.shengdai.global.enums.SystemBoolean;

public class Fun4DemoForm extends BaseStrutsEntityForm<Fun4DemoEntity> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6227752468574948125L;

	

	
	/**
	 * 逻辑删除标识
	 */
	protected Integer flgDeleted = SystemBoolean.NO.getKey();
	/**
	 * 工号
	 */
	private String workerNum;
	/**
	 * 姓名
	 */
	private String workerName;
	
	/**
	 * 性别
	 */
	private String sex;
	
	/**
	 * 身份证号
	 */
	private String identityCard;
	
	/**
	 * 工种
	 */
	protected String genre;
	/**
	 * 入职时间
	 */
	protected Date entryTime = new Date();
	
	/**
	 * 工资
	 */
	private double salary;
	
	/**
	 * 联系方式
	 */
	public String contact;
	
	/**
	 * QQ号
	 */
	public String qq;
	
	/**
	 * 微信
	 */
	public String weChat;
	
	/**
	 * 邮箱
	 */
	public String email;
	
	/**
	 * 家庭住址
	 */
	public String address;
	
	/**
	 * URL路径
	 */
	private String url;
	/**
	 * 小图标路径
	 */
	private String smallIcon;
	
	
	public Integer getFlgDeleted() {
		return flgDeleted;
	}

	public void setFlgDeleted(Integer flgDeleted) {
		this.flgDeleted = flgDeleted;
	}

	public String getWorkerNum() {
		return workerNum;
	}

	public void setWorkerNum(String workerNum) {
		this.workerNum = workerNum;
	}

	public String getWorkerName() {
		return workerName;
	}

	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@JSON(format = "yyyy-MM-dd HH:mm:ss")
	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public String getWeChat() {
		return weChat;
	}

	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getSmallIcon() {
		return smallIcon;
	}

	public void setSmallIcon(String smallIcon) {
		this.smallIcon = smallIcon;
	}
	@Override
	public void setEntityToFormProperties(Fun4DemoEntity instance) {
		super.setEntityToFormProperties(instance);
	}


	@Override
	public void setFormToEntityProperties(Fun4DemoEntity instance) {
		//可重写该方法，以实现保存内容的正确性
		//比如字典库转换，数组拆分存储等。
		//super.setEntityProperties(instance);
		instance.setWorkerNum(this.getWorkerNum());
		instance.setWorkerName(this.getWorkerName());
		instance.setSex(this.getSex());
		instance.setIdentityCard(this.getIdentityCard());
		instance.setGenre(this.getGenre());
		instance.setSalary(this.getSalary());
		instance.setContact(this.getContact());
		instance.setQq(this.getQq());
		instance.setWeChat(this.getWeChat());
		instance.setEmail(this.getEmail());
		instance.setAddress(this.getAddress());
		instance.setSmallIcon(this.getSmallIcon());
		instance.setUrl(this.getUrl());
		
	}

	@Override
	public String toString() {
		return "Fun4DemoForm [id=" + id + ", workerNum=" + workerNum
				+ ", workerName=" + workerName + ", sex=" + sex
				+ ", flgDeleted=" + flgDeleted + ", identityCard=" + identityCard
				+ ", entryTime=" + entryTime + ", genre=" + genre
				+ ", salary=" + salary + ", contact=" + contact
				+ ", qq=" + qq + ", weChat=" + weChat
				+ ", email=" + email + ", address=" + address
				+ ", smallIcon=" + smallIcon + ", url=" + url
				+ "]";
	}

}

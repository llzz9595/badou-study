package com.badou.project.moduleDemo.model;

import javax.persistence.Column;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity4;
import com.shengdai.global.annotation.DefaultOrderBy;
/**
 * 应用DEMO实体对象,示例2
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
 * @author xiangsf 2013-1-18
 */
@javax.persistence.Entity  			//实体类定义，该标签表示当前类是一个Hibernate的数据库实体，对应着数据库中的某个表
@Table(name = "WORKER_INFO") 		//指定数据库的某张表
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="entryTime desc")	 //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")			//实现条件过滤功能，实现逻辑删除
public class Fun4DemoEntity extends AppBaseEntity4 {

	/**
	 * 
	 */
	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 工号
	 */
	@Column(name = "workerNum", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String workerNum;    //列的声明
	/**
	 * 姓名
	 */
	@Column(name = "workerName", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String workerName;
	
	/**
	 * 性别
	 */
	@Column(name = "sex", unique = false, nullable = true, insertable = true, updatable = true, length = 2)
	private String sex;
	
	/**
	 * 身份证号
	 */
	@Column(name = "identityCard", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String identityCard;
	
	/**
	 * 工种
	 */
	@Column(name = "genre", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String genre;
	
	/**
	 * 工资
	 */
	@Column(name = "salary", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	private double salary;
	
	/**
	 * 联系方式
	 */
	@Column(name = "contact", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String contact;
	
	/**
	 * QQ号
	 */
	@Column(name = "qq", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String qq;
	
	/**
	 * 微信号
	 */
	@Column(name = "weChat", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String weChat;
	
	/**
	 * 邮箱
	 */
	@Column(name = "email", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String email;
	
	/**
	 * 家庭住址
	 */
	@Column(name = "address", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	private String address;
	
	/**
	 * URL路径
	 */
	@Column(name = "url", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String url;
	/** 
	 * 小图标路径
	 */
	@Column(name = "smallIcon", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String smallIcon;
	
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
	
	public String getSmallIcon() {
		return smallIcon;
	}

	public void setSmallIcon(String smallIcon) {
		this.smallIcon = smallIcon;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
	
}

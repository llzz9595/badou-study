package com.badou.project.moduleDemo.model;

import javax.persistence.Column;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

import com.shengdai.base.support.hibernate.used.AppBaseEntity;
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
@Table(name = "SD_ZTDEMO") 		//指定数据库的某张表
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="age desc")	 //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")			//实现条件过滤功能，实现逻辑删除
public class Fun5DemoEntity extends AppBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 444904135356506239L;

	/**
	 * 编号
	 */
	@Column(name = "stuID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String stuID;    //列的声明
	/**
	 * 姓名
	 */
	@Column(name = "Name", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String Name;
	
	/**
	 * 性别
	 */
	@Column(name = "sex", unique = false, nullable = true, insertable = true, updatable = true, length = 2)
	private String sex;
	
	/**
	 * 年龄1
	 */
	@Column(name = "age", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	private String age;
	
	/**
	 * address
	 */
	@Column(name = "address", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	private String address;
	
	/**
	 * CREATOR_NAME
	 */
	@Column(name = "CREATOR_NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String CREATOR_NAME;

	/**
	 * FLG_DELETED
	 */
	@Column(name = "FLG_DELETED", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	private int FLG_DELETED;
	

	/**
	 * CREATOR
	 */
	@Column(name = "CREATOR", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String CREATOR;
	
	
	public String getCREATOR() {
		return CREATOR;
	}

	public void setCREATOR(String cREATOR) {
		CREATOR = cREATOR;
	}

	public int getFLG_DELETED() {
		return FLG_DELETED;
	}

	public void setFLG_DELETED(int fLG_DELETED) {
		FLG_DELETED = fLG_DELETED;
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

	




	
	
	
}

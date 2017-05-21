package com.badou.project.moduleDemo.model;
/*http://www.cnblogs.com/hongten/archive/2011/07/20/2111773.html
*/import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Where;
import com.shengdai.base.support.hibernate.used.AppBaseEntity5;
@javax.persistence.Entity
@Table(name = "SD_DEMO_FUN1_CHILD")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE) 缓存配置
@Where(clause = "FLG_DELETED=0")
public class Fun1DemoChildEntity extends AppBaseEntity5 {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4739297943076205488L;

	/**
	 * 字段1
	 */
	@Column(name = "field_name_1", unique = false, nullable = true, insertable = true, updatable = true, length = 64)
	private String fieldName1;
	
	/**
	 * 字段1
	 */
	@Column(name = "field_name_2", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	private String fieldName2;
	
	
	@Column(name = "fun1_demo_id", unique = false, nullable = true, insertable = false, updatable = false, length = 128)
	private String fun1demoid;
	
	public String getFun1demoid() {
		return fun1demoid;
	}

	public void setFun1demoid(String fun1demoid) {
		this.fun1demoid = fun1demoid;
	}

	@JoinColumn(name = "fun1_demo_id", referencedColumnName = "id")
	@ManyToOne
	private Fun1DemoEntity fun1Demo;
	
	public String getFieldName1() {
		return fieldName1;
	}

	public void setFieldName1(String fieldName1) {
		this.fieldName1 = fieldName1;
	}

	public String getFieldName2() {
		return fieldName2;
	}

	public void setFieldName2(String fieldName2) {
		this.fieldName2 = fieldName2;
	}

	public Fun1DemoEntity getFun1Demo() {
		return fun1Demo;
	}

	public void setFun1Demo(Fun1DemoEntity fun1Demo) {
		this.fun1Demo = fun1Demo;
	}
	
	
}

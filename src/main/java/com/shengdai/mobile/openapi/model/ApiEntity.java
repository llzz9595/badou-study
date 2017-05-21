package com.shengdai.mobile.openapi.model;

import javax.persistence.Column;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;
import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
import com.shengdai.global.annotation.DefaultOrderBy;
/**
 * 订单实体类
 * 应用meal 继承第4种 未实现最后更新者信息
 * <p>该实体对象一般来讲，映射数据库表
 * <br/>命名规则：应用功能名称+Entity
 * <br/>按业务实际情况继承<package>com.shengdai.base.support.hibernate</package>包下抽象实体类
 * <ul>
 * </ul>
 * @author xpp 2012-06-25
 */
@javax.persistence.Entity
@Table(name = "mobile_open_api")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="CREATE_TIME desc") //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")
public class ApiEntity extends AppBaseEntity1{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9049113475202984750L;

	/**
	 * 接口名称
	 */
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String name;
	
	/**
	 * 接口路径
	 */
	@Column(name = "url", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String url;
	
	/**
	 * 接口状态
	 */
	@Column(name = "type", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String type;
	
	/**
	 * 消息代码
	 */
	@Column(name = "msg_code", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String msgCode;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMsgCode() {
		return msgCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}

	
}

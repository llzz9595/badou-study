package com.shengdai.mobile.version.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
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
@Table(name = "mobile_apk_version")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="CREATE_TIME desc") //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")

public class ApkVersionEntity extends AppBaseEntity1{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4305056877596860897L;
	
	/**
	 * Resource
	 */
	@OrderBy(value = "id")
	@Cascade({org.hibernate.annotations.CascadeType.ALL})
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "apkVersion")
	private Set<ResourceVersionEntity> resourceVersion = new HashSet<ResourceVersionEntity>();
	
	/**
	 * 版本名称
	 */
	@Column(name = "version_name", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String versionName;
	
	/**
	 * 版本描述
	 */
	@Column(name = "version_description", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String versionDescription;	
	
	/**
	 * 版本号
	 */
	@Column(name = "version_num", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private int versionNum;	
	
	/**
	 * 附件存放路径
	 */
	@Column(name = "apk_url", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String apkUrl;
	
	
	/**
	 * 附件名称
	 */
	@Column(name = "attach_name", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String attachName;
	
	@Column(name = "attach_size", unique = false, nullable = true, insertable = true, updatable = true)
	private Long attachSize;

	public String getVersionName() {
		return versionName;
	}

	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}

	public String getVersionDescription() {
		return versionDescription;
	}

	public void setVersionDescription(String versionDescription) {
		this.versionDescription = versionDescription;
	}

	public int getVersionNum() {
		return versionNum;
	}

	public void setVersionNum(int versionNum) {
		this.versionNum = versionNum;
	}

	public String getApkUrl() {
		return apkUrl;
	}

	public void setApkUrl(String apkUrl) {
		this.apkUrl = apkUrl;
	}

	public Set<ResourceVersionEntity> getResourceVersion() {
		return resourceVersion;
	}

	public void setResourceVersion(Set<ResourceVersionEntity> resourceVersion) {
		this.resourceVersion = resourceVersion;
	}


	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public Long getAttachSize() {
		return attachSize;
	}

	public void setAttachSize(Long attachSize) {
		this.attachSize = attachSize;
	}

	
	
}

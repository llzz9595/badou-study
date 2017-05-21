package com.shengdai.mobile.version.model;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;
import com.shengdai.base.support.hibernate.used.AppBaseEntity1;
import com.shengdai.global.annotation.DefaultOrderBy;
/**
 * HTML5管理实体类
 * 应用meal 继承第4种 未实现最后更新者信息
 * <p>该实体对象一般来讲，映射数据库表
 * <br/>命名规则：应用功能名称+Entity
 * <br/>按业务实际情况继承<package>com.shengdai.base.support.hibernate</package>包下抽象实体类
 * <ul>
 * </ul>
 * @author xpp 2012-06-25
 */
@javax.persistence.Entity
@Table(name = "mobile_resource_version")
@Cache(usage = CacheConcurrencyStrategy.NONE) //缓存配置
@DefaultOrderBy(clause="CREATE_TIME desc") //默认排序，该排序只针对单表有效
@Where(clause = "FLG_DELETED=0")

public class ResourceVersionEntity extends AppBaseEntity1{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2298306304858922681L;
	
	/**
	 * APK 
	 */
	@ManyToOne
	@JoinColumn(name = "apk_id", referencedColumnName = "id")
	private ApkVersionEntity apkVersion; 
	
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
	@Column(name = "resource_url", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	private String resourceUrl;
	
	/**
	 * 附件名称
	 */
	@Column(name = "attach_name", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String attachName;
	
	/**
	 * apk_id
	 */
	@Column(name = "apk_id", unique = false, nullable = false, insertable = false, updatable = false, length = 32)
	private String apkId;

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

	public String getApkId() {
		return apkId;
	}

	public void setApkId(String apkId) {
		this.apkId = apkId;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public ApkVersionEntity getApkVersion() {
		return apkVersion;
	}

	public void setApkVersion(ApkVersionEntity apkVersion) {
		this.apkVersion = apkVersion;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}	
	
	
	
	
}

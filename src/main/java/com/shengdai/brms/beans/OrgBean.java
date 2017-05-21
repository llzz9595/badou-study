package com.shengdai.brms.beans;

import com.shengdai.kpi.system.org.Constants;
import com.shengdai.kpi.system.org.vo.Org;

/**
 * 组织信息与业务接口承接类
 * @author xiangsf 2013-3-9
 *
 */
public class OrgBean {
	/**
	 * id属性
	 */
	private String id;
	/**
	 * 所属SYS_ORG属性
	 */		
	private String parentId;
	
	/**
	 * 所属SYS_ORG属性
	 */		
	private String parentName;
	/**
	 * name属性
	 */
	private String name;
	
	/**
	 * code属性
	 */
	private String code;
	/**
	 * 负责人属性
	 */
	private String satrapId;
	
	/**
	 * 负责人名称
	 */
	private String satrapName;
	
	/**
	 * full_path属性
	 */
	private String fullPath;
	
	/**
	 * priority属性
	 */
	private int priority;
	/**
	 * full_name属性
	 */
	private String fullName;
	
	/**
	 * layer属性
	 */
	private int layer;
	
	/**
	 * remark属性
	 */
	private String remark;

	private int uniformIntType = Constants.ORG_UNIFORM_TYPE_FRONT;

	public OrgBean(){}
	
	public OrgBean(Org org){
		this.id = org.getId();
		this.name = org.getName();
		this.code = org.getCode();
		this.fullName = org.getFullName();
		this.fullPath = org.getFullPath();
		this.layer = org.getLayer();
		Org parentOrg = org.getOrg();
		if(parentOrg != null){
			this.parentId = parentOrg.getId();
			this.parentName = parentOrg.getName();
		}
		this.priority = org.getPriority();
		this.remark = org.getRemark();
		this.satrapId = org.getSatrapId();
		this.satrapName = org.getSatrapName();
		this.uniformIntType = org.getUniformIntType();
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSatrapId() {
		return satrapId;
	}

	public void setSatrapId(String satrapId) {
		this.satrapId = satrapId;
	}

	public String getSatrapName() {
		return satrapName;
	}

	public void setSatrapName(String satrapName) {
		this.satrapName = satrapName;
	}

	public String getFullPath() {
		return fullPath;
	}

	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getLayer() {
		return layer;
	}

	public void setLayer(int layer) {
		this.layer = layer;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getUniformIntType() {
		return uniformIntType;
	}

	public void setUniformIntType(int uniformIntType) {
		this.uniformIntType = uniformIntType;
	}
	
	
}

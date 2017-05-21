package com.shengdai.brms.beans;

import com.shengdai.kpi.system.org.vo.User;


/**
 * 用户信息与业务接口承接类
 * @author xiangsf 2013-3-9
 *
 */
public class UserBean {

	private String id;//用户ID
	
	private String orgId;//所属组织ＩＤ
	private String orgName;
	private String orgAddress;//组织地址
	private String positionId;//岗位ID
	private String positionName;//岗位名称
	private String positionLayer;//岗位层级

	private int priority = 1;//同组织内排序

	private String preManagerId;//上级领导ID
	private String preManagerName;//上级领导名称

	private String remark;
	//用户公共信息
	private String logonId;
	private String userCode;
	private String pwd;
	private String name;
	private String qq;
	private String tel;
	private String email;
	//地址本表达式
	private String addressExpress;
	public UserBean(){}
	
	public UserBean(User user){
		this.id = user.getId();
		this.email = user.getEmail();
		this.logonId = user.getLogonId();
		this.name =user.getName();
		this.orgId = user.getOrg().getId();
		this.orgName = user.getOrg().getName();
		this.orgAddress = user.getOrg().getAddress();
		this.positionId = user.getPositionId();
		this.positionLayer = user.getPositionLayer();
		this.positionName = user.getPositionName();
		this.preManagerId = user.getPreManagerId();
		this.preManagerName = user.getPreManagerName();
		this.priority = user.getPriority();
		this.pwd = user.getPwd();
		this.qq = user.getQq();
		this.remark = user.getRemark();
		this.tel = user.getTel();
		this.addressExpress = user.getAddressInfo();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getPositionLayer() {
		return positionLayer;
	}
	public void setPositionLayer(String positionLayer) {
		this.positionLayer = positionLayer;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getPreManagerId() {
		return preManagerId;
	}
	public void setPreManagerId(String preManagerId) {
		this.preManagerId = preManagerId;
	}
	public String getPreManagerName() {
		return preManagerName;
	}
	public void setPreManagerName(String preManagerName) {
		this.preManagerName = preManagerName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLogonId() {
		return logonId;
	}
	public void setLogonId(String logonId) {
		this.logonId = logonId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the orgAddress
	 */
	public String getOrgAddress() {
		return orgAddress;
	}

	/**
	 * @param orgAddress the orgAddress to set
	 */
	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}

	public String getAddressExpress() {
		return addressExpress;
	}

	public void setAddressExpress(String addressExpress) {
		this.addressExpress = addressExpress;
	}

}

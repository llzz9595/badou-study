package com.shengdai.brms.beans;


public class RoleBean {

	private String id;
	
	private String code;
	
	private String name;
	
	private String indexUrl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIndexUrl() {
		return indexUrl;
	}

	public void setIndexUrl(String indexUrl) {
		this.indexUrl = indexUrl;
	}
	
	public boolean isSA(){
		return com.shengdai.brms.BrmsConst.ADMIN_ROLE_ID.equalsIgnoreCase(this.code);
	}
	
	public boolean isSaler(){
		return com.shengdai.brms.BrmsConst.SELL_ROLE_ID.equalsIgnoreCase(this.code);
	}
	
}

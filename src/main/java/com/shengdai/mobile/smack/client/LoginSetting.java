package com.shengdai.mobile.smack.client;

/**
 * openfire登录配置信息
 */
public class LoginSetting {

	private String host;
	private String domain;
	private int port;
	
	private String userName;
	private String password;
	
	public LoginSetting() {
		
	}
	
	public LoginSetting(String host, String domain, int port, String userName,
			String password) {
		super();
		this.host = host;
		this.domain = domain;
		this.port = port;
		this.userName = userName;
		this.password = password;
	}
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}

}

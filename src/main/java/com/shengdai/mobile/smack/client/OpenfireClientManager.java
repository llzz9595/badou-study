package com.shengdai.mobile.smack.client;

import java.util.List;

import org.apache.log4j.Logger;

import com.shengdai.mobile.smack.listener.DefaultPacketListener;

/**
 * openfire客户端管理类
 * 执行客户端登录，消息发送等
 * @author zhouan
 *
 */
public class OpenfireClientManager {

	private Logger logger = Logger.getLogger(OpenfireClientManager.class);
	
	public static OpenfireClientManager clientManager;
	private static LoginSetting setting;
	private OpenfireClient client;
	private boolean isLogin = false;
	private int retry = 10;
	
	private OpenfireClientManager() {
		client = new OpenfireClient();
		if (client.connectServer(setting.getHost(), setting.getPort())) {
			isLogin = client.login(setting.getUserName(), setting.getPassword());
			if (isLogin)
				client.registerPacketListener(new DefaultPacketListener());
		} else {
			logger.error("openfire 连接失败！");
		}
	}
	
	/**
	 * 客户端登录，登录前需先调用getSetting设置登录相关信息
	 * @return
	 */
	synchronized public static OpenfireClientManager login(LoginSetting _setting) {
		if (_setting == null)
			throw new RuntimeException("openfire客户端登录失败：未设置登录信息");
		setting = _setting;
		if (clientManager == null)
			clientManager = new OpenfireClientManager();
		return clientManager;
	}
	
	public void logout() {
		client.disconnect();
	}
	
	public boolean sendMessage(String toUser, String message) {
		return client.sendMessage(toUser, setting.getDomain(), message);
	}
	
	public boolean sendMessages(List<String> toUsers, String message) {
		boolean flag = false;
		for (String toUser : toUsers) {
			flag = client.sendMessage(toUser, setting.getDomain(), message);
		}
		return flag;
	}
	
	public boolean isLogin() {
		return isLogin;
	}
	
	public void retry() {
		if (client == null)
			client = new OpenfireClient();
		int temp = 0;
		while (!isLogin && temp < retry) {
			if (client.connectServer(setting.getHost(), setting.getPort())) {
				isLogin = client.login(setting.getUserName(), setting.getPassword());
				if (isLogin)
					client.registerPacketListener(new DefaultPacketListener());
			} else {
				logger.error("openfire重连失败!");
			}
		}
	}
}

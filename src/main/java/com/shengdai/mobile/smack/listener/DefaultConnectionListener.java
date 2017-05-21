package com.shengdai.mobile.smack.listener;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.jivesoftware.smack.ConnectionListener;


/**
 * 默认openfire连接监听器
 * @author zhouan
 *
 */
public class DefaultConnectionListener implements ConnectionListener {
	
	private Logger logger = Logger.getLogger(DefaultConnectionListener.class);

	public void connectionClosed() {
		logger.error("connection is closed");
	}

	public void connectionClosedOnError(Exception e) {
		logger.error("connection is closed unexpected, occured an error: " + e.getMessage());
		Pattern pattern = Pattern.compile("conflict");
		Matcher matcher = pattern.matcher(e.getMessage());
		if (matcher.find()) { 
			logger.error("警告：您使用的openfire账户已在其他地方登录！");
		}
		//e.printStackTrace();
	}

	public void reconnectingIn(int seconds) {
		logger.debug("try reconnect after " + seconds + " seconds");
	}

	public void reconnectionFailed(Exception arg0) {
		logger.warn("reconnect failed");
	}

	public void reconnectionSuccessful() {
		logger.debug("reconnect is successful!");
	}
	
}

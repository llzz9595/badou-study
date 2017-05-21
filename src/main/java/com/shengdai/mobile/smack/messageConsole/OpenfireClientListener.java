package com.shengdai.mobile.smack.messageConsole;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.shengdai.common.cfg.ConfigContainer;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.mobile.smack.client.LoginSetting;
import com.shengdai.mobile.smack.client.OpenfireClientManager;
import com.shengdai.mobile.smack.common.SmackPropertiesLoader;

/**
 * openfire客户端监听器，在spring加载完后，开始登录openfire
 * @author zhouan
 *
 */
public class OpenfireClientListener implements ServletContextListener {

	private static final Logger logger = Logger.getLogger(OpenfireClientListener.class);
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent context) {
		ConfigContainer.getInstance().register(SmackPropertiesLoader.class);
		LoginSetting setting = new LoginSetting(PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_HOST, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
												PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_DOMAIN, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
												PropertyUtils.getIntProperty(SmackPropertiesLoader.OPENFIER_PORT, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
												PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_USERNAME, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
												PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_PASSWORD, SmackPropertiesLoader.SMACK_CONFIG_FILE));
		final OpenfireClientManager manager = OpenfireClientManager.login(setting);
		if (!manager.isLogin()) {
			logger.error("登录失败，尝试重连...");
			manager.retry();
		}
		if (!manager.isLogin())
			throw new RuntimeException("openfire 服务器连接失败，请检查故障，并重新启动web服务！");
	}


}

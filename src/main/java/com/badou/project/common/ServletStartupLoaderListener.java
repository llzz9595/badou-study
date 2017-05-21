package com.badou.project.common;

import javax.servlet.ServletContextEvent;


import com.shengdai.common.cfg.ConfigContainer;
import com.shengdai.common.listener.ServletContextLoaderListener;
import com.shengdai.factory.InstanceFactory;
import com.shengdai.kpi.system.SpringHelper;

public class ServletStartupLoaderListener extends ServletContextLoaderListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		super.contextDestroyed(arg0);
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		super.contextInitialized(arg0);
		InstanceFactory.setServletContent(arg0.getServletContext());
		SpringHelper.setServletContent(arg0.getServletContext());
		com.shengdai.global.util.SpringHelper.setServletContent(arg0.getServletContext());
		
		// cas配置文件
		ConfigContainer.getInstance().register(com.shengdai.ssl.cas.CASPropertiesLoader.class);
		// version配置文件
		ConfigContainer.getInstance().register(com.shengdai.version.VersionPropertiesLoader.class);
	}
	
}

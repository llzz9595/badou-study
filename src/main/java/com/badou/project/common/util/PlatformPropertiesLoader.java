package com.badou.project.common.util;

import com.shengdai.common.cfg.ConfigLocalLoader;
import com.shengdai.common.cfg.PropertiesConfigLocalLoader;

public class PlatformPropertiesLoader extends PropertiesConfigLocalLoader
		implements ConfigLocalLoader {

	/**
	 * 配置文件
	 */
	public static final String CONFIG_FILE = "platform.properties";
	
	@Override
	public String getFileName() {
		return CONFIG_FILE;
	}
	
	public static final String SYS_ORG_TEACHER = "SYS_ORG_TEACHER";
	public static final String SYS_ROLE_TEACHER ="SYS_ROLE_TEACHER";

}

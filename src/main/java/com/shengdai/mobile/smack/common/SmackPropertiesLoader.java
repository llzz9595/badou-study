package com.shengdai.mobile.smack.common;

import com.shengdai.common.cfg.PropertiesConfigLocalLoader;

public class SmackPropertiesLoader extends PropertiesConfigLocalLoader {

	public static final String SMACK_CONFIG_FILE = "smack.properties";
	
	public static final String OPENFIRE_HOST = "openfire.server.host";
	
	public static final String OPENFIRE_DOMAIN = "openfire.server.domain";
	
	public static final String OPENFIER_PORT = "openfire.server.port";
	
	public static final String OPENFIRE_USERNAME = "openfire.client.username";
	
	public static final String OPENFIRE_PASSWORD = "openfire.client.password";
	
	@Override
	public String getFileName() {
		return SMACK_CONFIG_FILE;
	}

}

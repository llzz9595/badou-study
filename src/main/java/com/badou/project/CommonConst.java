package com.badou.project;

import java.io.InputStream;
import java.util.Properties;

public class CommonConst
{
	private static Properties properties = new Properties();
	
	private static  CommonConst instance;
	
	private final static String COMMONT_PEOPERTIES_NAME = "/common.properties";

	private CommonConst() throws Exception
	{
		try
		{
			java.net.URL u = CommonConst.class.getClassLoader().getResource(COMMONT_PEOPERTIES_NAME);
			InputStream is = (InputStream) u.getContent();
			properties.load(is);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw ex;
		}
	}

	/**
	 * @return 杩斿洖閰嶇疆淇℃伅鐨勫疄渚�
	 */
	public static CommonConst getInstance() throws Exception
	{
		if(instance == null)
		{
			instance = new CommonConst();
		}
		return instance;
	}
	
	public static String getConstantString(String param)
	{
		String str = null;
		try
		{
			str = properties.getProperty(param);
		}
		catch(Exception ex)
		{
		}
		return str;
	}
}

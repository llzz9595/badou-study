package com.shengdai.mobile.smack.common;

import java.lang.reflect.Method;

import org.apache.log4j.Logger;

/**
 * 通用线程类，可指定某个类中的某个方法采用线程执行
 * @author zhouan
 *
 */
public class CommonMethodThread extends Thread {
	private Logger logger = Logger.getLogger(CommonMethodThread.class);
	
	private Object instance;
	private Method method;
	private Object[] params;
	
	@Override
	public void run() {
		try {
			logger.info("start a thread invoke the method [" + method.getName() + "] of class" + instance.getClass().getName());
			this.method.invoke(instance, params);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	/**
	 * 设置线程执行的任务：指定类中的公共方法
	 * @param clazz 方法所属类
	 * @param methodName 方法名
	 * @param params 方法参数
	 */
	public void setJob(Class<?> clazz, String methodName, Object ... params) {
		try {
			Method[] methods = clazz.getMethods();
			for (Method method : methods) {
				if (method.getName().equals(methodName)) {
					this.method = method;
					break;
				}
			}
			if (this.method == null) {
				throw new RuntimeException("unknow public method [" + methodName + "] in " + clazz.getName());
			}
			this.instance = clazz.newInstance();
			this.params = params;
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	/**
	 * 设置线程执行的任务
	 * @param clazz 方法所属类
	 * @param methodName 方法名
	 * @param params 方法参数
	 */
	public void setJob(Object instance, String methodName, Object ... params) {
		Method[] methods = instance.getClass().getMethods();
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				this.method = method;
				break;
			}
		}
		if (this.method == null) {
			throw new RuntimeException("unknow public method [" + methodName + "] in " + instance.getClass().getName());
		}
		this.instance = instance;
		this.params = params;
	}
	
}

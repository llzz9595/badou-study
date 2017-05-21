package com.shengdai.mobile.smack.util;

import com.shengdai.factory.InstanceFactory;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;

/**
 * 消息推送接口管理工具类
 * @author zhouan
 *
 */
public class PushInterfacesUtil {

	public static ApiEntity isInterfaceValid(String url) {
		ApiEntity entity = null;
		IApiService pushActionService = (IApiService) InstanceFactory.getInstance(IApiService.class);
		entity = pushActionService.findByUrl(url);
		return entity;
	}
}

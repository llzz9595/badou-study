package com.shengdai.mobile.openapi.service;

import java.io.Serializable;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.mobile.openapi.model.ApiEntity;

public interface IApiService extends IBaseSpringService<ApiEntity, Serializable>{
	public ApiEntity findByUrl(String url);
}

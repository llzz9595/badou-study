package com.shengdai.mobile.openapi.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.mobile.openapi.dao.IApiDAO;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.openapi.service.IApiService;

/**
 * 功能2示例业务层接口实现
 * 
 * @author xpp
 * 
 */
@Service
public class ApiServiceImpl extends
		BaseSpringService<ApiEntity, Serializable> implements
		IApiService {

	@Autowired
	private IApiDAO actionDAO;

	@Autowired
	public void setActionDAO(IApiDAO actionDAO) {
		this.actionDAO = actionDAO;
		super.setBaseDAO(actionDAO);
	}
	
	
	@SuppressWarnings("unchecked")
	public ApiEntity findByUrl(String url){
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("url",url,null,QueryOperSymbolEnum.like))
					  .addOrder(new QueryOrderby(1,"createTime",SortOrderEnum.desc));
		queryCriterion.setMaxResults(10);
		
		List apiList = new ArrayList<ApiEntity>();
		apiList = actionDAO.find(queryCriterion);
		ApiEntity apiEntity = null;
		if (apiList != null && apiList.size() > 0) {
			apiEntity = (ApiEntity) apiList.get(0);
		}
		return apiEntity;
	}
}
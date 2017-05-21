package com.shengdai.mobile.openapi.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.mobile.openapi.dao.IApiDAO;
import com.shengdai.mobile.openapi.model.ApiEntity;

@Repository
public class ApiDAOImpl extends
BaseHibernateDAO<ApiEntity, Serializable> implements IApiDAO{


	
}

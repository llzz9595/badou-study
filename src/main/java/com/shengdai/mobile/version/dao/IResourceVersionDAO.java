package com.shengdai.mobile.version.dao;

import java.io.Serializable;

import com.shengdai.base.support.hibernate.IBaseHibernateDAO;
import com.shengdai.mobile.version.model.ResourceVersionEntity;

/**
 * users对象对应的DAO接口
 * @author xpp 2013-7-9
 *
 */
public interface IResourceVersionDAO extends IBaseHibernateDAO<ResourceVersionEntity, Serializable> {

	public ResourceVersionEntity html5Version(String apkId) throws Exception;
	
}

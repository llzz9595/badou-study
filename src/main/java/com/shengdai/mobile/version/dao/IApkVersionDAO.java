package com.shengdai.mobile.version.dao;

import java.io.Serializable;

import com.shengdai.base.support.hibernate.IBaseHibernateDAO;
import com.shengdai.mobile.version.model.ApkVersionEntity;

/**
 * users对象对应的DAO接口
 * @author xpp 2013-7-9
 *
 */
public interface IApkVersionDAO extends IBaseHibernateDAO<ApkVersionEntity, Serializable> {

	public ApkVersionEntity getLatestVersion() throws Exception;
	
}

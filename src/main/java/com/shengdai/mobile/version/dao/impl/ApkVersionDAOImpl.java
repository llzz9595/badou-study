package com.shengdai.mobile.version.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.mobile.version.dao.IApkVersionDAO;
import com.shengdai.mobile.version.model.ApkVersionEntity;

@Repository
public class ApkVersionDAOImpl extends
BaseHibernateDAO<ApkVersionEntity, Serializable> implements IApkVersionDAO{

	@Override
	public ApkVersionEntity getLatestVersion() throws Exception {
		 
		String hql = "from ApkVersionEntity as apk where apk.versionNum=(select max(apkT.versionNum) from ApkVersionEntity as apkT where flgDeleted = 0) ";
		Query query = this.getSession().createQuery(hql);
		
		List list =  query.list();
		if (list == null || list.size() <= 0)
			return null;
		return (ApkVersionEntity)list.get(0);
	}

	
}

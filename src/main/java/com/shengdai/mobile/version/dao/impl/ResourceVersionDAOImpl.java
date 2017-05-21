package com.shengdai.mobile.version.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.mobile.version.dao.IResourceVersionDAO;
import com.shengdai.mobile.version.model.ResourceVersionEntity;

@Repository
public class ResourceVersionDAOImpl extends
BaseHibernateDAO<ResourceVersionEntity, Serializable> implements IResourceVersionDAO{

	@Override
	public ResourceVersionEntity html5Version(String apkId) throws Exception {
		
		//String hql = "from ResourceVersionEntity where apkId='"+apkId+"'";

		String hql = "from ResourceVersionEntity as ht where ht.apkId='"+apkId+"' and ht.versionNum=(select max(htT.versionNum) from ResourceVersionEntity as htT) ";
		Query query = this.getSession().createQuery(hql);
		
		List list =  query.list();
		System.out.println(list.size());
		// TODO Auto-generated method stub
		return (ResourceVersionEntity)list.get(0);
	}

}

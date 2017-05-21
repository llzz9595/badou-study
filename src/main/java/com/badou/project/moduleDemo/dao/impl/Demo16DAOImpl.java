package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.badou.project.moduleDemo.dao.IDemo16DAO;
import com.badou.project.moduleDemo.model.Demo16Entity;
import com.shengdai.base.extend.ICreatorEntity;
import com.shengdai.base.extend.IUpdatorEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
import com.shengdai.ssl.local.LogonCertificateHolder;

@Repository
public class Demo16DAOImpl extends 
				BaseHibernateDAO<Demo16Entity, Serializable> implements IDemo16DAO{

//	@Override
//	public void save(Demo16Entity o) {
//		
//		System.out.println("///////////");
//		if(o instanceof ICreatorEntity){
//			//无法判断是新增还是更新，所以这里加一个数据判断，若创建人为空，则赋一个值给他
//			if(StringUtils.isEmpty(((ICreatorEntity) o).getCreator())){
//				((ICreatorEntity)o).setCreator(LogonCertificateHolder.getLogonCertificate().getUserName());
//			
//			}
//		}
//		if(o instanceof IUpdatorEntity){
//			((IUpdatorEntity)o).setUpdator(LogonCertificateHolder.getLogonCertificate().getUserId());
//			((IUpdatorEntity)o).setUpdatorName(LogonCertificateHolder.getLogonCertificate().getUserName());
//			((IUpdatorEntity)o).setUpdateTime(new Date());
//		}
	
//		
//		super.getHibernateTemplate().saveOrUpdate(o);
//		this.evictCollection(o);
//	}
//	
	
}

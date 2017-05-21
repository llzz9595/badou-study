package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;


import com.badou.project.moduleDemo.dao.IFun5DemoDAO;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能2示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun5DemoDAOImpl extends
		BaseHibernateDAO<Fun5DemoEntity, Serializable> implements IFun5DemoDAO {
	
}

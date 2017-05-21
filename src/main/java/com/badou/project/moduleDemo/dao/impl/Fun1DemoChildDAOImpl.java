package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun1DemoChildDAO;
import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;

/**
 * 功能1子对象示例DAO实现类
 * 
 * @author xiangsf 2013-1-18
 * 
 */
@Repository
public class Fun1DemoChildDAOImpl extends
		BaseHibernateDAO<Fun1DemoChildEntity, Serializable> implements
		IFun1DemoChildDAO {

}

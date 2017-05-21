package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun1DemoDAO;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能1示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun1DemoDAOImpl extends
		BaseHibernateDAO<Fun1DemoEntity, Serializable> implements IFun1DemoDAO {
	
}

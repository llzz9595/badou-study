package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun4DemoDAO;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能2示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun4DemoDAOImpl extends
		BaseHibernateDAO<Fun4DemoEntity, Serializable> implements IFun4DemoDAO {
	
}

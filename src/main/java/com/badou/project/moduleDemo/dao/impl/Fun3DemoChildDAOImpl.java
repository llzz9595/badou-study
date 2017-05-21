package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun3DemoChildDAO;
import com.badou.project.moduleDemo.model.Fun3DemoChildEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能1子对象示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun3DemoChildDAOImpl extends
		BaseHibernateDAO<Fun3DemoChildEntity, Serializable> implements IFun3DemoChildDAO {
	
	
}

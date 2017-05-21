package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun3DemoDAO;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能1示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun3DemoDAOImpl extends
		BaseHibernateDAO<Fun3DemoEntity, Serializable> implements IFun3DemoDAO {
	
}

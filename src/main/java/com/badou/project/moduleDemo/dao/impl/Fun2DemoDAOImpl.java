package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.moduleDemo.dao.IFun2DemoDAO;
import com.badou.project.moduleDemo.model.Fun2DemoEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 功能2示例DAO实现类
 * @author xiangsf 2013-1-18
 *
 */
@Repository
public class Fun2DemoDAOImpl extends
		BaseHibernateDAO<Fun2DemoEntity, Serializable> implements IFun2DemoDAO {
	
}

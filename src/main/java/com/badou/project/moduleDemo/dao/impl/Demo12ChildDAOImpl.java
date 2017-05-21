package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.badou.project.moduleDemo.dao.IDemo12ChildDAO;
import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;

@Repository
public class Demo12ChildDAOImpl extends
					BaseHibernateDAO<Demo12ChildEntity, Serializable> implements
						IDemo12ChildDAO {

}

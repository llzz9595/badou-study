package com.badou.project.moduleDemo.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.badou.project.moduleDemo.dao.IDemo11DAO;
import com.badou.project.moduleDemo.model.Demo11Entity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;

/**
 * Created by lps on 2017/3/27.
 * Demo11 实现单表的CRUD
 */
@Repository
public class Demo11DAOImpl extends
                   BaseHibernateDAO<Demo11Entity, Serializable>implements IDemo11DAO {
}

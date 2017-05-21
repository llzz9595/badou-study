package com.badou.project.orderSystem.dao.impl;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.orderSystem.dao.IMenuDAO;
import com.badou.project.orderSystem.model.MenuEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;
/**
 * 菜单DAO实现类
 * @author 
 *
 */
@Repository
public class MenuDaoImpl extends
		BaseHibernateDAO<MenuEntity, Serializable> implements IMenuDAO {
	
}
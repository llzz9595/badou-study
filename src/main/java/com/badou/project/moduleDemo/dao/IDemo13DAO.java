package com.badou.project.moduleDemo.dao;

import java.io.Serializable;
import java.util.List;

import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.vo.Demo15VO;
import com.shengdai.base.support.hibernate.IBaseHibernateDAO;

public interface IDemo13DAO extends IBaseHibernateDAO<Demo13Entity, Serializable>{

	public List<Demo15VO> findBySQL();

	

	public List<Demo13Entity> findByName(String s);

}

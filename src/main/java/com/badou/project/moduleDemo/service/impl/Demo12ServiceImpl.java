package com.badou.project.moduleDemo.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.moduleDemo.dao.IDemo12ChildDAO;
import com.badou.project.moduleDemo.dao.IDemo12DAO;
import com.badou.project.moduleDemo.model.Demo12Entity;
import com.badou.project.moduleDemo.service.IDemo12Service;
import com.badou.project.moduleDemo.vo.Demo14Vo;
import com.shengdai.base.support.spring.BaseSpringService;

@Service
public class Demo12ServiceImpl extends BaseSpringService<Demo12Entity, Serializable>
		implements IDemo12Service {
	@Autowired
	private IDemo12DAO Demo12DAO;
	@Autowired
	private IDemo12ChildDAO Demo12ChildDAO;
	@Autowired
	public void setDemo12DAO(IDemo12DAO Demo12DAO) {
		this.Demo12DAO = Demo12DAO;
		super.setBaseDAO(Demo12DAO);
	}
	
	public List<Demo14Vo> findBySQL() {
		return Demo12DAO.findBySQL();
	}

	@Override
	public List<Demo12Entity> findOrder(String s) {
		// TODO Auto-generated method stub
		return Demo12DAO.findOrder(s);
	}
	
}

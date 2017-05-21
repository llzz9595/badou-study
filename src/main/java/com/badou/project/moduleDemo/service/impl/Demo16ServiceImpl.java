package com.badou.project.moduleDemo.service.impl;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.moduleDemo.dao.IDemo16DAO;
import com.badou.project.moduleDemo.model.Demo16Entity;
import com.badou.project.moduleDemo.service.IDemo16Service;
import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.ssl.local.LogonCertificateHolder;

@Service
public class Demo16ServiceImpl  extends BaseSpringService<Demo16Entity, Serializable>
						implements IDemo16Service{
	@Autowired
	private IDemo16DAO demo16DAO;
	@Autowired
	public void setDemo16DAO(IDemo16DAO demo16DAO) {
		this.demo16DAO = demo16DAO;
		super.setBaseDAO(demo16DAO);
		
	}
	
	@Override
	public void create(Demo16Entity t) {
		System.out.println("over");
		t.setCreator(LogonCertificateHolder.getLogonCertificate().getUserName());
		t.setCreateDate(new Date());
		demo16DAO.create(t);
	}

	
	
}

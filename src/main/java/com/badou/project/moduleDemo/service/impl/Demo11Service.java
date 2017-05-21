package com.badou.project.moduleDemo.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.moduleDemo.dao.IDemo11DAO;
import com.badou.project.moduleDemo.model.Demo11Entity;
import com.badou.project.moduleDemo.service.IDemo11Service;
import com.shengdai.base.support.spring.BaseSpringService;

/**
 * Created by lps on 2017/3/27.
 * 实现单表CRUD
 */
@Service
public class Demo11Service extends BaseSpringService<Demo11Entity, Serializable>
							implements IDemo11Service
{
	@Autowired
	private IDemo11DAO demo11DAO;
	@Autowired
	public void setDemo11DAO(IDemo11DAO demo11DAO) {
		this.demo11DAO = demo11DAO;
		super.setBaseDAO(demo11DAO);
		
	}
}

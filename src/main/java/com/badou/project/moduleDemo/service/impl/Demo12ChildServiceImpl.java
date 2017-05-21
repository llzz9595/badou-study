package com.badou.project.moduleDemo.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.badou.project.moduleDemo.dao.IDemo12ChildDAO;
import com.badou.project.moduleDemo.model.Demo12ChildEntity;
import com.badou.project.moduleDemo.service.IDemo12ChildService;
import com.shengdai.base.support.spring.BaseSpringService;
@Service
public class Demo12ChildServiceImpl extends BaseSpringService<Demo12ChildEntity, Serializable>
                                  implements IDemo12ChildService {
	@Autowired
	private IDemo12ChildDAO Demo12ChildDAO;
	@Autowired
	public void setDemo12ChildDAO(IDemo12ChildDAO Demo12ChildDAO) {
		this.Demo12ChildDAO = Demo12ChildDAO;
		super.setBaseDAO(Demo12ChildDAO);
}


}

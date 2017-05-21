package com.badou.project.moduleDemo.service.impl;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.badou.project.moduleDemo.dao.IFun1DemoChildDAO;
import com.badou.project.moduleDemo.dao.IFun1DemoDAO;
import com.badou.project.moduleDemo.dao.IFun5DemoDAO;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
import com.badou.project.moduleDemo.service.IFun1DemoService;
import com.badou.project.moduleDemo.service.IFun5DemoService;
/**
 * 功能1示例业务层接口实现
 * @author xiangsf 2013-1-18
 *
 */
@Service
public class Fun5DemoServiceImpl extends BaseSpringService<Fun5DemoEntity, Serializable>
		implements IFun5DemoService {
	@Autowired
	private IFun5DemoDAO fun5DemoDAO;
	@Autowired

	public void setFun5DemoDAO(IFun5DemoDAO fun5DemoDAO) {
		this.fun5DemoDAO = fun5DemoDAO;
		super.setBaseDAO(fun5DemoDAO);
	}
	
	
}

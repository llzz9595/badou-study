package com.badou.project.moduleDemo.service.impl;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shengdai.base.support.spring.BaseSpringService;
import com.badou.project.moduleDemo.dao.IFun2DemoDAO;
import com.badou.project.moduleDemo.model.Fun2DemoEntity;
import com.badou.project.moduleDemo.service.IFun2DemoService;
/**
 * 功能2示例业务层接口实现
 * @author xiangsf 2013-1-18
 *
 */
@Service
public class Fun2DemoServiceImpl extends BaseSpringService<Fun2DemoEntity, Serializable>
		implements IFun2DemoService {
	@Autowired
	private IFun2DemoDAO fun2DemoDAO;
	@Autowired
	public void setFun2DemoDAO(IFun2DemoDAO fun2DemoDAO) {
		this.fun2DemoDAO = fun2DemoDAO;
		super.setBaseDAO(fun2DemoDAO);
	}
	
	
}

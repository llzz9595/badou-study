package com.badou.project.moduleDemo.service.impl;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shengdai.base.support.spring.BaseSpringService;
import com.badou.project.moduleDemo.dao.IFun1DemoChildDAO;
import com.badou.project.moduleDemo.dao.IFun1DemoDAO;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.moduleDemo.service.IFun1DemoService;
/**
 * 功能1示例业务层接口实现
 * @author xiangsf 2013-1-18
 *
 */
@Service
public class Fun1DemoServiceImpl extends BaseSpringService<Fun1DemoEntity, Serializable>
		implements IFun1DemoService {
	@Autowired
	private IFun1DemoDAO fun1DemoDAO;
	@Autowired
	private IFun1DemoChildDAO fun1DemoChildDAO;
	@Autowired
	public void setFun1DemoDAO(IFun1DemoDAO fun1DemoDAO) {
		this.fun1DemoDAO = fun1DemoDAO;
		super.setBaseDAO(fun1DemoDAO);
	}
	
	
}

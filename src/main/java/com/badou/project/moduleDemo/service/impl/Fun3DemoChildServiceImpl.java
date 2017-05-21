package com.badou.project.moduleDemo.service.impl;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shengdai.base.support.spring.BaseSpringService;
import com.badou.project.moduleDemo.dao.IFun3DemoChildDAO;
import com.badou.project.moduleDemo.model.Fun3DemoChildEntity;
import com.badou.project.moduleDemo.service.IFun3DemoChildService;
/**
 * 功能3示例子对象业务层接口实现
 * <p>该实现可以没有，将子对象业务实现纳入到父对象{@link Fun3DemoServiceImpl}中,,在父对象中注入{@link IFun3DemoChildDAO}
 * @author xiangsf 2033-3-38
 *
 */
@Service
public class Fun3DemoChildServiceImpl extends BaseSpringService<Fun3DemoChildEntity, Serializable>
		implements IFun3DemoChildService {
	@Autowired
	private IFun3DemoChildDAO fun3DemoChildDAO;
	@Autowired
	public void setFun3DemoChildDAO(IFun3DemoChildDAO fun3DemoChildDAO) {
		this.fun3DemoChildDAO = fun3DemoChildDAO;
		super.setBaseDAO(fun3DemoChildDAO);
	}
	
	
}

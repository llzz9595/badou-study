package com.badou.project.moduleDemo.service;
import java.io.Serializable;
import java.util.List;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
//import com.badou.project.moduleDemo.web.form.Fun4DemoTreeForm;
/**
 * 功能1示例业务层接口
 * @author xiangsf 2013-1-18
 *
 */
public interface IFun4DemoService extends IBaseSpringService<Fun4DemoEntity, Serializable> {

	void saveFun4Demo(Fun4DemoEntity fun4Demo, List<Attach> attachList,
			String imgid);
}

package com.badou.project.moduleDemo.service;
import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.moduleDemo.dao.IFun2DemoDAO;
import com.badou.project.moduleDemo.dao.IFun5DemoDAO;
import com.badou.project.moduleDemo.model.Fun5DemoEntity;
//import com.badou.project.moduleDemo.web.form.Fun4DemoTreeForm;
/**
 * 功能1示例业务层接口
 * @author xiangsf 2013-1-18
 *
 */
public interface IFun5DemoService extends IBaseSpringService<Fun5DemoEntity, Serializable> {

	
}

package com.badou.project.moduleDemo.service;
import java.io.Serializable;
import com.shengdai.base.support.spring.IBaseSpringService;
import com.badou.project.moduleDemo.dao.IFun1DemoChildDAO;
import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
/**
 * 功能1示例子对象业务层接口
 * <p>该接口可以没有，将子对象业务接口纳入到父对象{@link IFun1DemoServiceImpl}中,在父对象中注入{@link IFun1DemoChildDAO}
 * @author xiangsf 2013-1-18
 *
 */
public interface IFun1DemoChildService extends IBaseSpringService<Fun1DemoChildEntity, Serializable> {

}

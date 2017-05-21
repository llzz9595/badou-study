package com.badou.project.orderSystem.service;

import java.io.Serializable;
import java.util.List;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.orderSystem.model.MenuEntity;
//import com.badou.project.moduleDemo.web.form.Fun4DemoTreeForm;
/**
 * 点餐模块业务层接口
 * @author
 *
 */
public interface IMenuService extends IBaseSpringService<MenuEntity, Serializable> {

	void saveMenu(MenuEntity menu, List<Attach> attachList,
			String imgid);
}
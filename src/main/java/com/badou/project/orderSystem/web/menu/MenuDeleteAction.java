package com.badou.project.orderSystem.web.menu;

import java.io.Serializable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.orderSystem.model.MenuEntity;
import com.badou.project.orderSystem.service.IMenuService;
/**
 * 删除事件
 * <p>对应的请求路径是：${context}/orderSystem/menu/menudelete/方法名.do
 * @author 
 *
 */
@Controller
public class MenuDeleteAction extends BaseJsonDeleteStrutsAction<MenuEntity, Serializable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IMenuService MenuService;

	@Autowired
	public void setMenuService(IMenuService MenuService) {
		this.MenuService = MenuService;
		super.setBaseService(MenuService);
	}
	
	
}

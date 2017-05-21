package com.badou.project.orderSystem.service.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.orderSystem.dao.IMenuDAO;
import com.badou.project.orderSystem.help.AttachImgCaches;
import com.badou.project.orderSystem.help.AttachImgCaches.AttachImg;
import com.badou.project.orderSystem.model.MenuEntity;
import com.badou.project.orderSystem.service.IMenuService;
/**
 * 点餐模块业务层接口实现
 * @author
 *
 */
@Service
public class MenuServiceImpl extends BaseSpringService<MenuEntity, Serializable>
		implements IMenuService {
	@Autowired
	private IMenuDAO menuDAO;
	@Autowired
	public void setMenuDAO(IMenuDAO menuDAO) {
		this.menuDAO = menuDAO;
		super.setBaseDAO(menuDAO);
	}
	@Autowired
	private AttachFactory attachFactory;
	@Override
	public void saveMenu(MenuEntity menu, List<Attach> attachList,
			String imgid) {
		AttachImg img = AttachImgCaches.getImg(imgid);
		try {
			if(StringUtils.isNotBlank(imgid)){
				Attach a = new Attach();
				a.setFileContent(img.getContent());
				a.setExtendName(img.getSuffix());
				a.setFileName(img.getName());
				attachFactory.uploadFile(a);
				menu.setSmallIcon(a.getId());
			}
		if(StringUtils.isNotBlank(menu.getId()))
		{
			
			menuDAO.update(menu);
		}
		else
		{
			menuDAO.create(menu);
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		
	}
	
	
}

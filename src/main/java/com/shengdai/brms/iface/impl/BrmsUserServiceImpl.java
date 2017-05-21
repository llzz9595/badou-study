package com.shengdai.brms.iface.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shengdai.brms.beans.UserBean;
import com.shengdai.brms.iface.IBrmsUserService;
import com.shengdai.kpi.system.org.service.IUserService;
import com.shengdai.kpi.system.org.vo.User;
@Component
public class BrmsUserServiceImpl implements IBrmsUserService {

	@Autowired
	private IUserService userService;
	@Override
	public UserBean findUserBean(String id) {
		User user = userService.findById(id);
		if(user != null)
			return new UserBean(user);
		return null;
	}

}

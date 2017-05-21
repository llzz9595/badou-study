package com.shengdai.brms;

import com.shengdai.brms.beans.UserBean;
import com.shengdai.brms.iface.IBrmsUserService;
import com.shengdai.factory.InstanceFactory;

public final class BrmsUserHelper {
	/**
	 * 根据ID查询出user
	 * @param id
	 * @return
	 */
	public static UserBean findById(String id){
		IBrmsUserService brmsUserService = InstanceFactory.getInstance(IBrmsUserService.class);
		return brmsUserService.findUserBean(id);
	}
}

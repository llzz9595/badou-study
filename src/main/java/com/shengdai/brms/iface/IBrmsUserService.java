package com.shengdai.brms.iface;

import com.shengdai.brms.beans.UserBean;

public interface IBrmsUserService {
	
	public UserBean findUserBean(String id);
}

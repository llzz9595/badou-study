package com.shengdai.brms;

import com.shengdai.brms.beans.RoleBean;
import com.shengdai.brms.iface.IBrmsRoleService;
import com.shengdai.factory.InstanceFactory;

public class BrmsRoleHelper {

	public static RoleBean getRole(String roleId){
		return InstanceFactory.getInstance(IBrmsRoleService.class).getRole(roleId);
	}
}

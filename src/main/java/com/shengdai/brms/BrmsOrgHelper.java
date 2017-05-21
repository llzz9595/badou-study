package com.shengdai.brms;

import java.util.List;

import com.shengdai.brms.beans.OrgBean;
import com.shengdai.brms.iface.IBrmsOrgService;
import com.shengdai.factory.InstanceFactory;

public final class BrmsOrgHelper {

	/**
	 * 根据ID查询出Org
	 * @param id
	 * @return
	 */
	public static OrgBean findById(String id){
		IBrmsOrgService brmsOrgService = InstanceFactory.getInstance(IBrmsOrgService.class);
		return brmsOrgService.findOrgBean(id);
	}
	
	public static List<OrgBean> findByType(int type){
		IBrmsOrgService brmsOrgService = InstanceFactory.getInstance(IBrmsOrgService.class);
		return brmsOrgService.listOrgBeanByType(type);
	}
}

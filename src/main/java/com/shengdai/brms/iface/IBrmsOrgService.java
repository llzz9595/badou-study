package com.shengdai.brms.iface;

import java.util.List;

import com.shengdai.brms.beans.OrgBean;

public interface IBrmsOrgService {

	public OrgBean findOrgBean(String id);
	
	List<OrgBean> getAllParentOrgs(String userId);
	/**
	 * 获得销售部门
	 * @param type
	 * @return
	 */
	public List<OrgBean> listOrgBeanByType(int type);
}

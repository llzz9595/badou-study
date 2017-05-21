package com.shengdai.brms.iface.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shengdai.brms.beans.OrgBean;
import com.shengdai.brms.iface.IBrmsOrgService;
import com.shengdai.kpi.system.org.service.IOrgService;
import com.shengdai.kpi.system.org.service.IUserService;
import com.shengdai.kpi.system.org.vo.Org;
import com.shengdai.kpi.system.org.vo.User;

@Component
public class BrmsOrgService implements IBrmsOrgService {
	
	@Autowired
	private IOrgService orgService;
	
	@Autowired
	private IUserService userService;
	@Override
	public OrgBean findOrgBean(String id) {
		Org org = orgService.findById(id);
		if(org != null) return new OrgBean(org);
		return null;
	}
	
	public List<OrgBean> getAllParentOrgs(String userId){
		List<OrgBean> orgs = new ArrayList<OrgBean>();
		User user = userService.findById(userId);
		
		for(Org o : user.getOrg().getRoute()){
			orgs.add(new OrgBean(o));
		}
		return orgs;
	}

	@Override
	public List<OrgBean> listOrgBeanByType(int type) {
		List<OrgBean> orgBeans = new ArrayList<OrgBean>();
		List<Org> orgs = orgService.listAllOrgByType(type);
		for(Org o : orgs){
			orgBeans.add(new OrgBean(o));
		}
		return orgBeans;
	}
	

}

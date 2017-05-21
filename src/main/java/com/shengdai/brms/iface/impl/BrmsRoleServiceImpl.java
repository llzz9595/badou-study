package com.shengdai.brms.iface.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.brms.beans.RoleBean;
import com.shengdai.brms.iface.IBrmsRoleService;
import com.shengdai.kpi.system.security.service.IRoleService;
import com.shengdai.kpi.system.security.vo.Role;

@Service
public class BrmsRoleServiceImpl implements IBrmsRoleService {
	@Autowired
	private IRoleService roleService;
	@Override
	public RoleBean getRole(String id) {
		Role role = roleService.findById(id);
		RoleBean rb = new RoleBean();
		rb.setCode(role.getCode());
		rb.setId(role.getId());
		rb.setName(role.getName());
		rb.setIndexUrl(role.getIndexUrl());
		return rb;
	}

}

package com.badou.project.moduleDemo.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.badou.project.moduleDemo.dao.IFun3DemoChildDAO;
import com.badou.project.moduleDemo.dao.IFun3DemoDAO;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.service.IFun3DemoService;
import com.badou.project.moduleDemo.web.form.Fun3DemoTreeForm;
import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;

/**
 * 功能1示例业务层接口实现
 * 
 * @author xiangsf 2013-1-18
 * 
 */
@Service
public class Fun3DemoServiceImpl extends
		BaseSpringService<Fun3DemoEntity, Serializable> implements
		IFun3DemoService {
	@Autowired
	private IFun3DemoDAO fun3DemoDAO;
	@Autowired
	private IFun3DemoChildDAO fun3DemoChildDAO;

	@Autowired
	public void setFun3DemoDAO(IFun3DemoDAO fun3DemoDAO) {
		this.fun3DemoDAO = fun3DemoDAO;
		super.setBaseDAO(fun3DemoDAO);
	}

	@Autowired
	private AttachFactory attachFactory;

	@Override
	public List<Fun3DemoTreeForm> getTreeByParentId(String pid) {
		List<Fun3DemoTreeForm> list = new ArrayList<Fun3DemoTreeForm>();
		// 这里要按pid去查出其下所有对象，递归子对象like fullpath
		Fun3DemoEntity rootEntity = fun3DemoDAO.find(pid);
		List<Fun3DemoEntity> alls = fun3DemoDAO.findAll();

		Fun3DemoTreeForm treeRoot = new Fun3DemoTreeForm(rootEntity);
		list.add(treeRoot);

		this.recurrenceChildTree(alls, treeRoot);
		return list;
	}

	private void recurrenceChildTree(List<Fun3DemoEntity> alls,
			Fun3DemoTreeForm t) {
		Fun3DemoEntity parentMenu = null;
		Fun3DemoTreeForm mtf = null;
		for (Fun3DemoEntity m : alls) {
			parentMenu = m.getParent();
			// 父节点ID与当前节点ID相同，则放入子集中
			if (parentMenu != null
					&& parentMenu.getId().equalsIgnoreCase(t.getTreeNodeId())) {
				mtf = new Fun3DemoTreeForm(m);
				t.getChildren().add(mtf);
				this.recurrenceChildTree(alls, mtf);
			}
		}
	}

	@Override
	public void saveFun3Demo(Fun3DemoEntity fun3Demo, List<Attach> attachList,
			String imgid) {

		try {
				if (attachList != null && attachList.size() != 0) {
					if (attachList.size() == 1) {
						Attach a = new Attach();
						a = attachList.get(0);
						Attach b=attachFactory.uploadFile(a);
						if (StringUtils.isNotBlank(imgid)) {
							fun3Demo.setSmallIcon(b.getId());
						} else {
							fun3Demo.setBigIcon(b.getId());
						}
	
					} else {
						for (int i = 0; i < attachList.size(); i++) {
							Attach a = new Attach();
							a = attachList.get(i);
							Attach b=attachFactory.uploadFile(a);
							switch (i) {
							case 0:
								fun3Demo.setSmallIcon(b.getId());
								break;
							case 1:
								fun3Demo.setBigIcon(b.getId());
								break;
							}
						}
	
					}
				}
			if(StringUtils.isNotBlank(fun3Demo.getId()))
			{
				
				fun3DemoDAO.update(fun3Demo);
			}
			else
			{
				fun3DemoDAO.create(fun3Demo);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

package com.badou.project.moduleDemo.service.impl;
import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.base.support.spring.BaseSpringService;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.moduleDemo.dao.IFun4DemoDAO;
import com.badou.project.moduleDemo.help.AttachImgCaches;
import com.badou.project.moduleDemo.help.AttachImgCaches.AttachImg;
import com.badou.project.moduleDemo.model.Fun4DemoEntity;
import com.badou.project.moduleDemo.service.IFun4DemoService;
/**
 * 功能4示例业务层接口实现
 * @author xiangsf 4013-1-18
 *
 */
@Service
public class Fun4DemoServiceImpl extends BaseSpringService<Fun4DemoEntity, Serializable>
		implements IFun4DemoService {
	@Autowired
	private IFun4DemoDAO fun4DemoDAO;
	@Autowired
	public void setFun4DemoDAO(IFun4DemoDAO fun4DemoDAO) {
		this.fun4DemoDAO = fun4DemoDAO;
		super.setBaseDAO(fun4DemoDAO);
	}
	@Autowired
	private AttachFactory attachFactory;
	@Override
	public void saveFun4Demo(Fun4DemoEntity fun4Demo, List<Attach> attachList,
			String imgid) {
		AttachImg img = AttachImgCaches.getImg(imgid);
		try {
			if(imgid!=null){
				Attach a = new Attach();
				a.setFileContent(img.getContent());
				a.setExtendName(img.getSuffix());
				a.setFileName(img.getName());
				attachFactory.uploadFile(a);
				fun4Demo.setSmallIcon(a.getId());
			/*if (attachList != null && attachList.size() != 0) {
				if (attachList.size() == 1) {
					Attach a = new Attach();
					a.set = //attachList.get(0);
					Attach b=attachFactory.uploadFile(a);
					fun4Demo.setSmallIcon(b.getId());
				} */

			}
		if(StringUtils.isNotBlank(fun4Demo.getId()))
		{
			
			fun4DemoDAO.update(fun4Demo);
		}
		else
		{
			fun4DemoDAO.create(fun4Demo);
		}

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		
	}
	
	
}

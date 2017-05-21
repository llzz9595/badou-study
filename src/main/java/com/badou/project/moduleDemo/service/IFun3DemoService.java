package com.badou.project.moduleDemo.service;
import java.io.Serializable;
import java.util.List;
import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;
import com.badou.project.moduleDemo.web.form.Fun3DemoTreeForm;
/**
 * 功能1示例业务层接口
 * @author xiangsf 2013-1-18
 *
 */
public interface IFun3DemoService extends IBaseSpringService<Fun3DemoEntity, Serializable> {
	/**
	 * 根据父级ID加载出一棵树结构
	 * @param pid
	 * @return
	 */
	public List<Fun3DemoTreeForm> getTreeByParentId(String pid);
	
	public void saveFun3Demo (Fun3DemoEntity fun3Demo,List<Attach> attachList,String imgid);
}

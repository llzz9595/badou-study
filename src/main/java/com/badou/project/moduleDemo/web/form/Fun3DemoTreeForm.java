package com.badou.project.moduleDemo.web.form;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import org.apache.struts2.json.annotations.JSON;
import com.shengdai.common.tree.model.ITreeModel;
import com.shengdai.common.tree.support.ligeruitree.json.LigerUIJSONTreeBuilder;
import com.shengdai.global.Globals;
import com.badou.project.moduleDemo.model.Fun3DemoEntity;

public class Fun3DemoTreeForm extends LigerUIJSONTreeBuilder {

	private Fun3DemoEntity fun3;

	public Fun3DemoTreeForm(Fun3DemoEntity fun3) {
		this.fun3 = fun3;
	}

	private Collection<Fun3DemoTreeForm> children = new ArrayList<Fun3DemoTreeForm>();

	@Override
	public OutputStream genOutputStream() {
		return null;
	}

	@Override
	@JSON(name = "name")
	public String getTreeNodeName() {
		return fun3.getName();
	}

	@Override
	@JSON(name = "type")
	public String getTreeNodeType() {
		return fun3.getTreeType();
	}

	@Override
	@JSON(name = "id")
	public String getTreeNodeId() {
		return fun3.getId();
	}

	@Override
	@JSON(name = "children")
	public Collection<ITreeModel> getTreeChildrens() {
		return new ArrayList<ITreeModel>(children);
	}

	@Override
	@JSON(name = "pid")
	public ITreeModel getTreeParent() {
		if (fun3.getParent() != null)
			return new Fun3DemoTreeForm(fun3.getParent());
		return null;
	}

	@Override
	@JSON(name = "url")
	public String getTreeClickURL() {
		return fun3.getUrl();
	}

	@Override
	@JSON(name = "userData")
	public com.alibaba.fastjson.JSONArray getUserJSONData() {
		return null;
	}

	public Collection<Fun3DemoTreeForm> getChildren() {
		return children;
	}

	@JSON(name = "isexpand")
	public boolean getIsExpand() {
		if (Globals.RESOURCE_ROOT_ID.equalsIgnoreCase(this.getTreeNodeId())) {
			return true;
		}
		return false;
	}

	@JSON(name = "hasChild")
	public boolean getHasChild() {
		return !children.isEmpty();
	}
}

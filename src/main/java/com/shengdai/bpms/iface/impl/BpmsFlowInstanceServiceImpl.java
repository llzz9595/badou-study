package com.shengdai.bpms.iface.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.bpms.beans.instance.NodeInstanceBean;
import com.shengdai.bpms.beans.instance.RouteInstanceBean;
import com.shengdai.bpms.iface.IBpmsFlowInstanceService;
import com.shengdai.bpms.process.service.IProcessService;
import com.shengdai.bpms.process.service.IWorklistItemQueryService;
import com.shengdai.kpi.flow.service.IRecFlowService;
import com.shengdai.kpi.flow.valueobject.FlwNode;
import com.shengdai.kpi.flow.valueobject.FlwRoute;
import com.shengdai.kpi.flow.valueobject.RecFlow;
import com.shengdai.kpi.flow.valueobject.RecNode;
import com.shengdai.kpi.flow.valueobject.WorklistItem;

@Service
public class BpmsFlowInstanceServiceImpl implements IBpmsFlowInstanceService {

	@Autowired
	private IWorklistItemQueryService worklistItemQueryService;
	@Autowired
	private IProcessService processService;
	
	@Autowired
	protected IRecFlowService recFlowService;

	@Override
	public List<RouteInstanceBean> getWorklistRoutes(String worklistId) {
		List<RouteInstanceBean> routes = new ArrayList<RouteInstanceBean>();
		WorklistItem worklist = worklistItemQueryService.find(worklistId);
		FlwNode node = worklist.getFlwNode();
		RouteInstanceBean instance = null;
		for(FlwRoute fr : node.getRouteSet()){
			instance = new RouteInstanceBean();
			instance.setId(fr.getId());
			instance.setPriority(fr.getPriority());
			instance.setRouteId(fr.getId());
			instance.setRouteName(fr.getName());
			instance.setRemark(fr.getMemo());
			
			routes.add(instance);
		}
		Collections.sort(routes);
		return routes;
	}
	@Override
	public NodeInstanceBean getNodeInstance(String worklistId) {
		
		WorklistItem worklist = worklistItemQueryService.find(worklistId);
		FlwNode node = worklist.getFlwNode();
		NodeInstanceBean instance = new NodeInstanceBean();
		instance.setId(node.getId());
		instance.setNodeId(node.getId());
		instance.setNodeName(node.getNodeName());
		instance.setPriority(node.getPriority());
		instance.setHandleWay(node.getHandleTypeway().getId());
		instance.setFlgFullScreen(node.getFlgFullScreen()==1);
		return instance;
	}
	@Override
	public void deleteFlowInstance(String busiObjectId) {
		processService.deleteRecflow(busiObjectId);
	}
	@Override
	public NodeInstanceBean getNodeInstance(String boId, String nodeCode) {
		RecFlow recFlow = recFlowService.getRecFlowByBo(boId);
		RecNode recNode = recFlow.getRecNodeWithCode(nodeCode);
		if(recNode != null){
			NodeInstanceBean instance = new NodeInstanceBean();
			instance.setId(recNode.getId());
			instance.setNodeId(recNode.getNodeId());
			instance.setNodeName(recNode.getNodeName());
			instance.setPriority(recNode.getPriority());
			instance.setHandleWay(recNode.getHandlerWay());
			instance.setFlgFullScreen(true);
			return instance;
		}
		return null;
	}
	@Override
	public boolean isCompareNode(String boId, String nodeInstanceId, String nodeCode) {
		RecFlow recFlow = recFlowService.getRecFlowByBo(boId);
		RecNode recNode = recFlow.getRecNodeWithNodeInstanceId(nodeInstanceId);
		return nodeCode.equalsIgnoreCase(recNode.getNodeCode());
	}

}

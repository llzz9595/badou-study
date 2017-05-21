package com.shengdai.bpms;

import com.shengdai.bpms.beans.instance.NodeInstanceBean;
import com.shengdai.bpms.iface.IBpmsFlowInstanceService;
import com.shengdai.bpms.iface.IBpmsProcessService;
import com.shengdai.factory.InstanceFactory;

public class BpmsFlowInstanceHelper {
	/**
	 * 流程实例删除
	 * @param busiObjectId
	 */
	public static void deleteFlowInstance(String busiObjectId){
		IBpmsFlowInstanceService service = InstanceFactory.getInstance(IBpmsFlowInstanceService.class);
		service.deleteFlowInstance(busiObjectId);
	}
	
	/**
	 * 转移待办到指定环节
	 * @param busiObjectId 业务对象ID
	 * @param nodeId 环节id
	 */
	public static void transfer(String busiObjectId,String srcNodeInstanceId, String targetNodeInstanceId){
		IBpmsProcessService service = InstanceFactory.getInstance(IBpmsProcessService.class);
		service.transfer(busiObjectId,srcNodeInstanceId, targetNodeInstanceId);
	}
	
	public static boolean isTargetNode(String boId, String nodeInstanceId, String nodeCode){
		IBpmsFlowInstanceService service = InstanceFactory.getInstance(IBpmsFlowInstanceService.class);
		return service.isCompareNode(boId, nodeInstanceId, nodeCode);
	}
	/**
	 * 转移待办到指定的环节
	 * @param busiObjectId 业务对象ID
	 * @param nodeCode 环节编码
	 */
	public static void rehandle(String busiObjectId,String srcNodeInstanceId, String targetNodeCode){
		IBpmsProcessService service = InstanceFactory.getInstance(IBpmsProcessService.class);
		//获得流程中的唯一修订环节，若有多个时，则要用上面的指定环节了
		IBpmsFlowInstanceService bpmsFlowInstanceService = InstanceFactory.getInstance(IBpmsFlowInstanceService.class);
		NodeInstanceBean nodeInstance = bpmsFlowInstanceService.getNodeInstance(busiObjectId, targetNodeCode);
		service.transfer(busiObjectId,srcNodeInstanceId, nodeInstance.getId());
	}
}

package com.shengdai.bpms.iface.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shengdai.bpms.iface.IBpmsProcessService;
import com.shengdai.bpms.process.service.IProcessService;
import com.shengdai.kpi.flow.FlowContext;
import com.shengdai.kpi.flow.ProcessorContext;
import com.shengdai.kpi.flow.busi.BusinessObject;
import com.shengdai.kpi.flow.service.IRecFlowService;
import com.shengdai.kpi.flow.service.IWorklistItemService;
import com.shengdai.kpi.flow.service.IWorklistService;
import com.shengdai.kpi.flow.valueobject.RecFlow;
import com.shengdai.kpi.flow.valueobject.RecNode;
import com.shengdai.kpi.flow.valueobject.WorklistItem;
import com.shengdai.kpi.flow.works.IFlow;
@Service
public class BpmsProcessServiceImpl implements IBpmsProcessService {
	
	@Resource(name="flowHelper")
	private IFlow flowHelper;
	@Resource(name="worklistItemService")
	private IWorklistItemService worklistItemService;
	@Resource(name="workListService")
	private IWorklistService worklistService;
	@Resource(name="processService")
	private IProcessService processService;
	@Autowired
	protected IRecFlowService recFlowService;
	@Override
	public boolean start(String flowId, BusinessObject bo) throws Exception {
		flowHelper.start(flowId, bo);
		return true;
	}
	/**
	 * 将bo所在有待办置为已办，将目标环节的已办转为待办（没有则创建待办）
	 */
	@Override
	public boolean transfer(String busiObjectId, String srcNodeInstanceId, String targetNodeInstanceId) {
		RecFlow recFlow = recFlowService.getRecFlowByBo(busiObjectId);
		BusinessObject busiObject = recFlow.getBindBusinessObject();
		RecNode targetRecNode = recFlow.getRecNodeWithNodeInstanceId(targetNodeInstanceId);
		RecNode currentRecNode = recFlow.getRecNodeWithNodeInstanceId(srcNodeInstanceId);
		List<WorklistItem> worklists = worklistService.listWorkListItemByBoId(busiObjectId);
		List<WorklistItem> targetNodeWorklists = new ArrayList<WorklistItem>();
		FlowContext.addVariable(FlowContext.FLOW_BO, busiObject);
		try{
			for(WorklistItem w : worklists){
				if(w.getRecNodeId().equalsIgnoreCase(targetNodeInstanceId)){
					targetNodeWorklists.add(w);
				}else{
					w.setDealDate(new Date());
					w.setOpinion("转移待办");
					w.setStatus(WorklistItem.STATUS_DONE);
					worklistService.updateWorklistItem(w);
				}
			}
			if(!targetNodeWorklists.isEmpty()){//有待办则直接更新为已了
				for(WorklistItem w : targetNodeWorklists){
					w.setDealDate(null);
					w.setCompDate(null);
					w.setOpinion("转移恢复待办");
					w.setStatus(WorklistItem.STATUS_UNDO);
					worklistService.updateWorklistItem(w);
				}
			}else{//创建待办
				processService.createWorklist(busiObjectId, targetRecNode.getNodeId());
			}
			busiObject.transfer(ProcessorContext.createContext(currentRecNode).addNextRecNode(targetRecNode));
		}finally{
			worklists = null;
			targetNodeWorklists = null;
		}
		return true;
	}

}

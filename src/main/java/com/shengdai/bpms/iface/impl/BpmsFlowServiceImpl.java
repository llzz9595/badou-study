package com.shengdai.bpms.iface.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shengdai.bpms.beans.FlowBean;
import com.shengdai.bpms.iface.IBpmsFlowService;
import com.shengdai.kpi.flow.service.IFlowService;
import com.shengdai.kpi.flow.service.IRecFlowService;
import com.shengdai.kpi.flow.service.IWorklistItemService;
import com.shengdai.kpi.flow.valueobject.FlwFlow;
import com.shengdai.kpi.flow.valueobject.RecFlow;
/**
 * 流程在业务接口中的一个默认实现
 * <p>负责与流程打交道，业务上其它地方不关联bpms
 * @author xiangsf 2013-3-4
 *
 */
@Component
public class BpmsFlowServiceImpl implements IBpmsFlowService {
	
	@Autowired
	protected IFlowService flowService;
	@Autowired
	protected IRecFlowService recFlowService;
	@Autowired
	protected IWorklistItemService workitemlistService;
	
	@Override
	public FlowBean getFlow(String busiType) {
		List<FlwFlow> flows = flowService.listFlowByBusi(busiType);
		if(flows != null && !flows.isEmpty()) {
			return instanceFlowBean(flows.get(0));
		}
		return null;
	}

	private FlowBean instanceFlowBean(FlwFlow flow){
		FlowBean bean = new FlowBean();
		bean.setId(flow.getId());
		bean.setCode(flow.getCode());
		bean.setName(flow.getFlowName());
		bean.setBusiType(flow.getCommBusi().getId());
		
		return bean;
	}
	@Override
	public List<FlowBean> getFlows(String busiType) {
		List<FlowBean> flowBeans = new ArrayList<FlowBean>();
		List<FlwFlow> flows = flowService.listFlowByBusi(busiType);
		if(flows != null && !flows.isEmpty()) {
			for(FlwFlow ff : flows){
				flowBeans.add(this.instanceFlowBean(ff));
			}
		}
		return flowBeans;
	}

	@Override
	public void deleteFlowInstance(String boId) {
		RecFlow flowInstance = recFlowService.getRecFlowByBo(boId);
		if(flowInstance != null){
			//删除实例
			recFlowService.delete(flowInstance);
			//删除待办以及待阅
			workitemlistService.deleteWithBoId(boId);
		}
	}

}

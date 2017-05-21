package com.shengdai.bpms.iface;

import java.util.List;

import com.shengdai.bpms.beans.FlowBean;

public interface IBpmsFlowService {
	/**
	 * 根据业务类型，获得流程
	 * <p>如果业务类型下有多个流程，只返回创建时间最新的一个
	 * @param busiType 业务类型
	 * @return
	 */
	public FlowBean getFlow(String busiType);
	
	/**
	 * 根据业务类型，获得流程
	 * @param busiType 业务类型
	 * @return
	 */
	public List<FlowBean> getFlows(String busiType);
	/**
	 * 根据业务对象Id删除流程实例
	 * @param boId
	 */
	public void deleteFlowInstance(String boId);
}

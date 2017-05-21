package com.shengdai.bpms.iface;

import com.shengdai.kpi.flow.busi.BusinessObject;

/**
 * 流程实例服务
 * @author xiangsf 2013-3-29
 *
 */
public interface IBpmsProcessService {
	/**
	 * 流程发起
	 * @param bo
	 * @return
	 */
	public boolean start(String flowId, BusinessObject bo) throws Exception;
	
	/**
	 * 转移待办到指定环节
	 * @param busiObjectId
	 * @param nodeId
	 * @return
	 */
	public boolean transfer(String busiObjectId,String srcNodeInstanceId, String targetNodeInstanceId);
}

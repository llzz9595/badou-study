package com.shengdai.bpms.iface;

import java.util.List;

import com.shengdai.bpms.beans.instance.NodeInstanceBean;
import com.shengdai.bpms.beans.instance.RouteInstanceBean;

/**
 * 流程实例服务
 * @author xiangsf 2013-3-29
 *
 */
public interface IBpmsFlowInstanceService {
	
	/**
	 * 获得指定待办的路由信息
	 * @param worklistId
	 * @return
	 */
	public List<RouteInstanceBean> getWorklistRoutes(String worklistId);
	/**
	 * 根据指定待办获得环节实例
	 * @param worklistId
	 * @return
	 */
	public NodeInstanceBean getNodeInstance(String worklistId);
	/**
	 * 获得指定业务对象在流程中指定环节编码的环节实例
	 * @param boId
	 * @param nodeCode
	 * @return
	 */
	public NodeInstanceBean getNodeInstance(String boId, String nodeCode);
	/**
	 * 判断指定环节实例ID是否某个指定的环节
	 * @param boId 业务对象ID
	 * @param nodeInstanceId 环节实例ID
	 * @param nodeCode 指定的某个特殊环节编码
	 * @return
	 */
	public boolean isCompareNode(String boId, String nodeInstanceId, String nodeCode);
	/**
	 * 删除流程实例
	 * @param busiObjectId
	 */
	public void deleteFlowInstance(String busiObjectId) ;
}

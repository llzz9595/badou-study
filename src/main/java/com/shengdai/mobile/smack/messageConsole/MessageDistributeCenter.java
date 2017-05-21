package com.shengdai.mobile.smack.messageConsole;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.mobile.openapi.model.ApiEntity;
import com.shengdai.mobile.smack.client.LoginSetting;
import com.shengdai.mobile.smack.client.OpenfireClientManager;
import com.shengdai.mobile.smack.common.CommonMethodThread;
import com.shengdai.mobile.smack.common.SmackPropertiesLoader;
import com.shengdai.mobile.smack.util.PushInterfacesUtil;

/**
 * 统一消息推送中心
 * <p>
 * 需要推送消息的接口需配置此拦截器
 * 具体消息内容由各个业务接口通过MessageTransporter（线程变量）传递到推送中心
 * </p>
 * @author zhouan
 *
 */
public class MessageDistributeCenter extends AbstractInterceptor{

	private static final long serialVersionUID = 1891746347490799207L;
	private Logger logger = Logger.getLogger(MessageDistributeCenter.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String returnStr = invocation.invoke();
		HttpServletRequest request = ServletActionContext.getRequest();
		String url = request.getServletPath();
		/*ApiEntity entity = PushInterfacesUtil.isInterfaceValid(url);
		if (entity == null) {
			return returnStr;
		}*/
		try {
			//调用openfire客户端，如未登陆，则重新登录
			LoginSetting setting = new LoginSetting(PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_HOST, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
													PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_DOMAIN, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
													PropertyUtils.getIntProperty(SmackPropertiesLoader.OPENFIER_PORT, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
													PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_USERNAME, SmackPropertiesLoader.SMACK_CONFIG_FILE), 
													PropertyUtils.getProperty(SmackPropertiesLoader.OPENFIRE_PASSWORD, SmackPropertiesLoader.SMACK_CONFIG_FILE));
			OpenfireClientManager clientManager = OpenfireClientManager.login(setting);
			Message message = MessageTransporter.getMessage();
			
			//message.setCode(entity.getMsgCode());
			//启用线程执行消息推送
			if (message != null) {
				CommonMethodThread cmt = new CommonMethodThread();
				cmt.setJob(clientManager, "sendMessages", message.getToUser(), message.getMsgXml());
				cmt.run();
			}
		} catch (Exception e) {
			logger.error("消息推送失败：" + e.getMessage());
			throw e;
		}
		return returnStr;
	}
	
}

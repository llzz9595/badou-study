/**
 * 
 */
package com.shengdai.mobile.smack.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.stereotype.Controller;

import com.shengdai.global.util.ParamUtils;
import com.shengdai.global.util.StringUtils;
import com.shengdai.mobile.common.struts2.JsonMobileTemplateAction;
import com.shengdai.mobile.smack.messageConsole.Message;
import com.shengdai.mobile.smack.messageConsole.MessageTransporter;

/**
 * @author 林栋
 * @date    2014-5-24
 */
@Controller
public class MessagePushJsonpAction extends JsonMobileTemplateAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3654101854162403037L;
	
	@Action(interceptorRefs = @InterceptorRef("pushJsonStack"))
	public void messagePush(){
		try {
			prepare();
			String code = ParamUtils.getParameter(request, "code");
			String title = ParamUtils.getParameter(request, "title");
			String content = ParamUtils.getParameter(request, "content");
			String ids = ParamUtils.getParameter(request, "ids");
			if(StringUtils.isBlank(ids)){
				outJsonp(false);
				return;
			}
			List<String> toUser = new ArrayList<String>();
			String[] user = ids.split(",");
			for(String str:user){
				toUser.add(str);
			}
			MessageTransporter.setMessage(new Message(code, title, content, toUser));
			outJsonp(true);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			outJsonp(false);
		}
	}

}

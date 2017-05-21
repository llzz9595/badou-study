package com.shengdai.mobile.version.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.shengdai.common.cfg.PropertyUtils;
import com.shengdai.global.util.ParamUtils;
import com.shengdai.mobile.MobileConstants;
import com.shengdai.mobile.common.struts2.JsonMobileTemplateAction;
import com.shengdai.mobile.version.model.ApkVersionEntity;
import com.shengdai.mobile.version.model.ResourceVersionEntity;
import com.shengdai.mobile.version.service.IApkVersionService;
import com.shengdai.mobile.version.service.IResourceVersionService;
import com.shengdai.version.VersionPropertiesLoader;

/**
 * 应用版本管理，对外接口类
 * @author zhouan
 *
 */
@Controller
public class VersionJsonpAction extends JsonMobileTemplateAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4689422857367739965L;
	
	@Autowired
	private IApkVersionService apkVersionService;
	
	@Autowired
	private IResourceVersionService resourceVersionService;
	
	@Autowired
	public void setVersionService(IApkVersionService apkVersionService) {
		this.apkVersionService = apkVersionService;
	}

	@Action
	public void getLatestVersion() throws Exception {
		PrintWriter out = response.getWriter();
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			ApkVersionEntity apkVersionEntity = apkVersionService.getLatestVersion();	
			JSONObject jo = new JSONObject();
			jo.put("version", apkVersionEntity == null ? 1 : apkVersionEntity.getVersionNum());
			jo.put("description", "");
			jo.put("downloadUrl", apkVersionEntity == null ? "" : PropertyUtils.getProperty(MobileConstants.PROP_DOWNLOAD_BASEURL,
					VersionPropertiesLoader.VERSION_FILE) + MobileConstants.APK_DOWNLOAD_URL + apkVersionEntity.getId());
			
			out.println(jo);
		} catch (Exception e) {
			JSONObject jo = new JSONObject();
			jo.put("version", 1);
			jo.put("description", "");
			out.println(jo);
			e.printStackTrace();
		}
	}

	@Action
	public void getLatestResourceVersion() throws Exception {
		try {
			HttpServletRequest req = ServletActionContext.getRequest();
			String apkId = ParamUtils.getParameter(req, "apkId");
			ResourceVersionEntity resourceVersionEntity = resourceVersionService.html5Version(apkId);	
			
			JSONObject jo = new JSONObject();
			jo.put("resourceNum", resourceVersionEntity.getVersionNum());
			jo.put("resourceUrl", "");
			
			PrintWriter out = response.getWriter();
			out.println(jo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

package com.shengdai.brms.common.web.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;

import com.shengdai.base.support.struts.BaseStrutsAction;
import com.shengdai.common.cfg.system.DefaultPropertiesLoader;
import com.shengdai.global.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.ExcelResult;

public class ExcelExportAction extends BaseStrutsAction {

	private static final long serialVersionUID = 6643967541189066312L;

	private String excelFileName;

	private InputStream excelFileStream;
	/**
	 * @return the excelFileName
	 */
	public String getExcelFileName() {
		return excelFileName;
	}
	/**
	 * @return the excelFileStream
	 */
	public InputStream getExcelFileStream() {
		return excelFileStream;
	}
	
	@Action(interceptorRefs = @InterceptorRef("baseStack"))
	@ExcelResult
	public String exportExcel() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		excelFileName = ParamUtils.getParameter(request, "fileName");
		File downFile = new File(DefaultPropertiesLoader.getAppExcelFilePath() + URLDecoder.decode(excelFileName, "UTF-8") + ".xls");
		excelFileName = URLDecoder.decode(excelFileName, "UTF-8");
		excelFileName=new String(excelFileName.getBytes("GBK"),"ISO8859-1"); 
		try {
			excelFileStream = new FileInputStream(downFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exportExcel";
	}
}

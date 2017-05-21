package com.badou.project.moduleDemo.web.demo13;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduleDemo13/Fun2/Fun2Demo13list/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo13/Fun2/Fun2Demo13list_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo13ListAction extends JsonListTemplateAction<Demo13Entity, Serializable, Demo13Form> {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo13Service Demo13Service;
	@Autowired
	public void setDemo13Service(IDemo13Service Demo13Service) {
		this.Demo13Service = Demo13Service;
		super.setBaseService(Demo13Service);
	}
  
	private String base ="D:\\chromedownload\\";
	
	@Action
	@DispatcherResult
	public void importExcel() throws BiffException, IOException
	{
			//		
		HttpServletRequest req = ServletActionContext.getRequest();
		String fileName = ParamUtils.getParameter(req, "fileName");
		System.out.println("000"+fileName);
		File file =  new File(base+fileName);
		 InputStream is = new FileInputStream(file);  
		Workbook book = Workbook.getWorkbook(is);    

	        Sheet sheet = book.getSheet(0);// 指定下标方式  
////	      	        /* 
////	         * 读取单元格 方法：getCell param1：第几列 param2：第几行 
////	         */  
	         for(int i = 1 ; i < sheet.getRows();i++)
	         {
	        	 Demo13Entity demo13 = new Demo13Entity();
	        	for(int j = 0 ; j < 3 ;j++){ 
	        	 Cell cell = sheet.getCell(j, i);  
	        	 String content = cell.getContents(); 
	        	 System.out.println("content-"+content);
	        	
	        	 switch(j){
	        	 case 0:demo13.setName(content); break;
	        	 case 1: demo13.setPrice(content);break;
	        	 case 2: demo13.setDesc(content);break;
	        	 }
	        	 
	        	}
	        	demo13.setCreateDate(new Date());
	        	demo13.setCreator(LogonCertificateHolder.getLogonCertificate().getUserName());
	        	demo13.setLastUpdator(LogonCertificateHolder.getLogonCertificate().getUserName());
	        	demo13.setLastUpdateDate(new Date());
	        	if(Demo13Service.findByName(demo13.getName()).isEmpty())
	        	{
	        		Demo13Service.create(demo13);
	        	}
	        	
	        		
	      
	         }
	         /** 
		         * 释放资源 当你完成对 Excel 电子表格数据的处理后，一定要使用 close() 
		         * 方法来关闭先前创建的对象，以释放读取数据表的过程中所占用的内存空间，在读取大量数据时显得尤为重要 
		         */  
		       
	         book.close();  
	        	
	         }
	       
	  

	     


	@Override
	protected void exeBeforeList() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String id = ParamUtils.getParameter(req, "id");
		String name = ParamUtils.getParameter(req, "name");
		String price = ParamUtils.getParameter(req, "price");
		String desc = ParamUtils.getParameter(req, "desc");
		String imgUrl = ParamUtils.getParameter(req, "imgUrl");
		System.out.println(imgUrl);
		String creator = ParamUtils.getParameter(req, "creator");
		Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
		Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
		String lastUpdator = ParamUtils.getParameter(req, "lastUpdator");
		Date lastUpdateDate = ParamDateUtils.getParameter(req, "lastUpdateDate",DateUtils.DATE_FMT_CN_YMD);
		QueryCriterion queryCriterion = new QueryCriterion();
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("id",id, null, QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("name",name,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("price",price,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("desc",desc,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("imgUrl",imgUrl,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.rlike))
			.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeStart,null,QueryOperSymbolEnum.ge))
			.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeEnd,null,QueryOperSymbolEnum.le))
			.addParam(new QueryHibernatePlaceholderParam("lastUpdator",lastUpdator,null,QueryOperSymbolEnum.eq))
			.addParam(new QueryHibernatePlaceholderParam("lastUpdateDate",lastUpdateDate,null,QueryOperSymbolEnum.eq))
			.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));
		req.setAttribute(Request_Criterion, queryCriterion);
	}

}

package com.badou.project.moduleDemo.web.demo17;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.badou.project.moduleDemo.model.Demo12Entity;
import com.badou.project.moduleDemo.service.IDemo12ChildService;
import com.badou.project.moduleDemo.service.IDemo12Service;
import com.badou.project.moduleDemo.vo.Demo14Vo;
import com.badou.project.moduleDemo.web.form.Demo12Form;
import com.shengdai.base.query.QueryCriterion;
import com.shengdai.base.query.QueryOperSymbolEnum;
import com.shengdai.base.query.QueryOrderby;
import com.shengdai.base.query.SortOrderEnum;
import com.shengdai.base.query.support.QueryHibernatePlaceholderParam;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.util.ParamUtils;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduleDemo12//Demo12list/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo12//Demo12list_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo17ListAction extends JsonListTemplateAction<Demo12Entity, Serializable, Demo12Form> {

	/**
	 * http://blog.csdn.net/heyutao007/article/details/5981555
	 * http://blog.csdn.net/guo_love_peng/article/details/6853728
	 */
	private static final long serialVersionUID = 5580776894637809336L;
	@Autowired
	private IDemo12Service Demo12Service;
	@Autowired
	private IDemo12ChildService Demo12ChildService;
	@Autowired
	public void setDemo12Service(IDemo12Service Demo12Service) {
		this.Demo12Service = Demo12Service;
		super.setBaseService(Demo12Service);
	}
	
	private JSONObject rows;
	
	@Action
	@JSONResult(params={"root","rows"})
	public String initDemo17() throws IOException{
	//		获取数据
		
		
		List<Demo12Entity> list= Demo12Service.findOrder(LogonCertificateHolder
				.getLogonCertificate().getUserName());
		
	    HashMap<String, Object> map = new HashMap<String,Object>();  
	    List<HashMap<String, Object>> data = new ArrayList<HashMap<String, Object>>();
		
	    for(Demo12Entity demo12 : list ){
	    	  HashMap<String, Object> hashMap = new HashMap<String, Object>();
//	    	  HashMap<String, Object> hashMap1 = new HashMap<String, Object>();
         
            hashMap.put("id",demo12.getId());
            hashMap.put("orderTitle", demo12.getOrderTitle());
            hashMap.put("orderNo", demo12.getOrderNo());
            hashMap.put("salmon", demo12.getSalmon());
            hashMap.put("remark", demo12.getRemark());
            hashMap.put("customerName", demo12.getCustomerName());
            hashMap.put("customerPhoneNum", demo12.getCustomerPhoneNum());
            hashMap.put("creator", demo12.getCreator());
            hashMap.put("createDate", demo12.getCreateDate());
            hashMap.put("LastUpdator", demo12.getLastUpdator());
            hashMap.put("LastUpdateDate", demo12.getLastUpdateDate());
            data.add(hashMap);
	    }
	    map.put("Rows", data);
	    map.put("Total", list.size());
	    rows= JSONObject.parseObject(JSON.toJSONString(map));
//	 返回数据
	   HttpServletResponse response = ServletActionContext.getResponse();  
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(JSON.toJSONString(map));
		response.getWriter().close();
//	 System.out.println("data-1"+JSON.toJSONString(data));
        
       return  JSON.toJSONString(data) ;

		
	}
//	
//	@Action
//	public String exportExcel() throws Exception {
//	  
//		HttpServletResponse response = ServletActionContext.getResponse();  
//	        // 定义request ,response.  
//	        // 查询下载附件.  
//	        // 设置下载头信息.begin  
//		
//
//	        OutputStream output = null;  
//	        InputStream fis = null;  
//	        try {  
//	           
//	        	// 定义输出流，以便打开保存对话框______________________begin
//				// HttpServletResponse response=ServletActionContext.getResponse();
//				output = response.getOutputStream();// 取得输出流
//				response.reset();// 清空输出流
//				response.setHeader("Content-disposition",
//						"attachment; filename=" + new String("demo12.xls".getBytes("GB2312"), "ISO8859-1"));
//				// 设定输出文件头
//				response.setContentType("application/msexcel");// 定义输出类型
//				// 定义输出流，以便打开保存对话框_______________________end
//
//				/** **********创建工作簿************ */
//				WritableWorkbook workbook = Workbook.createWorkbook(output);
//
//				/** **********创建工作表************ */
//
//				WritableSheet sheet = workbook.createSheet("Sheet1", 0);
//
//				/** **********设置纵横打印（默认为纵打）、打印纸***************** */
//				jxl.SheetSettings sheetset = sheet.getSettings();
//				sheetset.setProtected(false);
//	 		   
//				sheet.addCell(new Label(0,0, "主键ID"));  		             
//	 		    sheet.addCell(new Label(1,0, "订单标题")); 
//	  	       
//	 		    sheet.addCell(new Label(2,0, "订单编号"));  
//	          
//	 		    sheet.addCell(new Label(3,0, "所属销售人员名称"));  
//				
//
//	            int i = 1;  
//	            List list1 = new ArrayList();  
//	        	/** ***************以下是EXCEL正文数据********************* */
//	            
//	            list1 = Demo12Service.listAll();
//	          
//	            
//	            for (int j = 0; j < list1.size(); j++) {  
//	               
//	            	Demo12Entity demo12 = (Demo12Entity) list1.get(j);  
//	            	sheet.addCell(new Label(0, i + 1, "" + demo12.getId()));  
//	                sheet.addCell(new Label(1, i + 1, "" + demo12.getOrderTitle())); 
//	                sheet.addCell(new Label(2, i + 1, "" + demo12.getOrderNo()));  
//	                sheet.addCell(new Label(3, i + 1, "" + demo12.getSalmon()));  
//	              
//	                i++;  
//	                
//	            }  
//	            workbook.write();  
//	            workbook.close();
//	        
//	        } catch (Exception e) {  
//	            System.out.println("Error!");  
//	            e.printStackTrace();  
//	        } finally {// 正常关闭输入输出流.  
//	            try {  
//	                if (fis != null) {  
//	                    fis.close();  
//	                    fis = null;  
//	                }  
//	            } catch (Exception e) {  
//	                e.printStackTrace();  
//	            }  
//	            try {  
//	                if (output != null) {  
//	                    output.close();  
//	                    output = null;  
//	                }  
//	            } catch (Exception e) {  
//	                e.printStackTrace();  
//	            }  
//	        }  
//	        return null;  
//	}
//	
	
	@Override
	protected void exeBeforeList() throws Exception {
				
		HttpServletRequest req = ServletActionContext.getRequest();
		String order = ParamUtils.getParameter(req, "order");
		QueryCriterion queryCriterion = new QueryCriterion();
		System.out.println("------------------------");
		queryCriterion.addParam(new QueryHibernatePlaceholderParam("customerName",order,null,QueryOperSymbolEnum.eq))
		.addParam(new QueryHibernatePlaceholderParam("customerPhoneNum",order,null,QueryOperSymbolEnum.like))
		.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));
		
		req.setAttribute(Request_Criterion, queryCriterion);
	}
	
}

//String ID = ParamUtils.getParameter(req, "id");
//String orderTitle = ParamUtils.getParameter(req, "orderTitle");
//String salmon = ParamUtils.getParameter(req, "salmon");
//String remark = ParamUtils.getParameter(req, "remark");
//String creator = ParamUtils.getParameter(req, "creator");
//Date createTimeStart = ParamDateUtils.getParameter(req, "createTimeStart",DateUtils.DATE_FMT_CN_YMD);
//Date createTimeEnd = ParamDateUtils.getParameter(req, "createTimeEnd",DateUtils.DATE_FMT_CN_YMD);
////Date createDate = ParamDateUtils.getParameter(req, "createDate",DateUtils.DATE_FMT_CN_YMD);
//String lastUpdator = ParamUtils.getParameter(req, "lastUpdator");
//Date lastUpdateDate = ParamDateUtils.getParameter(req, "lastUpdateDate",DateUtils.DATE_FMT_CN_YMD);
//String orderNo = ParamUtils.getParameter(req, "orderNo");
//String customerName = ParamUtils.getParameter(req, "customerName");
//String customerPhoneNum = ParamUtils.getParameter(req, "customerPhoneNum");
//QueryCriterion queryCriterion = new QueryCriterion();

//.addParam(new QueryHibernatePlaceholderParam("orderTitle",orderTitle,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("salmon",salmon,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("remark",remark,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("creator",creator,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeStart,null,QueryOperSymbolEnum.ge))
//.addParam(new QueryHibernatePlaceholderParam("createDate",createTimeEnd,null,QueryOperSymbolEnum.le))
//.addParam(new QueryHibernatePlaceholderParam("lastUpdator",lastUpdator,null,QueryOperSymbolEnum.eq))
//.addParam(new QueryHibernatePlaceholderParam("lastUpdateDate",lastUpdateDate,null,QueryOperSymbolEnum.eq))
//.addParam(new QueryHibernatePlaceholderParam("orderNo",orderNo,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("customerName",customerName,null,QueryOperSymbolEnum.rlike))
//.addParam(new QueryHibernatePlaceholderParam("customerPhoneNum",customerPhoneNum,null,QueryOperSymbolEnum.rlike))
//.addOrder(new QueryOrderby(2,"createDate",SortOrderEnum.desc));

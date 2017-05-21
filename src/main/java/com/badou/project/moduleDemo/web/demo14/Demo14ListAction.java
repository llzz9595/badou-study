package com.badou.project.moduleDemo.web.demo14;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
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
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;


/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduleDemo12//Demo12list/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo12//Demo12list_list.jsp
 * @author xiangsf 2013-1-18
 *
 */
@Controller
public class Demo14ListAction extends JsonListTemplateAction<Demo12Entity, Serializable, Demo12Form> {

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
	 @DispatcherResult
	 public String initChart() throws IOException
	 {
				
//			获取数据
			List<Demo14Vo> list= Demo12Service.findBySQL();
			HashMap<String, Object> map = new HashMap<String,Object>();  
			
		    List<HashMap<String, Object>> data = new ArrayList<HashMap<String, Object>>();
		 
		    for(Demo14Vo demo14 : list ){
		    	  HashMap<String, Object> hashMap = new HashMap<String, Object>();
//		    	  HashMap<String, Object> hashMap1 = new HashMap<String, Object>();
	              hashMap.put("name", demo14.getCustomer());
	              int[] data1 = {demo14.getFirst(),demo14.getSecond(),
	            		        demo14.getThird(),demo14.getFourth(),
	            		        demo14.getFifth(),demo14.getSixth(),
	            		        demo14.getSeventh()};
	              hashMap.put("data", data1);
	              data.add(hashMap);
		    }
		   
//		 返回数据
		   HttpServletResponse response = ServletActionContext.getResponse();  
			response.setContentType("text/json; charset=utf-8");
			response.getWriter().print(JSON.toJSONString(data));
			response.getWriter().close();
		 System.out.println("data-1"+JSON.toJSONString(data));
	        
	       return  JSON.toJSONString(data) ;
	 }
	 
	 
	@Action
	@JSONResult(params={"root","rows"})
	@DispatcherResult
	public String initDemo14() throws IOException{
		
	
//		获取数据
		List<Demo14Vo> list= Demo12Service.findBySQL();
		HashMap<String, Object> map = new HashMap<String,Object>();  
		
	    List<HashMap<String, Object>> data = new ArrayList<HashMap<String, Object>>();
	 
	    for(Demo14Vo demo14 : list ){
	    	  HashMap<String, Object> hashMap = new HashMap<String, Object>();
           
              hashMap.put("customer",demo14.getCustomer());
              hashMap.put("first",demo14.getFirst());
              hashMap.put("second",demo14.getSecond());
              hashMap.put("third",demo14.getThird());
              hashMap.put("fourth",demo14.getFourth());
              hashMap.put("fifth",demo14.getFifth());
              hashMap.put("sixth",demo14.getSixth());
              hashMap.put("seventh",demo14.getSeventh());
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

	


	public JSONObject getRows() {
		return rows;
	}




	public void setRows(JSONObject rows) {
		this.rows = rows;
	}




	@Override
	protected void exeBeforeList() throws Exception {
		System.out.println("///////////////////before");
	}
	
}

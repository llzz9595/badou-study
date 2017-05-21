package com.badou.project.moduleDemo.web.demo15;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.badou.project.moduleDemo.model.Demo13Entity;
import com.badou.project.moduleDemo.service.IDemo13Service;
import com.badou.project.moduleDemo.vo.Demo15VO;
import com.badou.project.moduleDemo.web.form.Demo13Form;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.plugin.struts2.annotation.result.JSONResult;
import com.shengdai.ui.ligerui.struts2.JsonListTemplateAction;


/**
 * 功能1示例查询事件
 * <p>对应的请求路径是：${context}/moduleDemo13//Demo13list/方法名.do
 * <p>对应的请求默认页面是：${context}/WEB-INF/jsp/moduleDemo13//Demo13list_list.jsp
 * @author xiangsf 3013-1-18
 *
 */
@Controller
public class Demo15ListAction extends JsonListTemplateAction<Demo13Entity, Serializable, Demo13Form> {

	/**
	 * http://blog.csdn.net/heyutao007/article/details/5981555
	 * http://blog.csdn.net/guo_love_peng/article/details/6853738
	 */
	private static final long serialVersionUID = 5580776895637809336L;
	@Autowired
	private IDemo13Service Demo13ervice;
	
	@Autowired
	public void setDemo13Service(IDemo13Service Demo13Service) {
		this.Demo13ervice = Demo13Service;
		super.setBaseService(Demo13Service);
	}
	
	 private JSONObject rows;
	
	 @Action
	 @DispatcherResult
	 public String initChart() throws IOException
	 {
				
		 System.out.println("////////////////////");
//			获取数据
			List<Demo15VO> list= Demo13ervice.findBySQL();
			HashMap<String, Object> map = new HashMap<String,Object>();  
			
		    List<HashMap<String, Object>> data = new ArrayList<HashMap<String, Object>>();
		 
		    for(Demo15VO demo15 : list ){
		    	  HashMap<String, Object> hashMap = new HashMap<String, Object>();
//		    	  HashMap<String, Object> hashMap1 = new HashMap<String, Object>();
	              hashMap.put("name", demo15.getGoods());
	              int[] data1 = {demo15.getFirst(),demo15.getSecond(),
	            		        demo15.getThird(),demo15.getFourth(),
	            		        demo15.getFifth(),demo15.getSixth(),
	            		        demo15.getSeventh()};
	              hashMap.put("data", data1);
	              data.add(hashMap);
		    }
		   
//		 返回数据
		   HttpServletResponse response = ServletActionContext.getResponse();  
			response.setContentType("text/json; charset=utf-8");
			response.getWriter().print(JSON.toJSONString(data));
			response.getWriter().close();
		 System.out.println("data-2"+JSON.toJSONString(data));
	        
	       return  JSON.toJSONString(data) ;
	 }
	 
	 
	@Action
	@JSONResult(params={"root","rows"})
	@DispatcherResult
	public String initDemo15() throws IOException{
		
	
//		获取数据
		List<Demo15VO> list= Demo13ervice.findBySQL();
		HashMap<String, Object> map = new HashMap<String,Object>();  
		
	    List<HashMap<String, Object>> data = new ArrayList<HashMap<String, Object>>();
	 
	    for(Demo15VO demo15 : list ){
	    	  HashMap<String, Object> hashMap = new HashMap<String, Object>();
//	    	  HashMap<String, Object> hashMap1 = new HashMap<String, Object>();
           
              hashMap.put("goods",demo15.getGoods());
              hashMap.put("first",demo15.getFirst());
              hashMap.put("second",demo15.getSecond());
              hashMap.put("third",demo15.getThird());
              hashMap.put("fourth",demo15.getFourth());
              hashMap.put("fifth",demo15.getFifth());
              hashMap.put("sixth",demo15.getSixth());
              hashMap.put("seventh",demo15.getSeventh());
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

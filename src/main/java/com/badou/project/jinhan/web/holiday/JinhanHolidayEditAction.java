package com.badou.project.jinhan.web.holiday;
/*
 * 请假单填写、修改动作
 * author：一只尼玛
 * 2015.9.19
 * */
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import javax.servlet.http.HttpSession;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.BaseEditStrutsAction;
import com.shengdai.plugin.struts2.annotation.result.DispatcherResult;
import com.shengdai.ssl.local.LogonCertificate;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.jinhan.service.IJinhanHolidayService;
import com.badou.project.jinhan.web.form.JinhanHolidayForm;


@Controller
public class JinhanHolidayEditAction extends BaseEditStrutsAction<JinhanHolidayEntity, Serializable,JinhanHolidayForm> {

	private static final long serialVersionUID = -4265325489459574831L;
	private  String userid;
	private  String username;
	private  String userpart;


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpart() {
		return userpart;
	}

	public void setUserpart(String userpart) {
		this.userpart = userpart;
	}
	@Autowired
	private IJinhanHolidayService jinhanHolidayService ;
	@Autowired
	public void setJinhanHolidayService(IJinhanHolidayService jinhanHolidayService) {
		this.jinhanHolidayService = jinhanHolidayService;
		super.setBaseService(jinhanHolidayService);
	}
	
	/*
	 * 填写请假单，自动填写名字和部门
	 * */
	@Action
	@DispatcherResult
	public String show(){
		HttpSession session=request.getSession();
		LogonCertificate certificate = (LogonCertificate)session.getAttribute(com.shengdai.kpi.system.Globals.LOGON_KPIUSER);
		this.userid=certificate.getUserId();
		this.username=certificate.getUserName();
		this.userpart=certificate.getOrgName();
		return "show";
	}
	
	/*
	 * 审核请假单
	 * */
	@Action
	public void agree() throws IOException{
		JinhanHolidayEntity j=jinhanHolidayService.find(request.getParameter("id"));
		HttpSession session=request.getSession();
		LogonCertificate certificate = (LogonCertificate)session.getAttribute(com.shengdai.kpi.system.Globals.LOGON_KPIUSER);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//得到角色
		String role=certificate.getRoleName();
		//得到请假天数
		int holiday=j.getDays();
		//hr意见
		String hr=request.getParameter("agreeAdviceh");
		//经理意见
		String jl=request.getParameter("agreeAdvicej");
		//经理审核，hr意见不能为空
		if(holiday>3&&role.equals("经理")&&(j.getAgreeAdviceh()==null||j.getAgreeAdviceh().equals(""))){
			out.print("null");
			out.close();
			return;
		}
		//hr审核时意见不能为空
		if(role.equals("HR")&&(hr==null||hr.equals(""))){
			out.print("null");
			out.close();
			return;
		}
		if(holiday<=3){
			j.setAgreeAdvicej("请假天数低于3天经理不用审核");
		}
		//小于三天，人力直接审核通过
		if(role.equals("HR") && holiday<=3){
			j.setAgreeAdviceh(hr);
			j.setAgreeFlag("1");
			jinhanHolidayService.update(j);
			out.print("good");
			//否则待经理审核
		}else if(role.equals("HR") && holiday>3){
			j.setAgreeAdviceh(hr);
			jinhanHolidayService.update(j);
			out.print("notbad");
			//大于3天经理审核
		}else if(role.equals("经理") && holiday>3){
			j.setAgreeAdvicej(jl);
			j.setAgreeFlag("1");
			jinhanHolidayService.update(j);
			out.print("good");
		}else{
			jinhanHolidayService.update(j);
			out.print("bad");
		}
		out.flush();
		out.close();
		
	}
	
	/*
	 * 修改请假单，显示请假单内容
	 * */
	@Action
	@DispatcherResult
	@Override
	public String edit(){
		JinhanHolidayEntity j=jinhanHolidayService.find(request.getParameter("id"));
		request.setAttribute("j", j);
		return "edit";
	}

	
}


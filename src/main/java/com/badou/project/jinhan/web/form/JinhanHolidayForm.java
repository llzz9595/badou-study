package com.badou.project.jinhan.web.form;

import java.util.Date;

import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.moduleDemo.model.Fun1DemoChildEntity;
import com.badou.project.moduleDemo.model.Fun1DemoEntity;
import com.badou.project.moduleDemo.web.form.Fun1DemoChildForm;
import com.shengdai.base.support.struts.form.BaseStrutsEntityForm;

public class JinhanHolidayForm extends BaseStrutsEntityForm<JinhanHolidayEntity>{
	private static final long serialVersionUID = 3324796649194192249L;
	private Date periodb;
	private Date periode;
	private Integer days = 1;
	private String reasonName;
	protected Date createTime = new Date();
	private String link1;
	private String link2;
	private String link3;
	private String agreeName="0";
	private String agreeAdviceh;
	private String agreeAdvicej;
	private String  memberId;
	private String  memberName;
	private String  memberPart;
	private String reason;
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReasonName() {
		return reasonName;
	}
	public void setReasonName(String reasonName) {
		this.reasonName = reasonName;
	}
	public Date getPeriodb() {
		return periodb;
	}
	public void setPeriodb(Date periodb) {
		this.periodb = periodb;
	}
	public Date getPeriode() {
		return periode;
	}
	public void setPeriode(Date periode) {
		this.periode = periode;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getLink1() {
		return link1;
	}
	public void setLink1(String link1) {
		this.link1 = link1;
	}
	public String getLink2() {
		return link2;
	}
	public void setLink2(String link2) {
		this.link2 = link2;
	}
	public String getLink3() {
		return link3;
	}
	public void setLink3(String link3) {
		this.link3 = link3;
	}
	public String getAgreeName() {
		return agreeName;
	}
	public void setAgreeName(String agreeName) {
		this.agreeName = agreeName;
	}
	public String getAgreeAdviceh() {
		return agreeAdviceh;
	}
	public void setAgreeAdviceh(String agreeAdviceh) {
		this.agreeAdviceh = agreeAdviceh;
	}
	public String getAgreeAdvicej() {
		return agreeAdvicej;
	}
	public void setAgreeAdvicej(String agreeAdvicej) {
		this.agreeAdvicej = agreeAdvicej;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPart() {
		return memberPart;
	}
	public void setMemberPart(String memberPart) {
		this.memberPart = memberPart;
	}
	@Override
	public void setEntityToFormProperties(JinhanHolidayEntity instance) {
		if(instance.getAgreeFlag().equals("1")){
			this.setAgreeName("已审核");
		}else{
			this.setAgreeName("审核中");
		}
		if(instance.getReason().equals("1")){
			this.setReasonName("事假");
		}else{
			this.setReasonName("病假");
		}
		super.setEntityToFormProperties(instance);
	}

	@Override
	public void setFormToEntityProperties(JinhanHolidayEntity instance) {
		super.setFormToEntityProperties(instance);

	}

}

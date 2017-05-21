package com.badou.project.jinhan.model;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Where;
import com.shengdai.base.support.hibernate.used.AppBaseEntity;
import com.shengdai.global.annotation.DefaultOrderBy;
/*
 *  请假单实体
 *  author：一只尼玛
 *  time:2015.9.18
 * */
@javax.persistence.Entity
@Table(name = "JIN_HOLIDAY")
@Cache(usage = CacheConcurrencyStrategy.NONE) 
@DefaultOrderBy(clause="create_time desc") 
public class JinhanHolidayEntity extends AppBaseEntity{

	private static final long serialVersionUID = -5276296911531148651L;
	
	/**
	 * 字段1:请假起始时间
	 */
	@Column(name = "periodb",  nullable = false, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date periodb;
	
	/**
	 * 字段2:请假终止时间
	 */
	@Column(name = "periode",  nullable = false, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date periode;
	
	/**
	 * 字段3:请假天数
	 */
	@Column(name = "days", unique = false, nullable = false, insertable = true, updatable = true, length =4)
	private Integer days = 1;
	
	/**
	 * 字段4：请假理由
	 */
	@Column(name = "reason", unique = false, nullable = false, insertable = true, updatable = true, length = 1)
	private String reason;
	
	/**
	 * 字段5：创建时间
	 */
	@Column(name = "create_time", unique = false, nullable = false, insertable = true, updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	protected Date createTime = new Date();
	
	/**
	 * 字段4：请假理由
	 */
	@Column(name = "link1", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String link1;
	@Column(name = "link2", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String link2;
	@Column(name = "link3", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	private String link3;
	
	/**
	 * 字段：审核标记
	 */
	@Column(name = "agree_flag", unique = false, nullable = false, insertable = true, updatable = true, length =1)
	private String agreeFlag="0";
	@Column(name = "agree_adviceh", unique = false, insertable = true, updatable = true, length =1000)
	private String agreeAdviceh;
	@Column(name = "agree_advicej", unique = false, insertable = true, updatable = true, length =1000)
	private String agreeAdvicej;
	
	/**
	 * 字段：个人信息
	 */
	@Column(name = "member_id", unique = false,  nullable = false,insertable = true, updatable = true, length =32)
	private String  memberId;
	@Column(name = "member_name", unique = false,  nullable = false,insertable = true, updatable = true, length =100)
	private String  memberName;
	@Column(name = "member_part", unique = false,  nullable = false,insertable = true, updatable = true, length =100)
	private String  memberPart;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	public String getAgreeFlag() {
		return agreeFlag;
	}
	public void setAgreeFlag(String agreeFlag) {
		this.agreeFlag = agreeFlag;
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
	
	
}

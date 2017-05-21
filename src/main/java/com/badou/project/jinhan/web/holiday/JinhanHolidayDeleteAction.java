package com.badou.project.jinhan.web.holiday;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.shengdai.base.support.struts.used.json.BaseJsonDeleteStrutsAction;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.jinhan.service.IJinhanHolidayService;

@Controller
public class JinhanHolidayDeleteAction extends BaseJsonDeleteStrutsAction<JinhanHolidayEntity, Serializable> {

	private static final long serialVersionUID = -3685639293162389695L;
	
	@Autowired
	private IJinhanHolidayService jinhanHolidayService ;
	@Autowired
	public void setJinhanHolidayService(IJinhanHolidayService jinhanHolidayService) {
		this.jinhanHolidayService = jinhanHolidayService;
		super.setBaseService(jinhanHolidayService);
	}
	
	
}


package com.badou.project.jinhan.service;
import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.shengdai.base.support.spring.IBaseSpringService;
import com.shengdai.kpi.attach.model.Attach;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
/*
 * 请假单服务接口
 * */
public interface IJinhanHolidayService extends IBaseSpringService<JinhanHolidayEntity, Serializable>{
	public String saveJinhanHoliday (JinhanHolidayEntity entity,List<Attach> attachList);
	public int downloadFile(String id,HttpServletResponse response,int link);
}

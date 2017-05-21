package com.badou.project.moduleDemo.service;

import java.io.Serializable;
import java.util.List;

import com.badou.project.moduleDemo.model.Demo12Entity;
import com.badou.project.moduleDemo.vo.Demo14Vo;
import com.shengdai.base.support.spring.IBaseSpringService;

public interface IDemo12Service extends IBaseSpringService<Demo12Entity, Serializable>{

	public List<Demo14Vo> findBySQL() ;
	public List<Demo12Entity> findOrder(String s);

}

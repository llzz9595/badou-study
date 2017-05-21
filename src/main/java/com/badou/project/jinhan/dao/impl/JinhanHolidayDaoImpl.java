package com.badou.project.jinhan.dao.impl;
import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.badou.project.jinhan.dao.IJinhanHolidayDao;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.shengdai.base.support.hibernate.BaseHibernateDAO;

/*
 * 数据访问层接口实现*/
@Repository
public class JinhanHolidayDaoImpl extends 
BaseHibernateDAO<JinhanHolidayEntity, Serializable> implements IJinhanHolidayDao{

}

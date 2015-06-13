package com.wecan.wecanmanager.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wecan.wecanmanager.dao.ICommendDao;
import com.wecan.wecanmanager.pojo.Commend;
import com.wecan.wecanmanager.pojo.User;

/**
 * 管理员添加奖励者，在页面显示受奖励者
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 禹华仁
 * @modifyDate 修改的时间
 */
public class CommendDaoImpl extends HibernateDaoSupport implements ICommendDao {

	/*
	 * 管理员添加奖励者
	 */
	public boolean AddCommend(Commend commend) {

		return false;
	}

	/*
	 * 在页面显示受奖励者
	 */
	public List<Commend> showList() {
		
		return null;
	}

}

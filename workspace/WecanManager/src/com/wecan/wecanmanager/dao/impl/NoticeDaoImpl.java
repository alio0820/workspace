package com.wecan.wecanmanager.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wecan.wecanmanager.dao.INoticeDao;
import com.wecan.wecanmanager.pojo.Notice;

/**
 * 发布公告、接受公告、查看公告
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 王卓敏
 * @modifyDate 修改的时间
 */
public class NoticeDaoImpl extends HibernateDaoSupport implements INoticeDao {

	/*
	 * 发布公告
	 */
	public boolean addNotice(Notice notice) {

		return false;
	}

	/*
	 * 接受公告题目
	 */
	public List<Notice> queryNoticeText() {

		return null;
	}

	/*
	 * 查看公告内容
	 */
	public List<Notice> showNoticeTopic() {

		return null;
	}

}

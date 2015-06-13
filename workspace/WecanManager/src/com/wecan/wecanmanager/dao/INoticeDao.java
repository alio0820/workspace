package com.wecan.wecanmanager.dao;

import java.util.List;

import com.wecan.wecanmanager.pojo.Notice;

/**
 * 发布公告、接受公告、查看公告
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 王卓敏
 * @modifyDate 修改的时间
 */

public interface INoticeDao {
	/*
	 * 发布公告
	 */
	public boolean addNotice(Notice notice);

	/*
	 * 接受公告题目
	 */
	public List<Notice> showNoticeTopic();

	/*
	 * 查看公告内容
	 */
	public List<Notice> queryNoticeText();
}

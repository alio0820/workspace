package com.wecan.wecanmanager.service;

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
public interface INoticeService {
	/*
	 * 发布公告
	 */
	public boolean addNotice(Notice notice);

	/*
	 * 接受公告
	 */
	public List<Notice> showNoticeTopic();

	/*
	 * 查看公告
	 */
	public List<Notice> queryNoticeText();
}

package com.wecan.wecanmanager.service.impl;

import java.util.List;

import com.wecan.wecanmanager.dao.INoticeDao;
import com.wecan.wecanmanager.pojo.Notice;
import com.wecan.wecanmanager.service.INoticeService;

/**
 * 发布公告、接受公告、查看公告
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 王卓敏
 * @modifyDate 修改的时间
 */
public class NoticeServiceImpl implements INoticeService {

	private INoticeDao ind;// notice对应的dao层接口的对象

	public INoticeDao getInd() {
		return ind;
	}

	public void setInd(INoticeDao ind) {
		this.ind = ind;
	}

	/*
	 * 发布公告
	 */
	public boolean addNotice(Notice notice) {

		return ind.addNotice(notice);
	}

	/*
	 * 查看公告
	 */
	public List<Notice> queryNoticeText() {

		return ind.queryNoticeText();
	}

	/*
	 * 接受公告
	 */
	public List<Notice> showNoticeTopic() {

		return ind.showNoticeTopic();
	}

}

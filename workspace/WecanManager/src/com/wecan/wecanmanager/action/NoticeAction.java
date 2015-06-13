package com.wecan.wecanmanager.action;

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
public class NoticeAction {

	private Notice notice;// 公告对象

	private INoticeService ins;// 公告service接口对象

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public INoticeService getIns() {
		return ins;
	}

	public void setIns(INoticeService ins) {
		this.ins = ins;
	}

	/*
	 * 发布公告
	 */
	public String addNotice() {
		return "";
	}

	/*
	 * 接受公告
	 */
	public String showNotice() {
		return "";
	}

	/*
	 * 查看公告
	 */
	public String queryNotic() {
		return "";
	}

}

package com.wecan.wecanmanager.action;

import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.wecan.wecanmanager.pojo.Commend;
import com.wecan.wecanmanager.service.ICommendService;

/**
 * 管理员添加奖励者，在页面显示受奖励者
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 禹华仁
 * @modifyDate 修改的时间
 */

public class CommendAction extends ActionSupport {

	private Commend commend;// 嘉奖人的对象

	private ICommendService ics;// 嘉奖人service接口对象

	private List<Commend> list;// 在页面显示的Commend类型的list

	public List<Commend> getList() {
		return list;
	}

	public void setList(List<Commend> list) {
		this.list = list;
	}

	public Commend getCommend() {
		return commend;
	}

	public void setCommend(Commend commend) {
		this.commend = commend;
	}

	public ICommendService getIcs() {
		return ics;
	}

	public void setIcs(ICommendService ics) {
		this.ics = ics;
	}

	/*
	 * 管理员添加奖励者
	 */

	public String AddCommend() {
		
		return "";
	}

	/*
	 * 在页面显示受奖励者
	 */

	public String showList() {
		list = ics.showList();
		if (list.size() != 0) {
			return "suce";
		}
		return INPUT;
	}
}

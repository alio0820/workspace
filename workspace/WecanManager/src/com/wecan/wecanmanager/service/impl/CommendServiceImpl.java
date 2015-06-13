package com.wecan.wecanmanager.service.impl;

import java.util.List;

import com.wecan.wecanmanager.dao.ICommendDao;
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
public class CommendServiceImpl implements ICommendService {

	private ICommendDao icd;// commend的dao层接口的对象

	public ICommendDao getIcd() {
		return icd;
	}

	public void setIcd(ICommendDao icd) {
		this.icd = icd;
	}

	/*
	 * 管理员添加奖励者
	 */
	public boolean AddCommend(Commend commend) {
		return icd.AddCommend(commend);
	}

	/*
	 * 在页面显示受奖励者
	 */
	public List<Commend> showList() {
		return icd.showList();
	}

}

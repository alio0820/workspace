package com.wecan.wecanmanager.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.wecan.wecanmanager.dao.IUserDao;
import com.wecan.wecanmanager.pojo.Authority;
import com.wecan.wecanmanager.pojo.HibernateSessionFactory;
import com.wecan.wecanmanager.pojo.User;

/**
 * 管理员添加奖励者，在页面显示受奖励者
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 孙玲、孙显松
 * @modifyDate 修改的时间
 */
public class UserDaoImpl extends HibernateDaoSupport implements IUserDao {

	/*
	 * 添加管理员
	 */
	public boolean addManager(User user) {
		try {
			// 前台传过来的username为添加管理员的那个人的用户名，name是被添加为管理员的那个人

			Session session = HibernateSessionFactory.getSession();
			String hql = "select u.id from User u where u.name=?";
			Query query = session.createQuery(hql);
			query.setString(0, user.getName());
			List<Integer> list = query.list();
			for (int i : list) {
				user.setId(i);
			}

			session.beginTransaction();
			hql = "update User us set us.authority.id='2' where us.id=?";
			query = session.createQuery(hql);
			query.setLong(0, user.getId());
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	/*
	 * 强制用户添加个人信息
	 */
	public boolean addUerMessage(User user) {

		return false;
	}

	/*
	 * 添加成员
	 */
	public boolean addUser(User user) {
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			Authority authority = new Authority();
			authority.setId(3);
			user.setAuthority(authority);
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;

	}

	/*
	 * 刪除管理员
	 */
	public boolean delManager(User user) {
		// 前台传过来的username为删除管理员的那个人的用户名，name是被删除管理员的那个人
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "select u.id from User u where u.name=?";
			Query query = session.createQuery(hql);
			query.setString(0, user.getName());
			List<Integer> list = query.list();
			for (int i : list) {
				user.setId(i);
			}

			session.beginTransaction();
			hql = "delete User us where us.id=?";
			query = session.createQuery(hql);
			query.setLong(0, user.getId());
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	/*
	 * 删除成员
	 */
	public boolean delUser(User user) {

		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "delete from User u where u.id=?";

			Query query = session.createQuery(hql);
			query.setLong(0, user.getId());
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	/*
	 * 用户登录
	 */
	public boolean login(User user) {

		Session session = HibernateSessionFactory.getSession();
		String hql = "select u.password from User u where u.username = ?";
		Query query = session.createQuery(hql);
		query.setString(0, user.getUsername());
		List<String> list = query.list();
		for (String str : list) {
			if (user.getPassword().equals(str)) {
				return true;
			}
		}

		return false;

	}

	/*
	 * 修改管理员信息,包括部门和工号，前台传过来的user包括id,部门，工号
	 */
	public boolean updateManager(User user) {
		// 前台传过来的username为修改管理员信息的那个人的用户名，name是被修改信息的管理员的名字
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "select u.id from User u where u.name=?";
			Query query = session.createQuery(hql);
			query.setString(0, user.getName());
			List<Integer> list = query.list();
			for (int i : list) {
				user.setId(i);
			}

			session.beginTransaction();
			hql = "update User u set u.department=?,u.countId=? where u.id=?";
			query = session.createQuery(hql);
			query.setString(0, user.getDepartment());
			query.setString(1, user.getCountId());
			query.setLong(2, user.getId());
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;
		
	}

	/*
	 * 修改密码
	 */
	public boolean updatePasswd(User user) {

		return false;
	}

	/*
	 * 修改成员信息，部门和工号
	 */
	public boolean updateUser(User user) {
		try {
			Session session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			String hql = "update User u set u.department=?,u.countId=? where u.id=?";
			Query query = session.createQuery(hql);
			query.setString(0, user.getDepartment());
			query.setString(1, user.getCountId());
			query.setLong(2, user.getId());
			query.executeUpdate();
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {

		}
		return false;
	}

	/*
	 * 修改个人信息
	 */
	public boolean updateUserMessage(User user) {
		/*
		 * Session session = HibernateSessionFactory.getSession(); Transaction
		 * tx = null; try { tx = session.beginTransaction();
		 * session.update(user); tx.commit(); return true; } catch (Exception e)
		 * { if(tx != null) tx.rollback(); } finally { session.close(); }
		 */
		return false;

	}

	/*
	 * 显示非管理员的真实名字
	 */
	public List<User> showUserName() {
		List<User> list = new ArrayList<User>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "select u.name from User u where u.authority.id=3";
		Query query = session.createQuery(hql);
		list = query.list();
		return list;
	}

	/*
	 * 显示管理员的真实名字
	 */
	public List<User> showManagerName() {
		List<User> list = new ArrayList<User>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "select u.name from User u where u.authority.id=2";
		Query query = session.createQuery(hql);
		list = query.list();
		return list;
	}
	
	/*
	 * 显示普通用户名字、部门、工号，用于修改用户信息
	 */
	public List<User> showUserNameForUpdate(){
		List<User> list = new ArrayList<User>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "select u.name,u.countId,u.department from User u where u.authority.id=3";
		Query query = session.createQuery(hql);
		list = query.list();
		return list;
		
		
	}
	
	
	/*
	 * 显示管理员名字、部门、工号，用于修改管理员信息
	 */
	public List<User> showManagerNameForUpdate(){
		List<User> list = new ArrayList<User>();
		Session session = HibernateSessionFactory.getSession();
		String hql = "select u.name,u.countId,u.department,u.id from User u where u.authority.id=2";
		Query query = session.createQuery(hql);
		list = query.list();
		return list;
		
		
	}

}

package com.order.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.Common;
import com.common.DBConnection;
import com.common.OrderBean;
import com.common.UserBean;
import com.common.OrderTotalBean;

public class OrderAction {
	/**
	 * 1	订餐
	 * @param userId
	 * @param price
	 * @param addRice
	 * @return String
	 */
	public String mealOrder(String userId,String price,String addRice){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select * from mealorder where userId=? and orderDate=? and orderTime=?");
			ps.setString(1, userId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			if(rs.next()){
				ps.close();
				rs.close();
				return "already";
			}
			else{
				ps=conn.prepareStatement("insert into mealorder(orderId,userId,orderDate,orderTime,orderPrice,addRice,confirm) values (?,?,?,?,?,?,?)");
				ps.setString(1, Common.getId());
				ps.setString(2, userId);
				ps.setString(3, Common.getDate());
				ps.setInt(4, Common.getWhichMeal());
				ps.setInt(5, Integer.parseInt(price));
				ps.setInt(6, Integer.parseInt(addRice));
				ps.setInt(7, 0);
				ps.execute();											
				ps.close();
				rs.close();
				return "success";
			}		
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return "error";
		}finally{
			db.CloseDB();
		}
	}
	/**
	 * 2	取消订餐
	 * @param userId
	 * @return String
	 */
	public String mealOrderCancel(String userId){
		if(isHasMealOrder(userId)){
			boolean confirm = isConfirm(userId);
			DBConnection db = new DBConnection();
			db.OpenDB();
			Connection conn = db.getConn();
			PreparedStatement ps=null;
			try {
				if(confirm){
					OrderBean ob = getOrderDetail(userId);
					updateGroupTotal(userId, ob.getOrderPrice()+"", ob.getAddRice()+"", 2);
				}
				ps=conn.prepareStatement("delete from mealorder where userId=? and orderDate=? and orderTime=?");
				ps.setString(1, userId);
				ps.setString(2, Common.getDate());
				ps.setInt(3, Common.getWhichMeal());
				ps.execute();
				ps.close();
				return "cancel";
			} catch (SQLException e) {
				e.printStackTrace();
				db.CloseDB();
				return "error";
			}finally{
				db.CloseDB();
			}
		}
		return "cancel";
	}
	/**
	 * 3	是否存在订单
	 * @param userId
	 * @return boolean
	 */
	public boolean isHasMealOrder(String userId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select userId from mealorder where userId=? and orderDate=? and orderTime=?");
			ps.setString(1, userId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			if(rs.next()){
				ps.close();
				rs.close();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return false;
		}finally{
			db.CloseDB();
		}
		return false;
	}
//	/**
//	 * 10 返回订餐详情
//	 * @param userId
//	 * @return OrderBean
//	 */
//	public OrderBean getMealOrder(String userId){
//		OrderBean ob = new OrderBean();
//		DBConnection db = new DBConnection();
//		db.OpenDB();
//		Connection conn = db.getConn();
//		PreparedStatement ps=null;
//		ResultSet rs=null;
//		try {
//			ps=conn.prepareStatement("select * from mealorder where userId=? and orderDate=? and orderTime=?");
//			ps.setString(1, userId);
//			ps.setString(2, Common.getDate());
//			ps.setInt(3, Common.getWhichMeal());
//			rs=ps.executeQuery();
//			if(rs.next()){
//				ob.setOrderId(rs.getString("orderId"));
//				ob.setOrderPrice(rs.getInt("orderPrice"));
//				ob.setOrderDate(rs.getString("orderDate"));
//				ob.setOrderTime(rs.getInt("orderTime"));
//				ob.setAddRice(rs.getInt("addRice"));
//				ob.setConfirm(rs.getInt("confirm"));
//			}
//			ps.close();
//			rs.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//			db.CloseDB();
//			return null;
//		}finally{
//			db.CloseDB();
//		}
//		return ob;
//	}
	/**
	 * 4	确认订单
	 * @param userId
	 * @return String
	 */
	public String confirm(String userId){
		boolean bl = isHasMealOrder(userId);
		if(!bl) return "noOrder";
		bl = isConfirm(userId);
		if(bl) return "confirm";
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		try {
			ps=conn.prepareStatement("update mealorder set confirm=? where userId=? and orderDate=? and orderTime=?");
			ps.setInt(1, 1);
			ps.setString(2, userId);
			ps.setString(3, Common.getDate());
			ps.setInt(4, Common.getWhichMeal());
			ps.executeUpdate();
			ps.close();
			OrderBean ob = getOrderDetail(userId);
			updateGroupTotal(userId, ob.getOrderPrice()+"", ob.getAddRice()+"", 1);//更新mealorder_total表
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "confirm";
	}
	/**
	 * 5	取消确认
	 * @param userId
	 * @return String
	 */
	public String confirmCancel(String userId){
		boolean bl = isHasMealOrder(userId);
		if(!bl) return "noOrder";
		bl = isConfirm(userId);
		if(!bl) return "cancel";
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		try {
			ps=conn.prepareStatement("update mealorder set confirm=? where userId=? and orderDate=? and orderTime=?");
			ps.setInt(1, 0);
			ps.setString(2, userId);
			ps.setString(3, Common.getDate());
			ps.setInt(4, Common.getWhichMeal());
			ps.executeUpdate();
			ps.close();
			OrderBean ob = getOrderDetail(userId);
			updateGroupTotal(userId, ob.getOrderPrice()+"", ob.getAddRice()+"", 2);
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "cancel";
	}
	/**
	 * 9	是否确认
	 * @param userId
	 * @return boolean
	 */
	public boolean isConfirm(String userId){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select confirm from mealorder where userId=? and orderDate=? and orderTime=?");
			ps.setString(1, userId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			if(rs.next()){
				int confirm = rs.getInt("confirm");
				return confirm==1?true:false;
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return false;
		}finally{
			db.CloseDB();
		}
		return false;
	}
	/**
	 * 6	更新groupTotal表
	 * @param userId
	 * @param price
	 * @param addRice
	 * @param flag
	 * @return String
	 */
	public String updateGroupTotal(String userId,String price,String addRice,int flag){//flag=1代表确认订单,2代表取消订单
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select groupId from user where userId=?");
			ps.setString(1, userId);
			rs=ps.executeQuery();
			String groupId=null;
			if(rs.next()) groupId = rs.getString("groupId");
			if(groupId==null) return "sqlerror";
			
			ps =conn.prepareStatement("select totalId,price_8,price_10,price_12,addRiceNum,num,total from mealorder_total where groupId=? and orderDate=? and orderTime=?");
			ps.setString(1, groupId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			String field;int pricex=0;
			int price_int = Integer.parseInt(price);//price_int第一次提交有效，第二次提交无效
			if(price_int==8){
				field = "price_8";
			}else if(price_int==10){
				field = "price_10";
			}else{
				field = "price_12";
			}
			if(rs.next()){				//更新
				String totalId = rs.getString("totalId");
				int num = rs.getInt("num");
				int total = rs.getInt("total");
				int addRiceNum = rs.getInt("addRiceNum");
				System.out.println(num);
				System.out.println(total);
				System.out.println(addRiceNum);
				if(flag==2){
					ps =conn.prepareStatement("select orderPrice from mealorder where userId=? and orderDate=? and orderTime=?");
					ps.setString(1, userId);
					ps.setString(2, Common.getDate());
					ps.setInt(3, Common.getWhichMeal());
					ResultSet rs2=ps.executeQuery();
					rs2.next();
					price_int = rs2.getInt("orderPrice");
					field = "price_"+price_int;
					rs2.close();
				}
				num = num+(flag==1?1:-1);
				total = total+(flag==1?price_int:-price_int);
				pricex = rs.getInt(field)+(flag==1?1:-1);
				addRiceNum = addRiceNum+(flag==1?Integer.parseInt(addRice):-Integer.parseInt(addRice));
				ps =conn.prepareStatement("update mealorder_total set "+field+"=? , total=? , addRiceNum=? , num=? where totalId=?");
				ps.setInt(1, pricex);
				ps.setInt(2, total);
				ps.setInt(3, addRiceNum);
				ps.setInt(4, num);
				ps.setString(5, totalId);
				ps.executeUpdate();
			}else{						//插入数据
				
				ps =conn.prepareStatement("insert into mealorder_total(totalId,groupId,orderDate,orderTime,"+field+",addRiceNum,num,total) values (?,?,?,?,?,?,?,?)");
				ps.setString(1, Common.getId());
				ps.setString(2, groupId);
				ps.setString(3, Common.getDate());
				ps.setInt(4, Common.getWhichMeal());
				ps.setInt(5, 1);
				ps.setInt(6, Integer.parseInt(addRice));
				ps.setInt(7, 1);
				ps.setInt(8, price_int);
				ps.execute();
			}
			ps.close();
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return "error";
		}finally{
			db.CloseDB();
		}
		return "success";
	}
	/**
	 * 7	返回组员信息
	 * @param userId
	 * @return ArrayList<UserBean>
	 */
	public ArrayList<OrderBean> getMember(String userId){
		ArrayList<OrderBean> list = new ArrayList<OrderBean>();
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select u2.userId,u2.userName,addRice,orderPrice,confirm from user as u1,user as u2,mealorder where u1.userId=?"+
					" and u1.groupId=u2.groupId and u2.userId=mealorder.userId and orderDate=? and orderTime=?");
			ps.setString(1, userId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			while(rs.next()){
				OrderBean ob = new OrderBean();
				ob.setUserId(rs.getString("userId"));
				ob.setUserName(rs.getString("userName"));
				ob.setOrderPrice(rs.getInt("orderPrice"));
				ob.setAddRice(rs.getInt("addRice"));
				ob.setConfirm(rs.getInt("confirm"));
				list.add(ob);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return null;
		}finally{
			db.CloseDB();
		}
		return list;
	}
	/**
	 * 8	返回订单详情
	 * @param userId
	 * @return
	 */
	public OrderBean getOrderDetail(String userId){
		OrderBean ob = new OrderBean();
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select * from mealorder where userId=? and orderDate=? and orderTime=?");
			ps.setString(1, userId);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			if(rs.next()){
				ob.setOrderId(rs.getString("orderId"));
				ob.setUserId(rs.getString("userId"));
				ob.setOrderDate(rs.getString("orderDate"));
				ob.setOrderTime(rs.getInt("orderTime"));
				ob.setOrderPrice(rs.getInt("orderPrice"));
				ob.setAddRice(rs.getInt("addRice"));
				ob.setConfirm(rs.getInt("confirm"));
				ps.close();
				rs.close();
				return ob;
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return null;
		}finally{
			db.CloseDB();
		}
		return null;
	}
	public ArrayList<OrderTotalBean> getOrderTotalDetail(int whichDay){//昨天-1；今天0；明天1；
		ArrayList<OrderTotalBean> list = new ArrayList<OrderTotalBean>();
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement("select mealorder_total.groupId,userName as groupLeaderName,price_8,price_10,price_12,orderTime,addRiceNum,num,total"+
					" from mealorder_total,user where user.groupId =mealorder_total.groupId and user.roleId=? and orderDate=? and orderTime=?");
			ps.setInt(1, 2);
			ps.setString(2, Common.getDate());
			ps.setInt(3, Common.getWhichMeal());
			rs=ps.executeQuery();
			while(rs.next()){
				OrderTotalBean otb = new OrderTotalBean();
				otb.setGroupId(rs.getString("groupId"));
				otb.setGroupLeaderName(rs.getString("groupLeaderName"));
				otb.setPrice_8(rs.getInt("price_8"));
				otb.setPrice_10(rs.getInt("price_10"));
				otb.setPrice_12(rs.getInt("price_12"));
				otb.setOrderTime(rs.getInt("orderTime"));
				otb.setAddRiceNum(rs.getInt("addRiceNum"));
				otb.setNum(rs.getInt("num"));
				otb.setTotal(rs.getInt("total"));
				list.add(otb);	
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			db.CloseDB();
			return null;
		}finally{
			db.CloseDB();
		}
		return list;
	}
}

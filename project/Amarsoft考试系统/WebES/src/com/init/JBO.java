package com.init;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.common.Common;
import com.common.DBConnection;
import com.common.Message;
import com.common.ILog;

public class JBO<T> {
	private Class<?> cls;
	private boolean hasInit = false;
	private String tableName;
	private JBOFactory tf = null;
	private String prikey;
	private static HashMap<String,JBO<?>> action = new HashMap<String,JBO<?>>();
	public void init(){
		if(hasInit) 
			return;
		this.cls = getGenericType(0);
		this.tf = JBOFactory.getFactory(cls);
		this.tableName = cls.getSimpleName().toLowerCase().replace("bean", "");
		try {
			this.prikey = ((String[])tf.getValue(tf.newInstance(), "prikey"))[0];
		} catch (InstantiationException | IllegalAccessException e) {
			ILog.error(e,"");
		}
		action.put(tableName, this);
		this.hasInit = true;
	}
	@SuppressWarnings("unchecked")
	public T initBean(HashMap<String,String> hash){
		Iterator<String> it = hash.keySet().iterator();
		T o = null;
		try {
			o = (T) tf.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			ILog.error(e,"");
		}
		while(it.hasNext()){
			String key = it.next().toString();
			String value = "";
			value = hash.get(key);
			if(key.toLowerCase().equals("id"))
				key = this.prikey.toLowerCase();
			tf.setValue(o, key.toLowerCase(), value);
		}
		return o;
	}
	public Message doAction(String type,HashMap<String,String> hash){
		T o = initBean(hash);
		Message msg = new Message();
		if(Common.isBlank(type)){
//			hash.containsKey("id")&&!Common.isBlank(hash.get("id"))
			if(hash.containsKey("id")&&!Common.isBlank(hash.get("id"))){
				if(hash.size() == 1)
					msg = this.delete(o);
				else
					msg = this.update(o);
			}
			else
				msg = this.insert(o);
		}
		else if(type.equals("0"))
			msg = this.insert(o);
		else if(type.equals("1"))
			msg = this.delete(o);
		else if(type.equals("2"))
			msg = this.update(o);
		return msg;
	}
	public String querySingleData(String sql){
		Connection conn = DBConnection.getConnection();
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		String id = null;
		try {
			if(rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			ILog.error(e,"");
		}
		return id;
	}
	public ArrayList<T> query(String sql){
		if(!sql.toLowerCase().contains("from")){
			String sfrom = "select * from "+ this.tableName + " ";
			sql = sfrom + sql;
		}
		ArrayList<T> list = new ArrayList<T>();
		Connection conn = DBConnection.getConnection();
		ResultSet rs = DBConnection.executeQuery(conn, sql);
		try {
			ResultSetMetaData meta = rs.getMetaData();
			int count = meta.getColumnCount();
			while (rs.next()) {
				@SuppressWarnings("unchecked")
				T o = (T) tf.newInstance();
				for (int i = 1; i <= count; i++) {
					String columnName = meta.getColumnLabel(i);		//取的是别名
					String type = meta.getColumnTypeName(i);
					Object value = Common.getValue4Mysql(rs, type, columnName);
					tf.setValue(o, columnName, value);
				}
				list.add(o);
			}
//			conn.close();
		} catch (Exception e) {
			ILog.error(e,"");
		}
		return list;
	}
	
	public Message delete(T o){
		String[] prikey = (String[])tf.getValue(o, "prikey");
		String sWhere = " where";
		for(int i=0;i<prikey.length;i++){
			Object value = tf.getValue(o, prikey[i]);
			if (Common.isBlank(value)){
				return new Message(false);
			}
			sWhere += " "+prikey[i] +"="+ getSqlValue(value) + " and";
		}
		sWhere = sWhere.replaceAll("and$", "");
		String sql = "delete from "+ this.tableName+sWhere;
		return new Message(DBConnection.executeSQL(sql));
	}
	
	public Message update(T o){
		HashMap<String, Method> getmethod = tf.getGetMethods();
		Set<String> column = new HashSet<String>(getmethod.keySet());
		String[] prikey = (String[])tf.getValue(o, "prikey");
		//在keyset方法返回的set上直接做修改会改变原来hashmap
		column.remove("prikey");
		String sWhere = " where";
		for(int i=0;i<prikey.length;i++){
			Object value = tf.getValue(o, prikey[i]);
			sWhere += " "+prikey[i] +"="+ getSqlValue(value) + " and";
			column.remove(prikey[i].toLowerCase());
		}
		sWhere = sWhere.replaceAll("and$", "");
		String sql = "update "+ this.tableName+" set ";
		for(String key:column){
			Object value = tf.getValue(o, key);
			if(value!=null){
				sql+=key + "="+getSqlValue(value)+",";
			}
		}
		sql = sql.replaceAll(",$", "");
		sql = sql + sWhere;
		return new Message(DBConnection.executeSQL(sql));
	}
	public Message insert(T o){
		Message message = new Message();
		JBOFactory tf =JBOFactory.getFactory(cls);
		String[] prikey = (String[])tf.getValue(o, "prikey");
		String tableName = this.tableName;
		
		for(int i=0;i<prikey.length;i++){
//			Object value = tf.getValue(o, prikey[i]);
//			if(Common.isBlank(value)){
				String keyValue = Common.getSerialNo(tableName,prikey[i]);
				tf.setValue(o, prikey[i],keyValue);
				message.put("id", keyValue);
//			}
		}
		HashMap<String, Method> setmethod = tf.getSetMethods();
		Set<String> column = setmethod.keySet();
		String sqlPerfix = "insert into "+ tableName+"(";
		String sqlSuffix = " values(";
		for(String key:column){
			Object value = tf.getValue(o, key);
			if(value!=null){
				sqlPerfix +=key+",";
				sqlSuffix +=""+getSqlValue(value)+",";
			}
		}
		sqlPerfix = sqlPerfix.replaceAll(",$", ")");
		sqlSuffix = sqlSuffix.replaceAll(",$", ")");
		message.setStatus(DBConnection.executeSQL(sqlPerfix+sqlSuffix));
		return message;
	}
	
	public Class<?> getGenericType(int index) {
		Type genType = getClass().getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			throw new RuntimeException("Index outof bounds");
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class<?>) params[index];
	}

	public static Object getSqlValue(Object value){
		String type = value.getClass().getSimpleName();
		switch(type){
			case "String": value = "'"+value+"'"; break;
			case "Integer":break;
		}
		return value;
	}
	public static JBO<?> getAction(String name){
		return action.get(name);
	}
	public static void main(String[] args) throws Exception{
		System.out.println();
	}
}

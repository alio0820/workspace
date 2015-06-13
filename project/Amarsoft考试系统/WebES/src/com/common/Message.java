package com.common;

import java.util.HashMap;
import java.util.Set;

/**
 * 消息类，处理各种消息
 * @author louis
 * @time 2015-04-07 08:42:25
 */
public class Message {
	private boolean status;
	private String message = "";
	private HashMap<String,String> params = new HashMap<String, String>();
	
	public Message(){}
	public Message(boolean status){
		this.status = status;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public HashMap<String, String> getParams() {
		return params;
	}
	public void setParams(HashMap<String, String> params) {
		this.params = params;
	}
	public String toString(){
		String param = "{status:"+status+",message:'"+message+"',params:{";
		String keyValue = "";
		Set<String> keys = params.keySet();
		for(String key :keys){
			keyValue +="'"+key+"':'"+params.get(key)+"',";
		}
		param += keyValue.replaceAll(",$", "")+"}}";
		return param;
	}
	public HashMap<String,String> put(String key,String value){
		this.params.put(key, value);
		return this.params;
	}

	public static void main(String[] args){
		Message message = new Message();
		message.put("abc", "=456");
		System.out.println(message.toString());
	}
}

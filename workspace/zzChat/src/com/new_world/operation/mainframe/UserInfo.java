package com.new_world.operation.mainframe;
/**�û���ϢBean
 * 
 */
public class UserInfo {
	private int userId;				//ID
	private String nickName;		//�ǳ�
	private String headPortrait;	//ͷ��
	private String singature;		//����ǩ��
	private int status;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHeadPortrait() {
		return headPortrait;
	}
	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}
	public String getSingature() {
		return singature;
	}
	public void setSingature(String singature) {
		this.singature = singature;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}

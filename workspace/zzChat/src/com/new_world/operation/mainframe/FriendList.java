package com.new_world.operation.mainframe;
/**好友列表
 * 
 */
public class FriendList {
	private int friendId;					//好友的ID
	private String friendNoteName;			//备注名称
	private String groupingName;			//分组
	private String headPortrait;			//头像
	private String singature;				//个性签名
	private int status;						//状态
	private String realName;				//姓名
	private String birthday;				//生日
	private String mailbox;					//邮箱
	private String mobinum;					//电话
	
	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	public String getFriendNoteName() {
		return friendNoteName;
	}
	public void setFriendNoteName(String friendNoteName) {
		this.friendNoteName = friendNoteName;
	}
	public String getGroupingName() {
		return groupingName;
	}
	public void setGroupingName(String groupingName) {
		this.groupingName = groupingName;
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
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	public String getMobinum() {
		return mobinum;
	}
	public void setMobinum(String mobinum) {
		this.mobinum = mobinum;
	}
	
}

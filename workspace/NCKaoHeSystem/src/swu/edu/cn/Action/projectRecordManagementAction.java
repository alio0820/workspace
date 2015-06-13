package swu.edu.cn.Action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import swu.edu.cn.sql.ProjectManagement;

public class projectRecordManagementAction {
	private String  projectId;			//��ĿID
	private double rate;				//����
	private	String isMoney;				//�Ƿ����ʽ��ʾ
	private String rate_string;			//��ȡ���Ľ���String��
	private String actualFinish;		//��������
	private int taskMonth;				//�����·�
	private ProjectManagement prm=new ProjectManagement();
	private String departmentId;			
	private String yijian;
	private String tongguo;
		
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public String getActualFinish() {
		return actualFinish;
	}
	public void setActualFinish(String actualFinish) {
		this.actualFinish = actualFinish;
	}
	public int getTaskMonth() {
		return taskMonth;
	}
	public void setTaskMonth(int taskMonth) {
		this.taskMonth = taskMonth;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getYijian() {
		return yijian;
	}
	public void setYijian(String yijian) {
		this.yijian = yijian;
	}
	public String getTongguo() {
		return tongguo;
	}
	public void setTongguo(String tongguo) {
		this.tongguo = tongguo;
	}
	public String getRate_string() {
		return rate_string;
	}
	public void setRate_string(String rate_string) {
		this.rate_string = rate_string;
	}
	
	
	//��Ŀ�걨
	public String shenbao() throws UnsupportedEncodingException{
		actualFinish =new String(actualFinish.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		double money = Double.parseDouble(rate_string);
		rate = Double.parseDouble(rate_string)/100;
		boolean succ = prm.ReportProjectRecord(projectId, taskMonth, isMoney,rate, money, actualFinish);

		prm.CloseDB();
		if(succ==true)
			return "shenbao";
		return "input";
	}
	public String shenbao_feixm() throws UnsupportedEncodingException{
		actualFinish =new String(actualFinish.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean succ = prm.ReportNoProjectRecord(departmentId,projectId,taskMonth,actualFinish);
		prm.CloseDB();
		if(succ==true)
			return "shenbao";
		return "input";
	}
	//������ȡ�����걨����Ŀ
	public String shenbao_yue(){
		return "shenbao";
	}
	
	//ǣͷ���ŵ����---��Ŀָ��
	public String shenheQiantou() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.LeadDepartmentShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQiantou";
		return "input";
	}
	
	//ǣͷ���ŵ����---�Է���Ŀָ��
	public String shenheQiantou_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.LeadDepartmentShen(projectId,departmentId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQiantou";
		return "input";
	}
	//���ֹ��쵼�����
	public String qufenguan() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouLeaderShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "qufenguan";
		return "input";
	}
	//���ֹ��쵼�����----����Ŀָ��
	public String qufenguan_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouLeaderNoProjectShen(projectId,departmentId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "qufenguan";
		return "input";
	}
	//�������---��Ŀ
	public String duchashenhe() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		boolean succ = prm.DuchaShen(projectId, taskMonth, isMoney, yijian, tonguoBoolean);
		prm.CloseDB();
		if(succ==false)
			return "duchashenhe";
		return "input";
	}
	//�������---����Ŀ
	public String duchashenhe_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.DuchaNoProjectShen(projectId, departmentId, taskMonth, yijian, tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "duchashenhe";
		return "input";
	}
}

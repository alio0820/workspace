package swu.edu.cn.bean;
/**
 *����	������
 *����	2012-05-09
 *����	��bean������Ŀ����bean����ĳ�����ڿ����ڣ����ò���û�ге��κ���Ŀ
 *��bean������NoProjectEvaluation���EvaluationForm��
 *
 */

public class NoProjectEvaluationBean {
	
	private String evaluationId;			//��������
	private String evaluationContent;		//�������ͣ��ص���Ŀ��
	
	private String leadDepartmentId;		//ǣͷ���ű��
	private String leadDepartmentName;		//ǣͷ��������
	
	private String evaDepartmentId;			//�����˲��ű��
	private String evaDepartmentName;		//�����˲���
		
	
	private int evaMonth;					//�����·�
	private String monthFinish;				//����ɣ��¼�������
	private String submitTime;				//�ύʱ��
	
	private String status;					//���״̬
	
	private	String firstView;				//һ�������ǣͷ���ţ�
	private String secondView;				//������������ֹ��쵼��
	private String thirdView;				//��������������ң�
	
	
	public String getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(String evaluationId) {
		this.evaluationId = evaluationId;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getLeadDepartmentId() {
		return leadDepartmentId;
	}
	public void setLeadDepartmentId(String leadDepartmentId) {
		this.leadDepartmentId = leadDepartmentId;
	}
	public String getLeadDepartmentName() {
		return leadDepartmentName;
	}
	public void setLeadDepartmentName(String leadDepartmentName) {
		this.leadDepartmentName = leadDepartmentName;
	}
	public String getEvaDepartmentId() {
		return evaDepartmentId;
	}
	public void setEvaDepartmentId(String evaDepartmentId) {
		this.evaDepartmentId = evaDepartmentId;
	}
	public String getEvaDepartmentName() {
		return evaDepartmentName;
	}
	public void setEvaDepartmentName(String evaDepartmentName) {
		this.evaDepartmentName = evaDepartmentName;
	}
	public int getEvaMonth() {
		return evaMonth;
	}
	public void setEvaMonth(int evaMonth) {
		this.evaMonth = evaMonth;
	}
	public String getMonthFinish() {
		return monthFinish;
	}
	public void setMonthFinish(String monthFinish) {
		this.monthFinish = monthFinish;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFirstView() {
		return firstView;
	}
	public void setFirstView(String firstView) {
		this.firstView = firstView;
	}
	public String getSecondView() {
		return secondView;
	}
	public void setSecondView(String secondView) {
		this.secondView = secondView;
	}
	public String getThirdView() {
		return thirdView;
	}
	public void setThirdView(String thirdView) {
		this.thirdView = thirdView;
	}
	
	
	
	

}

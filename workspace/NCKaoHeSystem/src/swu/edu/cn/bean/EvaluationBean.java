package swu.edu.cn.bean;

/**
 * 
 * ����	 ������
 * ����	2012-05-08
 * ����	��beanΪ�����������bean
 */
public class EvaluationBean {
	
	private String evaluationId;
	private String evaluationContent;		//��������
	private String leadDepartmentId;		//ǣͷ���ű��
	private String leadDepartmentName;		//ǣͷ��������
	
	private String evaluationStandard;		//���˱�׼
	private String separateLeader;			//��ǣͷ���ŵķֹ��쵼
	
	private String isMoney;					//�Ƿ��漰�ʽ�
	private float totalMoney;				//�漰���ʽ�
	private String currentFinish;			//��ǰ��ɣ�����漰�ʽ����ʽ����������ʽ���ǣͷ������д
	
	
	
	
	public String getSeparateLeader() {
		return separateLeader;
	}
	public void setSeparateLeader(String separateLeader) {
		this.separateLeader = separateLeader;
	}
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
	public String getEvaluationStandard() {
		return evaluationStandard;
	}
	public void setEvaluationStandard(String evaluationStandard) {
		this.evaluationStandard = evaluationStandard;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public float getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getCurrentFinish() {
		return currentFinish;
	}
	public void setCurrentFinish(String currentFinish) {
		this.currentFinish = currentFinish;
	}
	
	
	
	
	
	
	
	

}

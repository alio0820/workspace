//Source file: c:\\PD\\RenderAccount.java

package PD;

public class RenderAccount 
{
   private String Apply_ID;//�����id
   private String reason;//��������
   private Double receiptAccount;//���ѽ��
   private Double amount;//������
   private Double balance;//���
   private String bztime;//ʱ��
   private String protime;//��Ŀ��ɻ㱨ʱ��
   private String isManApproval;//������Ƿ���׼
   private String isFinCheck;//�������Ƿ��ʵ
   private String isManCheck;//������ʵ�Ƿ�ͨ��
   
   public String getProtime()
{
	return protime;
}

public void setProtime(String protime)
{
	this.protime = protime;
}

public String getIsManApproval()
{
	return isManApproval;
}

public void setIsManApproval(String isManApproval)
{
	this.isManApproval = isManApproval;
}

public String getApply_ID()
{
	return Apply_ID;
}

public void setApply_ID(String apply_ID)
{
	Apply_ID = apply_ID;
}

public String getReason()
{
	return reason;
}

public void setReason(String reason)
{
	this.reason = reason;
}

public Double getReceiptAccount()
{
	return receiptAccount;
}

public void setReceiptAccount(Double receiptAccount)
{
	this.receiptAccount = receiptAccount;
}

public Double getAmount()
{
	return amount;
}

public void setAmount(Double amount)
{
	this.amount = amount;
}

public Double getBalance()
{
	return balance;
}

public void setBalance(Double balance)
{
	this.balance = balance;
}

public String getBztime()
{
	return bztime;
}

public void setBztime(String bztime)
{
	this.bztime = bztime;
}

public String getIsFinCheck()
{
	return isFinCheck;
}

public void setIsFinCheck(String isFinCheck)
{
	this.isFinCheck = isFinCheck;
}

public String getIsManCheck()
{
	return isManCheck;
}

public void setIsManCheck(String isManCheck)
{
	this.isManCheck = isManCheck;
}

/**
    * @roseuid 4FE1D46B0089
    */
   public RenderAccount() 
   {
    
   }
   
   /**
    * @param Apply_ID
    * @param receiptAccount
    * @param amount
    * @param balance
    * @param time
    * @param isManCheck
    * @roseuid 4FE07387027A
    */
   public void create(Long Apply_ID, Double receiptAccount, Double amount, Double balance, Boolean time, Boolean isManCheck) 
   {
    
   }
   
   /**
    * @return java.lang.Double
    * @roseuid 4FEC052C0039
    */
   public Double calcSubReceipt() 
   {
    return null;
   }//�����վ�
   
   /**
    * @return java.lang.Double
    * @roseuid 4FE0758703B8
    */
   public Double caclTotal() 
   {
    return null;
   }//���㻨��+����Ƿ����������
}

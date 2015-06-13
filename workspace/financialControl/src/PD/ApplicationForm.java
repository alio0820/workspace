//Source file: c:\\PD\\ApplicationForm.java

package PD;

import java.util.Date;

public class ApplicationForm 
{
   private String Apply_ID; //申请表id
   private String applicant;//申请人姓名
   private String Staff_ID;//申请人id
   private String appTime;//申请时间
   private String bztime;//报账时间
   private String reason;//申请理由
   private Double amount;//申请金额
   private Double receiptAccount;//花费金额
   private Double income; //收入
   private String protime;//项目完成汇报时间
   private String shroffAccountNumber;//银行卡号
   private String isFinApproval;//财政部是否批准
   private String isManApproval;//管理层是否批准
   
public Double getIncome()
{
	return income;
}

public void setIncome(Double income)
{
	this.income = income;
}

public String getProtime()
{
	return protime;
}

public void setProtime(String protime)
{
	this.protime = protime;
}

public String getBztime()
{
	return bztime;
}

public void setBztime(String bztime)
{
	this.bztime = bztime;
}

public Double getReceiptAccount()
{
	return receiptAccount;
}

public void setReceiptAccount(Double receiptAccount)
{
	this.receiptAccount = receiptAccount;
}

public String getApply_ID()
{
	return Apply_ID;
}

public void setApply_ID(String apply_ID)
{
	Apply_ID = apply_ID;
}

public String getApplicant()
{
	return applicant;
}

public void setApplicant(String applicant)
{
	this.applicant = applicant;
}

public String getStaff_ID()
{
	return Staff_ID;
}

public void setStaff_ID(String staff_ID)
{
	Staff_ID = staff_ID;
}

public String getAppTime()
{
	return appTime;
}

public void setAppTime(String appTime)
{
	this.appTime = appTime;
}

public String getReason()
{
	return reason;
}

public void setReason(String reason)
{
	this.reason = reason;
}

public Double getAmount()
{
	return amount;
}

public void setAmount(Double amount)
{
	this.amount = amount;
}

public String getShroffAccountNumber()
{
	return shroffAccountNumber;
}

public void setShroffAccountNumber(String shroffAccountNumber)
{
	this.shroffAccountNumber = shroffAccountNumber;
}

public String getIsFinApproval()
{
	return isFinApproval;
}

public void setIsFinApproval(String isFinApproval)
{
	this.isFinApproval = isFinApproval;
}

public String getIsManApproval()
{
	return isManApproval;
}

public void setIsManApproval(String isManApproval)
{
	this.isManApproval = isManApproval;
}

/**
    * @roseuid 4FE1D467031A
    */
   public ApplicationForm()
   {
    
   }
   
   /**
    * @param Apply_ID
    * @param name
    * @param Staff_ID
    * @param appTime
    * @param reason
    * @param amount
    * @param shroffAccountNumber
    * @param isFinApproval
    * @param isManApproval
    * @roseuid 4FE0665900B5
    */
   public void create(Long Apply_ID, String name, Long Staff_ID, Date appTime, String reason, Double amount, String shroffAccountNumber, Boolean isFinApproval, Boolean isManApproval) 
   {
    
   }//创建申请表
}

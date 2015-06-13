//Source file: c:\\PD\\RenderAccount.java

package PD;

public class RenderAccount 
{
   private String Apply_ID;//申请表id
   private String reason;//申请理由
   private Double receiptAccount;//花费金额
   private Double amount;//申请金额
   private Double balance;//余额
   private String bztime;//时间
   private String protime;//项目完成汇报时间
   private String isManApproval;//管理层是否批准
   private String isFinCheck;//财政部是否核实
   private String isManCheck;//管理层核实是否通过
   
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
   }//计算收据
   
   /**
    * @return java.lang.Double
    * @roseuid 4FE0758703B8
    */
   public Double caclTotal() 
   {
    return null;
   }//计算花费+余额是否等于申请金额
}

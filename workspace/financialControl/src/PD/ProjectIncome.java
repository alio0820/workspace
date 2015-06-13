//Source file: c:\\PD\\ProjectIncome.java

package PD;

public class ProjectIncome 
{
   private String Apply_ID;//相对应的申请表id
   private String reason;//申请理由
   private String time;//提交时间
   private String protime;//项目完成汇报时间
   private String isManApproval;//管理层批准情况
   private Double amount;//申请的金额
   private Double Income;//收入
   private String bztime;//报账时间
   private String isFinProjectCheck;//财政部是否核实
   private String isManProjectCheck;//管理层是否核实 
   
public String getBztime()
{
	return bztime;
}

public void setBztime(String bztime)
{
	this.bztime = bztime;
}

public String getIsManApproval()
{
	return isManApproval;
}

public void setIsManApproval(String isManApproval)
{
	this.isManApproval = isManApproval;
}

public String getProtime()
{
	return protime;
}

public void setProtime(String protime)
{
	this.protime = protime;
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

public String getTime()
{
	return time;
}

public void setTime(String time)
{
	this.time = time;
}

public Double getAmount()
{
	return amount;
}

public void setAmount(Double amount)
{
	this.amount = amount;
}

public Double getIncome()
{
	return Income;
}

public void setIncome(Double income)
{
	Income = income;
}

public String getIsFinProjectCheck()
{
	return isFinProjectCheck;
}

public void setIsFinProjectCheck(String isFinProjectCheck)
{
	this.isFinProjectCheck = isFinProjectCheck;
}

public String getIsManProjectCheck()
{
	return isManProjectCheck;
}

public void setIsManProjectCheck(String isManProjectCheck)
{
	this.isManProjectCheck = isManProjectCheck;
}

/**
    * @roseuid 4FE1D46302BB
    */
   public ProjectIncome() 
   {
    
   }
   
   /**
    * @roseuid 4FE083A701FF
    */
   public void create() 
   {
    
   }
}

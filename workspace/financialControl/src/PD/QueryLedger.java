//Source file: c:\\PD\\QueryLedger.java

package PD;

import cn.edu.swu.sql.DBConnection;


public class QueryLedger extends  DBConnection 
{
   private Double totalSalary;//该员工总工资
   private String name;//员工id
   private Double basicWage;//基础工资
   private Double welfareCost;//福利费
   private Double premium;//保险费
   private Double annualBonus;//年度奖金
   private Double perIncomeTax;//个人所得税税率
   
   /**
    * @roseuid 4FE1D4620196
    */
   public QueryLedger() 
   {  
   }
   
   /**
    * @param salary
    * @return Double
    * @roseuid 4FDE08C00347
    */
   public Double calcTotal(Double salary) 
   {
    return null;
   }//计算最后工资

public Double getTotalSalary()
{
	return totalSalary;
}

public void setTotalSalary(Double totalSalary)
{
	this.totalSalary = totalSalary;
}

public String getName()
{
	return name;
}

public void setName(String name)
{
	this.name = name;
}

public Double getBasicWage()
{
	return basicWage;
}

public void setBasicWage(Double basicWage)
{
	this.basicWage = basicWage;
}

public Double getWelfareCost()
{
	return welfareCost;
}

public void setWelfareCost(Double welfareCost)
{
	this.welfareCost = welfareCost;
}

public Double getPremium()
{
	return premium;
}

public void setPremium(Double premium)
{
	this.premium = premium;
}

public Double getAnnualBonus()
{
	return annualBonus;
}

public void setAnnualBonus(Double annualBonus)
{
	this.annualBonus = annualBonus;
}

public Double getPerIncomeTax()
{
	return perIncomeTax;
}

public void setPerIncomeTax(Double perIncomeTax)
{
	this.perIncomeTax = perIncomeTax;
}
   
}

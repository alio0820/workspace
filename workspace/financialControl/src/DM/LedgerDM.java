//Source file: c:\\DM\\LedgerDM.java

package DM;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import cn.edu.swu.sql.DBConnection;
import PD.QueryLedger;

public class LedgerDM extends  DBConnection //员工工资
{
   private QueryLedger ledger;
   
   /**
    * @roseuid 4FE1D6260116
    */
   public LedgerDM()
   {
   }
   
   /**
    * @param ID
    * @return list
    * @roseuid 4FE021E5014F
    */
   public ArrayList<QueryLedger> searchLedger(String name)
   {
	   ArrayList<QueryLedger> list = new ArrayList();			
		System.out.println(name);
		this.OpenDB();
		String selectSQL="select  name,basicWage,premium,welfareCost from salary where name='"+name+"'";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				QueryLedger ql=new QueryLedger();
				
				ql.setName(rs.getString("name"));
				ql.setBasicWage(rs.getDouble("basicWage"));
				ql.setPremium(rs.getDouble("premium"));
				ql.setWelfareCost(rs.getDouble("welfareCost"));	
				ql.setTotalSalary(rs.getDouble("basicWage")+rs.getDouble("premium")+rs.getDouble("welfareCost"));
				list.add(ql);
				}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//查找
}

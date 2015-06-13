package com.git.datatype;


import java.sql.ResultSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.lang.StringBuffer;

import com.git.datatype.MyDAO;
import com.git.datatype.DataTypeModel;


public class SeMetoDAO {

	private Collection list;

	/**
	 * 初始化DataType的集合
	 * 
	 * @param session
	 */
	public void init(Map session) {
		ResultSet rs;
		MyDAO dao = new MyDAO();
		String sql="select * from DDdmDataType";
		rs = dao.query(sql);

		try {

			list = dao.populate(rs, Class
					.forName("com.git.datatype.DataTypeModel"));
			

		} catch (Exception e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		
		session.put("DataTypeDB", list);
		
//		System.out.println("SemetoDAO---init==打印ResultSet"+rs.toString());
	}

	/**
	 * 保存数据到Map
	 * 
	 * @param session
	 */
	public void saveData(Map session) {
		session.put("DataTypeDB", list);
	}

	/**
	 * 从Map里加载所有的DataType
	 * 
	 * @param session
	 */
	private void loadData(Map session) {
		list = (Collection) session.get("DataTypeDB");
		if (list == null)
			init(session);
	}

	/**
	 * 
	 * @param session
	 * @return
	 */
	public Collection getAllDataTypes(Map session) {
		loadData(session);
		return list;
	}

	/**
	 * 把数据类型保存到数据库并返回1or0
	 * 
	 * @param book
	 * @param session
	 * @return
	 */
	public int saveToDB(DataTypeModel dataType, Map session) {
		
		
		
		MyDAO dao = new MyDAO();
		String sql = "insert into DDdmDataType(";
		StringBuffer sb = new StringBuffer(sql);
		sb.append("DataTypeCode,ProgramUse,DatabaseUse,DTDescription,");
		sb.append("DTExpand,DTStatus,DTRemark,DTAbbreviation,");
		sb.append("DTV1,DTV2,DTV3)values('");
		sb.append(this.convertStyle(dataType.getDataTypecode()) + "','");
		sb.append(this.convertStyle(dataType.getProgramuse()) + "','");
		sb.append(this.convertStyle(dataType.getDatabaseuse()) + "','");
		sb.append(this.convertStyle(dataType.getDtdescription()) + "','");
		sb.append(this.convertStyle(dataType.getDtExpand()) + "','");
		sb.append(dataType.getDtstatus() + "','");
		sb.append(this.convertStyle(dataType.getDtremark()) + "','");		
		sb.append(this.convertStyle(dataType.getDtabbreviation()) + "','");
		sb.append(this.convertStyle(dataType.getDTV1()) + "','");
		sb.append(this.convertStyle(dataType.getDTV2()) + "','");
		sb.append(this.convertStyle(dataType.getDTV3()) + "')");
		
		System.out.println(sb.toString());
		System.out.println("insert:");
		System.out.println("dataType.getDtstatus().toString():"+dataType.getDtstatus().toString());
		int n = dao.update(sb.toString());
		System.out.println("n:"+n);
		if (n > 0) {
			this.init(session);
			
			return n;
		}
		
		return 0;
				
	}

	/**
	 * 修改数据到数据库
	 * 
	 * @param dataType
	 * @param session
	 * @return
	 */
	public int updateToDB(DataTypeModel dataType, Map session) {
		MyDAO dao = new MyDAO();
		
		String sql = "UPDATE DDdmDataType SET [DataTypeCode] =";
	
		StringBuffer sb=new StringBuffer(sql);
		sb.append("'"+dataType.getDataTypecode()+"',");
		sb.append("[ProgramUse]=");
		sb.append("'"+dataType.getProgramuse()+"',");
		sb.append("[DatabaseUse]=");
		sb.append( "'"+dataType.getDatabaseuse()+"',");
		sb.append("[DTDescription]=");
		sb.append("'"+dataType.getDtdescription()+"',");
		sb.append("[DTAbbreviation]=");
		sb.append("'"+dataType.getDtabbreviation()+"',");
		sb.append("[Dtstatus]=");
		sb.append("'"+dataType.getDtstatus()+"'");
		sb.append("where [DataTypeID]="+dataType.getDataTypeid());
		
		System.out.print("update:");
		System.out.print("dataType.getDtstatus().toString():"+dataType.getDtstatus().toString());
		
		int n=dao.update(sb.toString());
		if(n>0){
			this.init(session);
			return n;			
		}
		this.saveData(session);
		System.out.print(sb.toString());

		return 0;
	}

	/**
	 * 对象为NULL转化为空串
	 * 
	 * @param obj
	 * @return
	 */
	public String convertStyle(Object obj) {
		if (obj == null) {
			return "";
		} else {
			return obj.toString();

		}

	}

	/**
	 * 已知ID返回一个数据类型
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	public DataTypeModel loadDataTypeById(int id, Map session) {
		
		
		loadData(session);

        for (Iterator iter = list.iterator(); iter.hasNext();) {
        	DataTypeModel dt = (DataTypeModel) iter.next();
            if (dt.getDataTypeid() == id)
                return (DataTypeModel) dt;
        }
        return null;		
		 
	}
	/**
	 * 从DB查一条数据类型
	 *
	 */
	public void loadFromDBById(){
		//
		
		
		
	}
	/**
	 * 删除一条数据类型
	 * 
	 * @param id
	 * @param session
	 */
	public void deleteDataTypeById(int id, Map session) {
		
		
		MyDAO dao = new MyDAO();
		String sql = "delete from DDdmDataType where DataTypeID=" + id;
		boolean isDel = dao.delete(sql);

		if (isDel == true) {
			this.init(session);
			DataTypeList dtList=new DataTypeList();
			dtList.getDtLst();						
		}
		
		this.saveData(session);
		System.out.print(sql);
		
	}

	public static void main(String[] args) {
		// 测试查询
		// MyDAO dao = new MyDAO();
		// String sql = "select * from DDdmDataType";
		// ResultSet rs = dao.query(sql);
		//
		// try {
		// Collection a;
		// a = dao.populate(rs, Class
		// .forName("com.git.datatype.DataTypeModel"));
		// System.out.println("studentid=" + a);
		//
		// } catch (Exception e) {
		// // TODO 自动生成 catch 块
		// e.printStackTrace();
		// }

		// //测试新增
		// SeMetoDAO sm=new SeMetoDAO();
		// DataTypeModel datatype=new DataTypeModel();
		// datatype.setDatabaseuse("s");
		// datatype.setDataTypecode("v");
		// // datatype.setDtstatus('a');
		// // datatype.setDtabbreviation('v');
		// Map sesion=new TreeMap();
		// sm.saveToDB(datatype, sesion);

		// //测试删除
		// SeMetoDAO sm=new SeMetoDAO();
		//		
		// DataTypeModel datatype=new DataTypeModel();
		// datatype.setDataTypeid(4);
		// Map a=new TreeMap();
		// sm.deleteDataTypeById(datatype.getDataTypeid(), a);

		// 测试修改
		SeMetoDAO sm = new SeMetoDAO();
		DataTypeModel datatype = new DataTypeModel();
		datatype.setDataTypeid(4);
		Map a = new TreeMap();
		sm.deleteDataTypeById(datatype.getDataTypeid(), a);
	}

}

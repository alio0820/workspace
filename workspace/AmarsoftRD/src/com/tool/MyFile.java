package com.tool;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import com.bean.FileBean;
import com.common.MyLog;
/**
 * 文件管理的类
 * 用于管理目录和文件
 * @time 2014-4-14 15:58:19
 */
public class MyFile {
	/**
	 * 返回文件列表
	 * （之所以使用两个参数，是为了不在客户端暴露文件路径）
	 */
	public static ArrayList<FileBean> getFileList(String root,String path){
		String currentPath = root+path;
		File file = new File(currentPath);
		File[] files = file.listFiles();
		@SuppressWarnings("rawtypes")
		Map map = new TreeMap();
		for(int m=0;m<files.length;m++){
			map.put(files[m].getName(), files[m]);
		}
		File[] filelist = (File[])map.values().toArray(new File[0]);
		ArrayList<FileBean> list = new ArrayList<FileBean>();
		if(filelist==null) return list;
		for(int i=0;i<filelist.length;i++){
			if(filelist[i].getName().equals(".svn"))
				continue;
			FileBean fileBean = new FileBean();
			if(filelist[i].isDirectory())
				fileBean.setFolder(true);
			else
				fileBean.setFolder(false);
			fileBean.setCurrentPath(path+"/"+filelist[i].getName());
			fileBean.setName(filelist[i].getName());
			list.add(fileBean);
		}
		return list;
	}
	/**
	 * 删除文件
	 * @param sPath
	 */
	public static boolean deleteFile(String sPath){
		File file = new File(sPath);
		if(file.isFile()&&file.exists()){
			file.delete();
			return true;
		}
		return true;
	}
	/**
	 * 删除目录
	 * @param sPath
	 */
	public static boolean deleteDirectory(String sPath){
		boolean flag = true;
//		if (!sPath.endsWith(File.separator)) {  
//	        sPath = sPath + File.separator;  
//	    }
		File dirFile = new File(sPath);
		if (!dirFile.exists()) {  
	        return true;
	    }
		if(!dirFile.isDirectory())
			return false;
	    //删除文件夹下的所有文件(包括子目录)  
	    File[] files = dirFile.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        //删除子文件  
	        if (files[i].isFile()) {  
	            flag = deleteFile(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        } //删除子目录  
	        else {  
	            flag = deleteDirectory(files[i].getAbsolutePath());  
	            if (!flag) break;  
	        }  
	    }  
	    if (!flag) return false;  
	    //删除当前目录  
	    if (dirFile.delete()) {  
	        return true;
	    } else {  
	        return false;  
	    }  
	}
	/**
	 * 删除文件或者文件夹
	 * @param sPath
	 */
	public static boolean deleteFolder(String sPath){
		boolean flag= true;
		File file = new File(sPath);
		if(file.isFile()){//删除文件
			flag = deleteFile(sPath);
		}
		else{//删除目录
			flag = deleteDirectory(sPath);
		}
		return flag;
	}
	/**
	 * 依据原始文件名生成新文件名
	 * 
	 * @return
	 */
	public static String getFileName(String userName){
		Random random = new Random();
		return "" + random.nextInt(10000) + System.currentTimeMillis()+"_"+userName + ".htm";
	}
	/**
	 * 将数据写入文件，对于一般数据量比较大的内容，写入文件更节省空间
	 * @return boolean
	 */
	public static boolean writeDataToFile(String sPath,String fileName,String data){
		File file = new File(sPath+fileName);
		if(!file.exists()){
			try {
				file.createNewFile();
			} catch (IOException e) {
				MyLog.getLogError(e,"创建文件失败...");
				return false;
			}
		}
		//true = append file
		try {
			FileWriter fileWriter = new FileWriter(file.getAbsolutePath());
			BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write(data);
			bufferedWriter.close();
		} catch (IOException e) {
			MyLog.getLogError(e,"写入文件失败...");
			return false;
		}
		return true;
	}
	/**
     * 以行为单位读取文件，常用于读面向行的格式化文件
     */
    public static String readFileByLines(String fileName) {
        File file = new File(fileName);
        if(!file.exists()){
        	return "";
        }
        StringBuffer sbuffer = new StringBuffer();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
            	sbuffer.append(tempString);
            }
            reader.close();
        } catch (IOException e) {
        	MyLog.getLogError(e,"读取文件失败...");
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        return sbuffer.toString();
    }
	public static void main(String[] args) {
//		ArrayList<FileBean> list = getFileList("E:/Software/Tomcat 6.0/webapps/AmarsoftRD/","document/Product");
//		System.out.print(list.size());
//		System.out.println(deleteFolder("E:\\Software\\Tomcat 6.0\\webapps\\AmarsoftRD\\document\\Product\\ALS7\\1.天气真好"));
//		System.out.println(writeDataToFile("E:\\Software\\Tomcat 6.0\\webapps\\AmarsoftRD\\document\\Product\\","今天天气真好.htm","~！@#￥%……&*（）——+《》？|}{“："));
	}

}

package com.init;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.JarURLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import com.common.ILog;


public class JBOPackage {
    /** 
     * 从包package中获取所有的Class 
     *  
     * @param pack 
     * @return 
     */  
    public static List<Class<?>> getClasses(String pack) {
        // 第一个class类的集合  
        List<Class<?>> classes = new ArrayList<Class<?>>();  
        // 是否循环迭代  
        boolean recursive = true;  
        // 获取包的名字 并进行替换  
        String packageName = pack;  
        String packageDirName = packageName.replace('.', '/');  
        // 定义一个枚举的集合 并进行循环来处理这个目录下的things  
        Enumeration<URL> dirs;  
        try {  
            dirs = Thread.currentThread().getContextClassLoader().getResources(  
                    packageDirName);  
            // 循环迭代下去  
            while (dirs.hasMoreElements()) {  
                // 获取下一个元素  
                URL url = dirs.nextElement();  
                // 得到协议的名称  
                String protocol = url.getProtocol();  
                // 如果是以文件的形式保存在服务器上  
                if ("file".equals(protocol)) {  
                    ILog.init("扫描bean包下的javaBean[file]");  
                    // 获取包的物理路径  
                    String filePath = URLDecoder.decode(url.getFile(), "UTF-8");  
                    // 以文件的方式扫描整个包下的文件 并添加到集合中  
                    findClassInPackageByFile(packageName, filePath,recursive, classes);  
                } else if ("jar".equals(protocol)) {  // 如果是jar包文件  
                	ILog.init("扫描bean包下的javaBean[jar]");
                	// 定义一个JarFile
                    JarFile jar;  
                    try {  
                        // 获取jar  
                        jar = ((JarURLConnection)url.openConnection()).getJarFile();  
                        // 从此jar包 得到一个枚举类  
                        Enumeration<JarEntry> entries = jar.entries();  
                        // 同样的进行循环迭代  
                        while (entries.hasMoreElements()) {  
                            // 获取jar里的一个实体 可以是目录 和一些jar包里的其他文件 如META-INF等文件  
                            JarEntry entry = entries.nextElement();  
                            String name = entry.getName();  
                            // 如果是以/开头的  
                            if (name.charAt(0) == '/') {  
                                // 获取后面的字符串  
                                name = name.substring(1);  
                            }  
                            // 如果前半部分和定义的包名相同  
                            if (name.startsWith(packageDirName)) {  
                                int idx = name.lastIndexOf('/');  
                                // 如果以"/"结尾 是一个包  
                                if (idx != -1) {  
                                    // 获取包名 把"/"替换成"."  
                                    packageName = name.substring(0, idx)  
                                            .replace('/', '.');  
                                }  
                                // 如果可以迭代下去 并且是一个包  
                                if ((idx != -1) || recursive) {  
                                    // 如果是一个.class文件 而且不是目录  
                                    if (name.endsWith(".class")  
                                            && !entry.isDirectory()) {  
                                        // 去掉后面的".class" 获取真正的类名  
                                        String className = name.substring(  
                                                packageName.length() + 1, name  
                                                        .length() - 6);  
                                        try {  
                                            // 添加到classes  
                                            classes.add(Class  
                                                    .forName(packageName + '.'  
                                                            + className));  
                                        } catch (ClassNotFoundException e) {  
                                        	ILog.error(e,"添加用户自定义视图类错误 找不到此类的.class文件");  
                                        }  
                                    }  
                                }  
                            }  
                        }  
                    } catch (IOException e) {  
                    	ILog.error(e,"在扫描用户定义视图时从jar包获取文件出错");  
                        e.printStackTrace();  
                    }  
                }  
            }  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return classes;  
    }  
    
    public static void findClassInPackageByFile(String packageName, String filePath, final boolean recursive, List<Class<?>> classs) {
	  File dir = new File(filePath);
	  if (!dir.exists() || !dir.isDirectory()) {
	    return;
	  }
	  // 在给定的目录下找到所有的文件，并且进行条件过滤
	  File[] dirFiles = dir.listFiles(new FileFilter() {
	
		@Override
		public boolean accept(File file) {
		  boolean acceptDir = recursive && file.isDirectory();// 接受dir目录
		  boolean acceptClass = file.getName().endsWith("class");// 接受class文件
		  return acceptDir || acceptClass;
		}
	  });
	  ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	  for (File file : dirFiles) {
	    if (file.isDirectory()) {
	      findClassInPackageByFile(packageName + "." + file.getName(), file.getAbsolutePath(), recursive, classs);
	    } else {
	    	String className = file.getName().substring(0, file.getName().length() - 6);
	    	try {
	    		classs.add(classLoader.loadClass(packageName + "." + className));
	    	} catch (Exception e) {
	    		e.printStackTrace();
	      }
	    }
	  }
    }
    
    public static void main(String[] args){
    	long time = new Date().getTime();
    	List<Class<?>> list =JBOPackage.getClasses("com.bean");
    	for(Class<?> item : list){
    		System.out.println(item.getSimpleName());
    	}
    	System.out.println(new Date().getTime() - time);
    }
}

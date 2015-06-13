package com.init;
import java.lang.Class;
import java.lang.reflect.Method;
import java.util.regex.Pattern;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.bean.UserBean;
import com.common.ILog;
/**
 * JavaBean工厂，通过javaBean实现数据库的增删改查
 * @author louis
 */
public class JBOFactory{
	private static HashMap<Class<?>,JBOFactory> beans = new HashMap<Class<?>,JBOFactory>();
    private Class<?> cls;
    /**这里保存标签和方法的映射*/
    private HashMap<String, Method> getMethods= null;
    private  HashMap<String, Method> setMethods= null;
    
    public static void init(String pack) throws Exception{
    	List<Class<?>> list =JBOPackage.getClasses(pack);
    	for(Class<?> item : list){
    		JBOFactory tf = new JBOFactory();
    		tf.initTags(item);
    		JBOFactory.beans.put(item, tf);
    	}
    }
    public void initTags(Class<?> sClass) throws Exception{
    	cls = sClass;
    	initTags();
    }
    public void initTags(String className) throws Exception{
    	cls = Class.forName(className);
    	initTags();
    }
    private void initTags() throws Exception{
        getMethods = new HashMap<String, Method>();
        setMethods = new HashMap<String, Method>();
       
        /**从类中获取所有的方法*/
        Method methods[] = cls.getDeclaredMethods();
       
        /**定义正则表达式，从方法中过滤出getter / setter 函数，以及其标签*/
        String gs = "get(\\w+)";
        Pattern getM = Pattern.compile(gs);
        String ss ="set(\\w+)";
        Pattern setM = Pattern.compile(ss);
        String rapl = "$1";
        String tag;
        for(int i = 0; i < methods.length; ++i) {
            Method m = methods[i];
            String methodName = m.getName();
            if (Pattern.matches(gs, methodName )) {
               tag = getM.matcher(methodName).replaceAll(rapl).toLowerCase();
               getMethods.put(tag, m);
            }
            else if (Pattern.matches(ss, methodName )) {
               tag = setM.matcher(methodName).replaceAll(rapl).toLowerCase();
               setMethods.put(tag, m);
            }
            else ILog.error(methodName + " cannot match");
        }
    }
    public Object newInstance() throws InstantiationException, IllegalAccessException{
    	Object o = cls.newInstance();
    	return o;
    }
    public static JBOFactory getFactory(Class<?> sClass){
    	return beans.get(sClass);
    }
    public static JBOFactory getFactory(String className) throws ClassNotFoundException{
    	Class<?> c = Class.forName(className);
    	return beans.get(c);
    }
	/**
	* 通过这个初始化函数，所有的getter/setter方法就全部保存在hashtable中了。以后可以用标签方便的调用。
	* 下面演示如何调用setValue函数向javaBean设定值
	*/
    public void setValue(Object o,String tag, Object value){
    	//从hashtable中直接得到对应tag的setter函数对象
    	Method m = setMethods.get(tag.toLowerCase());
        if (m != null){
            try{
            	//调用bean的setter函数
                m.invoke(o, value);
            }catch (Exception ex){
                ILog.error(ex,"invoke setter on " + tag + " error: ");
            }
        }
    }
    
    public Object getValue(Object o,String tag){
    	Method m = getMethods.get(tag.toLowerCase());
    	if(m!=null){
    		try{
    			return m.invoke(o);
    		}catch(Exception e){
    			ILog.error(e,"invoke getter on " + tag + " error: ");
    		}
    	}
    	return null;
    }
    
    public HashMap<String, Method> getGetMethods() {
		return getMethods;
	}
	public HashMap<String, Method> getSetMethods() {
		return setMethods;
	}
	public static void main(String[] args)throws Exception{
    	long time=new Date().getTime();
    	Log4jInit.init4Test();
    	JBOFactory.init("com.bean");
    	JBOFactory tf =JBOFactory.getFactory(UserBean.class);
    	UserBean u = new UserBean();
    	tf.setValue(u,"valid", 100);
    	System.out.println(u.getValid());
    	System.out.println(new Date().getTime() -time);
    	System.out.println("u.getClass()==UserBean.class:" + (u.getClass()==UserBean.class));
    }
}
package com.httpclient;
import java.io.IOException;  
import java.io.InputStream;  
import java.util.ArrayList;  
import java.util.List;  
import java.util.Map;  
import java.util.Set;  
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.HttpEntity;  
import org.apache.http.HttpResponse;  
import org.apache.http.NameValuePair;  
import org.apache.http.client.ClientProtocolException;  
import org.apache.http.client.HttpClient;  
import org.apache.http.client.entity.UrlEncodedFormEntity;  
import org.apache.http.client.methods.HttpGet;  
import org.apache.http.client.methods.HttpPost;  
import org.apache.http.entity.BufferedHttpEntity;  
import org.apache.http.impl.client.DefaultHttpClient;  
import org.apache.http.message.BasicNameValuePair;  

public class Client {  
      
    public String sendGet(String url,String encode) throws ClientProtocolException, IOException{  
        String result = null;  
        HttpClient httpClient = new DefaultHttpClient();  
        HttpGet get = new HttpGet(url);  
        InputStream in = null;  
        try {  
            HttpResponse response = httpClient.execute(get);  
            HttpEntity entity = response.getEntity();  
            if (entity != null) {  
                entity = new BufferedHttpEntity(entity);  
                in = entity.getContent();  
                byte[] read = new byte[1024];  
                byte[] all = new byte[0];  
                int num;  
                while ((num = in.read(read)) > 0) {  
                    byte[] temp = new byte[all.length + num];  
                    System.arraycopy(all, 0, temp, 0, all.length);  
                    System.arraycopy(read, 0, temp, all.length, num);  
                    all = temp;  
                }
                result = new String(all, encode);
            }
        } finally {  
            if (in != null) in.close();  
            get.abort();  
        }  
          
        return result;  
    }  
      
    public String sendPost(String url, Map<String, String> params) throws ClientProtocolException, IOException{  
        String result = null;  
        HttpClient httpClient = new DefaultHttpClient();  
          
        HttpPost get = new HttpPost(url);  
          
        // 创建表单参数列表    
        List<NameValuePair> qparams = new ArrayList<NameValuePair>();   
        Set<String> keys = params.keySet();  
        for (String key : keys) {  
            qparams.add(new BasicNameValuePair(key, params.get(key)));  
        }  
          
        // 填充表单    
        get.setEntity(new UrlEncodedFormEntity(qparams,"UTF-8"));  
          
        HttpResponse response = httpClient.execute(get);  
        HttpEntity entity = response.getEntity();  
        if (entity != null) {  
            entity = new BufferedHttpEntity(entity);  
              
            InputStream in = entity.getContent();  
            byte[] read = new byte[1024];  
            byte[] all = new byte[0];  
            int num;  
            while ((num = in.read(read)) > 0) {  
                byte[] temp = new byte[all.length + num];  
                System.arraycopy(all, 0, temp, 0, all.length);  
                System.arraycopy(read, 0, temp, all.length, num);  
                all = temp;  
            }  
            result = new String(all,"UTF-8");  
            if (null != in) {  
                in.close();  
            }  
        }  
        get.abort();  
          
        return result;  
    }  
      
    public String sendGet(String url,String encode, Map<String, String> params) throws ClientProtocolException, IOException {  
        Set<String> keys = params.keySet();  
        StringBuilder urlBuilder = new StringBuilder(url + "?");  
        for (String key : keys) {  
            urlBuilder.append(key).append("=").append(params.get(key)).append("&");
        }  
        urlBuilder.delete(urlBuilder.length() - 1, urlBuilder.length());  
        return this.sendGet(urlBuilder.toString(),encode);  
    }
    public static void main(String[] args) throws ClientProtocolException, IOException{
    	Client client = new Client();
    	String data = client.sendGet("http://www.baidu.com/baidu?wd=%BD%F0%C8%DA&tn=monline_4_dg","utf-8");
    	
    	System.out.println(data);
//    	Pattern p = Pattern.compile("[\\w[.-]]+@[\\w[.-]]+\\.[\\w]+");//截取邮箱
//    	Pattern p = Pattern.compile("http://(\\w+[.]){2}(\\w+/)+(\\w+[.]\\w+)");//截取网址
    	Pattern p = Pattern.compile("[\u4e00-\u9fa5]+");//截取中文
//    	Pattern p = Pattern.compile("[.]*金融[. ]*");//截取包含中文的
		Matcher m  = p.matcher(data);
		while(m.find()){
			if(m.group().indexOf("金融")>=0)
				System.out.println(m.group());
		}
    }
}  
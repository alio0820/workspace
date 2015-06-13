package com.message;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;


public class Test {
 private static Log log = LogFactory.getLog(Test.class);

 public static void main(String[] args) {
  String mobile = "15123364298";
  String pw = "zcd1991";
  //���Է�����
  boolean b = fetchToSendSMS(mobile, pw, new String[] { "15123364298" }, "TestMessage");
  System.out.println("Send Message result:" + b);

  //����ȡ�ú����б�
  JSONArray friends = fetchToGetFriends(mobile, pw);
  System.out.println("friends:\r\n"+ (friends == null ? "null" : friends.toString()));

  //������Ӻ���
  // int result = fetchToAddFriend(mobile, pw,"13812345678","TestMyName", "TestFriendName");
  // System.out.println("Add Friend result:"+result);

  //���Է��Ͷ�ʱ����(ע����̫ƽ��ʱ�䣬����2009-10-09 01:00 �Ǳ���ʱ��09:00����)
  // String sid = fetchToSendScheduleMsg(mobile, pw, new String[]{"13912345678"}, "TestScheduleMessage", "2009-10-09 01:00");
  // System.out.println("sid:"+sid);

  //����ɾ����ʱ����
  // boolean b2 = fetchToDeleteScheduleMsg(mobile, pw, "123456");
  // System.out.println("schedule message delete result:"+b2);
 }

 private static final int TRY_TIMES = 3;
 private static final int TIME_OUT = 30000;

 /**
  *���Ͷ���Ϣ ���򵥵�Get��ʽ����֧��Ⱥ������ҪȺ��������POST��ʽ���Ѹ��£���ֱ������������������µ�ַ,�ֻ���������������иĵ���
  * http://fetionlib.appspot.com/restlet/fetion/13812345678/password/13912345678/message �ɹ�����OK
  * ���򷵻�Message Not Sent�����ҪȺ�����������������/������Ҫ�ύ������Ϣ������ܵ���������������µĳ���POST��ʽ��
  * ע�����String[] friends �е���������Ǻ��ѵ��ֻ���,Ҳ�����Ǻ����ó���ȡ���ĺ��ѵ�uri���������ȡ�ú����б��˵��
  * ��fetchToSendSMS("13812345678","password",new String[]{"sip:12345678@fetion.com.cn;p=5065","13916416465","tel:15912345678"},"Test");
  * ���������ܳ���8�����������Ҫ�����ó���ֿ�����ε���
  * ע�⣺��ͬ�ֻ��ţ���ͬ���ѵ�����ĵ��ü��Ҫ����30�룬���򲻳ɹ���responseCode:406���������ܺ����а������Լ����ֻ��ŵ�������30������ƣ�
  */
 public static boolean fetchToSendSMS(String mobile, String password,
   String[] friends, String message) {
  // ����UUID��Ŀ���Ƿ�ֹ������������ڷ��������Ѿ��ɹ����Ͷ��ţ�ȴ�ڷ��ؽ����������������
  // �����¿ͻ��˼����������󣬴�ʱ�÷���������UUID�ֱ���������Ѿ����͹��������ٴη��Ͷ��š�
  String uuid = UUID.randomUUID().toString();
  for (int i = 0; i < TRY_TIMES; i++) {
   int responseCode = 0;
   try {
    URL postUrl = new URL(
      "http://fetionlib.appspot.com/restlet/fetion");
    HttpURLConnection connection = (HttpURLConnection) postUrl
      .openConnection();
    connection.setConnectTimeout(TIME_OUT);
    connection.setReadTimeout(TIME_OUT);
    connection.setDoOutput(true);
    connection.setRequestMethod("POST");
    connection.setUseCaches(false);
    connection.setInstanceFollowRedirects(true);
    connection.setRequestProperty("Content-Type",
      "application/x-www-form-urlencoded");
    connection.connect();
    DataOutputStream out = new DataOutputStream(connection
      .getOutputStream());
    String content = "mobile=" + mobile + "&uuid=" + uuid
      + "&password=" + password + "&friend="
      + convertArrayToJSONString(friends) + "&message="
      + URLEncoder.encode(message, "utf-8");
    out.writeBytes(content);

    out.flush();
    out.close();

    responseCode = connection.getResponseCode();
    connection.disconnect();
    if (responseCode == 202)
     return true;
    else
     return false;
   } catch (Exception e) {
    log.warn("error fetchToSendSMS, exception:" + e.getMessage()
      + ". tried " + i + " times");
   }
  }
  return false;
 }
 
   /**
     *ȡ�ú����б� GET��ʽΪ��
     * http://fetionlib.appspot.com/restlet/fetion/friendsList/13812345678/password
     * �ɹ�������JSON��ʽ�ĺ����б���������˽�JSON��ʽ���������ϲ������֪ʶ��
     * �磺[{"nickname":"Jerry","localname":"С��","uri":"sip:123456@fetion.com.cn;p=6012","mobile":"13912345678"}]
     * ����nickname�ǶԷ����Լ����õ��ǳƣ�localname�������Է����õ����֣�mobile�ǶԷ��������ֻ��ţ�uri�Ǹ��û��ı�ʶ���������ڷ��Ͷ���ʱ���ݵĲ���
     * ע��nickname��localname��mobile �������ֶο���Ϊ�գ����Ϊ�գ���������JSON����ʾ��
     * ���ɹ����ؿհ�
     * ע�⣺��ͬ�ֻ��ŵ��ü��Ҫ����30�룬���򲻳ɹ���responseCode:406��
     *
     * ����JSONArray��ȡ�õ�uri,��sip:123456@fetion.com.cn;p=6012�����Ϊtel:13912345678��
     * ��ֱ����Ϊ������������������з��Ͷ��ţ� �����mobile��Ҳ���Դ���mobile��13916416465��
     * ������Щʱ�򣬶Է��������ֻ��ţ����޷���ȡ�ֻ��ţ�ֻ��ͨ��uri�����Ͷ���
     *
     */
    public static JSONArray fetchToGetFriends(String mobile, String password) {
          String uuid = UUID.randomUUID().toString();
          for (int i = 0; i < TRY_TIMES; i++) {
                try {
                      URL postUrl = new URL(
                                  "http://fetionlib.appspot.com/restlet/fetion/friendsList");
                      HttpURLConnection connection = (HttpURLConnection) postUrl
                                  .openConnection();
                      connection.setConnectTimeout(TIME_OUT);
                      connection.setReadTimeout(TIME_OUT);
                      connection.setDoOutput(true);
                      connection.setRequestMethod("POST");
                      connection.setUseCaches(false);
                      connection.setInstanceFollowRedirects(true);
                      connection.setRequestProperty("Content-Type",
                                  "application/x-www-form-urlencoded");
                      connection.connect();
                      DataOutputStream out = new DataOutputStream(connection
                                  .getOutputStream());
                      String content = "mobile=" + mobile + "&uuid=" + uuid
                                  + "&password=" + password;
                      out.writeBytes(content);

                      out.flush();
                      out.close();

                      int responseCode = connection.getResponseCode();
                      if (responseCode == 202) {
                            BufferedReader reader = new BufferedReader(
                                        new InputStreamReader(connection.getInputStream())); // ��ȡ���
                            StringBuffer sb = new StringBuffer();
                            String line;
                            while ((line = reader.readLine()) != null) {
                                  sb.append(line);
                            }
                            reader.close();
                            connection.disconnect();
                            return new JSONArray(sb.toString());
                      } else {
                            connection.disconnect();
                      }
                } catch (Exception e) {
                      log.warn("error fetchToGetFriends, exception:" + e.getMessage()
                                  + ". tried " + i + " times");
                }
          }
          return null;
    }

 /**
  *������� GET��ʽΪ��
  * http://fetionlib.appspot.com/restlet/fetion/friend/13812345678/password/13912345678/MyName/FriendNickname ��������-1��0��1��������˵��
  *
  *@param friend
  *            ��������ѵ��ֻ���
  *@param desc
  *            �������������ܳ���10���֣����Է��յ��������ʱ������ʾ������֣��Ա��öԷ�֪������˭
  *@param nickname
  *            �Է������������ܳ���10���֣�������Է�ͬ��Ļ���������ֻ���Ϊ���ĺ���������ʾ
  *
  *@return -1������߶Է��ֻ��Ų�֧��, 0�Է��Ѿ������ĺ��� 1�ɹ�����������ţ��ȴ��Է��ظ��Ƿ�ͬ��
  * ע�⣺��ͬ�ֻ��ŵ��ü��Ҫ����30�룬���򲻳ɹ���responseCode:406��
  */
 public static int fetchToAddFriend(String mobile, String password,
   String friend, String desc, String nickname) {
  String uuid = UUID.randomUUID().toString();
  for (int i = 0; i < TRY_TIMES; i++) {
   int responseCode = 0;
   try {
    URL postUrl = new URL(
      "http://fetionlib.appspot.com/restlet/fetion/friend");
    HttpURLConnection connection = (HttpURLConnection) postUrl
      .openConnection();
    connection.setConnectTimeout(TIME_OUT);
    connection.setReadTimeout(TIME_OUT);
    connection.setDoOutput(true);
    connection.setRequestMethod("POST");
    connection.setUseCaches(false);
    connection.setInstanceFollowRedirects(true);
    connection.setRequestProperty("Content-Type",
      "application/x-www-form-urlencoded");
    connection.connect();
    DataOutputStream out = new DataOutputStream(connection
      .getOutputStream());
    String content = "mobile=" + mobile + "&uuid=" + uuid
      + "&password=" + password + "&friend=" + friend
      + "&desc=" + URLEncoder.encode(desc, "utf-8")
      + "&nickname=" + URLEncoder.encode(nickname, "utf-8");
    out.writeBytes(content);

    out.flush();
    out.close();

    responseCode = connection.getResponseCode();
    if (responseCode == 202) {
     BufferedReader reader = new BufferedReader(
       new InputStreamReader(connection.getInputStream())); // ��ȡ���
     StringBuffer sb = new StringBuffer();
     String line;
     while ((line = reader.readLine()) != null) {
      sb.append(line);
     }
     reader.close();
     connection.disconnect();
     JSONObject jo = new JSONObject(sb.toString());
     return jo.getInt("action");
    } else {
     connection.disconnect();
     return -1;
    }
   } catch (Exception e) {
    log.warn("error fetchToAddFriend, exception:" + e.getMessage()
      + ". tried " + i + " times");
   }
  }
  return -1;
 }

 /**
  *���Ͷ�ʱ���� GET��ʽΪ����֧��Ⱥ������ҪȺ��������POST��ʽ���Ѹ��£�:
  * http://fetionlib.appspot.com/restlet/fetion/schedule/13812345678/password/13912345678/message/2009-08-08%2012:18 �ɹ�����sid���룬���򷵻ؿհ�(�ո�)
  *
  *POST��ʽ����
  *
  *@param message
  *            �������ݣ��������ܳ���180��
  *@param date
  *            �������ڸ�ʽΪyyyy-MM-dd HH:mm��ע������Ϊʱ��Ϊ0�ı�׼ʱ�䣬����ʱ���ʱ����8������Ҫ��ȥ8Сʱ��
  *            ��ƻ�2009-08-08 20:18�ַ��ͣ�Ӧ����д2009-08-08 12:18��
  *            �й��ƶ����涨����Ҫ��������ʱ��20���ӵ����ܳ���1�ꡣ
  *@param friends
  *            ���ܶ��ŵĺ����ǣ� ���е���������Ǻ��ѵ��ֻ���,Ҳ�������ó���ȡ���ĺ��ѵ�uri��ע����������ܳ���30�����������Ҫ�����ó���ֿ�����ε���
  * ע�⣺��ͬ�ֻ��ţ���ͬ���ѵ�����ĵ��ü��Ҫ����30�룬���򲻳ɹ���responseCode:406���������ܺ����а������Լ����ֻ��ŵ�������30������ƣ�
  *
  *@return һ��sid���룬�������������Ҫ�������ŷ��ͣ���Ҫ�õ��������
  */
 public static String fetchToSendScheduleMsg(String mobile, String password,
   String[] friends, String message, String date) {
  String uuid = UUID.randomUUID().toString();
  for (int i = 0; i < TRY_TIMES; i++) {
   try {
    URL postUrl = new URL(
      "http://fetionlib.appspot.com/restlet/fetion/schedule");
    HttpURLConnection connection = (HttpURLConnection) postUrl
      .openConnection();
    connection.setConnectTimeout(TIME_OUT);
    connection.setReadTimeout(TIME_OUT);
    connection.setDoOutput(true);
    connection.setRequestMethod("POST");
    connection.setUseCaches(false);
    connection.setInstanceFollowRedirects(true);
    connection.setRequestProperty("Content-Type",
      "application/x-www-form-urlencoded");
    connection.connect();
    DataOutputStream out = new DataOutputStream(connection
      .getOutputStream());
    String content = "mobile=" + mobile + "&uuid=" + uuid
      + "&password=" + password + "&friend="
      + convertArrayToJSONString(friends) + "&schedule="
      + date.replace(" ", "%20") + "&message="
      + URLEncoder.encode(message, "utf-8");
    out.writeBytes(content);

    out.flush();
    out.close();
    int responseCode = connection.getResponseCode();
    if (responseCode == 202) {
     BufferedReader reader = new BufferedReader(
       new InputStreamReader(connection.getInputStream())); // ��ȡ���
     StringBuffer sb = new StringBuffer();
     String line;
     while ((line = reader.readLine()) != null) {
      sb.append(line);
     }
     reader.close();
     connection.disconnect();
     JSONObject jo = new JSONObject(sb.toString());
     return jo.getString("sid");
    } else {
     connection.disconnect();
     return null;
    }
   } catch (Exception e) {
    log.warn("error fetchToSaveSchedule, exception:"
      + e.getMessage() + ". tried " + i + " times");
   }
  }
  return null;
 }

 /**
  *ɾ����ʱ���� GET��ʽΪ��
  * http://fetionlib.appspot.com/restlet/fetion/scheduleDelete/13812345678/password/aglmZXRpb25saWJyGgsSB0FjY291bnQYAQwLEgdNZXNzYWdlGCQM
  * aglmZXRpb25saWJyGgsSB0FjY291bnQYAQwLEgdNZXNzYWdlGCQM���㷢�Ͷ�ʱ���ŷ��ص�sid���룬
  * GET��ʽ֧֮��һ��ɾ��һ����ʱ���ţ� ���Ҫɾ����������������POST��ʽ���ɹ�����OK�����򷵻�Schedule Not Deleted
  * ע�⣺��ͬ�ֻ��ŵ��ü��Ҫ����30�룬���򲻳ɹ���responseCode:406��
  *
  *@param sid
  *            ���Ͷ�ʱ����ʱ���ص���Щsid���루���ܳ���10��sid����������������ʽ�������ת����JSON�ύ
  *
  */
 public static boolean fetchToDeleteScheduleMsg(String mobile,
   String password, String[] sids) {
  String uuid = UUID.randomUUID().toString();
  for (int i = 0; i < TRY_TIMES; i++) {
   try {
    URL postUrl = new URL(
      "http://fetionlib.appspot.com/restlet/fetion/scheduleDelete");
    HttpURLConnection connection = (HttpURLConnection) postUrl
      .openConnection();
    connection.setConnectTimeout(TIME_OUT);
    connection.setReadTimeout(TIME_OUT);
    connection.setDoOutput(true);
    connection.setRequestMethod("POST");
    connection.setUseCaches(false);
    connection.setInstanceFollowRedirects(true);
    connection.setRequestProperty("Content-Type",
      "application/x-www-form-urlencoded");
    connection.connect();
    DataOutputStream out = new DataOutputStream(connection
      .getOutputStream());
    String content = "mobile=" + mobile + "&uuid=" + uuid
      + "&password=" + password + "&sids="
      + convertArrayToJSONString(sids);
    out.writeBytes(content);

    out.flush();
    out.close();

    int responseCode = connection.getResponseCode();
    connection.disconnect();
    if (responseCode == 202)
     return true;
    else
     return false;
   } catch (Exception e) {
    log.warn("error fetchToDeleteSchedule, exception:"
      + e.getMessage() + ". tried " + i + " times");
   }
  }
  return false;
 }
 
 //������ת����JSONString
 private static String convertArrayToJSONString(String[] arr)
   throws Exception {
  JSONArray ja = new JSONArray();
  for (String a : arr)
   ja.put(a);//ja.add(a);//?
  return URLEncoder.encode(ja.toString(), "UTF-8");
 }
}

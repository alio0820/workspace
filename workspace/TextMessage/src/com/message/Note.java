package com.message;

import java.net.URLEncoder;
import java.net.URL;
import java.net.URLConnection;
import java.io.*;
/**
 * ������ͨ�ķ�����Ϣ���ǿ��ֻ������������ģ�Ȼ���ɶ������ķ����Է��ֻ�
 * ͨ����ҳ�أ�����ֱ�ӰѶ��ŷ����������ģ����صĶ������Ļ��ṩip��ַ�Ͷ˿ںš�
 * ������ŵĸ�ʽ���ǰ��ղ�ͬ��Э��������ġ����涨����from ,to ,content,fee���ȵ�
 * �򵥵�ԭ���������
*/
class Note
{
    public String send_sms(String user_id, String password, String mobile_phone,
                         String msg, String send_date, String subcode) {
    String ret_str = "";
    try {
    // Construct data

      String data = "user_id=" + user_id + "&password=" + password +

          "&mobile_phone=" + mobile_phone +

          "&msg=" + URLEncoder.encode(msg, "GBK") + "&send_date=" + send_date +

          "&subcode=" + subcode;

    // Send data

      URL url = new URL("http://bms.hichina.com/sms_gateway/sms_api");

      URLConnection conn = url.openConnection();

      conn.setDoOutput(true);

      OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());

      wr.write(data);

      wr.flush();

    // Get the response

      BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));

      String line;

      while ( (line = rd.readLine()) != null) {

          ret_str += line;
      }

      wr.close();
      rd.close();
    }
    catch (Exception e) {
      System.out.println(e.toString());
    }
    return ret_str;

}

public static void main(String[] args) throws IOException

{

    Note note= new Note();

    String ret=note.send_sms("4003","xxxxxxx","15123364298","fromjava","","4003");

    System.out.println(ret);

}

}
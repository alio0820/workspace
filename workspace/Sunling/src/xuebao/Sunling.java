package xuebao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.sql.*;
import java.util.Date;


public class Sunling {
	// public static void main(String[] args) throws IOException {
	private int year;

	public Sunling() {
	}

	public Sunling(int year) {
		this.year = year;
	}

	public void Find(int year) {
		try {
			URL url1 = new URL("http://cjc.ict.ac.cn/qwjs/list1.asp"); // ������ҳ��URL
			HttpURLConnection conn1 = (HttpURLConnection) url1.openConnection(); // ��������
			conn1.setDoOutput(true);
			conn1.setDoInput(true);
			conn1.setRequestMethod("POST");
			conn1.connect();
			java.io.OutputStream os = conn1.getOutputStream();
			os.write(("pub_year=" + year).getBytes()); // pub_yearΪ��ָ�������Ψһ��ʶ
			// os.write("&name=����".getBytes());
			os.flush();
			InputStream in = conn1.getInputStream();
			ArrayList<String> content1 = pipe(in);
			for (int j = 0; j < content1.size(); j++) {
				URL url2 = new URL("http://cjc.ict.ac.cn/qwjs/view.asp?id="
						+ content1.get(j)); // ����ÿһ���URL
				URLConnection conn2 = url2.openConnection();
				conn2.setDoOutput(true);
				InputStream in2 = null;
				in2 = url2.openStream();
				String content2 = pipe2(in2); // ��ȡHTML�����е�����������Ϣ
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ArrayList<String> pipe(InputStream in) throws IOException {
		ArrayList<String> ids = new ArrayList<String>(); // ���id������
		StringBuffer s = new StringBuffer();
		String rLine = null;
		BufferedReader bReader = new BufferedReader(new InputStreamReader(in));
		PrintWriter pw = null;
		String gj = "<a href=\"view.asp?id=";
		FileOutputStream fo = new FileOutputStream("year.txt"); // ���HTML�������ʱ�ı��ĵ�
		OutputStreamWriter writer = new OutputStreamWriter(fo);
		BufferedWriter bw = new BufferedWriter(writer);
		// bw.append(c)
		pw = new PrintWriter(writer);
		while ((rLine = bReader.readLine()) != null) { // ��year.txt�м����������HTML����
			String tmp_rLine = rLine;
			int str_len = tmp_rLine.length();
			if (str_len > 0) {

				s.append(tmp_rLine);
				pw.println(tmp_rLine);
				pw.flush();
			}
			tmp_rLine = null;

		}

		FileInputStream fis = new FileInputStream("year.txt"); // ��ȡyear.txt
																// �ı��ĵ�����ȡid
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		String s1 = new String();

		String s2 = "<td style=\"FONT-SIZE: 9pt\" bgcolor=\"#fffeee\" height=15 width=\"58%\"><a href=\"view.asp?id=";
		int i, j;
		String id = null;
		while ((rLine = br.readLine()) != null) { // ��ȡid
			s1 = rLine.trim();
			if (s1.length() >= s2.length()) {
				if (s1.substring(0, s2.length()).equals(s2)) {
					i = s2.lastIndexOf("=");

					j = s1.indexOf("\"", i);
					id = s1.substring(i + 1, j);
					ids.add(id); // ��id��������ids
				}
			}

		}

		in.close();
		pw.close();

		return ids;

	}

	public static String pipe2(InputStream in) throws IOException {
		int count = 1;
		PrintWriter ppppp = new PrintWriter(new FileOutputStream("result.txt",
				true), true);
		StringBuffer s = new StringBuffer();
		String rLine = null;
		BufferedReader bReader = new BufferedReader(new InputStreamReader(in));
		PrintWriter pw = null;

		FileOutputStream fo = new FileOutputStream("abc.txt", true); // ��Ŷ�Ӧid���Ӧ�Ľ����HTML����
		OutputStreamWriter writer = new OutputStreamWriter(fo);
		BufferedWriter bw = new BufferedWriter(writer);
		pw = new PrintWriter(writer);
		while ((rLine = bReader.readLine()) != null) {
			String tmp_rLine = rLine;
			int str_len = tmp_rLine.length();
			if (str_len > 0) {
				s.append(tmp_rLine);
				pw.println(tmp_rLine);
				pw.flush();
			}
			tmp_rLine = null;
		}

		String ident = "style=\"FONT-SIZE: 8.8pt\">";
		int beginIndex, endIndex; // ��ȡ����������Ϣ
		int number = s.indexOf("<");

		if (number == 0) {
			int indexfirst = 0;
			while (indexfirst != -1) {
				indexfirst = s.indexOf(ident, indexfirst + 1);

				if (indexfirst != -1) {
					beginIndex = indexfirst + ident.length();
					endIndex = s.indexOf("<", beginIndex + 1);
					if ((s.substring(beginIndex, beginIndex + 1)).equals("&")) {
						beginIndex = s.indexOf(";", beginIndex + 1) + 1;
						
						//ppppp.append(s.substring(beginIndex, endIndex));
						ppppp.append(s.substring(beginIndex, endIndex)+"\r\n");
						//ppppp.write(s.substring(beginIndex, endIndex)+"\r\n");
						ppppp.flush();
						
					} else {
						
						// ppppp.append(s.substring(beginIndex, endIndex));
						ppppp.append(s.substring(beginIndex, endIndex)+"\r\n");
						// ppppp.write(s.substring(beginIndex, endIndex)+"\r\n");
						ppppp.flush();
					}
				}
			}
		}

		else {
			endIndex = s.indexOf("<");
		
			// ppppp.append(s.substring(0, endIndex));
			 ppppp.append(s.substring(0, endIndex) + "\r\n");
			//ppppp.write(s.substring(0, endIndex)+"\r\n");
			ppppp.flush();
		}
		ppppp.close();
		in.close();
		pw.close();
		return s.toString();
	}
	//@SuppressWarnings("deprecation")


}

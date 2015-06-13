package Xproer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.File;

import javax.servlet.ServletContext;

/**
 * 
 */

/**
 * �����ļ�����Ҫ�����ļ��ϴ�·����
 *
 */
public class HttpUploaderCfg {

	public String m_uploadPath;		//�ϴ�·����d:\\www\\upload\\201204\\09\\
	public String m_uploadFolder;	//�ϴ��ļ��С�d:\\www\\upload\\
	public String m_relatPath;		//���·����/upload/201204/09/
	public String m_domain;			//��վ������
	public String m_curFile;		//
	public String m_curFolder;		//��ǰ·�� D:\\Tomcat 6.0\\webapps\\HttpUploader3\\	
		
	/*
	 * ���캯��
	 * ��JSPҳ���д��� this.getServletContext()
	*/
	public HttpUploaderCfg(ServletContext sc)
	{
		this.m_curFolder = sc.getRealPath("/");
		//F:\\www\\upload\\
		this.m_uploadFolder = this.m_curFolder + ("upload\\");
	}

	// �����ϴ�·��
	// d:\\www\\upload\\2012\\04\\10	
	public void CreateUploadPath()
	{
		SimpleDateFormat fmtDD = new SimpleDateFormat("dd");
		SimpleDateFormat fmtMM = new SimpleDateFormat("MM");
		SimpleDateFormat fmtYY = new SimpleDateFormat("yyyy");
		
		Date date = new Date();
		String strDD = fmtDD.format(date);
		String strMM = fmtMM.format(date);
		String strYY = fmtYY.format(date);

		//DateTime timeCur = DateTime.Now;
		String timeStr = strYY+"\\"+strMM+"\\"+strDD;
		this.m_relatPath = strYY + "/" + strMM + "/" + strDD + "//";
		this.m_uploadPath = this.m_uploadFolder + timeStr + "\\";
		
		File folder = new File(this.m_uploadPath);
		if(!folder.exists()) folder.mkdirs();
	}

	/*
	 * ��ȡ�ϴ�·��
	 * ����ֵ��
	 * 	d:\\www\\upload\\201204\\10\\
	*/
	public String GetUploadPath()
	{
		return this.m_uploadPath;
	}

	// ��ȡ���·��
	// ����ֵ��
	//	/upload/201204/10/
	public String GetRelatPath()
	{
		return this.m_relatPath;
	}
}

package Xproer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.locks.ReentrantReadWriteLock;  
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.jspsmart.upload.SmartUploadException;


/**
 *�ļ������࣬�����ļ���д��Ӳ����
 */

public class FileResumer {
	public int 			m_RangeSize;	//��ǰ�ļ����С����SaveFileRange()����ֵ
	public long 		m_RangePos;		//�ļ�����ʼλ�á�һ����ajax_post.jsp�и�ֵ
	public long			m_FileSize;		//�ļ�ʵ�ʴ�С��2G��һ�����ⲿ��ֵ��
	public String 		m_FileMD5;		//
	public String		m_fileRemote;	//Զ���ļ�·����D:\\webapps\\upload\\2012\\05\\24\\QQ2012.exe
	HttpServletRequest 	m_hsr;
	ServletContext		m_sc;
	
	//����߳̿���ͬʱ������ͬ�ļ�����������ṩ�����߳�ͬ��ʹ�á�
	static ReentrantReadWriteLock m_wrtLock = new ReentrantReadWriteLock(true);  
	
	/*
	 * ������
	 * 	sc	this.getServletContext()
	 * 	hsr	request
	 * */
	public FileResumer(ServletContext sc,HttpServletRequest hsr)
	{
		this.m_sc = sc;
		this.m_hsr = hsr;
	}

	//�����ļ�
	public void CreateFile()
	{
		try 
		{
		    RandomAccessFile raf = new RandomAccessFile(this.m_fileRemote, "rw");
		    raf.setLength(this.m_FileSize);//
		    raf.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/*
	 * �����ļ���һ���� ajax_create_fid.jsp �е��á�
	 * ��������Ϊ�˱������û�ͬʱ�ϴ���ͬ�ļ�ʱ��Ƶ�������ļ������⡣
	 * ������
	 * 	path	Զ���ļ�����·��������d:\soft\qq.exe
	 *  strLen	Զ���ļ���С�����ֽ�Ϊ��λ��1201254
	 * */
	public void CreateFile(String path,String strLen)
	{
		try 
		{
			ReentrantReadWriteLock.WriteLock wrtLock = null;  
			try
			{
				wrtLock = m_wrtLock.writeLock();
				wrtLock.lock();  
	
			    RandomAccessFile raf = new RandomAccessFile(path, "rw");
			    raf.setLength(Long.parseLong(strLen));//
			    raf.close();
			}
			finally
			{
				wrtLock.unlock();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*
	 * ������ʱ�ļ����ơ�
	 * �߼���
	 * 	��ʱ�ļ����� = Զ���ļ����� + tmp + ��ǰʱ�������
	 * ˵����
	 * 	�ӵ�ǰʱ�������Ϊ�˷�ֹ����û�ͬʱ�ϴ���ͬ�ļ�ʱ��������ʱ�ļ��������ͻ�����⡣
	 * ����ֵ��
	 * 	D:\\webapps\\upload\\2012\\05\\24\\QQ2012.exe.tmp201205241990
	 * */
	public String CreateTmpFileName()
	{
		SimpleDateFormat fmtDD = new SimpleDateFormat("dd");
		SimpleDateFormat fmtMM = new SimpleDateFormat("MM");
		SimpleDateFormat fmtYY = new SimpleDateFormat("yyyy");
		SimpleDateFormat fmtSS = new SimpleDateFormat("SSSS");
		
		Date date = new Date();
		String strDD = fmtDD.format(date);
		String strMM = fmtMM.format(date);
		String strYY = fmtYY.format(date);
		String strSS = fmtSS.format(date);
		
		String name = this.m_fileRemote + ".tmp" + strYY+strMM+strDD+strSS;
		return name;
		
	}
	
	//д���ļ�������
	public void WriteRangeData(com.jspsmart.upload.File rangeFile)
	{
		String tmpName = this.CreateTmpFileName();
		
		//�����������ļ�������д�뵽�ڷ�����ļ���
		try {
			rangeFile.saveAs(tmpName);

			java.io.File file = new java.io.File(tmpName);
			FileInputStream fis = new FileInputStream(file);
			byte[] data = new byte[this.m_RangeSize];//128k
			int readLen = fis.read(data);//ʵ�ʶ�ȡ�Ĵ�С
			XDebug.Output("ʵ�ʶ�ȡ�Ĵ�С",readLen);
			
			RandomAccessFile raf = new RandomAccessFile(this.m_fileRemote,"rw");  
			//��λ�ļ�λ��
			raf.seek(this.m_RangePos);
			raf.write(data);
			
			raf.close();
			fis.close();
			file.delete();//ɾ����ʱ�ļ�
			
			
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/*
	 * �����ļ���
	 * ������
	 * 	rangeFile 	�ļ���
	 *	fileRemote	Զ���ļ�·����d:\\webapps\\httpuploader3\\upload\\QQ2012.exe
	 * */
	public void SaveFileRange(com.jspsmart.upload.File rangeFile,String fileRemote)
	{
		this.m_fileRemote = fileRemote;
		this.m_RangeSize = rangeFile.getSize();
		try
		{
			File f = new File(fileRemote);
			
			//�ļ��������򴴽�
			if(!f.exists()) this.CreateFile();

			//�ļ����С��Ϊ��
			if (rangeFile.getSize() > 0)
			{
				this.WriteRangeData(rangeFile);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		
	/*
	 * �����ļ��顣
	 * ������
	 * 		rangeFile	�ļ��顣
	 * 		md5			�ļ�MD5
	 * 		fileSize	�ļ��ܴ�С
	 * */
	public void SaveFileRange(com.jspsmart.upload.File rangeFile,String uploadPath,String md5,long fileSize)
	{
		this.m_RangeSize = rangeFile.getSize();
		this.m_fileRemote = uploadPath + md5 + "." + rangeFile.getFileExt();
		this.CreateFile();
		
		try
		{
			File f = new File(this.m_fileRemote);
			
			//�ļ��������򴴽�
			if(!f.exists()) this.CreateFile();

			//�ļ����С��Ϊ��
			if (rangeFile.getSize() > 0)
			{
				this.WriteRangeData(rangeFile);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

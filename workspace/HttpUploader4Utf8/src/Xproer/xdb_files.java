package Xproer;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * ԭ��
*/
public class xdb_files {

	public xdb_files()
	{
		this._postedtime = new Date();
	}
	
	/*
	 * �Զ���ResultSet�ж�ȡ����
	 * */
	public xdb_files(ResultSet rst)
	{
		this.Read(rst);
	}
	
	public void Read(ResultSet rst)
	{
		try {
			this._fid				= rst.getInt(1);
			this._uid 				= rst.getInt(2);
			this._filenamelocal 	= rst.getString(3);
			this._filenameremote 	= rst.getString(4);
			this._filepathlocal		= rst.getString(5);
			this._filepathremote	= rst.getString(6);
			this._filepathrelative	= rst.getString(7);
			this._filemd5			= rst.getString(8);
			this._filelength		= Long.parseLong(rst.getString(9));
			this._filesize			= rst.getString(10);
			this._filepos			= Long.parseLong( rst.getString(11) );
			this._postedlength		= Long.parseLong(rst.getString(12));
			this._postedpercent		= rst.getString(13);
			this._postcomplete		= rst.getBoolean(14);
			this._postedtime		= rst.getDate(15);
			this._isdeleted			= rst.getBoolean(16);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	/*
	 * ����JSON�ַ����б��е�һ��
	 * ��ʽ��
	 * 	{s:0,FileNameLocal:"abcd"}
	 * */
	public String ToJsonItem()
	{
		//�����ļ�����·����D:\\Soft\\QQ2012.exe
		String fploc = this._filepathlocal;
		try {
			fploc = URLEncoder.encode(this._filepathlocal,"UTF-8");
			fploc = fploc.replaceAll("\\+", "%20");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//���·����/2012/05/24/QQ2012.exe
		String fprel = this._filepathrelative;
		try {
			fprel = URLEncoder.encode(this._filepathrelative,"UTF-8");
			fprel = fprel.replaceAll("\\+", "%20");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//�ļ��ڷ������е�·����D:\\webapps\\upload\\2012\\05\\24\\md5.exe
		String fpremote = this._filepathremote;
		try{
			fpremote = URLEncoder.encode(this._filepathremote,"UTF-8");
			fpremote = fpremote.replaceAll("\\+", "%20");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("fid:\""); sb.append(this._fid); sb.append("\"");
		sb.append(",uid:\""); sb.append(this._uid); sb.append("\"");
		sb.append(",FileNameLocal:\""); sb.append(this._filenamelocal); sb.append("\"");
		sb.append(",FileNameRemote:\""); sb.append(this._filenameremote); sb.append("\"");
		sb.append(",FilePathLocal:\""); sb.append(fploc); sb.append("\"");
		sb.append(",FilePathRelative:\""); sb.append(fprel); sb.append("\"");
		sb.append(",FilePathRemote:\""); sb.append(fpremote); sb.append("\"");
		sb.append(",FileMD5:\""); sb.append(this._filemd5); sb.append("\"");
		sb.append(",FileLength:\""); sb.append(this._filelength); sb.append("\"");
		sb.append(",FileSize:\""); sb.append(this._filesize); sb.append("\"");
		sb.append(",FilePos:\""); sb.append(this._filepos); sb.append("\"");
		sb.append(",PostedLength:\""); sb.append(this._postedlength); sb.append("\"");
		sb.append(",PostedPercent:\""); sb.append(this._postedpercent); sb.append("\"");
		sb.append(",PostComplete:\""); sb.append(this._postcomplete?"True":"False"); sb.append("\"");
		sb.append(",PostedTime:\""); sb.append(this._postedtime); sb.append("\"");
		sb.append("}");
		return sb.toString();
	}
	
	/// ����JSON�ַ��� [{fid:"0",uid:"1",fileNameLocal:"urlencode()"}]
	/// FilePathLocal����UrlEncode����
	/// FilePathRelative����UrlEncode����
	public String ToJson()
	{
		String fploc = this._filepathlocal;
		try {
			fploc = URLEncoder.encode(this._filepathlocal,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String fprel = this._filepathrelative;
		try {
			fprel = URLEncoder.encode(this._filepathrelative,"UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("[{");
		sb.append("fid:\""); sb.append(this._fid); sb.append("\"");
		sb.append(",uid:\""); sb.append(this._uid); sb.append("\"");
		sb.append(",FileNameLocal:\""); sb.append(this._filenamelocal); sb.append("\"");
		sb.append(",FileNameRemote:\""); sb.append(this._filenameremote); sb.append("\"");
		sb.append(",FilePathLocal:\""); sb.append(fploc); sb.append("\"");
		sb.append(",FilePathRemote:\""); sb.append(fprel); sb.append("\"");
		sb.append(",FileMD5:\""); sb.append(this._filemd5); sb.append("\"");
		sb.append(",FileLength:\""); sb.append(this._filelength); sb.append("\"");
		sb.append(",FileSize:\""); sb.append(this._filesize); sb.append("\"");
		sb.append(",FilePos:\""); sb.append(this._filepos); sb.append("\"");
		sb.append(",PostedLength:\""); sb.append(this._postedlength); sb.append("\"");
		sb.append(",PostedPercent:\""); sb.append(this._postedpercent); sb.append("\"");
		sb.append(",PostComplete:\""); sb.append(this._postcomplete?"True":"False"); sb.append("\"");
		sb.append(",PostedTime:\""); sb.append(this._postedtime); sb.append("\"");
		sb.append("}]");
		return sb.toString();
	}

	/// <summary>
	/// fid
	/// </summary>		
	private int _fid = 0;
	public int getFid()	{return _fid;}
	public void setFid(int fid){this._fid = fid;}
	
	/// <summary>
	/// �û�ID���������ϵͳ����ʹ�á�
	/// </summary>		
	private int _uid = 0;
	public int getUid()	{return this._uid;}
	public void setUid(int uid){this._uid = uid;}
	
	/// <summary>
	/// �ļ��ڱ��ص����е����ơ�
	/// </summary>		
	private String _filenamelocal = "";
	public String getFileNameLocal(){return this._filenamelocal;}
	public void setFileNameLocal(String name){this._filenamelocal = name;}
	
	/// <summary>
	/// �ļ��ڷ������е����ơ�
	/// </summary>		
	private String _filenameremote = "";
	public String getFileNameRemote(){return this._filenameremote;}
	public void setFileNameRemote(String name){this._filenameremote = name;}

	/// <summary>
	/// �ļ��ڱ��ص����е�����·����ʾ����D:\Soft\QQ2012.exe
	/// </summary>		
	private String _filepathlocal="";
	public String getFilePathLocal(){return this._filepathlocal;}
	public void setFilePathLocal(String path){this._filepathlocal = path;}
	
	/// <summary>
	/// �ļ��ڷ������е�����·����ʾ����F:\\ftp\\uer\\md5.exe
	/// </summary>		
	private String _filepathremote="";
	public String getFilePathRemote(){return this._filepathremote;}
	public void setFilePathRemote(String path){this._filepathremote = path;}
	
	/// <summary>
	/// �ļ��ڷ������е����·����ʾ����/www/web/upload/md5.exe
	/// </summary>		
	private String _filepathrelative="";
	public String getFilePathRelative(){return this._filepathrelative;}
	public void setFilePathRelative(String path){this._filepathrelative = path;}
	
	/// <summary>
	/// �ļ�MD5
	/// </summary>		
	private String _filemd5="";
	public String getFileMD5(){return this._filemd5;}
	public void setFileMD5(String md5){this._filemd5 = md5;}
	
	/// <summary>
	/// �ļ��ܴ�С�����ֽ�Ϊ��λ
	/// �ļ���С���ܳ���2G������ʹ��long
	/// </summary>		
	private long _filelength=0;
	public long getFileLength(){return this._filelength;}
	public String getFileLengthStr(){return Long.toString(this._filelength);}
	public void setFileLength(long len){this._filelength = len;}
	public void setFileLength(String len){this._filelength = Long.parseLong(len);}
	
	/// <summary>
	/// ��ʽ�����ļ��ߴ硣ʾ����10.03MB
	/// </summary>		
	private String _filesize="";
	public String getFileSize(){return this._filesize;}
	public void setFileSize(String size){this._filesize = size;}
	
	/// <summary>
	/// �ļ�����λ�á�
	/// �ļ���С���ܳ���2G������ʹ��long
	/// </summary>		
	private long _filepos = 0;
	public long getFilePos(){return this._filepos;}
	public String getFilePosStr(){return Long.toString(this._filepos);}
	public void setFilePos(long pos){this._filepos = pos;}
	
	/// <summary>
	/// ���ϴ���С�����ֽ�Ϊ��λ
	/// �ļ���С���ܳ���2G������ʹ��long
	/// </summary>		
	private long _postedlength = 0;
	public long getPostedLength(){return this._postedlength;}
	public void setPostedLength(long len){this._postedlength = len;}
	
	/// <summary>
	/// ���ϴ��ٷֱȡ�ʾ����10%
	/// </summary>		
	private String _postedpercent = "0%";
	public String getPostedPercent(){return this._postedpercent;}
	public void setPostedPercent(String per){this._postedpercent = per;}
	
	/// <summary>
	/// PostComplete
	/// </summary>		
	private boolean _postcomplete = false;
	public boolean getPostComplete(){return this._postcomplete;}
	public void setPostComplete(boolean b){this._postcomplete = b;}
	
	/// <summary>
	/// PostedTime
	/// </summary>		
	private Date _postedtime;
	public Date getPostedTime(){return this._postedtime;}
	public String getPostedTimeStr()
	{
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		
		String str = fmt.format(this._postedtime);
		return str;
	}
	public void setPostedTime(Date time){this._postedtime = time;}
	
	/// <summary>
	/// IsDeleted
	/// </summary>		
	private boolean _isdeleted = false;
	public boolean getIsDeleted(){return this._isdeleted;}
	public void setIsDeleted(boolean b){this._isdeleted = b;}
	
}
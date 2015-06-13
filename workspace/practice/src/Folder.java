import java.io.File;

public class Folder {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		File directory = new File("");//设定为当前文件夹
		try{
		System.out.println(new Folder().getClass().getResource(""));//获取标准的路径
		System.out.println(directory.getAbsolutePath());//获取绝对路径
		}catch(Exception e){}
	}

}

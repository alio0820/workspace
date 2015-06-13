package com.lzx;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import com.artofsolving.jodconverter.DefaultDocumentFormatRegistry;
import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.DocumentFormat;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

/**
 * doc docx��ʽת��
 * 
 * @author Administrator
 * 
 */
public class ConverterTest {
	private static final int environment = 1;// ���� 1��windows 2:linux
												// (ֻ�漰pdf2swf·������)
	private String fileString;
	private String outputPath = "d:\\1";// ����·�� ����������þ������Ĭ�ϵ�λ��
	private String fileName;
	private File pdfFile;
	private File swfFile;
	private File docFile;

	public ConverterTest(String fileString) {
		ini(fileString);
	}

	/**
	 * ��������file
	 * 
	 * @param fileString
	 */
	public void setFile(String fileString) {
		ini(fileString);
	}

	/**
	 * ��ʼ��
	 * 
	 * @param fileString
	 */
	private void ini(String fileString) {
		this.fileString = fileString;
		fileName = fileString.substring(0, fileString.lastIndexOf("."));
		docFile = new File(fileString);
		pdfFile = new File(fileName + ".pdf");
		swfFile = new File(fileName + ".swf");
	}

	/**
	 * תΪPDF
	 * 
	 * @param file
	 */
	private void doc2pdf() throws Exception {
		if (docFile.exists()) {
			if (!pdfFile.exists()) {
				DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
				DocumentFormat file = formatReg.getFormatByFileExtension("docx");
				DocumentFormat pdf = formatReg.getFormatByFileExtension("pdf");
				
				OpenOfficeConnection connection = new SocketOpenOfficeConnection(
						8100);
				try {
					connection.connect();
					DocumentConverter converter = new OpenOfficeDocumentConverter(
							connection);
					converter.convert(docFile,file, pdfFile,pdf);
					// close the connection
					connection.disconnect();
					System.out.println("****pdfת���ɹ���PDF�����" + pdfFile.getPath()
							+ "****");
				} catch (java.net.ConnectException e) {
					e.printStackTrace();
					System.out.println("****swfת�����쳣��openoffice����δ������****");
					throw e;
				} catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
					e.printStackTrace();
					System.out.println("****swfת�����쳣����ȡת���ļ�ʧ��****");
					throw e;
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			} else {
				System.out.println("****�Ѿ�ת��Ϊpdf������Ҫ�ٽ���ת��****");
			}
		} else {
			System.out.println("****swfת�����쳣����Ҫת�����ĵ������ڣ��޷�ת��****");
		}
	}

	/**
	 * ת���� swf
	 */
	private void pdf2swf() throws Exception {
		Runtime r = Runtime.getRuntime();
		if (!swfFile.exists()) {
			if (pdfFile.exists()) {
				if (environment == 1) {// windows��������
					try {
						System.out.println("E:\\pdf2swf.exe -t "+ pdfFile.getPath() + " -s flashversion=9 -o "+ swfFile.getPath());
//						Process p = r.exec("D:/pdf2swf.exe "+ pdfFile.getPath() + " -o "+ swfFile.getPath() + " -T 9");
						
						Process p = r.exec("D:\\SWFTools\\pdf2swf.exe "+ pdfFile.getPath() + " -o "+ swfFile.getPath() + " -T 9");
						System.out.print(loadStream(p.getInputStream()));
						System.err.print(loadStream(p.getErrorStream()));
						System.out.print(loadStream(p.getInputStream()));
						System.err.println("****swfת���ɹ����ļ������"
								+ swfFile.getPath() + "****");
//						if (pdfFile.exists()) {
//							pdfFile.delete();
//						}

					} catch (IOException e) {
						e.printStackTrace();
						throw e;
					}
				} else if (environment == 2) {// linux��������
					try {
						Process p = r.exec("pdf2swf " + pdfFile.getPath()
								+ " -o " + swfFile.getPath() + " -T 9");
						System.out.print(loadStream(p.getInputStream()));
						System.err.print(loadStream(p.getErrorStream()));
						System.err.println("****swfת���ɹ����ļ������"
								+ swfFile.getPath() + "****");
						if (pdfFile.exists()) {
							pdfFile.delete();
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			} else {
				System.out.println("****pdf������,�޷�ת��****");
			}
		} else {
			System.out.println("****swf�Ѿ����ڲ���Ҫת��****");
		}
	}

	static String loadStream(InputStream in) throws IOException {

		int ptr = 0;
		in = new BufferedInputStream(in);
		StringBuffer buffer = new StringBuffer();

		while ((ptr = in.read()) != -1) {
			buffer.append((char) ptr);
		}

		return buffer.toString();
	}

	/**
	 * ת��������
	 */
	public boolean conver() {

		if (swfFile.exists()) {
			System.out.println("****swfת������ʼ���������ļ��Ѿ�ת��Ϊswf****");
			return true;
		}

		if (environment == 1) {
			System.out.println("****swfת������ʼ��������ǰ�������л���windows****");
		} else {
			System.out.println("****swfת������ʼ��������ǰ�������л���linux****");
		}
		try {
			doc2pdf();
			pdf2swf();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		if (swfFile.exists()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * �����ļ�·��
	 * 
	 * @param s
	 */
	public String getswfPath() {
		if (swfFile.exists()) {
			String tempString = swfFile.getPath();
			tempString = tempString.replaceAll("\\\\", "/");
			return tempString;
		} else {
			return "";
		}

	}

	/**
	 * �������·��
	 */
	public void setOutputPath(String outputPath) {
		this.outputPath = outputPath;
		if (!outputPath.equals("")) {
			String realName = fileName.substring(fileName.lastIndexOf("/"),
					fileName.lastIndexOf("."));
			if (outputPath.charAt(outputPath.length()) == '/') {
				swfFile = new File(outputPath + realName + ".swf");
			} else {
				swfFile = new File(outputPath + realName + ".swf");
			}
		}
	}

	public static void main(String s[]) {
		ConverterTest d = new ConverterTest("e:\\1\\test1.docx");
		d.conver();
	}
}

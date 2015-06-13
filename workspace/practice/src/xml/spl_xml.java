package xml;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class spl_xml {

 public spl_xml(){}

 public void create(String fileName){   // 使用DocumentHelp类创建一个文档实例
  Document doc = DocumentHelper.createDocument();  
  Element rootElement = doc.addElement("root");  
  Element firstElement = rootElement.addElement("info");
  Element element1 = firstElement.addElement("name");
  element1.setText("张三");
  Element element2 = firstElement.addElement("age");
  element2.setText("23");
  Element element3 = firstElement.addElement("sex");
  element3.setText("男");
  // 将创建的XML文档存盘
  try  
  {XMLWriter output = null;
  OutputFormat format = OutputFormat.createPrettyPrint();
   // 使用TAB缩进
   format.setIndent("\t");
   // 创建一个XMLWriter对象
   output = new XMLWriter(new FileOutputStream(new File(fileName)),format);
   output.write(doc);
   output.close(); 
  }
   catch(IOException e)  
   {System.out.println(e.getMessage());
	   }  
   }
   public static void main(String[] args) {
  String fileName = "C://zh.xml";
  spl_xml xmlTest = new spl_xml();
  xmlTest.create(fileName);
 }
}
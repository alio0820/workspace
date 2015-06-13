<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>



<html>
	<head>
		<title>在Iframe中获取服务器端数据</title>
		<script>
           
           var xmlHttp = null;
	function creatXMLHttpRequest()
	{
	    if(window.ActiveXObject)
	    {
	        var arrXmlHttpTypes = ['Microsoft.XMLHTTP','MSXML2.XMLHTTP.6.0',,'MSXML2.XMLHTTP.5.0','MSXML2.XMLHTTP.4.0','MSXML2,XMLHTTP.3.0','MSXML2.XMLHTTP'];
	        for(var i=0;i<arrXmlHttpTypes.length;i++)
	        {
	            try
	            { 
	                xmlHttp = new ActiveXObject(arrXmlHttpTypes[i]);
	                break;
	            }
	            catch(ex)
	            {}
	        }
	    }
	    else if(window.XMLHttpRequest)
	    {
	        xmlHttp = new XMLHttpRequest();
	    }
	}
	function settown()
	{
	    creatXMLHttpRequest();
	    if(xmlHttp!=null)
	    {
	        xmlHttp.onreadystatechange = httpStateChange;
	        xmlHttp.open("get","ddd.asp?townName="+myForm.province.value,true);
	        xmlHttp.send(null);
	    }
	    else
	    {
	        alert("您的浏览器不支持XMLHTTP,请更换浏览器后再进行注册。");
	    }
	}
	function httpStateChange()
	{
	    if(xmlHttp.readyState==4)
	    {
	        if(xmlHttp.status==200||xmlHttp.status==0)
	        {
	            //获得服务器返回的数据
	            var townNames = xmlHttp.responseText;
	            var arr = townNames.split(" ");
	            //删除原有选项
	            for(var i=document.myForm.section.length-1;i>-1;i--)
	            {
	               document.myForm.section.remove(i);
	            }
	            //通过循环添加选项
	            for(var i=0;i<arr.length;i++)
	            { 
	               document.myForm.section.options[i]=new Option(arr[i],arr[i]);
	            }
	        }
	    }
	}        
       </script>
	</head>
	<body>
		<form name="myForm">
			<select name="province" onchange="settown()">
				<option value="hunan">
					湖南省
				</option>
				<option value="guangdong">
					广东省
				</option>
				<option value="hebei">
					河北省
				</option>
			</select>
			<select name="section">
			</select>
</form>
	</body>
</html>
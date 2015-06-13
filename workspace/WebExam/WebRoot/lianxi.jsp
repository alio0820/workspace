<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>  
    <title>My JSP 'Newbox1.jsp' starting page</title>
    <script type="text/javascript">
    function li(){
				var li1 = document.getElementById('li');
				var node = (li1.childNodes)[0].childNodes;
				alert(node[1].innerHTML);
				var dd = document.getElementById('dd');
				dd.innerHTML="哦，那是谁";
			}
	function check(){
		var li1 = document.getElementById('li');
		
		var   a   =   li1.childNodes,   cs=[];
		alert(a.length);
		for(var   i=0;   i <a.length;   i++)
		{
		    if(a[i].nodeType==1   &&   a[i].tagName)   cs[cs.length]   =   a[i];
		} 
		alert(cs.length);
	}
			</script>
  </head> 
  <body>
  <input type="button" value="确定" onclick="li()"/>
  
  <input type="button" value="过滤" onclick="check()"/>
    <ul id="ul">
    	<li id="li">
    		<dl>
	    		<dt>nihao
	    		</dt>
	    		<dd id="dd">嘿，美女
	    		</dd>
    		</dl>
    		<dl>
	    		<dt>nihao
	    		</dt>
	    		<dd>嘿，美女
	    		</dd>
    		</dl>
    	</li>
    </ul>
  </body>
</html>

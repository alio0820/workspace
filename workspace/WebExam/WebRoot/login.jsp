<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>My JSP 'login.jsp' starting page</title>
    <style type="text/css" >
    	a{text-decoration:none;}
    </style>
    <script>
    	function sub(){
    		if(document.getElementById('user').value=="swu123456"){
    		document.form1.action="DealWithServlet";
          	document.form1.submit();
          	}
    	}
    </script>
  </head>
  <body style="background:rgb(22,69,126);">
  <div style="margin:100px auto; width:589px; height:AUTO;" >
  <form name="form1" method="get">
    	<div style="height:116px;width:589px;">
    		<img src="images/user_top_l.gif" style= "padding:   0px;border:   0px;float:left "  width="129px" height="116px"/>
    		<img src="images/user_top_c.gif" style= "padding:   0px;border:   0px;position:absolute;margin-left:-5px;" width="280px" height="116px"/>
    		<img src="images/user_top_r.gif" style= "padding:   0px;border:   0px; position:absolute;margin-left:275px" width="180px" height="116px"/>   		
    	</div>   	
    	<div style="height:116px;width:589px;">
    		<img src="images/user_main_l.gif" style= "padding:   0px;border:   0px;float:left ;"  width="129px" height="116px"/>
    		<div style="background:url(images/user_main_c.gif); width:280px;height:117px;position:absolute;">
    			<div style="height:40px;padding-top:5px;"><span>教师编号：</span><input type="text" name="id" /></div>
    			<div style="height:40px;padding-top:5px;"><span>密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text"id="user" name="user"/></div>
    		</div>
    		<div style="background:url(images/user_main_r.gif);position:absolute;margin-left:275px;width:180px;height:116px">
    			<a href="#" onclick="sub()"><img src="images/user_botton.gif"/></a>
    		</div>
    	</div>
    	<div style="height:116px;width:589px;">
    		<img src="images/user_bottom_l.gif" style= "padding:   0px;border:   0px;float:left "  width="129px" height="117px"/>
    		<img src="images/user_bottom_c.gif" style= "padding:   0px;border:   0px;float:left ;position:absolute;margin-left:-5px;"  width="280px" height="117px"/>
    		<img src="images/user_bottom_r.gif" style= "padding:   0px;border:   0px; position:absolute;margin-left:275px" width="180px" height="117px"/>   		
    	</div></form>
    	</div>
    	
  </body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<script type='text/javascript'>
		function a(){
			alert('你好！');
			document.getElementById('ps111').style.display='none';
			alert('关闭');
		}
	</script>
  <div style='background:rgb(255,255,255);width:100%;height:100%'>
  	<%out.print("你好"); %>
    This is my JSP page. <br>
    <input type='button' value='打招呼' onclick='a()'/>
   </div>


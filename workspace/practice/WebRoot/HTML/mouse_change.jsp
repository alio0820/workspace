<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>鼠标形状地图</title>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <style type="text/css">
    	.mouse1{cursor:se-resize}
    	.mouse2{cursor:s-resize}
    	.mouse3{cursor:sw-resize}
    	.mouse4{cursor:e-resize}
    	.mouse5{cursor:crosshair}
    	.mouse6{cursor:w-resize}
    	.mouse7{cursor:ne-resize}
    	.mouse8{cursor:n-resize}
    	.mouse9{cursor:nw-resize}    	
    </style>
  </head>
  <body style="background:#FFFF00">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
    		<tr>
    			<td align="center">
    				<table border="0" cellpadding="0" cellspacing="0" width="384">
    					<tr align="center">
    						<td class="mouse7" colspan="3" height="50">
    							<font size="7"><b>鼠标形状地图</b></font>
    						</td>
    					</tr>
    					<tr>
    						<td class="mouse1"><img name="map_r1_c1" src ="" alt="东南" width="207" height="202" border="0"/></td>
    						<td class="mouse2"><img name="map_r1_c2" src ="" alt="南" width="116" height="202" border="0"/></td>
    						<td class="mouse3"><img name="map_r1_c3" src ="" alt="西南" width="61" height="202" border="0"/></td>
    					</tr>
    					<tr>
    						<td class="mouse4"><img name="map_r1_c4" src ="" alt="东" width="207" height="69" border="0"/></td>
    						<td class="mouse5"><img name="map_r1_c5" src ="" alt="crosshair" width="116" height="69" border="0"/></td>
    						<td class="mouse6"><img name="map_r1_c6" src ="" alt="西" width="61" height="69" border="0"/></td>
    					</tr>
    					<tr>
    						<td class="mouse7"><img name="map_r1_c7" src ="" alt="东北" width="207" height="58" border="0"/></td>
    						<td class="mouse8"><img name="map_r1_c8" src ="" alt="北" width="116" height="58" border="0"/></td>
    						<td class="mouse9"><img name="map_r1_c9" src ="" alt="西北" width="61" height="58" border="0"/></td>
    					</tr>
    				</table>
    			</td>
    		</tr>
    	</table>
  </body>
</html>

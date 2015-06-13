<html>
  <head>
    <title>城市</title>
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
  </head>
  <body style="margin:0px">
     <select name="town">
     <%
        '获得townName参数的值
        townName= request.QueryString("townName")
        townName="hunan"
        '判断身份是否为湖南，如果是湖南，则输出以下代码
        if townName="hunan" then
     %>
     <option value= "changsha">长沙市</option>
	 <option value= "hengyang">衡阳市</option>
	 <option value= "zhuzhou">株洲市</option>
	 
	 <%
        '判断身份是否为广东，如果是广东，则输出以下代码
        elseif townName="guangdong" then
     %>
     <option value= "guangzhou">广州市</option>
	 <option value= "qingyuan">清远市</option>
	 <option value= "zhaoqing">肇庆市</option>
	 
	 <%
        '判断身份是否为河北，如果是河北，则输出以下代码
        elseif townName="hebei" then
     %>
     <option value= "shijiazhuang">石家庄市</option>
	 <option value= "baoding">保定市</option>
	 <option value= "zhangjiakou">张家口市</option>
	 <%
	    end if
	 %>
	 </select>
  </body>
</html>

<html>
  <head>
    <title>����</title>
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
  </head>
  <body style="margin:0px">
     <select name="town">
     <%
        '���townName������ֵ
        townName= request.QueryString("townName")
        townName="hunan"
        '�ж�����Ƿ�Ϊ���ϣ�����Ǻ��ϣ���������´���
        if townName="hunan" then
     %>
     <option value= "changsha">��ɳ��</option>
	 <option value= "hengyang">������</option>
	 <option value= "zhuzhou">������</option>
	 
	 <%
        '�ж�����Ƿ�Ϊ�㶫������ǹ㶫����������´���
        elseif townName="guangdong" then
     %>
     <option value= "guangzhou">������</option>
	 <option value= "qingyuan">��Զ��</option>
	 <option value= "zhaoqing">������</option>
	 
	 <%
        '�ж�����Ƿ�Ϊ�ӱ�������Ǻӱ�����������´���
        elseif townName="hebei" then
     %>
     <option value= "shijiazhuang">ʯ��ׯ��</option>
	 <option value= "baoding">������</option>
	 <option value= "zhangjiakou">�żҿ���</option>
	 <%
	    end if
	 %>
	 </select>
  </body>
</html>

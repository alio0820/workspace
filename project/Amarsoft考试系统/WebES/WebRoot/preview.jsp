<%@page import="com.ui.previewUI"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="com.action.PaperAction,com.bean.PaperTopicBean,com.bean.PaperBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- IE��div���ܾ����������ĵ����Ͷ�������� -->
<html>
	<head>
		<!-- saved from url=(0013)about:internet -->
		<title>���߿���</title>
		<script src="js/LodopFuncs.js"></script>
		
	<script>
		var time_login=3600;
		function time(){			
			time_login=time_login-1;
			document.getElementById('time').innerHTML="��ʱ��"+Math.floor(time_login/60)+"��"+time_login%60+"��";
			//Math.round(n1);�������룬Math.floor(n1)���ز����ڸ��������������������λС����:n1.toFixed(2)
			if(time_login==300) alert("�뽻��ֻ������ӣ���ץ��ʱ�䣡");
			if(time_login==0) {
				//window.showModalDialog("Newbox.jsp",window,"status:no;scroll:no;dialog;dialogHeight:100px"); 				
				alert("����ʱ�䵽������30��֮���ύ�Ծ�");
				time_login=30;
			}
		}
		function check(){											//�����
			var que_total=[]; 										//����洢ÿ����Ĵ������
			var total=0;										    //ͳ��δ��ɵ���Ŀ����Ŀ
			for(var i=1;i<=80;i++){
				var que= document.getElementsByName(i);
				for(var j=0;j<que.length;j++){
					if(que[j].checked) {que_total[i]=0;break;} 		//��������ļ��˳�ѭ��
					else que_total[i]=1;
				}
				total=total+que_total[i];
			}
			if(total==0) {
				tijiao();
				return true;
			}
			var que_every="";
			var que_num="�㻹����������δ�������\n";
			for(var i=1;i<=40;i++){									//�жϵ�һ��������Щû����
				if(que_total[i]==1) que_every=que_every+i+"��";
			}
			if(que_every!=""){										//���������ʾ
				que_every=que_every.substr(0,que_every.length-1);	//ȥ�����һ���ٺ�									
				que_num=que_num+"��һ����ĵ�"+que_every+"��\n";		
				que_every="";
			}
			for(var i=41;i<=60;i++){								//�жϵڶ���������Щû����				
				if(que_total[i]==1) que_every=que_every+(i-40)+"��";
			}
			if(que_every!=""){										
				que_every=que_every.substr(0,que_every.length-1);
				que_num=que_num+"�ڶ�����ĵ�"+que_every+"��\n";
				que_every="";
			}
			for(var i=61;i<=80;i++){								//�жϵ�����������Щû����
				if(que_total[i]==1) que_every=que_every+(i-60)+"��";
			}
			if(que_every!=""){
				que_every=que_every.substr(0,que_every.length-1);
				que_num=que_num+"��������ĵ�"+que_every+"��\n";
				que_every="";
			}
			que_num=que_num+"�뼰ʱ��ɴ��";
			return que_num;
		}
		
		function tijiao(){											//�ύ���
			var userSingleAnswer="#";
			for(var i=1;i<=40;i++){
				var tt=false;
				var que= document.getElementsByName(i);
				for(var j=0;j<que.length;j++){
					if(que[j].checked) {
						userSingleAnswer=userSingleAnswer+que[j].value;
						tt=true;
					}										
				}
				if(!tt)  userSingleAnswer=userSingleAnswer+"0";				
			}
			var userMultipleAnswer="#;";
			for(var i=41;i<=60;i++){
				var tt=false;
				var que= document.getElementsByName(i);
				for(var j=0;j<que.length;j++){
					if(que[j].checked) {
						userMultipleAnswer=userMultipleAnswer+que[j].value;
						tt=true;
					}
				}
				if(!tt) userMultipleAnswer=userMultipleAnswer+"0;";
				else userMultipleAnswer= userMultipleAnswer+";";
			}
			userMultipleAnswer = userMultipleAnswer.substr(0,userMultipleAnswer.length-1);			
			var userJudgeAnswer = "#";
			for(var i=61;i<=80;i++){
				var tt=false;
				var que= document.getElementsByName(i);
				for(var j=0;j<que.length;j++){
					if(que[j].checked) {
						userJudgeAnswer=userJudgeAnswer+que[j].value;
						tt=true;
					}
				}
				if(!tt) userJudgeAnswer=userJudgeAnswer+"0";
			}
			document.getElementById('userSingleAnswer').value=userSingleAnswer;
			document.getElementById('userMultipleAnswer').value=userMultipleAnswer;
			document.getElementById('userJudgeAnswer').value=userJudgeAnswer;
			document.form2.action="AcceptServlet";
			document.form2.submit();
		}
					
		function sub(){
			var sub_str=check()+"\n\n��ȷ��Ҫ�ύ�Ծ���";
			if(confirm(sub_str)){
				tijiao();
			}
		}
		
		function danxuan(){			
			document.getElementById('danxuan').style.display='block';
			document.getElementById('duoxuan').style.display='none';
			document.getElementById('panduan').style.display='none';
		}
		
		function duoxuan(){			
			document.getElementById('danxuan').style.display='none';
			document.getElementById('duoxuan').style.display='block';
			document.getElementById('panduan').style.display='none';
		}
		
		function panduan(){			
			document.getElementById('danxuan').style.display='none';
			document.getElementById('duoxuan').style.display='none';
			document.getElementById('panduan').style.display='block';
		}
		
		function htmlprint(){
			window.print();
		}
		setInterval("time()",1000);
		
		function CreateOnePage(){
			LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));
			LODOP.PRINT_INIT("��ӡ�ؼ�������ʾ_Lodop����_��ҳ���Ŵ�ӡ���");
			LODOP.ADD_PRINT_HTM(5,5,"100%","100%",document.documentElement.innerHTML);
			LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");
		}
		function prn_preview11() {
			CreateOnePage();
			LODOP.SET_PRINT_MODE("PRINT_PAGE_PERCENT","84%");
			LODOP.PREVIEW();
		}
	</script>
	<style type="text/css">
		.body{
			background-color: #198bc9;font-size:15px;
			scrollbar-3d-light-color:black;
		}
		.div_all{
			width:930px;padding:5px 5px;margin:auto;position:relative;background-color:white;
		}
		.top{
			background:url(images/top.png) repeat-x;height:65px
		}
		.top_text{color:rgb(65,122,193); width:500px; margin:auto; font-size:12px;padding:26px 0px;}
		.title{border:1px dashed red;font-family:Verdana, Arial, Helvetica, sans-serif;margin:10px 10px;padding:5px 0px;font-size:20px;color:red;background:rgb(252,235,220)}
		.question{border:1px dashed rgb(201,201,201);margin:10px 10px;padding:5px}
		.answer{border:1px solid rgb(201,201,201);margin:10px 10px;padding:2px;color:rgb(102,102,102);background:rgb(244,244,244)}
		.hr{color:rgb(201,201,201)}
		table{width:98%;}
		table td.small{width:10px;}
		#pro_line{width:192px;margin:auto;position:relative;height:25px;background:url(images/blue.png);display:none}
		#pro_line li{background:url(images/blue.png);float:left;list-style:none}
		#pro_line .select li.dan A:hover B { BACKGROUND:url(images/red.png) right top } 
		.tip{margin-left:10px;font-size:14px;}
		.print{display:none;}
	</style>
	<style media=print type="text/css">  
		.noprint{display:none;}
		.print{display:block;}
	</style>
		<object id="LODOP_OB" width="0" height="0" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA">
			<embed id="LODOP_EM" width="0" height="0" pluginspage="install_lodop32.exe" type="application/x-print-lodop">
		</object>
	</head>
	<body class="body">
		<%
			String paperId = request.getParameter("paperId");
			PaperBean pb = PaperAction.getPaperDetail(paperId);
			List ptbList = PaperAction.getPaperTopicByType(paperId);
			int size_ptbList = ptbList.size();
		%>
		<div id="previewMain" class="div_all">
		<div class="top">
			<div class="top_text">
				<span>����ʱ�䣺60����&nbsp;&nbsp;������ţ�<%=request.getAttribute("id") %>&nbsp;&nbsp;�ܷ֣�100��&nbsp;&nbsp;</span>
				<span id="time">��ʱ��60��0��</span>
			</div>
		</div>
	    <h1 id="paperName" align="center"><%=pb.getExamPaperName()%></h1>
	    <center class="print">
	    	����:____________רҵ��___________��ϵ��ʽ��____________
	    </center>
	    <div class="tip print">������֪������𰸱�����д�ڴ��⿨�ϣ�д���Ծ��ϲ��÷�</div>
	    <div id="pro_line">
	    	<ul class="select">
	    		<li class="dan"><a href="#"></a></li>
	    		<li class="duo"><a href="#"></a></li>
	    		<li class="pan"><a href="#"></a></li>
	    	</ul>
	    </div>
	    <center class="noprint">
		    <input type="button" value="��ѡ��" onclick="danxuan()"/>
		    <input type="button" value="��ѡ��" onclick="duoxuan()"/>
		    <input type="button" value="�ж���" onclick="panduan()"/>
		    <input type="button" value="��ӡ" onclick="prn_preview11()"/>
	    </center>
		<hr>
		<form name="form1" METHOD="POST">
			<%
				String topicTypeBefore = "";
				String topicTypeNow = "";
				Boolean isFirst = true;
				int part = 0;
				for(int i=0;i<size_ptbList;i++){
					PaperTopicBean ptb = (PaperTopicBean)ptbList.get(i);
					topicTypeNow = ptb.getTopicTypeId();
					if(!topicTypeNow.equals(topicTypeBefore)){
						if(i!=0)
							out.println("</div>");
						out.println("<div id=\""+ptb.getTopicTypeId()+"\"><div class=\"title\"><b>"+previewUI.numTransformation[part]+"��"+ptb.getTopicTypeName()+"��"+ptb.getTopicTypeRemark()+"��</b></div>");
						//out.println("<div class=\"title\"><b>��[yi]���֣�"+ptb.getTopicTypeName()+"</b></div>");
						part++;
					}
					if(i+1==size_ptbList)
						out.println("</div>");
					out.println(previewUI.showTopic(ptb,i+1));
					topicTypeBefore = topicTypeNow;
				}
			%>		
			
			<center class="noprint">
					<input type="button" value="�����" onclick="check()"/>
					<input type="button" value="�ύ�Ծ� " onclick="sub()"/>				
			</center>
		</form>
		<form name="form2" method="get">
					<input type="hidden" name="id" id="id" value=    '<%=request.getAttribute("id")%>'     />
					<input type="hidden" name="user" id="user" value=    '<%=request.getAttribute("user")%>'     />
					<input type="hidden" name="userSingleAnswer" id="userSingleAnswer">
					<input type="hidden" name="userMultipleAnswer" id="userMultipleAnswer">
					<input type="hidden" name="userJudgeAnswer" id="userJudgeAnswer">
		</form>
		</div>
	</body>
</html>
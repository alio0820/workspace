<%@page import="com.ui.previewUI"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="com.action.PaperAction,com.bean.PaperTopicBean,com.bean.PaperBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- IE下div不能居中是由于文档类型定义的问题 -->
<html>
	<head>
		<!-- saved from url=(0013)about:internet -->
		<title>在线考试</title>
		<script src="js/LodopFuncs.js"></script>
		
	<script>
		var time_login=3600;
		function time(){			
			time_login=time_login-1;
			document.getElementById('time').innerHTML="计时："+Math.floor(time_login/60)+"分"+time_login%60+"秒";
			//Math.round(n1);四舍五入，Math.floor(n1)返回不大于该数的最大整数；保留两位小数点:n1.toFixed(2)
			if(time_login==300) alert("离交卷只有五分钟，请抓紧时间！");
			if(time_login==0) {
				//window.showModalDialog("Newbox.jsp",window,"status:no;scroll:no;dialog;dialogHeight:100px"); 				
				alert("答题时间到，请在30秒之内提交试卷！");
				time_login=30;
			}
		}
		function check(){											//检测答卷
			var que_total=[]; 										//数组存储每道题的答题情况
			var total=0;										    //统计未完成的题目的数目
			for(var i=1;i<=80;i++){
				var que= document.getElementsByName(i);
				for(var j=0;j<que.length;j++){
					if(que[j].checked) {que_total[i]=0;break;} 		//遇到作答的即退出循环
					else que_total[i]=1;
				}
				total=total+que_total[i];
			}
			if(total==0) {
				tijiao();
				return true;
			}
			var que_every="";
			var que_num="你还有以下试题未完成作答：\n";
			for(var i=1;i<=40;i++){									//判断第一大题有哪些没作答
				if(que_total[i]==1) que_every=que_every+i+"、";
			}
			if(que_every!=""){										//补充相关提示
				que_every=que_every.substr(0,que_every.length-1);	//去掉最后一个顿号									
				que_num=que_num+"第一大题的第"+que_every+"题\n";		
				que_every="";
			}
			for(var i=41;i<=60;i++){								//判断第二大题有哪些没作答				
				if(que_total[i]==1) que_every=que_every+(i-40)+"、";
			}
			if(que_every!=""){										
				que_every=que_every.substr(0,que_every.length-1);
				que_num=que_num+"第二大题的第"+que_every+"题\n";
				que_every="";
			}
			for(var i=61;i<=80;i++){								//判断第三大题有哪些没作答
				if(que_total[i]==1) que_every=que_every+(i-60)+"、";
			}
			if(que_every!=""){
				que_every=que_every.substr(0,que_every.length-1);
				que_num=que_num+"第三大题的第"+que_every+"题\n";
				que_every="";
			}
			que_num=que_num+"请及时完成答卷！";
			return que_num;
		}
		
		function tijiao(){											//提交答卷
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
			var sub_str=check()+"\n\n你确定要提交试卷吗？";
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
			LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_整页缩放打印输出");
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
				<span>考试时间：60分钟&nbsp;&nbsp;考生编号：<%=request.getAttribute("id") %>&nbsp;&nbsp;总分：100分&nbsp;&nbsp;</span>
				<span id="time">计时：60分0秒</span>
			</div>
		</div>
	    <h1 id="paperName" align="center"><%=pb.getExamPaperName()%></h1>
	    <center class="print">
	    	姓名:____________专业：___________联系方式：____________
	    </center>
	    <div class="tip print">考试须知：试题答案必须填写在答题卡上，写在试卷上不得分</div>
	    <div id="pro_line">
	    	<ul class="select">
	    		<li class="dan"><a href="#"></a></li>
	    		<li class="duo"><a href="#"></a></li>
	    		<li class="pan"><a href="#"></a></li>
	    	</ul>
	    </div>
	    <center class="noprint">
		    <input type="button" value="单选题" onclick="danxuan()"/>
		    <input type="button" value="多选题" onclick="duoxuan()"/>
		    <input type="button" value="判断题" onclick="panduan()"/>
		    <input type="button" value="打印" onclick="prn_preview11()"/>
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
						out.println("<div id=\""+ptb.getTopicTypeId()+"\"><div class=\"title\"><b>"+previewUI.numTransformation[part]+"、"+ptb.getTopicTypeName()+"（"+ptb.getTopicTypeRemark()+"）</b></div>");
						//out.println("<div class=\"title\"><b>第[yi]部分："+ptb.getTopicTypeName()+"</b></div>");
						part++;
					}
					if(i+1==size_ptbList)
						out.println("</div>");
					out.println(previewUI.showTopic(ptb,i+1));
					topicTypeBefore = topicTypeNow;
				}
			%>		
			
			<center class="noprint">
					<input type="button" value="检测答卷" onclick="check()"/>
					<input type="button" value="提交试卷 " onclick="sub()"/>				
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
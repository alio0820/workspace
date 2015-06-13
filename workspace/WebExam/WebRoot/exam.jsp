<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- IE下div不能居中是由于文档类型定义的问题 -->
<html>
	<head>
		<!-- saved from url=(0013)about:internet -->
		<title>在线考试</title>
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
		setInterval("time()",1000);
	</script>
	<style type="text/css">
		.body{
			background-color: #198bc9;font-size:15px
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
		
		#pro_line{width:192px;margin:auto;position:relative;height:25px;background:url(images/blue.png);display:none}
		#pro_line li{background:url(images/blue.png);float:left;list-style:none}
		#pro_line .select li.dan A:hover B { BACKGROUND:url(images/red.png) right top } 
	</style>


	</head>
	<body class="body">
		<div class="div_all">
		<div class="top">
			<div class="top_text">
				<span>考试时间：60分钟&nbsp;&nbsp;考生编号：<%=request.getAttribute("id") %>&nbsp;&nbsp;总分：100分&nbsp;&nbsp;</span>
				<span id="time">计时：60分0秒</span>
			</div>
		</div>
	    <h1 align="center">西南大学第二届辅导员职业技能竞赛基础知识测试试题</h1>
	    <div id="pro_line">
	    	<ul class="select">
	    		<li class="dan"><a href="#"></a></li>
	    		<li class="duo"><a href="#"></a></li>
	    		<li class="pan"><a href="#"></a></li>
	    	</ul>
	    </div>
	    <center>
		    <input type="button" value="单选题" onclick="danxuan()"/>
		    <input type="button" value="多选题" onclick="duoxuan()"/>
		    <input type="button" value="判断题" onclick="panduan()"/>
	    </center>
		<hr>
		<form name="form1" METHOD="POST">
					
			<!--1.单选题 -->
			<div id="danxuan">
			<div class="title">
			<b>第一部分：1. 单项选择题（每小题1分，小计40分）</b>
			</div>
			<div>
				<div class="question">					
						<font color="red">第1题：</font>西南大学2005年7月经教育部批准由西南师范大学、西南农业大学合并组建而成。原两校发轫于1906年在西南地区开中国新学的（ ）。
					<BR/>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 国立女子师范学院	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD>相辉学院	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 川东师范学院</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 四川省立教育学院</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="1" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="1" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="1" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="1" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第2题：</font>根据《普通高等学校学生安全教育及管理暂行规定》，学生未经学校批准擅自离校不归发生意外事故的，学校不承担责任。（  ）不归且未说明原因，学校可张榜公布，按自动退学除名。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 7天	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 10天	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD>半个月</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 一个月</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 两个月</TD>
						</TR>						
					</TABLE>
				</div>
				<div class="answer">						
				选择答案：
						A<INPUT NAME="2" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="2" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="2" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="2" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="2" TYPE="RADIO" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第3题：</font>学生因病或其它原因不能坚持学习，应当办理请假手续。达到（  ）个工作日的，由主管教学院长签署意见，报教务处审批。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 3	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 5	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 7</TD>
						</TR>						
						<TR>
							<TD>&nbsp;D.</TD>
							<TD> 10</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="3" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="3" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="3" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="3" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第4题：</font>每年3月5日定为学雷锋纪念日，是因为这天是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 雷锋同志生日	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 雷锋同志去世的日子	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 毛泽东主席题词“向雷锋同志学习”的日子</TD>
						</TR>						
						
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="4" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="4" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="4" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第5题：</font>在创先争优活动中开展基层组织建设年的主题是(  )。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 一讲二评三公示	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD>抓党建、促三风、建三高	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 强组织、增活力，创先争优迎十八大 </TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 抓落实、全覆盖、求实效、受欢迎</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 五个进一步提升</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 三创六进</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="5" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="5" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="5" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="5" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="5" TYPE="RADIO" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="5" TYPE="RADIO" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第6题：</font>学校党委组织部要求，党员组织生活（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 每周不少于一次	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 每月不少于两次	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 每月不少于一次</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 每季度不少于两次</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 每学期不少于两次</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="6" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="6" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="6" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="6" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="6" TYPE="RADIO" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第7题：</font>今年是建团90周年，是因为(  )。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 90年前爆发了反对帝国主义、封建主义的五四爱国运动	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD>90年前社会主义青年团成立</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD>90年前中国新民主主义青年团成立</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD>90年前民主青年团成立</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD>90年前中国新民主主义青年团召开第一次全国代表大会</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD>90年前中国社会主义青年团召开第一次全国代表大会</TD>
						</TR>
						<TR>
							<TD> &nbsp;G.</TD>
							<TD>90年前中国社会主义青年团改名为中国共产主义青年团</TD>
						</TR>
						<TR>
							<TD> &nbsp;H.</TD>
							<TD>90年前中国社会主义青年团改名为中国共产主义青年团</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="7" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="7" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="7" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="7" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="7" TYPE="RADIO" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="7" TYPE="RADIO" VALUE="F">&nbsp;&nbsp;&nbsp;
						G<INPUT NAME="7" TYPE="RADIO" VALUE="G">&nbsp;&nbsp;&nbsp;
						H<INPUT NAME="7" TYPE="RADIO" VALUE="H">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第8题：</font>《西南大学二级党组织工作细则》规定，二级党组织委员候选人( )。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 应具有2年以上党龄	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 应具有3年以上党龄	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 应具有5年以上党龄</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 应具有副高以上职称或者科以上职务</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="8" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="8" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="8" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="8" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第9题：</font>学校党委关于党员（党员代表）大会选举办法规定，有选举权的到会党员（代表）超过应到数的（  ），方可进行选举。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD>五分之四 </TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 三分之二	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 二分之一</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 五分之三</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="9" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="9" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="9" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="9" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第10题：</font>毕业生离校时无故将党组织关系滞留学校超过（   ）以上的，根据党章规定按照自动脱党处理，不再办理组织关系接转事宜。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 两个月	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 三个月	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 六个月</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 一年</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 二年</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 三年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="10" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="10" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="10" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="10" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="10" TYPE="RADIO" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="10" TYPE="RADIO" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第11题：</font>每年对学生进行综合考评，各学院应当成立综合考评工作领导小组和学生考评小组，学生考评小组须在辅导员（班主任）的指导下进行工作。其中学生考评小组的组成人员是（ ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 班、团干部	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 班、团干部及辅导员（班主任）	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 班、团干部及学生代表</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 班、团干部、学生代表和辅导员（班主任）</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="11" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="11" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="11" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="11" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第12题：</font>根据学生手册规定，学生综合考评成绩由以下几部分组成（ ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 思想政治素质、学习成绩、工作表现	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 德育考评、课堂学习效果和拓展性素质评价	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 学习成绩、工作表现和参加集体活动表现</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 思想政治素质、学习成绩和参加活动情况</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="12" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="12" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="12" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="12" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第13题：</font>根据《西南大学学生先进集体和个人评选表彰办法》规定，三好学生和优秀学生干部的评选比例分别是按参评学生人数的（ ）评选。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD>3%、7%	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 5%、9%	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 7%、3%</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 9%、5%</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="13" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="13" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="13" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="13" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第14题：</font>根据《西南大学本科学生转专业实施办法》，同一专业年级转出学生数量不超过该专业年级学生数的（    ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 2%	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 3%	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 5%</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 7%</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="14" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="14" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="14" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="14" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第15题：</font>根据学校学士学位授予条件有关规定，培养方案规定的学科基础课程、专业必修课程和实践教学环节的平均学分绩点最低应达到（  ）绩点才能授予学士学位。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 1.8	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 2.0	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD>  2.4 </TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 3.0</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="15" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="15" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="15" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="15" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第16题：</font>我们常说的“24号令”颁发的是（    ）文件。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 《关于普通高等学校加强大学生思想政治教育的规定》	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 《关于进一步加强和改进大学生思想政治教育的意见》	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 《关于普通高等学校学生工作队伍建设的规定》</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 《普通高等学校辅导员队伍建设规定》</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="16" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="16" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="16" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="16" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第17题：</font>加强和改进大学生思想政治教育要求做到“三贴近”，指的是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 贴近实际、贴近生活、贴近学生	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 贴近学习、贴近生活、贴近工作	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 贴近思想、贴近青年、贴近课堂</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 贴近课堂、贴近学习、贴近实践</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="17" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="17" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="17" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="17" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第18题：</font>大学生思想政治教育的主渠道是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 思想品德与法律基础课	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 马克思主义原理课	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 思想政治理论课</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 形势政策课</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="18" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="18" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="18" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="18" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第19题：</font>开展大学思想政治教育，要求做好“三进”工作，这“三进”指的是（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 进社团、进课堂、进寝室	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 进教材、进社团、进课堂	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 进公寓、进网络、进社团</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 进教材、进课堂、进大学生头脑</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="19" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="19" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="19" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="19" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第20题：</font>“16号文件”明确指出，大学生思想政治教育的骨干力量是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 学校党政干部和共青团干部	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 思想政治理论课教师	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 分管学生工作的副书记和辅导员</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 辅导员和班主任</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="20" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="20" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="20" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="20" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第21题：</font>我们在开展大学生思想政治教育活动中常说的“三育人”，指的是（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 教书育人、管理育人、环境育人 </TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD>教书育人、管理育人、服务育人	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 教书育人、思想育人、学习育人</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 教书育人、文化育人、环境育人</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="21" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="21" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="21" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="21" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第22题：</font>根据《普通高等学校学生管理规定》，新生入学后，学校在（  ）内按照国家招生规定对其进行复查。复查合格者予以注册，取得学籍。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 3个月	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 6个月	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 9个月</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 12个月</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="22" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="22" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="22" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="22" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第23题：</font>对患有疾病的新生，经学校指定的二级甲等以上医院诊断不宜在校学习的，可以保留入学资格（    ）年,保留入学资格者（    ）学籍。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 半年、不具有	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 半年、具有	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 1年、具有</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 1年、不具有</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="23" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="23" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="23" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="23" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第24题：</font>学生应征参军，学校应当保留其学籍（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 一年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 两年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 至退役</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 至退役后一年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="24" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="24" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="24" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="24" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第25题：</font>学生对处分决定有异议的，在接到学校处分决定书之日起在（    ）个工作日内，可以向学校有关机构提出书面申诉。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 5	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 7	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 10</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 15</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="25" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="25" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="25" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="25" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第26题：</font>学生考核不合格课程应当申请重修，一门课程在校期间重修不得超过（  ）次，成绩合格后记载为60分或者及格。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 2	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 3	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 4 </TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 5 </TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="26" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="26" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="26" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="26" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第27题：</font>学生可以分阶段完成学业。本科学生在校学习年限（含休学）可以是（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 3～6年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 3～8年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 4～6年</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 4～6年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="27" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="27" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="27" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="27" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第28题：</font>休学学生应当办理休学手续，在办完手续后（   ）个工作日内离校。学生休学期间，学校保留其（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 2、学籍	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 5、学籍	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 7、待遇</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 10、待遇</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="28" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="28" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="28" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="28" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第29题：</font>我国的基本经济制度是（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 社会主义市场经济制度	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 公有制为主体、多种所有制经济共同发展	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 各尽所能、按劳分配</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 按劳分配、兼顾公平</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="29" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="29" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="29" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="29" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第30题：</font>发展党员要个别履行入党手续。一次支部大会讨论发展党员人数不超过（   ）人，对每个人的讨论时间不少于（    ）分钟。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 2人、15分钟	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 3人、20分钟	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 4人、30分钟</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 5人、35分钟</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="30" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="30" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="30" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="30" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第31题：</font>召开支部大会进行党员组织发展工作时，实到有表决权的党员人数应不少于应到人数的（  ）才能开会，并且，发展对象及入党介绍人必须到会。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 1/2	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 2/3	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD>3/4</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 4/5</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="31" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="31" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="31" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="31" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第32题：</font>我们常说的“三会一课”制度，指的是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 团员大会、团支部大会、团支部学习会和团课	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 民主生活会、政治学习会、组织生活会和政治学习课	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 支部党员大会、党支部委员会议、党小组会议和党课</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 党政联席会、教职工大会、政治学习会和政治学习课</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="32" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="32" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="32" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="32" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第33题：</font>党的全国代表大会每几年举行一次？（  ）
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 三年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 四年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 五年</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 六年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="33" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="33" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="33" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="33" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第34题：</font>国家助学贷款（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 实行借款学生在校期间的贷款利息全部由财政补贴，毕业后全部自付	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 实行借款学生在校期间贷款利息全部由财政补贴，毕业后也由财政补贴	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 实行借款学生在校期间的贷款利息全部由财政补贴，毕业后由财政补贴一半，自付一半</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 实行借款学生在校期间的贷款利息全部自付，毕业后全部自付</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="34" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="34" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="34" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="34" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第35题：</font>根据国家助学贷款政策规定，借款学生从（   ）起开始自付利息。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 开始偿还本金之日	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 毕业后第一天	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 根据自己与银行签定的还款协议而定</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 毕业后两年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="35" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="35" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="35" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="35" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第36题：</font>国家助学贷款必须在借款学生毕业后（   ）内年还清。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 7年</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 6年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 4年</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD>2年</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="36" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="36" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="36" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="36" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第37题：</font>国家助学贷款金额每人每年最多不得超过（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 4000元	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 5000元	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 6000元</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 8000元</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="37" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="37" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="37" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="37" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第38题：</font>国家制定的《国家中长期教育改革和发展规划纲要》的战略目标是（   ）
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 到2015年，努力实现教育现代化，努力形成学习型社会，进入教育先进国家行列	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 到2020年，基本实现教育现代化，基本形成学习型社会，进入人力资源强国行列	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 到2025年，走上教育现代化之路，达到学习型社会标准，进入教育发达国家行列</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 到2030年，全面实现教育现代化，实现学习型社会目标，进入教育资源强国行列</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="38" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="38" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="38" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="38" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第39题：</font>自1997年大连举行第一届中国国际园林博览会以来，已先后举办过多届，在重庆举办的这次园博会是第（   ）届。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 15	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 10	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 8</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 6</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="39" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="39" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="39" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="39" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第40题：</font>当前我国高等教育改革发展最核心最紧迫的任务是（   ）
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 加快改革创新	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 提高教育质量	</TD>
						</TR>
						<TR>
							<TD> &nbsp;C.</TD>
							<TD> 落实教育规划纲要</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 优化人才培养结构</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="40" TYPE="RADIO" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="40" TYPE="RADIO" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="40" TYPE="RADIO" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="40" TYPE="RADIO" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			</div>
			<!--2.多选题 -->
			<div id="duoxuan">
			<div class="title">
			<b>第二部分：2. 多项选择题（每小题2分，小计40分。凡多选、少选、错选均不得分）</b>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第1题：</font>加强和改进大学生思想政治教育的基本原则有（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 坚持教书与育人相结合	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 坚持教育与自我教育相结合	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 坚持政治理论教育与社会实践相结合</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 坚持解决思想问题与解决实际问题相结合</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 坚持教育与管理相结合</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 坚持继承优良传统与改进创新相结合</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="41" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="41" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="41" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="41" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="41" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="41" TYPE="checkbox" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
						<font color="red">第2题：</font>加强和改进大学生思想政治教育的主要任务有(   )。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 以理想信念教育为核心，深入进行树立正确的世界观人生观和价值观教育。	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 以爱国主义教育为重点，深入进行弘扬和培育民族精神教育。	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 以基本道德规范为基础，深入进行公民道德教育。</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 以大学生全面发展为目标，深入进行素质教育。</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="42" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="42" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="42" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="42" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第3题：</font>有下列哪些情况者，不能授予学士学位？（  ）
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 在校学习时间超过4年	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 未获得毕业证书	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 未过英语四级考试</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 未过计算机二级考试</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 培养方案规定的学科基础课程、专业发展必修课程和实践教学环节的平均学分绩点未达到2.0</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="43" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="43" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="43" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="43" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="43" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第4题：</font>今年3月下旬学校党委下发《关于在基层组织建设年活动中开展“双千双带计划”的实施方案》中的“双千双带”是指（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 组织1000余名教职工党员联系学生寝室	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 组织1000余名教职工党员帮带1000个学生班级	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 组织1000余名教职工党员帮扶1000名困难学生</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 组织1000余名学生党员联系学生入党积极分子</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 组织1000余名学生党员帮带1000名困难学生</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 组织1000余名学生党员带动1000个学生寝室岛</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="44" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="44" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="44" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="44" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="44" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="44" TYPE="checkbox" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第5题：</font>我校二级党组织委员会一般设书记、副书记以及（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 青年委员	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 生活委员	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 纪检委员</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 政保委员</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 保密委员</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 宣传委员</TD>
						</TR>
						<TR>
							<TD> &nbsp;G.</TD>
							<TD> 统战委员</TD>
						</TR>
						<TR>
							<TD> &nbsp;H.</TD>
							<TD> 文体委员</TD>
						</TR>
						<TR>
							<TD> &nbsp;I.</TD>
							<TD> 组织委员</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="45" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="45" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="45" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="45" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="45" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="45" TYPE="checkbox" VALUE="F">&nbsp;&nbsp;&nbsp;
						G<INPUT NAME="45" TYPE="checkbox" VALUE="G">&nbsp;&nbsp;&nbsp;
						H<INPUT NAME="45" TYPE="checkbox" VALUE="H">&nbsp;&nbsp;&nbsp;
						I<INPUT NAME="45" TYPE="checkbox" VALUE="I">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第6题：</font>社会主义核心价值体系的基本内容是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 马克思主义指导思想	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 中国特色社会主义共同理想	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 以爱国主义为核心的民族精神和以改革创新为核心的时代精神</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 以“八荣八耻”为主要内容的社会主义荣辱观</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="46" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="46" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="46" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="46" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第7题：</font>高等学校教师职业道德规范的主要内容是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 爱国守法,敬业爱生 	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 教书育人,严谨治学	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 廉洁自律，淡薄名利</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 服务社会,为人师表</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="47" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="47" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="47" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="47" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第8题：</font>胡锦涛总书记在清华大学百年校庆讲话中给青少年提出的希望是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 把文化知识学习和思想品德修养紧密结合起来	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 把创新能力和实践能力培养紧密结合起来	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 把创新思维和社会实践紧密结合起来</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 把全面发展和个性发展紧密结合起来</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="48" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="48" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="48" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="48" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第9题：</font>我党在推进马克思主义中国化的历史进程中产生的两大理论成果是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 毛泽东思想	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 邓小平理论	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> “三个代表”重要思想以及科学发展观</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 中国特色社会主义理论体系</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="49" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="49" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="49" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="49" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第10题：</font>我党在这90年的奋斗、创造、积累，取得了以下（  ）成就。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 开辟了中国特色社会主义道路	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 形成了中国特色社会主义理论体系	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 确立了中国特色社会主义制度</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 实现了全面建设小康社会的目标</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="50" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="50" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="50" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="50" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第11题：</font>	中共十七届六中全会审议通过了（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 《中共中央关于加强党的执政能力建设的决定》	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 《关于召开党的第十八次全国代表大会的决议》	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 《中共中央关于深化文化体制改革、推动社会主义文化大发展大繁荣若干重大问题的决定》</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 《中共中央关于加强和改进新形势下党的建设若干重大问题的决定》</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="51" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="51" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="51" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="51" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第12题：</font>拓展新形势下大学生思想政治教育的有效途径，包括以下哪些要素（   ） 。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 深入开展社会实践	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 大力建设校园文化，并主动占领网络思想政治教育新阵地	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 开展深入细致的思想政治工作和心理健康教育</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 努力解决大学生的实际问题</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="52" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="52" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="52" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="52" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第13题：</font>大学生思想政治教育工作队伍的主体是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 学校党政干部和共青团干部	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 思想政治理论课教师	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 形势政策课教师</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 辅导员和班主任</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 哲学社会科学课教师</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="53" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="53" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="53" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="53" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="53" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第14题：</font>对有违法、违规、违纪行为的学生，学校应当给予批评教育或者纪律处分。其中纪律处分的种类有（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 警告和严重警告	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 记过	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 记大过</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 留校察看和开除学籍 　　</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="54" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="54" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="54" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="54" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第15题：</font>学校对学生的处分，应当做到以下哪些方面（    ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 程序正当	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 证据充分和依据明确	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 定性准确</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 处分有力</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="55" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="55" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="55" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="55" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第16题：</font>学校学生申诉处理委员会由以下人员组成（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 学校主管领导	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 职能部门领导	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 法律专家</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 教师代表</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 学生代表</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="56" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="56" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="56" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="56" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="56" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第17题：</font>下列哪些同学的就业单位符合基层就业学费补偿、贷款代偿的范围（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 富士康科技集团（重庆），单位地址为：重庆市沙坪坝区西永镇西园一路108号，从事行政管理工作。	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 重庆市大足县人民医院，单位地址为：重庆市大足县龙岗街道龙岗西路138号，从事医生工作。</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 棠湖中学外语实验学校，单位地址：四川省成都市双流县航空港开发区临港路，从事教师工作。</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 辽宁省阜新市阜新蒙古族自治县务欢池镇天恩村，单位地址：辽宁省阜新市阜新县务欢池镇天恩村，从事大学生村官工作。</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="57" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="57" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="57" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="57" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第18题：</font>下列哪个同学符合义务服兵役学费补偿、贷款代偿资助范围（   ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 同学甲2011年7月份毕业，2011年12月应征入伍服义务兵役。	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 同学乙2009年9月进入学校就读，2011年12月应征入伍服义务兵役。	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 同学丙2010年7月份毕业，2011年12月应征入伍服义务兵役。岛</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> .同学丁2007年9月月进入学校就读，2009年12月应征入伍服义务兵役，2011年12月退伍回校复学到2009级就读。</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="58" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="58" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="58" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="58" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第19题：</font>重庆夏季天气炎热，民国时期就有“三大火炉”之说，且重庆排在首位。请问另外传统“三大火炉”城市的另外两座城市是（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 广州</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 南京</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 武汉</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 长沙</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 上海</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="59" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="59" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="59" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="59" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="59" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第20题：</font>党的基本路线的核心内容“一个中心，两个基本点”是指（  ）。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 坚持四项基本原则	</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 坚持党的领导	</TD>
						</TR>
						<TR>
							<TD>&nbsp;C.</TD>
							<TD> 以经济建设为中心</TD>
						</TR>						
						<TR>
							<TD> &nbsp;D.</TD>
							<TD> 以执政为民为中心</TD>
						</TR>
						<TR>
							<TD> &nbsp;E.</TD>
							<TD> 坚持改革开放</TD>
						</TR>
						<TR>
							<TD> &nbsp;F.</TD>
							<TD> 坚持全心全意为人民服务</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						A<INPUT NAME="60" TYPE="checkbox" VALUE="A">&nbsp;&nbsp;&nbsp;
						B<INPUT NAME="60" TYPE="checkbox" VALUE="B">&nbsp;&nbsp;&nbsp;
						C<INPUT NAME="60" TYPE="checkbox" VALUE="C">&nbsp;&nbsp;&nbsp;
						D<INPUT NAME="60" TYPE="checkbox" VALUE="D">&nbsp;&nbsp;&nbsp;
						E<INPUT NAME="60" TYPE="checkbox" VALUE="E">&nbsp;&nbsp;&nbsp;
						F<INPUT NAME="60" TYPE="checkbox" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			</div>
			
			<!-- 3.判断题 -->
			<div id="panduan">
			<div class="title">
			<b>第三部分：3. 判断题（每小题1分，小计20分）</b>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第1题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">今后一个时期我国教育事业改革发展的工作方针是：优先发展，育人为本，改革创新，促进公平，提高质量</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="61" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="61" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第2题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">天宫一号目标飞行器与神舟七号飞船先后成功发射并顺利交会对接，成为我国载人航天发展史上新的里程碑</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="62" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="62" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第3题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">回顾90年中国的发展进步，可以得出一个基本结论：办好中国的事情，关键在党</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="63" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="63" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第4题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">政治路线确定之后干部就是决定因素</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="64" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="64" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第5题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">党的十八大于2012年下半年在北京召开</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="65" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="65" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第6题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">党的十七届六中全会提出来要建设社会主义文化强国</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="66" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="66" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第7题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">我校学科齐全，涵盖了哲、经、法、文、史、教、理、工、农、医、管、艺等12个学科门类，并在教师教育和农业教育方面形成了鲜明特色</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="67" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="67" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第8题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">长期以来，学校为国家培养了20余万优秀毕业生，袁隆平、吴明珠、胡锦矗、向仲怀、李丹阳等均是我校毕业生中的杰出代表</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="68" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="68" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第9题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">16号文件提出要坚持把党支部建在班上，努力实现本科学生班级“低年级有党员、高年级有党支部”的目标</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="69" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="69" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第10题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">选课后未正式办理退课手续，又不参加课程学习和考核，成绩以“0”分计算</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="70" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="70" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第11题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">学校党委关于党员（党员代表）大会选举办法规定，大会以无记名投票方式进行直接差额选举，候选人的差额不少于应选人数的20%。</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="71" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="71" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第12题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">重庆1997年被批准成为中央直辖市，人口3200万。重庆市花是山茶花，市树是黄桷树</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="72" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="72" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第13题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">在现阶段，我国社会的主要矛盾是人民日益增长的物质文化需要与落后的社会生产力之间的矛盾</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="73" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="73" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第14题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">《中国共产党章程》总纲指出，党的最高理想和最终目标是实现共产主义的社会制度</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="74" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="74" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第15题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">已获得保送硕士研究生资格的毕业生如与用人单位签订就业协议，则自动撤销保送资格</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="75" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="75" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第16题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">毕业生离校后要求改派的向学院提交改派申请，经学院审核同意后在学校招生就业处办理改派，打印新的《就业报到证》</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="76" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="76" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第17题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">毕业生要求档案缓寄的，应填写《档案缓寄申请表》，档案缓寄时间不得超过1个月</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="77" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="77" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第18题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">学生学业情况低于常规水平，在校期间考核不合格课程累计达到8门或者24学分，学校给予学业警示。学业警示以书面形式送达学生和学生家长</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="78" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="78" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第19题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">学校对学生事故无责任的，也可以根据学生家庭经济情况给予受伤害学生适当的经济赔偿</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="79" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="79" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
						<font color="red">第20题：</font><span style="font-size: 11pt; font-family: 仿宋_GB2312;">参加了城镇居民合作医疗保险和商业保险的学生住院医疗费报账流程是：出院时先结算城合保险报销，再到商业保险公司理赔，最后到校医改办进行公费医疗补助</span>。
					<BR>
					<span class="hr">&nbsp;&nbsp;---------------------------------------------------------------------------------------------------------------------------------------------------&nbsp;&nbsp;</span>
					<TABLE BORDER="0" CELLPADDING="5" CELLSPACING="0">
						<TR>
							<TD> &nbsp;A.</TD>
							<TD> 正确</TD>
						</TR>
						<TR>
							<TD> &nbsp;B.</TD>
							<TD> 错误</TD>
						</TR>
					</TABLE>
				</div>
				<div class="answer">
						选择答案：
						正确<INPUT NAME="80" TYPE="radio" VALUE="T">&nbsp;&nbsp;&nbsp;
						错误<INPUT NAME="80" TYPE="radio" VALUE="F">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			</div>
			<center>
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
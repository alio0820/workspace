<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
	<head>
		<!-- saved from url=(0013)about:internet -->
		<link rel="icon" href="../images/fruit.ico" type="image/x-icon"/>
		<title>触宝客户反馈问卷调查</title>
	<style type="text/css">
		.body{
			margin:0;
			padding:0;
			font-size:15px scrollbar-3d-light-color:black;
		}
		table{
			border-collapse:collapse;
		}
		table td{
			padding:5px;
		}
		.div_all{
			width:930px;padding:5px 5px;margin:auto;position:relative;background-color:white;
		}
		.top{
			height:20px
		}
		.top_text{color:rgb(65,122,193); width:500px; margin:auto; font-size:12px;padding:26px 0px;}
		
		.select-btn{
			height:40px;
			line-height:40px;
			text-align:center;
		}
		.line{
			width:100%;
			height:1px;
			background:#84c2d9;
		}
		.dotted-line{
			width:100%;
			height:1px;
			border-top:1px dashed lightgray;
		}
		.title{/* border:1px dashed red; */
			font-family:Verdana, Arial, Helvetica, sans-serif;
			margin:10px;
			padding:5px 10px;
			font-size:20px;
			color:white;
			background-color:#84c2d9;
		}
		.question{
			border:2px dashed rgb(201,201,201);
			margin:10px 10px;
			padding:5px
		}
		.content{
			margin:0 10px 5px;
			padding:10px 0;
			border-bottom:2px dashed lightgray;
		}
		.answer{border:1px solid rgb(201,201,201);margin:10px 10px;padding:2px;color:rgb(102,102,102);background:rgb(244,244,244)}
		.hr{color:rgb(201,201,201)}
		
		#pro_line{width:192px;margin:auto;position:relative;height:25px;background:url(images/blue.png);display:none}
		#pro_line li{background:url(images/blue.png);float:left;list-style:none}
		#pro_line .select li.dan A:hover B { BACKGROUND:url(images/red.png) right top } 
	</style>
	<script>
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
	</script>

	</head>
	<body class="body">
		<div class="div_all">
		<div class="top">
		</div>
	    <h1 align="center">触宝客户反馈问卷调查</h1>
	    <div id="pro_line">
	    	<ul class="select">
	    		<li class="dan"><a href="#"></a></li>
	    		<li class="duo"><a href="#"></a></li>
	    		<li class="pan"><a href="#"></a></li>
	    	</ul>
	    </div>
	    <div class="select-btn">
		    <input type="button" value="单选题" onclick="danxuan()"/>
		    <input type="button" value="多选题" onclick="duoxuan()"/>
		    <input type="button" value="判断题" onclick="panduan()"/>
	    </div>
		<div class="line"></div>
		<form name="form1" method="post">
					
			<!--1.单选题 -->
			<div id="danxuan">
			<div class="title">
			<b>第一部分：1. 单项选择题</b>
			</div>
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">1.</font>
						西南大学2005年7月经教育部批准由西南师范大学、西南农业大学合并组建而成。原两校发轫于1906年在西南地区开中国新学的（ ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 国立女子师范学院	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td>相辉学院	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 川东师范学院</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 四川省立教育学院</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="1" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="1" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="1" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="1" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">2.</font>
						根据《普通高等学校学生安全教育及管理暂行规定》，学生未经学校批准擅自离校不归发生意外事故的，学校不承担责任。（  ）不归且未说明原因，学校可张榜公布，按自动退学除名。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 7天	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 10天	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td>半个月</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 一个月</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 两个月</td>
						</tr>						
					</table>
				</div>
				<div class="answer">						
				选择答案：
						a<input name="2" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="2" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="2" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="2" type="radio" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="2" type="radio" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">3.</font>
						学生因病或其它原因不能坚持学习，应当办理请假手续。达到（  ）个工作日的，由主管教学院长签署意见，报教务处审批。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 3	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 5	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 7</td>
						</tr>						
						<tr>
							<td>&nbsp;d.</td>
							<td> 10</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="3" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="3" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="3" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="3" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">4.</font>
						每年3月5日定为学雷锋纪念日，是因为这天是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 雷锋同志生日	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 雷锋同志去世的日子	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 毛泽东主席题词“向雷锋同志学习”的日子</td>
						</tr>						
						
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="4" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="4" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="4" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">5.</font>
						在创先争优活动中开展基层组织建设年的主题是(  )。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 一讲二评三公示	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td>抓党建、促三风、建三高	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 强组织、增活力，创先争优迎十八大 </td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 抓落实、全覆盖、求实效、受欢迎</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 五个进一步提升</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 三创六进</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="5" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="5" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="5" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="5" type="radio" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="5" type="radio" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="5" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">6.</font>
						学校党委组织部要求，党员组织生活（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 每周不少于一次	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 每月不少于两次	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 每月不少于一次</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 每季度不少于两次</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 每学期不少于两次</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="6" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="6" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="6" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="6" type="radio" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="6" type="radio" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">7.</font>
						今年是建团90周年，是因为(  )。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 90年前爆发了反对帝国主义、封建主义的五四爱国运动	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td>90年前社会主义青年团成立</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td>90年前中国新民主主义青年团成立</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td>90年前民主青年团成立</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td>90年前中国新民主主义青年团召开第一次全国代表大会</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td>90年前中国社会主义青年团召开第一次全国代表大会</td>
						</tr>
						<tr>
							<td> &nbsp;g.</td>
							<td>90年前中国社会主义青年团改名为中国共产主义青年团</td>
						</tr>
						<tr>
							<td> &nbsp;h.</td>
							<td>90年前中国社会主义青年团改名为中国共产主义青年团</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="7" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="7" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="7" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="7" type="radio" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="7" type="radio" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="7" type="radio" value="f">&nbsp;&nbsp;&nbsp;
						g<input name="7" type="radio" value="g">&nbsp;&nbsp;&nbsp;
						h<input name="7" type="radio" value="h">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">8.</font>
						《西南大学二级党组织工作细则》规定，二级党组织委员候选人( )。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 应具有2年以上党龄	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 应具有3年以上党龄	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 应具有5年以上党龄</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 应具有副高以上职称或者科以上职务</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="8" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="8" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="8" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="8" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">9.</font>
						学校党委关于党员（党员代表）大会选举办法规定，有选举权的到会党员（代表）超过应到数的（  ），方可进行选举。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td>五分之四 </td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 三分之二	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 二分之一</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 五分之三</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="9" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="9" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="9" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="9" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">10.</font>
						毕业生离校时无故将党组织关系滞留学校超过（   ）以上的，根据党章规定按照自动脱党处理，不再办理组织关系接转事宜。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 两个月	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 三个月	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 六个月</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 一年</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 二年</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 三年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="10" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="10" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="10" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="10" type="radio" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="10" type="radio" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="10" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">11.</font>
						每年对学生进行综合考评，各学院应当成立综合考评工作领导小组和学生考评小组，学生考评小组须在辅导员（班主任）的指导下进行工作。其中学生考评小组的组成人员是（ ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 班、团干部	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 班、团干部及辅导员（班主任）	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 班、团干部及学生代表</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 班、团干部、学生代表和辅导员（班主任）</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="11" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="11" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="11" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="11" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">12.</font>
						根据学生手册规定，学生综合考评成绩由以下几部分组成（ ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 思想政治素质、学习成绩、工作表现	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 德育考评、课堂学习效果和拓展性素质评价	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 学习成绩、工作表现和参加集体活动表现</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 思想政治素质、学习成绩和参加活动情况</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="12" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="12" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="12" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="12" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">13.</font>
						根据《西南大学学生先进集体和个人评选表彰办法》规定，三好学生和优秀学生干部的评选比例分别是按参评学生人数的（ ）评选。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td>3%、7%	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 5%、9%	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 7%、3%</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 9%、5%</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="13" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="13" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="13" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="13" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">14.</font>
						根据《西南大学本科学生转专业实施办法》，同一专业年级转出学生数量不超过该专业年级学生数的（    ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 2%	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 3%	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 5%</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 7%</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="14" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="14" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="14" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="14" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">15.</font>
						根据学校学士学位授予条件有关规定，培养方案规定的学科基础课程、专业必修课程和实践教学环节的平均学分绩点最低应达到（  ）绩点才能授予学士学位。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 1.8	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 2.0	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td>  2.4 </td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 3.0</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="15" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="15" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="15" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="15" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">16.</font>
						我们常说的“24号令”颁发的是（    ）文件。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 《关于普通高等学校加强大学生思想政治教育的规定》	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 《关于进一步加强和改进大学生思想政治教育的意见》	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 《关于普通高等学校学生工作队伍建设的规定》</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 《普通高等学校辅导员队伍建设规定》</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="16" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="16" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="16" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="16" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">17.</font>
						加强和改进大学生思想政治教育要求做到“三贴近”，指的是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 贴近实际、贴近生活、贴近学生	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 贴近学习、贴近生活、贴近工作	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 贴近思想、贴近青年、贴近课堂</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 贴近课堂、贴近学习、贴近实践</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="17" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="17" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="17" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="17" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">18.</font>
						大学生思想政治教育的主渠道是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 思想品德与法律基础课	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 马克思主义原理课	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 思想政治理论课</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 形势政策课</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="18" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="18" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="18" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="18" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">19.</font>
						开展大学思想政治教育，要求做好“三进”工作，这“三进”指的是（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 进社团、进课堂、进寝室	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 进教材、进社团、进课堂	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 进公寓、进网络、进社团</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 进教材、进课堂、进大学生头脑</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="19" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="19" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="19" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="19" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">20.</font>
						“16号文件”明确指出，大学生思想政治教育的骨干力量是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 学校党政干部和共青团干部	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 思想政治理论课教师	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 分管学生工作的副书记和辅导员</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 辅导员和班主任</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="20" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="20" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="20" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="20" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">21.</font>
						我们在开展大学生思想政治教育活动中常说的“三育人”，指的是（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 教书育人、管理育人、环境育人 </td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td>教书育人、管理育人、服务育人	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 教书育人、思想育人、学习育人</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 教书育人、文化育人、环境育人</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="21" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="21" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="21" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="21" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">22.</font>
						根据《普通高等学校学生管理规定》，新生入学后，学校在（  ）内按照国家招生规定对其进行复查。复查合格者予以注册，取得学籍。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 3个月	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 6个月	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 9个月</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 12个月</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="22" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="22" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="22" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="22" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">23.</font>
						对患有疾病的新生，经学校指定的二级甲等以上医院诊断不宜在校学习的，可以保留入学资格（    ）年,保留入学资格者（    ）学籍。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 半年、不具有	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 半年、具有	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 1年、具有</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 1年、不具有</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="23" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="23" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="23" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="23" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">24.</font>
						学生应征参军，学校应当保留其学籍（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 一年	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 两年	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 至退役</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 至退役后一年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="24" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="24" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="24" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="24" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">25.</font>
						学生对处分决定有异议的，在接到学校处分决定书之日起在（    ）个工作日内，可以向学校有关机构提出书面申诉。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 5	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 7	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 10</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 15</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="25" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="25" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="25" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="25" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">26.</font>
						学生考核不合格课程应当申请重修，一门课程在校期间重修不得超过（  ）次，成绩合格后记载为60分或者及格。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 2	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 3	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 4 </td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 5 </td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="26" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="26" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="26" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="26" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">27.</font>
						学生可以分阶段完成学业。本科学生在校学习年限（含休学）可以是（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 3～6年	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 3～8年	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 4～6年</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 4～6年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="27" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="27" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="27" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="27" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">28.</font>
						休学学生应当办理休学手续，在办完手续后（   ）个工作日内离校。学生休学期间，学校保留其（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 2、学籍	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 5、学籍	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 7、待遇</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 10、待遇</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="28" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="28" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="28" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="28" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">29.</font>
						我国的基本经济制度是（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 社会主义市场经济制度	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 公有制为主体、多种所有制经济共同发展	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 各尽所能、按劳分配</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 按劳分配、兼顾公平</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="29" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="29" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="29" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="29" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">30.</font>
						发展党员要个别履行入党手续。一次支部大会讨论发展党员人数不超过（   ）人，对每个人的讨论时间不少于（    ）分钟。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 2人、15分钟	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 3人、20分钟	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 4人、30分钟</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 5人、35分钟</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="30" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="30" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="30" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="30" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">31.</font>
						召开支部大会进行党员组织发展工作时，实到有表决权的党员人数应不少于应到人数的（  ）才能开会，并且，发展对象及入党介绍人必须到会。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 1/2	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 2/3	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td>3/4</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 4/5</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="31" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="31" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="31" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="31" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">32.</font>
						我们常说的“三会一课”制度，指的是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 团员大会、团支部大会、团支部学习会和团课	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 民主生活会、政治学习会、组织生活会和政治学习课	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 支部党员大会、党支部委员会议、党小组会议和党课</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 党政联席会、教职工大会、政治学习会和政治学习课</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="32" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="32" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="32" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="32" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">33.</font>
						党的全国代表大会每几年举行一次？（  ）
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 三年	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 四年	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 五年</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 六年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="33" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="33" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="33" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="33" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">34.</font>
						国家助学贷款（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 实行借款学生在校期间的贷款利息全部由财政补贴，毕业后全部自付	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 实行借款学生在校期间贷款利息全部由财政补贴，毕业后也由财政补贴	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 实行借款学生在校期间的贷款利息全部由财政补贴，毕业后由财政补贴一半，自付一半</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 实行借款学生在校期间的贷款利息全部自付，毕业后全部自付</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="34" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="34" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="34" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="34" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">35.</font>
						根据国家助学贷款政策规定，借款学生从（   ）起开始自付利息。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 开始偿还本金之日	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 毕业后第一天	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 根据自己与银行签定的还款协议而定</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 毕业后两年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="35" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="35" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="35" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="35" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">36.</font>
						国家助学贷款必须在借款学生毕业后（   ）内年还清。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 7年</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 6年	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 4年</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td>2年</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="36" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="36" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="36" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="36" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">37.</font>
						国家助学贷款金额每人每年最多不得超过（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 4000元	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 5000元	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 6000元</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 8000元</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="37" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="37" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="37" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="37" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">38.</font>
						国家制定的《国家中长期教育改革和发展规划纲要》的战略目标是（   ）
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 到2015年，努力实现教育现代化，努力形成学习型社会，进入教育先进国家行列	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 到2020年，基本实现教育现代化，基本形成学习型社会，进入人力资源强国行列	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 到2025年，走上教育现代化之路，达到学习型社会标准，进入教育发达国家行列</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 到2030年，全面实现教育现代化，实现学习型社会目标，进入教育资源强国行列</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="38" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="38" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="38" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="38" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">39.</font>
						自1997年大连举行第一届中国国际园林博览会以来，已先后举办过多届，在重庆举办的这次园博会是第（   ）届。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 15	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 10	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 8</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 6</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="39" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="39" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="39" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="39" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">40.</font>
						当前我国高等教育改革发展最核心最紧迫的任务是（   ）
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 加快改革创新	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 提高教育质量	</td>
						</tr>
						<tr>
							<td> &nbsp;c.</td>
							<td> 落实教育规划纲要</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 优化人才培养结构</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="40" type="radio" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="40" type="radio" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="40" type="radio" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="40" type="radio" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			</div>
			<!--2.多选题 -->
			<div id="duoxuan">
			<div class="title">
			<b>第二部分：2. 多项选择题</b>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">1.</font>
						加强和改进大学生思想政治教育的基本原则有（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 坚持教书与育人相结合	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 坚持教育与自我教育相结合	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 坚持政治理论教育与社会实践相结合</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 坚持解决思想问题与解决实际问题相结合</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 坚持教育与管理相结合</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 坚持继承优良传统与改进创新相结合</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="41" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="41" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="41" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="41" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="41" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="41" type="checkbox" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">2.</font>
						加强和改进大学生思想政治教育的主要任务有(   )。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 以理想信念教育为核心，深入进行树立正确的世界观人生观和价值观教育。	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 以爱国主义教育为重点，深入进行弘扬和培育民族精神教育。	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 以基本道德规范为基础，深入进行公民道德教育。</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 以大学生全面发展为目标，深入进行素质教育。</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="42" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="42" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="42" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="42" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">3.</font>
						有下列哪些情况者，不能授予学士学位？（  ）
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 在校学习时间超过4年	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 未获得毕业证书	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 未过英语四级考试</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 未过计算机二级考试</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 培养方案规定的学科基础课程、专业发展必修课程和实践教学环节的平均学分绩点未达到2.0</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="43" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="43" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="43" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="43" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="43" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">4.</font>
						今年3月下旬学校党委下发《关于在基层组织建设年活动中开展“双千双带计划”的实施方案》中的“双千双带”是指（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 组织1000余名教职工党员联系学生寝室	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 组织1000余名教职工党员帮带1000个学生班级	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 组织1000余名教职工党员帮扶1000名困难学生</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 组织1000余名学生党员联系学生入党积极分子</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 组织1000余名学生党员帮带1000名困难学生</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 组织1000余名学生党员带动1000个学生寝室岛</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="44" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="44" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="44" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="44" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="44" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="44" type="checkbox" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">5.</font>
						我校二级党组织委员会一般设书记、副书记以及（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 青年委员	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 生活委员	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 纪检委员</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 政保委员</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 保密委员</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 宣传委员</td>
						</tr>
						<tr>
							<td> &nbsp;g.</td>
							<td> 统战委员</td>
						</tr>
						<tr>
							<td> &nbsp;h.</td>
							<td> 文体委员</td>
						</tr>
						<tr>
							<td> &nbsp;i.</td>
							<td> 组织委员</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="45" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="45" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="45" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="45" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="45" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="45" type="checkbox" value="f">&nbsp;&nbsp;&nbsp;
						g<input name="45" type="checkbox" value="g">&nbsp;&nbsp;&nbsp;
						h<input name="45" type="checkbox" value="h">&nbsp;&nbsp;&nbsp;
						i<input name="45" type="checkbox" value="i">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">6.</font>
						社会主义核心价值体系的基本内容是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 马克思主义指导思想	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 中国特色社会主义共同理想	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 以爱国主义为核心的民族精神和以改革创新为核心的时代精神</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 以“八荣八耻”为主要内容的社会主义荣辱观</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="46" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="46" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="46" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="46" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">7.</font>
						高等学校教师职业道德规范的主要内容是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 爱国守法,敬业爱生 	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 教书育人,严谨治学	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 廉洁自律，淡薄名利</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 服务社会,为人师表</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="47" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="47" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="47" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="47" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">8.</font>
						胡锦涛总书记在清华大学百年校庆讲话中给青少年提出的希望是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 把文化知识学习和思想品德修养紧密结合起来	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 把创新能力和实践能力培养紧密结合起来	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 把创新思维和社会实践紧密结合起来</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 把全面发展和个性发展紧密结合起来</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="48" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="48" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="48" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="48" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">9.</font>
						我党在推进马克思主义中国化的历史进程中产生的两大理论成果是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 毛泽东思想	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 邓小平理论	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> “三个代表”重要思想以及科学发展观</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 中国特色社会主义理论体系</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="49" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="49" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="49" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="49" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">10.</font>
						我党在这90年的奋斗、创造、积累，取得了以下（  ）成就。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 开辟了中国特色社会主义道路	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 形成了中国特色社会主义理论体系	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 确立了中国特色社会主义制度</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 实现了全面建设小康社会的目标</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="50" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="50" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="50" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="50" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">11.</font>
							中共十七届六中全会审议通过了（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 《中共中央关于加强党的执政能力建设的决定》	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 《关于召开党的第十八次全国代表大会的决议》	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 《中共中央关于深化文化体制改革、推动社会主义文化大发展大繁荣若干重大问题的决定》</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 《中共中央关于加强和改进新形势下党的建设若干重大问题的决定》</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="51" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="51" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="51" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="51" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">12.</font>
						拓展新形势下大学生思想政治教育的有效途径，包括以下哪些要素（   ） 。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 深入开展社会实践	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 大力建设校园文化，并主动占领网络思想政治教育新阵地	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 开展深入细致的思想政治工作和心理健康教育</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 努力解决大学生的实际问题</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="52" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="52" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="52" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="52" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">13.</font>
						大学生思想政治教育工作队伍的主体是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 学校党政干部和共青团干部	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 思想政治理论课教师	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 形势政策课教师</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 辅导员和班主任</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 哲学社会科学课教师</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="53" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="53" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="53" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="53" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="53" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">14.</font>
						对有违法、违规、违纪行为的学生，学校应当给予批评教育或者纪律处分。其中纪律处分的种类有（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 警告和严重警告	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 记过	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 记大过</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 留校察看和开除学籍 　　</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="54" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="54" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="54" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="54" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">15.</font>
						学校对学生的处分，应当做到以下哪些方面（    ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 程序正当	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 证据充分和依据明确	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 定性准确</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 处分有力</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="55" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="55" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="55" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="55" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">16.</font>
						学校学生申诉处理委员会由以下人员组成（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 学校主管领导	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 职能部门领导	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 法律专家</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 教师代表</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 学生代表</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="56" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="56" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="56" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="56" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="56" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">17.</font>
						下列哪些同学的就业单位符合基层就业学费补偿、贷款代偿的范围（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 富士康科技集团（重庆），单位地址为：重庆市沙坪坝区西永镇西园一路108号，从事行政管理工作。	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 重庆市大足县人民医院，单位地址为：重庆市大足县龙岗街道龙岗西路138号，从事医生工作。</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 棠湖中学外语实验学校，单位地址：四川省成都市双流县航空港开发区临港路，从事教师工作。</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 辽宁省阜新市阜新蒙古族自治县务欢池镇天恩村，单位地址：辽宁省阜新市阜新县务欢池镇天恩村，从事大学生村官工作。</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="57" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="57" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="57" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="57" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">18.</font>
						下列哪个同学符合义务服兵役学费补偿、贷款代偿资助范围（   ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 同学甲2011年7月份毕业，2011年12月应征入伍服义务兵役。	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 同学乙2009年9月进入学校就读，2011年12月应征入伍服义务兵役。	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 同学丙2010年7月份毕业，2011年12月应征入伍服义务兵役。岛</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> .同学丁2007年9月月进入学校就读，2009年12月应征入伍服义务兵役，2011年12月退伍回校复学到2009级就读。</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="58" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="58" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="58" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="58" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">19.</font>
						重庆夏季天气炎热，民国时期就有“三大火炉”之说，且重庆排在首位。请问另外传统“三大火炉”城市的另外两座城市是（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 广州</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 南京</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 武汉</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 长沙</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 上海</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="59" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="59" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="59" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="59" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="59" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">20.</font>
						党的基本路线的核心内容“一个中心，两个基本点”是指（  ）。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 坚持四项基本原则	</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 坚持党的领导	</td>
						</tr>
						<tr>
							<td>&nbsp;c.</td>
							<td> 以经济建设为中心</td>
						</tr>						
						<tr>
							<td> &nbsp;d.</td>
							<td> 以执政为民为中心</td>
						</tr>
						<tr>
							<td> &nbsp;e.</td>
							<td> 坚持改革开放</td>
						</tr>
						<tr>
							<td> &nbsp;f.</td>
							<td> 坚持全心全意为人民服务</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						a<input name="60" type="checkbox" value="a">&nbsp;&nbsp;&nbsp;
						b<input name="60" type="checkbox" value="b">&nbsp;&nbsp;&nbsp;
						c<input name="60" type="checkbox" value="c">&nbsp;&nbsp;&nbsp;
						d<input name="60" type="checkbox" value="d">&nbsp;&nbsp;&nbsp;
						e<input name="60" type="checkbox" value="e">&nbsp;&nbsp;&nbsp;
						f<input name="60" type="checkbox" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			</div>
			
			<!-- 3.判断题 -->
			<div id="panduan">
			<div class="title">
			<b>第三部分：3. 判断题</b>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">1.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">今后一个时期我国教育事业改革发展的工作方针是：优先发展，育人为本，改革创新，促进公平，提高质量</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="61" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="61" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">2.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">天宫一号目标飞行器与神舟七号飞船先后成功发射并顺利交会对接，成为我国载人航天发展史上新的里程碑</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="62" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="62" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">3.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">回顾90年中国的发展进步，可以得出一个基本结论：办好中国的事情，关键在党</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="63" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="63" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">4.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">政治路线确定之后干部就是决定因素</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="64" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="64" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">5.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">党的十八大于2012年下半年在北京召开</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="65" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="65" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">6.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">党的十七届六中全会提出来要建设社会主义文化强国</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="66" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="66" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">7.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">我校学科齐全，涵盖了哲、经、法、文、史、教、理、工、农、医、管、艺等12个学科门类，并在教师教育和农业教育方面形成了鲜明特色</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="67" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="67" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">8.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">长期以来，学校为国家培养了20余万优秀毕业生，袁隆平、吴明珠、胡锦矗、向仲怀、李丹阳等均是我校毕业生中的杰出代表</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="68" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="68" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">9.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">16号文件提出要坚持把党支部建在班上，努力实现本科学生班级“低年级有党员、高年级有党支部”的目标</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="69" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="69" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">10.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">选课后未正式办理退课手续，又不参加课程学习和考核，成绩以“0”分计算</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="70" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="70" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">11.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">学校党委关于党员（党员代表）大会选举办法规定，大会以无记名投票方式进行直接差额选举，候选人的差额不少于应选人数的20%。</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="71" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="71" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">12.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">重庆1997年被批准成为中央直辖市，人口3200万。重庆市花是山茶花，市树是黄桷树</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="72" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="72" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">13.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">在现阶段，我国社会的主要矛盾是人民日益增长的物质文化需要与落后的社会生产力之间的矛盾</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="73" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="73" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">14.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">《中国共产党章程》总纲指出，党的最高理想和最终目标是实现共产主义的社会制度</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="74" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="74" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">15.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">已获得保送硕士研究生资格的毕业生如与用人单位签订就业协议，则自动撤销保送资格</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="75" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="75" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">16.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">毕业生离校后要求改派的向学院提交改派申请，经学院审核同意后在学校招生就业处办理改派，打印新的《就业报到证》</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="76" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="76" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">17.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">毕业生要求档案缓寄的，应填写《档案缓寄申请表》，档案缓寄时间不得超过1个月</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="77" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="77" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">18.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">学生学业情况低于常规水平，在校期间考核不合格课程累计达到8门或者24学分，学校给予学业警示。学业警示以书面形式送达学生和学生家长</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="78" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="78" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">19.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">学校对学生事故无责任的，也可以根据学生家庭经济情况给予受伤害学生适当的经济赔偿</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="79" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="79" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			<div>
				<div class="question">					
					<div class="content">
						<font color="red">20.</font>
						<span style="font-size: 11pt; font-family: 仿宋_gb2312;">参加了城镇居民合作医疗保险和商业保险的学生住院医疗费报账流程是：出院时先结算城合保险报销，再到商业保险公司理赔，最后到校医改办进行公费医疗补助</span>。
					</div>
					<table>
						<tr>
							<td> &nbsp;a.</td>
							<td> 正确</td>
						</tr>
						<tr>
							<td> &nbsp;b.</td>
							<td> 错误</td>
						</tr>
					</table>
				</div>
				<div class="answer">
						选择答案：
						正确<input name="80" type="radio" value="t">&nbsp;&nbsp;&nbsp;
						错误<input name="80" type="radio" value="f">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			
			</div>
			<div class="select-btn">
					<input type="button" value="检测答卷" onclick="check()"/>
					<input type="button" value="提交试卷 " onclick="sub()"/>					
			</div>
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
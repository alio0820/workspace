<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Untitled Page</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<STYLE type=text/css>
			{
				FONT-SIZE:12px;
			}
			table.xiangmu td {
				border-bottom:1px solid #6F9FC0;
				border-right:1px solid #6F9FC0;
				text-align:center;
				overflow:hidden;
				font-size:12px;
				width:90px;				
				}
			table.xiangmu th{
				border:1px solid #9AB5D0;	
				width:1170px;
			}
			.borderleft {
				border-left:1px solid #6F9FC0;
			}
			a{
				text-decoration:none;
				color:black;
			}
			span.class1{
				border:1px solid rgb(119,119,170);
				margin-left:2px;
				margin-right:5px;
				margin-top:3px;
				margin-bottom:3px;
			}
			div.new{
				margin-top:5px;
				margin-bottom:5px;
				margin-left:10px;
			}
			.ResultM_1{
	    		background:url(images/departManager_1.png);width:362px;height:57px;float:left;
	    	}	
		</STYLE>
		<script type='text/javascript'>
			function getElementsByClassName(n) {
			    var el = [],
			        _el = document.getElementsByTagName('*');
			    for (var i=0; i<_el.length; i++ ) {
			       if (_el[i].className == n ) {
			           el[el.length] = _el[i];
			        }
			   }
			   return el;
			}
			function hideClass(n,id){
				document.getElementById(id).innerHTML=document.getElementById(id).innerHTML=='[收起]'?'[展开]':'[收起]';
				var a=getElementsByClassName(n);
				for(var i=0;i<a.length;i++)
				{
					if(a[i].style.display=='table-row')
						a[i].style.display='none';
					else if(a[i].style.display=='none')
						a[i].style.display='table-row';
					else if(a[i].style.display='table-row')
						a[i].style.display='none';
				}
			}
			function user_right(name){
				document.getElementById('div_new').style.display='none';
				document.getElementById('div_change').style.display='none';
				document.getElementById('div_del').style.display='none';
				document.getElementById('div_query').style.display='none';
				document.getElementById(name).style.display='block';
			}
		</script>
		</HEAD>
	<BODY style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
		<DIV>
			<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR
						style="BACKGROUND-IMAGE: url(images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47px>
						<TD width=15px>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl.gif); WIDTH: 15px; background-position: left top; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD> 
						<TD>
							<SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
							<SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); COLOR: white; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">
								部门管理
							</SPAN>
							<SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: no-repeat; BACKGROUND-IMAGE: url(images/main_rc.gif)"
							width=10></TD>
					</TR>
					<TR>
						<TD
							style="background: url(images/main_ls.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-y;">
							&nbsp;
						</TD>
						<TD
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 0px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 0px; BACKGROUND-COLOR: white"
							vAlign=top >
							<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
						    	<div class="ResultM_1"></div>						    
					    	</div>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;部门分类</div><br>
							<div style='margin-left:30px'>
								<table class='xiangmu' cellSpacing=0 cellPadding=4>
									<tr>
										<th colspan='13' style='background:#91C7E1'>
											<center>
											<span>区级部门</span><span><a id='a' href='javascript:void(0)' onclick='hideClass("quji","a");'>[收起]</a></span>
											</center>
										</th>
									</tr>
									<tr class='quji'>
										<td class='borderleft'><a href='#'>纪委</a></td>
										<td><a href='#'>区委办</a></td>
										<td><a href='#'>人大办</a></td>
										<td><a href='#'>政府办</a></td>
										<td><a href='#'>组织部</a></td>
										<td><a href='#'>宣传部</a></td>
										<td><a href='#'>机关工委</a></td>
										<td><a href='#'>信访办</a></td>
										<td><a href='#'>老干局</a></td>
										<td><a href='#'>党史办党校</a></td>
										<td><a href='#'>南川日报社</a></td>
										<td><a href='#'>法制办</a></td>
										<td><a href='#'>统战部</a></td>																				
									</tr>
																		
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	纪委	</a></td>
									<td><a href='#'>	机关工委	</a></td>
									<td><a href='#'>	统战部	</a></td>
									<td><a href='#'>	总工会	</a></td>
									<td><a href='#'>	区委办	</a></td>
									<td><a href='#'>	信访办	</a></td>
									<td><a href='#'>	政法委	</a></td>
									<td><a href='#'>	团委	</a></td>
									<td><a href='#'>	人大办	</a></td>
									<td><a href='#'>	老干局	</a></td>
									<td><a href='#'>	法院	</a></td>
									<td><a href='#'>	妇联	</a></td>
									<td><a href='#'>	政府办	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	党史办党校	</a></td>
									<td><a href='#'>	检察院	</a></td>
									<td><a href='#'>	科协	</a></td>
									<td><a href='#'>	组织部	</a></td>
									<td><a href='#'>	南川日报社	</a></td>
									<td><a href='#'>	编办	</a></td>
									<td><a href='#'>	工商联	</a></td>
									<td><a href='#'>	宣传部	</a></td>
									<td><a href='#'>	法制办	</a></td>
									<td><a href='#'>	残联	</a></td>
									<td><a href='#'>	发展改革委	</a></td>
									<td><a href='#'>	水务局	</a></td>
									<td><a href='#'>	旅游局	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	人力社保局	</a></td>
									<td><a href='#'>	人口计生委	</a></td>
									<td><a href='#'>	招商局	</a></td>
									<td><a href='#'>	农委	</a></td>
									<td><a href='#'>	城乡建委	</a></td>
									<td><a href='#'>	安监局	</a></td>
									<td><a href='#'>	民政局	</a></td>
									<td><a href='#'>	科委	</a></td>
									<td><a href='#'>	社保局	</a></td>
									<td><a href='#'>	经济信息委	</a></td>
									<td><a href='#'>	规划局	</a></td>
									<td><a href='#'>	机关事务局	</a></td>
									<td><a href='#'>	财政局	</a></td>
									</tr>
									
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	环保局	</a></td>
									<td><a href='#'>	公告资源管理办公室	</a></td>
									<td><a href='#'>	教委	</a></td>
									<td><a href='#'>	市政园林局	</a></td>
									<td><a href='#'>	档案局	</a></td>
									<td><a href='#'>	交通局	</a></td>
									<td><a href='#'>	审计局	</a></td>
									<td><a href='#'>	供销社	</a></td>
									<td><a href='#'>	商务局	</a></td>
									<td><a href='#'>	卫生局	</a></td>
									<td><a href='#'>	广播电视台	</a></td>
									<td><a href='#'>	司法局	</a></td>
									<td><a href='#'>	林业局	</a></td>
									</tr>
									
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	煤炭局	</a></td>
									<td><a href='#'>	公安局	</a></td>
									<td><a href='#'>	文广新局	</a></td>
									<td><a href='#'>	政务服务中心	</a></td>
									<td><a href='#'>	统计局	</a></td>
									<td><a href='#'>	土地房屋征收中心	</a></td>
									<td><a href='#'>	国土房管局	</a></td>
									<td><a href='#'>	银监办	</a></td>
									<td><a href='#'>	綦南供电南川分局	</a></td>
									<td><a href='#'>	食品药监分局	</a></td>
									<td><a href='#'>	农发行	</a></td>
									<td><a href='#'>	人保寿险公司	</a></td>
									<td><a href='#'>	国税局	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	工行	</a></td>
									<td><a href='#'>	电信公司	</a></td>
									<td><a href='#'>	气象局	</a></td>
									<td><a href='#'>	重庆银行	</a></td>
									<td><a href='#'>	人保财险公司	</a></td>
									<td><a href='#'>	地税局	</a></td>
									<td><a href='#'>	建行	</a></td>
									<td><a href='#'>	移动公司	</a></td>
									<td><a href='#'>	铁路局	</a></td>
									<td><a href='#'>	邮储银行	</a></td>
									<td><a href='#'>	工商分局	</a></td>
									<td><a href='#'>	农行	</a></td>
									<td><a href='#'>	联通公司	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	邮政局人民银行	</a></td>
									<td><a href='#'>	供电公司	</a></td>
									<td><a href='#'>	质监分局	</a></td>
									<td><a href='#'>	中行	</a></td>
									<td><a href='#'>	盐业公司	</a></td>
									<td><a href='#'>	烟草专卖局	</a></td>
									<td><a href='#'>	农商行	</a></td>
									<td><a href='#'>	石油公司	</a></td>
									<td><a href='#'>	南川中学	</a></td>
									<td><a href='#'>	书院中学	</a></td>
									<td><a href='#'>	人民医院	</a></td>
									<td><a href='#'>	城投公司	</a></td>
									<td><a href='#'>	林峰公司	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	高指部	</a></td>
									<td><a href='#'>	道南中学	</a></td>
									<td><a href='#'>	水江中学	</a></td>
									<td><a href='#'>	二院	</a></td>
									<td><a href='#'>	惠农公司	</a></td>
									<td><a href='#'>	坤唯公司	</a></td>
									<td><a href='#'>	“80项目”指挥部	</a></td>
									<td><a href='#'>	隆化职中	</a></td>
									<td><a href='#'>	中医院	</a></td>
									<td><a href='#'>	园业实力公司	</a></td>
									<td><a href='#'>	南平公司	</a></td>
									<td><a href='#'>	铁指部	</a></td>
									<td><a href='#'>	电大进修校	</a></td>
									</tr>
									<tr class='quji'>
									<td class='borderleft'><a href='#'>	禹光公司	</a></td>
									<td><a href='#'>	水江公司	</a></td>
									<td><a href='#'>	一中	</a></td>
									<td><a href='#'>	昌大公司	</a></td>
									<td><a href='#'>	三中	</a></td>
									<td><a href='#'>	博顶公司	</a></td>
									</tr>
									
										<tr>
										<th colspan='13' style='background:#91C7E1'>
											<span>园区管委会</span><span><a id='b' href='javascript:void(0)' onclick='hideClass("yuanqu","b");'>[收起]</a></span>
										</th>
										</tr>
										<tr class='yuanqu'>
										<td class='borderleft'><a href='#'>	工业园区管委会	</a></td>
										<td><a href='#'>	新城区管委会	</a></td>
										<td><a href='#'>	金佛山旅游景区管委会	</a></td>
										<td><a href='#'>	农业园区管委会	</a></td>
										<td><a href='#'>	商贸物流园区管委会	</a></td>
										<td><a href='#'>	水江工业园区	</a></td>
										<td><a href='#'>	南平工业园区	</a></td>
										</tr>
										
										<tr>
										<th colspan='13' style='background:#91C7E1'>
											<span>乡镇街道</span><span><a id='c' href='javascript:void(0)' onclick='hideClass("xiangz","c");'>[收起]</a></span>
										</th>
										</tr>
										
										<tr class='xiangz'>
										<td class='borderleft'><a href='#'>	东城街道	</a></td>
										<td><a href='#'>	金山镇	</a></td>
										<td><a href='#'>	神童镇	</a></td>
										<td><a href='#'>	中桥乡	</a></td>
										<td><a href='#'>	乾丰乡	</a></td>
										<td><a href='#'>	南城街道	</a></td>
										<td><a href='#'>	头渡镇	</a></td>
										<td><a href='#'>	大观镇	</a></td>
										<td><a href='#'>	石莲乡	</a></td>
										<td><a href='#'>	石墙镇	</a></td>
										<td><a href='#'>	河图乡	</a></td>
										<td><a href='#'>	西城街道	</a></td>
										<td><a href='#'>	德隆乡	</a></td>
										</tr>
										
										<tr class='xiangz'>
										<td class='borderleft'><a href='#'>	兴隆镇	</a></td>
										<td><a href='#'>	鸣玉镇	</a></td>
										<td><a href='#'>	铁村乡	</a></td>
										<td><a href='#'>	木凉乡	</a></td>
										<td><a href='#'>	南平镇	</a></td>
										<td><a href='#'>	大有镇	</a></td>
										<td><a href='#'>	太平场镇	</a></td>
										<td><a href='#'>	石溪乡	</a></td>
										<td><a href='#'>	庆元乡	</a></td>
										<td><a href='#'>	民主乡	</a></td>
										<td><a href='#'>	水江镇	</a></td>
										<td><a href='#'>	含溪镇	</a></td>
										<td><a href='#'>	白沙镇	</a></td>
										</tr>
										<tr class='xiangz'>
										<td class='borderleft'><a href='#'>	福寿乡	</a></td>
										<td><a href='#'>	三泉镇	</a></td>
										<td><a href='#'>	峰岩乡	</a></td>
										<td><a href='#'>	古花乡	</a></td>
										<td><a href='#'>	黎香湖镇	</a></td>
										<td><a href='#'>	冷水关乡	</a></td>
										<td><a href='#'>	鱼泉乡	</a></td>
										<td><a href='#'>	骑龙乡	</a></td>
										</tr>																	
								</table>
							</div>						
						</TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rs.gif)"></TD>
					</TR>
					<TR style="BACKGROUND-IMAGE: url(images/main_fs.gif); background-color: rgb(255, 255, 255); BACKGROUND-REPEAT: repeat-x" height=10>
						<TD style="BACKGROUND-IMAGE: url(images/main_lf.gif); BACKGROUND-REPEAT: no-repeat; width: 10px"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(images/main_rf.gif)"></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</BODY>
</HTML>
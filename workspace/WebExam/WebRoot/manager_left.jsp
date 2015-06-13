<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>manager_left</title>
  
    <style type="text/css">
		 body {
			font-family: "Lucida Grande", Helvetica, Arial, sans-serif;
			font-size: 12px;
			margin:0;
		}
		
		#dlmenu {height:1000px;background:rgb(230,244,250);}
		#menu {list-style-type:none; margin:0; padding:0; position:absolute; width:172px;z-index:100;background:white;height:auto}
		#menu li {display:block; padding:0; margin:0; position:relative; z-index:100;}
		#menu li a, #menu li a:visited {display:block; text-decoration:none;}
		#menu li dd {display:none;}
		#menu li:hover, #menu li a:hover {border:0;}
		#menu li:hover dt a , #menu li a:hover dt a {background:url(images/menu_2.png); color:#000;}
		
		#menu table {border-collapse:collapse; padding:0; margin:-4px; font-size:1em;}
		#menu dl {margin: 0; cursor:pointer;}
		#menu dt {margin:0;  font-size: 1.1em; border-top:1px solid #cce;}
		#menu dd {margin:0; padding:0; font-size: 1em; text-align:left; }
		.gallery dt a, .gallery dt a:visited {display:block; height:20px;background:url(images/menu.png) center center;padding-left:60px;padding-top:6px;}
		.gallery dd a, .gallery dd a:visited {color:#000; min-height:1em; text-decoration:none; display:block; padding:4px 5px 4px 40px;}
		* html .gallery dd a, * html .gallery dd a:visited {height:1em;}
		.gallery dd a:hover {background:rgb(230,244,250);}
</style>
		<script type="text/javascript">
			var prenode="";
    		function li(obj){
				if(prenode!=obj&&prenode!=""){								//如果前一个点击的节点不为它，则关闭前一个节点的dd
					var node1 = prenode.parentNode.parentNode.childNodes;	//获取该a节点所在的dl节点
					var a1 = node1, cs1=[];
					for(var i=0; i <a1.length; i++)							//过滤FireFox中的节点异常
					{
						if(a1[i].nodeType==1&&a1[i].tagName)
							cs1[cs1.length]=a1[i];
					}
					if(cs1[1].style.display=="block")    					//这个   cs数组与IE里的   childNodes一样了！
					for(var i=1;i<cs1.length;i++)
					{
						cs1[i].style.display="none";
					}
				}
				var node = obj.parentNode.parentNode.childNodes;			//获取该a节点所在的dl所有子节点,打开该节点的所有兄弟dd标签
				var a = node, cs=[];
				for(var i=0; i <a.length; i++)								//过滤FireFox中的节点异常
				{
					if(a[i].nodeType==1&&a[i].tagName)
						cs[cs.length]=a[i];
				}    														//这个   cs数组与IE里的   childNodes一样了！
				for(var i=1;i<cs.length;i++)
				{
					cs[i].style.display=(cs[i].style.display=="block"?"none":"block"); //选择表达式3>2?3:2;
				}
				prenode=obj;
			}
		</script>
</head>
<body>
<div style="padding-left:8px;background-color:rgb(25,139,201)">
<div id="dlmenu">
	<ul id="menu">
		<li>
		<!--[if lte IE 6]><a href="#nogo"><table><tr><td><![endif]-->
		<dl class="gallery">
			<dt><a href="javascript:void(0)" onclick="li(this)">系统管理</a></dt>
			<dd><a href="#" target="right">模块管理</a></dd>
			<dd><a href="#" target="right">角色管理</a></dd>
			<dd><a href="#" target="right">用户管理</a></dd>
			<dd><a href="#" target="right">部门管理</a></dd>
			<dd><a href="#" target="right">岗位管理</a></dd>
			<dd><a href="#" target="right">首页Flash设置</a></dd>
		</dl>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		<li>
		<!--[if lte IE 6]><a href="#nogo"><table><tr><td><![endif]-->
		<dl class="gallery">
			<dt><a href="javascript:void(0)" onclick="li(this)">考试设计</a></dt>
			<dd><a href="#" target="right">知识点管理</a></dd>
			<dd><a href="#" target="right">题型管理</a></dd>
			<dd><a href="#" target="right">题库管理</a></dd>
			<dd><a href="#" target="right">试题征集信息</a></dd>
			<dd><a href="#" target="right">试题应征管理</a></dd>
			<dd><a href="#" target="right">考试类别管理</a></dd>
			<dd><a href="#" target="right">试卷管理</a></dd>
		</dl>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		<li>
		<!--[if lte IE 6]><a href="#nogo"><table><tr><td><![endif]-->
		<dl class="gallery">
			<dt><a href="javascript:void(0)" onclick="li(this)">考试管理</a></dt>
			<dd><a href="#" target="right">考试安排</a></dd>
			<dd><a href="#" target="right">考试包管理</a></dd>
			<dd><a href="#" target="right">练习安排</a></dd>
			<dd><a href="#" target="right">人工复评</a></dd>
			<dd><a href="ResultManage.jsp" target="right">成绩管理</a></dd>
			<dd><a href="#" target="right">准考证管理</a></dd>
		</dl>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		<li>
			<!--[if lte IE 6]><a href="#nogo"><table><tr><td><![endif]-->
			<dl class="gallery">
				<dt><a href="javascript:void(0)" onclick="li(this)">监控管理</a></dt>
				<dd><a href="exam.jsp" target="right">考试监控</a></dd>
			</dl>
			<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
		<li>
			<!--[if lte IE 6]><a href="#nogo"><table><tr><td><![endif]-->
			<dl class="gallery">
				<dt><a href="javascript:void(0)" onclick="li(this)">统计分析</a></dt>
				<dd><a href="#" target="right">分数分布</a></dd>
				<dd><a href="#" target="right">选项分布</a></dd>
				<dd><a href="#" target="right">生成答卷</a></dd>
			</dl>
			<!--[if lte IE 6]></td></tr></table></a><![endif]-->
		</li>
	</ul>
</div>
</div>

</body>
</html>
   
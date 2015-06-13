<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>Div属性</title>
    <style type='text/css'>
		#div_id1{
			width:100px;
			border:1px solid red;
		}
		.div_class1{
			width:200px;height:200px;
			border:1px solid black;
		}
	</style>
  </head>
  <div  style="opacity:0.1;filter:alpha(opacity=30)">欢迎使用div的属性讲解</div>
  <div style="overflow:scroll;color:red;font-size:18px;font-weight:bold;line-height:20px">溢出控制</div>
  <div style="background:#666">背景颜色</div>
  <div style="word-break:keep-all">断字</div>
  <div style="direction:rtl">文字方向</div>
  <div style="position:relative">定位属性</div>
  <div style="display:none">显示属性</div>
  <div>
  <div style="margin:5px 10px 20px 30px;width:200px; height:200px;background-color:#666;">margin:用于设置DIV的外延边距，也就是到父容器的距离。</div>
       说明：margin:后面跟有四个距离分别为到父容器的上-右-下-左边的距离；可以看例子中的白色DIV到黑色DIV的边距离效果。还可以分别设置这四个边的距离，用到的属性如下：

   margin-left:到父容器左边框的距离。

   margin-right:到父容器右边框的距离。

   margin-top: 到父容器上边框的距离。

   margin-bottom:到父容器下边框的距离。
  </div>
  <div style="padding:5px 10px 20px 30px;background-color:#666;width:300px;height:300px;"> 
  <div style="width:200px; height:200px;background-color:White;">padding:用于设置DIV的内边距。</div>
  说明：padding的格式和margin的格式一样，可以对照学习。可以看黑色DIV与白色DIV的边距来体会此属性的效果。这是还需要注意的是padding设置的距离不包括在本身的width和height内(在IE7和FF中)，比如一个DIV的width设置了100px,而padding-left设置了50px,那么这个DIV在页面上显示的将是150px宽。也可以用以下四个属性来分别设置DIV的内边距：

 padding-left:左内边距。

 padding-right: 右内边距。

 padding-top; 上内边距。

 padding-bottom: 下内边距。
  </div>
  <body>
    <div id="div_id1" class='div_class1'>id的优先级比class的优先级高</div>&gt;
	
  </body>
</html>

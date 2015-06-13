<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="head.jsp"%>
	<style>
		.container .part{
			width:100%;
		}
		.floatdiv{
			position:fixed;
			left:0;
			top:50%;
			margin-top:-20px;
			height:40px;
			width:20px;
			border:1px solid #333333;
			cursor:pointer;
			border-radius:3px;	
			-moz-user-select:none;
		}
		.floatdiv span{
			float:left;
			display:block;
			width:100%;
			height:20px;
			overflow:hidden;
			text-align:center;
		}
	</style>
	<script>
	/**小栏目*/
	$(document).ready(function(){
		$('div.part div.header').click(function(){
			if($(this).next().filter('.comment:visible').length==1) //jquery某些筛选的结果不知道是什么东西（不知道是否为null）
				$(this).next().hide();
			else
				$(this).next().show();
			body_onresize();
		});
		$('div.container .floatdiv span').each(function(index,ov){
			$(this).click(function(){
				if(index==0)
					$('.container .part').css('width','300px');
				else
					$('.container .part').css('width','');
			})
			
		});
	});
	function body_onresize() {
	    try{
	        self.parent.setAreaSize();
	    }
	    catch (e) {
	        window.status = 'Error: ' + e.number + '; ' + e.description;
	    }
	}
	</script>
<div style="margin-left:20px;margin-right:20px;">
	<div class="part">
    	<div class="header"><label>个人资料</label></div>
    	<div class="comment">
	    	<div class="row"><span class="text1">姓名：</span><span class="text2">翟灿东</span></div>
	    	<div class="row"><span class="text1">性别：</span><span class="text2">男</span></div>
	    	<div class="row"><span class="text1">年龄：</span><span class="text2">23</span></div>
	    	<div class="row"><span class="text1">毕业院校：</span><span class="text2">西南大学</span></div>
	    	<div class="row"><span class="text1">学历：</span><span class="text2">本科</span></div>
	    	<div class="row"><span class="text1">状态：</span><span class="text2">单身</span></div>
	    	<div class="row"><span class="text1">星座：</span><span class="text2">天蝎座</span></div>
	    </div>
    </div>
    <div class="part">
    	<div class="header"><label>便签</label></div>
    	<div class="comment">
    		<div class="comment_info">下班后记得关电脑、设置下备用闹钟</div>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>分享</label></div>
    	<div class="comment">
    		<p>今天早上，马克思课上来了才一半左右学生，老师怒瞪班长：怎么回事，你们班其他人呢？班长是女孩子，支吾了半天，什么都说不出来，眼看眼泪要滴下来了，委屈的不行</p>
　　			<p>旁边一男生低声道：有的起不来，有的不起来，有的起不来了，还有的起了不来！老师那个脸色……</p>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>快捷入口</label></div>
    	<div class="comment">
    		<div class="comment_info">资料快捷入口、超链接快捷入口</div>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>最近在做这些</label></div>
    	<div class="comment">
    		<div class="comment_info">写代码、吃饭、走路、睡觉、听歌、看电影</div>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>最近在看的书</label></div>
    	<div class="comment">
    		<div class="comment_info">《李嘉诚全集》、《财经郎眼》、《当你途经我的盛开》、《大数据时代》</div>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>最近作息节奏</label></div>
    	<div class="comment">
    		<div class="comment_info">
    			23:30之后开始睡<br/>
    			08:05起床<br/>
    			还得早睡早起
    		</div>
    	</div>
    </div>
    <div class="part">
    	<div class="header"><label>最近联系的人</label></div>
    	<div class="comment">
    		<div class="comment_info">没联系</div>
    	</div>
    </div>
   	<div class="clear"></div>
</div>
<div class="floatdiv">
	<span style="border-bottom:1px solid #333333;">小</span>
	<span>大</span>
</div>
<%@ include file="foot.jsp"%>
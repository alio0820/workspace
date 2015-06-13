// JavaScript Document
$(function(){
	
	$('#ul_nav_sub dt label').click(
		function(){
			$(this).parents().parents("li").toggleClass("open");
		}
	)
	
	$('#ul_nav_sub dt label').hover(
		function(){
			$(this).toggleClass("mousemove");
		},
		function(){
			$(this).toggleClass("mousemove");
		}
	)
	
	$('#Per_sel .Per_sel_ul li').click(
		function(){
			$(this).toggleClass("bg");
		}
	)
	
	$('#add_Per_sel').click(
		function(){
			$('#Per_sel_ul_1 li').each(function(i){
				if ($(this).is(".bg")) { 
					$(this).removeClass("bg"); 
					$(this).append("<span title='删除'></span>"); 
					$(this).clone().prependTo("#Per_sel_ul_2"); 
					$(this).remove();
				} 
			}); 
		}
	)
	
	$('#Per_sel_ul_2 li span').click(
		function(){
			var domid = $(this).parent("li")
			$(this).remove();
			domid.clone().prependTo("#Per_sel_ul_1"); 
			domid.remove();
		}
	)
	
	if (document.getBoxObjectFor){
		$(".Dis_sel ul").hover(
			function () {
				$(".Dis_sel a.More").css("background-position","left -50px"); 
			},
			function () {
				$(".Dis_sel a.More").css("background-position","left top"); 
			}
		);
	
	
		$(".Dis_sel a.More").hover(
			function () {
				$(this).css("background-position","left -50px"); 
			},
			function () {
				$(this).css("background-position","left top"); 
			}
		);
	}
	
	$('#menu_view li').click(
		function(){
			var indexid = $("#menu_view li").index(this);
			
			$('#menu_view li').removeClass("index")
			$(this).addClass("index")
			
			$('#menu_view .con_view').removeClass("con_view_show")
			$('#menu_view .con_view').eq(indexid).addClass("con_view_show")
		}
	)
	
	$('#ratings_list .icos_contract').click(
		function () {
			var sub_tr = $(this).parents("tr")
			
			$(this).toggleClass("icos_contract"); 
			$(this).toggleClass("icos_extension"); 
			;
			$(this).parent().toggleClass("sel");
			$(this).parent().nextAll("td").toggleClass("sel");
			
			if (sub_tr.next(".Preview").css("display") == "none") sub_tr.next(".Preview").show();
			else sub_tr.next(".Preview").hide()
		}
	); 
	
	$('#Customer_Type a').click(
		function(){
			$('#Customer_Type a').css({'color':'#656565','font-weight':'normal'})
			
			$("#Customer_Type").siblings('div').css("display","none").eq($(this).attr("rid")-1).css("display","block"); 
			
			$(this).css({'color':'#EA170E','font-weight':'bold'});
		}
	)

	
	$('.article_types dd span').click(
		function(){
			$('.article_types dd').removeClass("chengsed");
			$(this).parent().addClass("chengsed");

		}
	)
	
	$('#td_input_email #reg_eamil').keyup(
		function(){
			if ($(this).val() != ""){
				$(this).siblings(".sel_list").find("span").html($(this).val());
				$(this).siblings(".sel_list").show();
			}
			else{
				$(this).siblings(".sel_list").hide();
			}
		}
	)
	
	$('#td_input_email .sel_list a').click(
		function(){
			$('#td_input_email #reg_eamil').val($(this).text())
			$(this).closest(".sel_list").hide();
		}
	)
	
	$('#close_reset_email').click(
		function(){
			$('#reset_email').hide()
		}
	)
	
	$('#open_reset_email').click(
		function(){
			$('#reset_email').show()
		}
	)
	
	$('#type_sel_list td').click(
		function(){
			$('#reset_email').show()
		}
	)
	
	$("#type_sel_list td").hover(
		function () {
			if ($(this).html() != "&nbsp;") $(this).addClass("over");
		},
		function () {
			$(this).removeClass("over");
		}
	); 
	
	
	$("#open_type_list").click(
		function () {
			show_select(0);
			$("#type_sel").show();
		}
	); 
	
	$("#type_sel .assurance").click(
		function () {
			show_select(1);
			$("#type_sel").hide();
		}
	); 
	
	var show_time;	
	var hide_time;	
	
	$("u[menu='C_info']").hover(
		function () {
			clearTimeout(hide_time)
			
			var left_s,top_s
			
			left_s = $(this).offset().left - 240

			top_s = $(this).offset().top + $(this).height() +3
			
			$("#company_card").css({ left: left_s , top: top_s }); 
			
			show_time = setTimeout("$('#company_card').show()",500)
		},
		function () {
			clearTimeout(show_time)
			hide_time = setTimeout("$('#company_card').hide()",50)
		}
	); 
	
	$("#company_card").hover(
		function () {			
			clearTimeout(hide_time)
		},
		function () {
			hide_time = setTimeout("$('#company_card').hide()",50)
		}
	); 
	
	
	$("a.showbigpic").hover(
		function () {		
			var pic_w = $(this).find("div")
			var pic_width = pic_w.width();
			var pic_height = pic_w.height();
			
			var top_height = $(this).offset().top - $(window).scrollTop();
			var left_width = $(this).offset().left - $(window).scrollLeft();
			
			var left_s = 0;
			var top_s = 13;
						
			//优先默认于左下角，当向下(或向右)不足够显示并且向上(或向左)足够时在向上(或向左)显示
			//if ((pic_w.height() > $(window).height() - top_height - $(this).height()) && (top_height > pic_height)) top_s = 0 - pic_height;
			//if ((pic_w.width() > $(window).width() - left_width - $(this).width()) && (left_width > pic_width)) left_s = 0 - pic_width + $(this).width(); 
			
			
			//优先默认于左下角，上下(左右)谁的可见度高就在哪个显示
			if (top_height > $(window).height() - top_height) top_s = 0 - pic_height
			if (left_width > $(window).width() - left_width ) left_s = 0 - pic_width + $(this).width()
			
			
			pic_w.css({ left: left_s , top: top_s }); 
		},
		function () {
		}
	); 
		
	var tabs = $('.jqxt_title_1 ul li');
	tabs.bind('click', function(event) {
		var $this = $(this);
		tabs.removeClass('index23651');
		$this.addClass('index23651');
		var tid = $this.attr('name').match(/ent_(\d+)/i)[1];
		$('.jqlist').addClass('none');
		$('.jqlist:eq(' + tid + ')').removeClass('none');
	});	
	

})


function getobj(itemid){
	return document.getElementById(itemid)
}

function autoswitch (itemid){
	if (getobj(itemid).style.display != "")getobj(itemid).style.display = "";
	else getobj(itemid).style.display = "none";
}

function swich_view(swich,itemid){
	if (swich == 1) document.getElementById(itemid).style.display = "block";
	else document.getElementById(itemid).style.display = "none";
}

function close_view(itemid){
	document.getElementById(itemid).style.display = "none";
}

function changClass(Front,id,count,de_class,indexclass,show){
	
	for(i=1;i<=count;i++){
		getobj(Front + i).className = de_class;
		if (show != false){
			getobj(Front + "S_" + i).style.display = "none";
		}
	}
	
	getobj(Front + id).className = indexclass;
	if (show != false){
		getobj(Front + "S_" + id).style.display = "";
	}
}

function onechangClass(itemid,de_class,indexclass){
	if (getobj(itemid).className == de_class){
		getobj(itemid).className = indexclass;
	}
	else{
		getobj(itemid).className = de_class;
	}
}

function changview(Front,id,count){
	
	for(i=1;i<=count;i++){
		getobj(Front + i).style.display = "none";
	}
	getobj(Front  + id).style.display = "";
}


function show_select(aa){
	var Sys = {};
	var ua = navigator.userAgent.toLowerCase();
	if (window.ActiveXObject) Sys.ie = ua.match(/msie ([\d.]+)/)[1]
	
	if(Sys.ie == "6.0") {
		
		
		var item_arr = document.getElementsByTagName('select');
		
		for (var i=0;i<item_arr.length;i++){
			var e = item_arr[i];
			
			if (aa == 1){
				e.style.visibility = "visible";
			}
			else if (aa == 0){
				e.style.visibility = "hidden";
			}
			else{
				if ((e.style.visibility == "visible") || (e.style.visibility = "") || (((e.style.visibility = ""))))
					e.style.visibility = "hidden";
				else
					e.style.visibility = "visible";
			}

			//visibility:hidden; visibility:visible
		}
	}
}
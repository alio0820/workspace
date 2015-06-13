<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%String title="AmarsoftRD-个人信息";%>
<%@ include file="head.jsp"%>
<style>
	.link {
		display:none;
	    float: right;
	    color: #2C76C0;
	    outline: medium none;
	    text-decoration: none;
	    transition: color 0.2s ease 0s;
	    margin-left:10px;
	}
	.cancel-link,.save-link{
		display:none;
	}
	#dl_pwd:hover .link,#dl_head:hover .link{
		display:block;
	}
	.edit-btn {
	    background: url("images/pic/edit_btn.png") no-repeat scroll 0 1px rgba(0, 0, 0, 0);
	    float: right;
	    line-height: 20px;
	    padding-left: 20px;
	    color:#2C76C0;
	    margin-top:20px;
	}
	.profile .split-line {
	    background: none repeat scroll 0 0 #F2F2F2;
	    height: 1px;
	    margin-top: 12px;
	   	margin-bottom:12px;
	    overflow: hidden;
	}
	.profile dl{
		display:inline-block;
		width:710px;
		padding:12px 0;
		border-bottom:1px solid #F2F2F2;
	}
	.profile dl:hover .edit-link{
		display:block;
	}
	.edit-info:hover .cancel-link,.edit-info:hover .save-link{
		display:block;
	}
	.profile .edit-info:hover .edit-link{
		display:none;
	}
	.profile dt {
	    background-image: url("images/pic/detail.png");
	    background-repeat:no-repeat;
	    color: #666666;
	    font-size: 14px;
	    height: 14px;
	    line-height:14px;
	    margin-bottom: 15px;
	    padding-left: 20px;
	    vertical-align: baseline;
	}
	.profile dd {
	    line-height: 24px;
	    padding-left: 20px;
	}
	.userdetail-profile-basic dd, .userdetail-profile-habits dd {
	    clear: both;
	}
	.profile .profile-attr {
	    color: #999999;
	    display: inline-block;
	    padding-right: 10px;
	    text-align: right;
	    width: 50px;
	}
	.userdetail-profile-basic span, .userdetail-profile-habits span {
	    float: left;
	    max-width: 645px;
	}
	.userdetail-profile-basic .profile-cnt, .userdetail-profile-habits .profile-cnt {
	    padding-left: 3px;
	    word-wrap: break-word;
	}
	.i-txt{
		width:180px;
		height:20px;
	}
	.i-txt:focus{
	   	background: none repeat scroll 0 0 #F4FAFF;
	   	border:1px solid #9DD4FD;
	   	box-shadow:0 1px 1px rgba(0,0,0,0.075) inset, 0 0 8px rgba(82, 168, 236, 0.6);
	   	outline:0 none;
		border-radius: 2px;
	}
	.head_portrait{
		display:inline-block;
		margin-left:10px;
		margin-right:10px;
		float:left;
		border-radius:5px;
	}
	.head_portrait:hover{
		box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);
	}
	.head_portrait_focus{
		box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);
	}
	.head_portrait img{
		border-radius:5px;
	}
	.head_portrait:hover img{
		opacity:0.8;
	}
	.head_portrait_focus img{
		opacity:0.8;
	}
	#dl_head{
		-moz-user-select:none;
	}
	#dl_head dd{
		height:105px;
		float:left;
		display:block;
	}
</style>
<script>
		$(document).ready(function(){
			
		});
		var userName = "<%=userName%>";
		//为头像图片绑定动画效果
		function bindAnimate(dl){
			var head_portrait_list = dl.find('.head_portrait');
			head_portrait_list.hover(function(){
 				$(this).stop().animate({
					'margin-top':"-10px"
				}, 200);
 			},function(){
 				$(this).stop().animate({
					'margin-top':"0px"
				}, 200);
 			});
			head_portrait_list.click(function(){
				$('.head_portrait_focus').removeClass('head_portrait_focus');
				$(this).addClass('head_portrait_focus');
 			});
		}
		//编辑用户信息
		function editPersonInfo(obj){
			var _this = $(obj);
			var _parent = _this.parent();
			_parent.addClass('edit-info');
			_parent.find('.profile-edit').each(function(){
				var value = $(this).html();
				var input = '<input type="text" class="i-txt" value="'+value+'"/>';
				$(this).attr('data',value);
				$(this).html(input);
			});
		}
		//取消用户信息的编辑
		function cancelEdit(obj,status){
			var _this = $(obj);
			var _parent = _this.parent();
			_parent.removeClass('edit-info');
			_parent.find('.profile-edit').each(function(){
				var value ="";
				if(status==null)
					value = $(this).attr('data');
				else{
					value = $(this).find('input').val();
					if($(this).attr('data-field')=="nickName")
						$('.p_author_name').html(value);
					else if($(this).attr('data-field')=="remark")
						$('#p_author_remark').html(value);
				}
				$(this).html(value);
			});
		}
		//保存已经编辑的用户信息
		function savePersonInfo(obj){
			var _this = $(obj);
			var _parent = _this.parent();
			var parameter = "userName="+userName;
			_parent.find('.profile-edit').each(function(){
				var name = $(this).attr('data-field');
				var value = $(this).find('input').val();
				parameter +="&"+name+"="+getURLEncode(value);
			});
			$.ajax({
 				type:'post',
 				url:"jsp_file/person_action.jsp",
 				async:true,
 				cache:false,
 				dataType:'text',
 				data:parameter,
 				success: function(msg){
 					msg = eval("("+msg+")");
 					if(msg.status=="true"){
 						cancelEdit(_parent.find('.cancel-link'),1);
 						contentjs.showTip('success','保存资料成功',85);
 					}
 					else{
 						contentjs.showTip('failure','保存资料失败...',90);
 					}
 				}
 			});
		}
		//修改密码
		function changePwd(){
			$('#dl_pwd').show();
		}
		//取消修改密码
		function hide(obj){
			var _parent = $(obj).parent();
			_parent.find('.i-txt').val("");
			_parent.hide();
		}
		//保存修改的密码
		function savePwd(){
			var oldpassword = $('#oldpassword').val();
			var password = $('#newpassword').val();
			var parameter = "userName="+userName+"&oldpwd="+getURLEncode(oldpassword)+"&pwd="+getURLEncode(password);
			$.ajax({
 				type:'post',
 				url:"jsp_file/person_action.jsp",
 				async:true,
 				cache:false,
 				dataType:'text',
 				data:parameter,
 				success: function(msg){
 					msg = eval("("+msg+")");
 					if(msg.status=="true"){
 						hide($('#dl_pwd .cancel-link'));
 						contentjs.showTip('success','修改密码成功',85);
 					}
 					else{
 						contentjs.showTip('failure',msg.info,100);
 						$('#oldpassword').addClass('error');
 						setTimeout(function(){
 							$('#oldpassword').removeClass('error');
 						},3000);
 					}
 				}
 			});
		}
		//修改头像
		function changeHeadPortrait(){
			var dl_head = $('#dl_head');
			if(dl_head.length>0){
				dl_head.fadeIn('slow');
				return false;
			}
			var timestamp = new Date().getTime();
			var div = '<div id="'+timestamp+'" style="display:none;"></div>';
			var dl = $(div).prependTo($('.profile'));
			$(dl).load("jsp_file/show_headPortrait.jsp",{},function(){
				bindAnimate(dl);
				dl.find('a.head_portrait').dblclick(function(){
					saveHeadPortrait(this);
				})
				dl.find('dl').unwrap();
			});
		}
		//保存选择的头像
		function saveHeadPortrait(obj){
			var head_select=null;
			if(obj==null)
				head_select = $('.head_portrait_focus');
			else
				head_select = $(obj);
			if(head_select.length==0)
				contentjs.showTip('failure',"请选择你喜欢的头像",120);
			else{
				var head_src = head_select.find('img').attr('src');
				var parameter = "userName="+userName+"&head="+head_src;
				$.ajax({
	 				type:'post',
	 				url:"jsp_file/person_action.jsp",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:parameter,
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="true"){
	 						$('#dl_head').hide();
	 						$('.p_author .p_author_face img').attr('src',head_src);
	 						contentjs.showTip('success','修改头像成功',85);
	 					}
	 					else{
	 						contentjs.showTip('failure','修改头像失败...',100);
	 					}
	 				}
	 			});
			}
		}
</script>
<%@ include file="menu.jsp"%>
<br><br>
<div id="doc" class="">
  	<div style="border-radius:5px 5px 0 0px" class="jk_box">
		<div class="jk_main" style="float:left;margin-bottom:3px;width:100%;">
			<div class="textbox fr" style="box-shadow:0 1px 3px 2px rgba(0, 0, 0, 0.2);width:100%;margin-right:0px;border-radius:4px;">
				<div class="d_author" style="width:200px;">
					<div class="louzhubiaoshi_wrap">
						<div class="louzhubiaoshi j_louzhubiaoshi" author="<%=nickName%>">
							<a href="javascript:void(0)"></a>
						</div>
					</div>
					<ul class="p_author">
						<li class="icon">
							<div class="icon_relative" data-field="">
								<a class="p_author_face" href="javascript:void(0)" onclick="changeHeadPortrait()" title="修改头像">
									<img src="<%=user.getHead()%>">
								</a>
							</div>
						</li>
						<li class="d_name" data-field="">
							<a data-field="" alog-group="p_author" class="p_author_name j_user_card"
							 href="javascript:void(0)" style="text-decoration:none;"><%=nickName%></a>
						</li>
						<li style="display: block;" class="l_badge">
							<div class="p_badge">
								<div class="d_badge d_badge_bawu1" title="主人，你的资料在右侧">
									<div class="d_badge_title d_badge_title_bawu">
										主人
									</div>
									<div class="d_badge_lv">
										10
									</div>
								</div>
							</div>
						</li>
						<li style="margin-top:15px;">
							<div id="p_author_remark">
								<%=user.getRemark()%>
							</div>
						</li>
					</ul>
				</div>
				<div style="min-height:710px;position:relative;width:710px;border-width:0px;float:right;border-radius:0 4px 4px 0;padding:0 20px" class="textbox_m">
					<div style="position:relative;height:100%">
						<a class="edit-btn" href="javascript:void(0)" onclick="changePwd()">修改密码</a>
						<div style="background:#F2F2F2;height:1px;width:710px;float:left;"></div>
						<div class="profile">
							<dl class="userdetail-profile-habits" id="dl_pwd" style="display:none;">
								<a class="cancel-link link" href="javascript:void(0)" onclick="hide(this)">取消</a>
								<a class="save-link link" href="javascript:void(0)" onclick="savePwd()">保存</a>
								<dt>
									修改密码
								</dt>
								<dd>
									<span class="profile-attr">原始密码</span>
									<span class="profile-cnt">
										<input id="oldpassword" type="password" class="i-txt"/>
									</span>
								</dd>
								<dd>
									<span class="profile-attr">新密码</span>
									<span class="profile-cnt">
										<input id="newpassword" type="password" class="i-txt"/>
									</span>
								</dd>
							</dl>
							<dl class="userdetail-profile-basic">
								<a class="edit-link link" href="javascript:void(0)" onclick="editPersonInfo(this)">编辑</a>
								<a class="cancel-link link" href="javascript:void(0)" onclick="cancelEdit(this)">取消</a>
								<a class="save-link link" href="javascript:void(0)" onclick="savePersonInfo(this)">保存</a>
								<dt>
									基本资料
								</dt>
								<dd>
									<span class="profile-attr">用户名</span>
									<span class="profile-cnt" data-field="userName"><%=userName%></span>
								</dd>
								<dd>
									<span class="profile-attr">性别</span>
									<span class="profile-cnt profile-edit" data-field="sex"><%=user.getSex()%></span>
								</dd>
								<dd>
									<span class="profile-attr">昵称</span>
									<span class="profile-cnt profile-edit" data-field="nickName"><%=user.getNickName()%></span>
								</dd>
								<dd>
									<span class="profile-attr">签名档</span>
									<span class="profile-cnt profile-edit" data-field="remark"><%=user.getRemark()%></span>
								</dd>
							</dl>
							
							<dl class="userdetail-profile-habits">
								<a class="edit-link link" href="javascript:void(0)" onclick="editPersonInfo(this)">编辑</a>
								<a class="cancel-link link" href="javascript:void(0)" onclick="cancelEdit(this)">取消</a>
								<a class="save-link link" href="javascript:void(0)" onclick="savePersonInfo(this)">保存</a>
								<dt>
									详细资料
								</dt>
								<dd>
									<span class="profile-attr">生日</span>
									<span class="profile-cnt profile-edit" data-field="birthday"><%=user.getBirthday() %></span>
								</dd>
								<dd>
									<span class="profile-attr">出生地</span>
									<span class="profile-cnt profile-edit" data-field="birthplace"><%=user.getBirthplace() %></span>
								</dd>
								<dd>
									<span class="profile-attr">毕业院校</span>
									<span class="profile-cnt profile-edit" data-field="school"><%=user.getSchool()%></span>
								</dd>
								<dd>
									<span class="profile-attr">联系方式</span>
									<span class="profile-cnt profile-edit" data-field="phone"><%=user.getPhone() %></span>
								</dd>
							</dl>
							<dl class="userdetail-profile-habits">
								<dt>
									用户信息
								</dt>
								<dd>
									<span class="profile-attr">注册IP</span>
									<span class="profile-cnt" data-field="registerIp"><%=user.getRegisterIp()%></span>
								</dd>
								<dd>
									<span class="profile-attr">注册时间</span>
									<span class="profile-cnt" data-field="registerTime"><%=user.getRegisterTime() %></span>
								</dd>
								<dd>
									<span class="profile-attr">最近IP</span>
									<span class="profile-cnt" data-field="recentIp"><%=user.getRecentIp()%></span>
								</dd>
								<dd>
									<span class="profile-attr">最近时间</span>
									<span class="profile-cnt" data-field="recentTime"><%=user.getRecentTime() %></span>
								</dd>
								<dd>
									<span class="profile-attr">更新时间</span>
									<span class="profile-cnt" data-field="updateTime"><%=user.getUpdateTime()%></span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>			
		<%@ include file="relativeInfo.jsp"%>
	</div>
</div>
<%@ include file="foot.jsp"%>
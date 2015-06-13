(function(){
    var emotionHTML = "<ul class=\"emotion\"><li>"
				+ "<a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/16.gif?ver=1\" title=\"大笑\" alt=\"大笑\" emotion=\"(大笑)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/1.gif?ver=1\" title=\"微笑\" alt=\"微笑\" emotion=\"(微笑)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/3.gif?ver=1\" title=\"哭\" alt=\"哭\" emotion=\"(哭)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/5.gif?ver=1\" title=\"生气\" alt=\"生气\" emotion=\"(生气)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/14.gif?ver=1\" title=\"困\" alt=\"困\" emotion=\"(困)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/icons/statusface/13.gif?ver=1\" title=\"书呆子\" alt=\"书呆子\" emotion=\"(书呆子)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/4.gif?ver=1\" title=\"调皮\" alt=\"调皮\" emotion=\"(调皮)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/14.gif?ver=1\" title=\"生病\" alt=\"生病\" emotion=\"(生病)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/5.gif?ver=1\" title=\"尴尬\" alt=\"尴尬\" emotion=\"(尴尬)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/7.gif?ver=1\" title=\"惊恐\" alt=\"惊恐\" emotion=\"(惊恐)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/8.gif?ver=1\" title=\"囧-窘迫\" alt=\"囧-窘迫\" emotion=\"(囧)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/19.gif?ver=1\" title=\"呕吐\" alt=\"呕吐\" emotion=\"(吐)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/10.gif?ver=1\" title=\"酷\" alt=\"酷\" emotion=\"(酷)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/11.gif?ver=1\" title=\"流口水\" alt=\"流口水\" emotion=\"(流口水)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/21.gif?ver=1\" title=\"晕\" alt=\"晕\" emotion=\"(晕)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/9.gif?ver=1\" title=\"可爱\" alt=\"可爱\" emotion=\"(可爱)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/3.gif?ver=1\" title=\"吃饭\" alt=\"吃饭\" emotion=\"(吃饭)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/16.gif\" title=\"淘气\" alt=\"淘气\" emotion=\"(淘气)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/20.gif\" title=\"吻\" alt=\"吻\" emotion=\"(吻)\"></a>"
				+ "</li><li><a href=\"javascript:;\" onclick=\"return false;\"><img src=\"http://a.xnimg.cn/imgpro/emotions/tie/23.gif\" title=\"住嘴\" alt=\"住嘴\" emotion=\"(住嘴)\"></a>"
				+ "</li></ul>";

	XN.LikeWidget = function (isLiked, showFaces, data){
		var This = this, elems = Sizzle(".widget,.count_label,.comment"), faces = Sizzle(".face");
		this.liked = isLiked;
		this.data = data;
		this.widget = $(elems[0]);
		this.countLabel = $(elems[1]);
		this.cmt = $(elems[2]);
		if(faces.length>0)
			this.selfFace = $(faces[0]);
		this.icon = $(Sizzle(".icon", this.widget)[0]);
		this.icon.setAttribute('title',this.liked? '取消喜欢':'');
		$(Sizzle(".button")[0]).addEvent("click", function(e){
			if(This.data.uid==undefined || This.data.uid <= 0){
				if(This.loginW && !This.loginW.closed)
					This.loginW.focus();
				else This.loginW = window.open("http://www.connect.renren.com/like/login?url="+encodeURIComponent(This.data.url)+'&md5='+This.data.md5+'&post_form_id='+This.data.postFormId, "_blank", "resizable=yes,width=550,height=290,top=200,left="+(screen.availWidth-550)/2);
			} else {
				var s = e.target || e.srcElement;
				for (var t = s; t && t != this; t = t.parentNode) {
					if (t.className.search(/(\s+|^)like_label/) != -1 && !This.liked) {
						This.changeLike(true);
					} else if (t.className.search(/(\s+|^)icon/) != -1) {
						if(This.widget.hasClassName('icononly') && This.liked)
							return;
						This.changeLike(!This.liked);
					}
				}
			}
		});
		this.initComment();
		if(this.data.uid > 0 && showFaces==null && (this.data.count > 1 || (this.data.count == 1 && !isLiked)) && (document.documentElement.clientHeight||window.innerHeight)>=59){
			this.sendFacesRequest();
		}
	};
	
	$extend(XN.LikeWidget.prototype, {
		openAdminWin : function(){
			if(this.adminW && !this.adminW.closed)
				this.adminW.focus();
			else this.adminW = window.open("http://www.connect.renren.com/like/admin?url="+encodeURIComponent(this.data.url), "_blank", "resizable=yes,width=550,height=290,top=200,left="+(screen.availWidth-550)/2);
		},
		changeLike : function(like){
			if(like){
				if(this.liked) return;
				this.widget.addClass('like');
				if(this.selfFace) this.selfFace.show('fade');				
			} else {
				if(!this.liked) return;
				this.widget.delClass('like');
				this.hideComment();
				if(this.selfFace) this.selfFace.hide('fade');
			}
			this.liked = like;
			this.sendAsynRequest();
			this.icon.setAttribute('title',this.liked? '取消喜欢':'');
		},
		sendAsynRequest : function(){
			var This = this;
			if(!this.requestRunning){
				this.requestRunning = true;
				new XN.net.xmlhttp({
					url : 'http://www.connect.renren.com/like/'+ (this.liked? 'like' : 'unlike'),
					data :'url='+encodeURIComponent(this.data.url)+'&md5='+this.data.md5+'&post_form_id='+this.data.postFormId,
					onComplete : function(){This.requestRunning = false;},
					onSuccess : function(r) {
						r = r.responseText;
						This.onRequest(isJSON(r)? XN.JSON.parse(r) : {result:-1});
		            }
		         });
			}
		},
		sendCommentRequest : function(){
			var comment= XN.string.trim(this.cmt.tt.value);
			if(comment == '写下你的评论，与好友分享...' || comment == '')
				return;
			var This = this;
			if(!this.requestRunning){
				this.requestRunning = true;
				new XN.net.xmlhttp({
					url : 'http://www.connect.renren.com/like/comment',
					data : 'url='+encodeURIComponent(this.data.url)+'&md5='+this.data.md5+'&post_form_id='+this.data.postFormId+'&comment='+comment+"&feedId="+(this.feedId? this.feedId:0),
					onComplete: function(){This.requestRunning = false;},
					onSuccess : function(r) {
						r = r.responseText;
						This.onRequest(isJSON(r)? XN.JSON.parse(r): {result:-1});
			        }
	            });
			}
		},			
		sendFacesRequest : function(){
			var This = this;
			new XN.net.xmlhttp({
				url : 'http://www.connect.renren.com/like/faces',
				data : 'url='+encodeURIComponent(this.data.url)+'&md5='+this.data.md5+'&post_form_id='+this.data.postFormId,
				onSuccess : function(r) {
					r = r.responseText;
					This.onFacesRequest(isJSON(r)? XN.JSON.parse(r): {result:-1});
			    }
	        });
		},
		onFacesRequest : function(json){
			if(json.result==-1||json.length==0) return;
			var faces = $(Sizzle(".faces")[0]), This = this, faceLis = Sizzle(".face"), faceCount = faceLis.length;
			XN.array.each(faceLis, function(i, f){
				if(This.data.uid && i==0)
					return true;
				faces.removeChild(f);
				faceCount-=1;
			});
			var iframeWidth = document.documentElement.clientWidth||window.innerWidth, maxFCount = (iframeWidth>=182?5:Math.floor((iframeWidth+3)/37));
			XN.array.each(json, function(i, f){
				if((This.data.uid && This.data.uid == f.id) || faceCount==maxFCount)
					return true;
				fli = $element("li");
				fli.addClass("face");
				fli.innerHTML = '<a title="查看'+f.name+'的个人主页" href="http://www.renren.com/profile.do?id='+f.id+'" target="_blank"><img alt="" src="'+f.image+'" height="30px" width="30px"/></a><span class="name">'+f.name+'</span>';
				faces.appendChild(fli);
				faceCount+=1;
				if(XN.browser.IE6)
					$(fli).hover('hover');
			});
		},
		onRequest : function(json){
			if(json.result==-1) return;
			var This = this;
			if(json.op=='like'){
				if(json.feedId){
					this.feedId = json.feedId;
				}
				if(json.title){
					$('og_title').innerHTML = json.title;
				}
				/*
				if(json.count){
					if(json.count>9999){
						t.innerHTML = (json.count-(json.count%1000))/10000+"万人";
					}
					else t.innerHTML = json.count+"人";
				}*/
				var iframeWidth = document.documentElement.clientWidth||window.innerWidth;
				if(iframeWidth>=435 && json.nocomment!==true){
					this.countLabel.addEvent("mouseover", this.cmt.mouseover);
					this.countLabel.addEvent("mouseout", this.cmt.mouseout);
				    this.showComment();
				}
			} else if(json.op=='comment'){
				this.countLabel.delEvent("mouseover", this.cmt.mouseover);
				this.countLabel.delEvent("mouseout", this.cmt.mouseout);
				this.cmt.tt.value = '';
				this.hideComment();
			}
		},
		initComment : function(){
			var This = this, tt = Sizzle("textarea", this.cmt)[0], limit = Sizzle(".limit", this.cmt)[0];
			this.cmt.tt = tt;
			this.cmt.editor = $(Sizzle(".editor", this.cmt)[0]);
			tt.value = '写下你的评论，与好友分享...';
			tt.style.color = '#888888';
			tt.onclick = function(){
				if(!This.cmt.editor.hasClassName("expand"))
					This.expandEditor(true);
			};
			$(tt).addEvent("keyup",function(e){
				if(tt.value.length > 140){
					tt.value = tt.value.slice(0,-1);
				}
				limit.innerHTML = tt.value.length + "/140";
			});
			$(Sizzle(".emotionBtn", this.cmt)[0]).addEvent("click", function(e){
				XN.event.stop(e);
				if(!This.cmt.emotions){
					var emotionDiv = $element("div");
					emotionDiv.addClass("emotions");
					emotionDiv.innerHTML = emotionHTML;
					This.cmt.appendChild(emotionDiv);
					This.cmt.emotions = emotionDiv;
					initEmotions(This.cmt);
				}
				This.cmt.emotions.show();
				tt.focus();
			});
			this.cmt.addEvent("click", function(e){
				XN.event.stop(e);
				if(This.cmt.emotions){
					This.cmt.removeChild(This.cmt.emotions);
					This.cmt.emotions = null;
				}
			});
			$(Sizzle(".close", this.cmt)[0]).addEvent("click", function(){
				  This.hideComment();
			});
			$(Sizzle(".submit", this.cmt)[0]).addEvent("click", function(e){
				XN.event.stop(e);
				This.sendCommentRequest();
			});
			this.cmt.mouseover = function(){
				clearTimeout(window.timeID);
				This.showComment();
			};
			this.cmt.mouseout = function(e){
				XN.event.stop(e);
				clearTimeout(window.timeID);
				if(!This.cmt.editor.hasClassName("expand"))
					window.timeID = setTimeout(function(){
							This.hideComment();
					},2000);
			};
		},		
		showComment : function(){
			this.cmt.style.display = 'block';
		},
		hideComment : function(){
			this.cmt.style.display = 'none';
			if(XN.string.trim(this.cmt.tt.value).length==0 || this.cmt.tt.value == '写下你的评论，与好友分享...'){
				this.expandEditor(false);
			}
		},
		expandEditor : function(expand){
			var This = this;
			if(expand){
				clearTimeout(window.timeID);
				this.cmt.editor.addClass("expand");
				var tt = this.cmt.tt;
				if(tt.value=='写下你的评论，与好友分享...')
					tt.value = '';
				tt.style.color = '#000000';
				tt.focus();
			} else {
				this.cmt.editor.delClass("expand");
				var tt = this.cmt.tt;
				if(XN.string.trim(tt.value)=='' || this.cmt.tt.value == '写下你的评论，与好友分享...'){
					tt.value = '写下你的评论，与好友分享...';
					Sizzle(".limit", this.cmt)[0].innerHTML = "0/140";
				}
				tt.style.color = '#888888';
				tt.onclick = function(){
					This.expandEditor(true);
				};
				if(This.cmt.emotions){
					This.cmt.removeChild(This.cmt.emotions);
					This.cmt.emotions = null;
				}
			}
		}
	});
    
	function initEmotions(cmt){
		var list = Sizzle(".emotions img", cmt);
		XN.array.each(list,function(i,v){
			 $(v).addEvent("click", function(e){
			 	 XN.event.stop(e);
			 	 cmt.tt.focus();
                 if((cmt.tt.value.length + v.getAttribute("emotion").length) > 140)
				    return;
                 cmt.tt.value += v.getAttribute("emotion");
				 Sizzle(".limit", cmt)[0].innerHTML = cmt.tt.value.length + "/140";
			 });
		});
	}
})();
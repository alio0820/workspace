var mailInfojs= function(){
	var currentpage,id;
	return {
		getMailContent:function() {
			var content = MailAction.getMailContent(currentpage, id);
			alert(111);
			var content_i = content.indexOf('<');
			document.write(content_i<0?content:content.substring(content_i));
		},
		resize:function(){
			var parentBody = $(window.parent.document.body);
			$(parentBody).find('iframe:visible').css('height',document.body.scrollHeight);
			$(parentBody).find('div.frame-main-cont-body:visible')[0].scrollTop=0;
			mailInfojs.attachDeal();
		},
		attachDeal:function(){
			if($('div.netease-attDown').length!=0){
				var parentBody = $(window.parent.document.body);
				$('div.netease-attDown').hide();
				var attachNum = $('strong').html();
				var dt = $('dt');
				var attachNames="",downloadUrls="",previewUrls="";
				for(var i=0;i<attachNum;i++){
					var _dt =$(dt[i]);
					var attachName = $(_dt).attr('title');
					attachNames+=attachName+";";
					var downloadUrl = $(_dt).next().find('a:first').attr('href');
					downloadUrls+=downloadUrl+";";
					var previewUrl = $(_dt).next().find('a:last').attr('href');
					previewUrls+=previewUrl+";";
				}
				attachNames = attachNames.substring(0,attachNames.length-1);
				downloadUrls = downloadUrls.substring(0,downloadUrls.length-1);
				previewUrls = previewUrls.substring(0,previewUrls.length-1);
				var timestamp = new Date().getTime();
				var div = '<div id="'+timestamp+'"></div>';
				$(parentBody).find('div#_dvReply:visible').before(div);
				var timestamp2 = new Date().getTime();
				var div2 = '<div id="'+timestamp2+'"></div>';
				$(parentBody).find('li#liTime:visible').after(div2);
				$(parentBody).find('div#'+timestamp2).load('htmlPart/attachment.jsp #_liAttach',{'attachNames':attachNames},function(){
					var liAttach = $(parentBody).find('div#'+timestamp2).find('li#_liAttach');
					$(liAttach).unwrap();
					$(parentBody).find('li#_liAttach:visible').find('a').click(function(){
						var frameBody = $(parentBody).find('div.frame-main-cont-body:visible');
						var height=$(frameBody)[0].scrollHeight;
						$(frameBody).animate({scrollTop:height-390},800);
					});
				});
				$(parentBody).find('div#'+timestamp).load('htmlPart/attachment.jsp #dvAttachBody',{'attachNames':attachNames,'downloadUrls':downloadUrls,'previewUrls':previewUrls},function(){
					var attachBody = $(parentBody).find('div#'+timestamp).find('div#dvAttachBody');
					$(attachBody).unwrap();
					/**¸½¼þ*/
					$(attachBody).find('li').hover(function(){
						if($(this).hasClass('attach-li-first'))
							$(this).addClass('nui-bdr-item').addClass('nui-bg-item').addClass('et').addClass('eu');
						else
							$(this).addClass('nui-bdr-item').addClass('nui-bg-item').addClass('et');
					},function(){
						if($(this).hasClass('attach-li-first'))
							$(this).removeClass('nui-bdr-item').removeClass('nui-bg-item').removeClass('et').removeClass('eu');
						else
							$(this).removeClass('nui-bdr-item').removeClass('nui-bg-item').removeClass('et');
					});
				});
				
			}
		}
	};
}();
$(document).ready(mailInfojs.resize);
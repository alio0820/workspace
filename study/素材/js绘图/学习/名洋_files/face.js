
if(typeof HTMLElement != "undefined" && !jQuery.browser.opera && !jQuery.browser.msie){
    try{
        Event.prototype.__defineSetter__("returnValue", function(b){if(!b)this.preventDefault(); return b;});
        Event.prototype.__defineGetter__("offsetX", function(){return this.layerX;});
        Event.prototype.__defineGetter__("offsetY", function(){return this.layerY;});
    //  Event.prototype.__defineGetter__("srcElement", function(){var n=this.target;try{while(1!=n.nodeType)n=n.parentNode;}catch(_e){};return n;});
        Event.prototype.__defineGetter__("srcElement", function(){var n=this.target;while(n.nodeType!=1){n=n.parentNode}return n;});
        Event.prototype.__defineGetter__("srcElement", function(){return this.target;});
        Event.prototype.__defineGetter__("fromElement",function(){var node;if(this.type=="mouseover"){node=this.relatedTarget;}else if(this.type=="mouseout"){node=this.target;}if(!node){return;}while(node.nodeType!=1){node=node.parentNode;}return node;});
        Event.prototype.__defineGetter__("toElement",function(){var node;if(this.type=="mouseout"){node=this.relatedTarget;}else if(this.type=="mouseover"){node=this.target;}if(!node){return;}while(node.nodeType!=1){node=node.parentNode;}return node;});

        HTMLElement.prototype.contains=function(oNode){if(!oNode){return false;}do if(oNode==this){return true;}while(oNode=oNode.parentNode){return false;}};
        HTMLElement.prototype.insertAdjacentHTML=function(where,html){var e=this.ownerDocument.createRange();e.setStartBefore(this);e=e.createContextualFragment(html);this.insertAdjacentElement(where,e);};
        HTMLElement.prototype.insertAdjacentElement=function(where,e){switch(where){case 'beforeBegin':this.parentNode.insertBefore(e,this);break;case 'afterBegin':this.insertBefore(e,this.firstChild);break;case 'beforeEnd':this.appendChild(e);break;case 'afterEnd':if(!this.nextSibling){this.parentNode.appendChild(e);}else{this.parentNode.insertBefore(e,this.nextSibling);}break;}};
    }catch(e){
    }
}


(function(){
var TnewFace51 = {
        name :'',
        isInit :false,
        titles :{'face8':['','΢Ц','��Ц','����','����','�ɰ�','��','����','����','��','ãȻ','��Ƥ','��Ц','�־�','����','��','Ʋ��','��','��','ɫɫ','����','��','ŭ','б��','��','�ڱǿ�','��','����','����','����','Ǯ','��','ί��','�ܴ���','����','����','��','��ɬ','������','͵Ц','����','�ݰ�','��Ц','˥','��','����','��ͷ','���','ĥ��','����','̫��','�ֻ�','�ʺ�','����','��','����','õ�廨','õ�����','���յ���','������','��','����','OK','Ү','����','ǿ','��','����','��','����','��','ð��','�ݳ���','����','NoNo','���۸�','ˣ��','����','ãȻ','����','���','��̾','��į','�ҹ�','����','��ˮ','����','����','��ŭ','����','����']},
        //defcss : 'float:left;cursor:pointer;cursor:hand;width:48px;color:#6a6864;background:url(http://static.51img1.com/v3/home/images/mb.gif) no-repeat 0 0;text-align:center;margin-top:3px;', 
        selcss :'float:left;cursor:pointer;cursor:hand;width:48px;position:relative;top:1px;*top:0px;_top:0px;line-height:23px;color:#000;text-decoration:underline;width:48px;background:url(http://static.51img1.com/v3/home/images/ma.gif) no-repeat 0 0;text-align:center;',
        butt : null,//��ťDOM
        otxt :null,//Ҫ��������textarea����
        ontab : null,//��ǰTAB
        onclass :'face8',//��ǰ�����ʶ
        onimg :'',//��ǰѡ�еı���
        isIE  : jQuery.browser.msie,
        isFF  : jQuery.browser.mozilla,
        isGG  : /Chrome/.test(navigator.userAgent),
        isIE6 : jQuery.browser.version==6.0,
        isIE7 : jQuery.browser.version==7.0,
        isIE8 : jQuery.browser.version==8.0,   
        isIE9 : jQuery.browser.version==9.0,          
        init :function(params){/* �����ʼ�� */ 
            var that = this,_params = '';
            var str=(parseInt(params)>1)?params:'';
            _params = 'http://static.51img1.com/v5/t/public/images/ubbface_bg'+str+'.gif';
           // if(that.isInit) return;
         

            document.body.insertAdjacentHTML('beforeEnd','\
                <div id="public_51face_box_new" style="display:none;left: 0px;position: absolute;top: 35px;width:421px;z-index:9999999;width:421px;height:194px;background: url('+_params+') no-repeat;">\
                    <div style="clear:both; display:block; height:0;font-size:0/0; overflow:hidden; margin:0 auto; padding:0; border:0; background-color:#fff;"></div>\
                    <div style="width:430px; height:194px; margin-top:-3px; *margin-top:-4px; _margin-top:-4px;text-align:center;">\
                        <div id="public_51face_img_div_new" style="width:407px; height:194px; cursor:pointer;cursor:hand;margin:1px auto 0 auto;" onmousemove="TnewFace51.moveFaceEvent(event);" onmouseout="TnewFace51.moveFaceOutEvent(event)">\
                        </div>\
                    </div>\
                    <div id="public_51face_select_box_new" style="display:none;position:absolute;border:1px #f00 solid;width:24px;height:23px;background:transparent;"><div id="public_51face_title_box_new" style="filter:alpha(opacity=0);-moz-opacity:0;opacity:0;background:red;height:100%;width:100%;"></div></div>\
                    <table id="public_51face_show_left_box_new" style="display:none;left:2px;position:absolute;top:23px;width:64px!important;height:64px;border:1px #777 solid;background:#fff;" width="64" height="64" border="0" cellspacing="0" cellpadding="0"><tr><td align="center" valign="middle"><img id="public_51face_show_left_img_new" src="http://static.51img1.com/v3/home/images/tms.gif" /></td></tr></table>\
                    <table id="public_51face_show_right_box_new" style="display:none;right:2px;position:absolute;top:23px;width:64px!important;height:64px;border:1px #777 solid;background:#fff;" width="64" height="64" border="0" cellspacing="0" cellpadding="0"><tr><td align="center" valign="middle"><img id="public_51face_show_right_img_new" src="http://static.51img1.com/v3/home/images/tms.gif" /></td></tr></table>\
                </div>'
            );
            jQuery('li','#public_51face_tab').click(function(e){/* ����Tab�ڵ��¼� */
                e=e||event;
                var eo=e.srcElement;
                var oTxt=jQuery(eo).text().trim();
                var img='';
                var tag='face8';

                if(that.ontab==null)
                {
                    that.ontab= that.gID('public_51face_tab_def');	//��ǰTAB
                }
                //that.ontab.style.cssText=that.defcss;
                that.ontab=eo;	//��ǰTAB
                //that.onclass=tag;
                eo.style.cssText=that.selcss;
            });

            jQuery('#public_51face_img_div_new,#public_51face_select_box_new').click(function(e){	//�û�ȷ��ѡ���¼�
                e=e||event;

                var img= that.onimg;
                if(img=='')return;
                that.faceInstallIco(img.replace('http://static.51img1.com/v3/face/',''));	//�������
            });
         //   that.isInit=true;
            return;
        },
        show:function(t,name,params){
            var that = this,type='',_left=0,_top=0;
            that.name = name;
            if(typeof arguments[2] !='undefined'){
                type = params;
            }else{
                type = 0
            }
            jQuery('#public_51face_box_new').remove();
         //   if(!that.isInit){
                that.init(type);
         //   }
            //$(t).css({'height': '22px','width':' 26px','text-decoration': 'none'});
            if(jQuery('#public_51face_box_new').is(':visible')){/*�����ǰ�Ѿ���ʾ��ر�*/
                return that.hide();
            }
            
            if(name==''){
                return window.alert('�������� .');
            }else{
         
                that.otxt=that.gID(name);
                if(jQuery('#'+name).css('visibility') =='hidden'){
                    
                }else{
                    that.otxt.focus();
                    if(!that.otxt){
                        return window.alert(name+'DOM������.');
                    }                 
                    if(!jQuery(that.otxt).attr('caretPos')){
                        jQuery(that.otxt).attr('caretPos',{text:''});
                    }
                }
            }

            that.butt=t;
            if(jQuery(that.otxt).attr('isfaceevent')!='1'){
                jQuery(that.otxt).attr('isfaceevent',1);
            }

            jQuery(document).bind('mousedown',that.faceDocumentClick);	//���¼�
            var xy=jQuery(that.butt).offset();
            var oh=that.butt.offsetHeight;
            var global_WinDiv_zindex = 0;
            var global_WinDiv_parentNode_zindex= 0;
            var zindex = 0;
            try{
                global_WinDiv_zindex = $('#global_WinDiv').css('zIndex');w
                if(global_WinDiv_zindex>0){
                    zindex = global_WinDiv_zindex;
                }
            }catch(e){}
            try{
                global_WinDiv_parentNode_zindex = $('#global_WinDiv').parent().css('zIndex');
                if(global_WinDiv_parentNode_zindex>0){
                    zindex = global_WinDiv_parentNode_zindex;
                }                
            }catch(e){}
            zindex = (zindex>0)?zindex*10:999999999999;

            switch(type){
                case 0:
                case 1:
                    if(that.isIE){
                    _top = xy.top+oh-22;
                    _left = xy.left-3;                     
                    }else{
                    _top = xy.top+oh-18;
                    _left = xy.left-3;                     
                    }
               
                    break;
                case 2:
                    if(that.isIE){
                        if(that.isIE6){
                            _top = xy.top+oh-24;
                        }else if(that.isIE7){
                            _top = xy.top+oh-23;                        
                        }else if(that.isIE8){
                            _top = xy.top+oh-23;
                        }
                    _left =  xy.left-398;                         
                    }else{
                    _top = xy.top+oh-21;
                    _left =  xy.left-398;                         
                    }                

                    break;
                case 3:
                    if(that.isIE){
                    _top = xy.top+oh-190;
                    _left = xy.left;                     
                    }else{
                    _top = xy.top+oh-190;
                    _left = xy.left;                     
                    }                
      
                    break;
                case 4:
                    if(that.isIE){
                    _top = xy.top+oh-190;
                    _left = xy.left-410;                      
                    }else{
                    _top = xy.top+oh-190;
                    _left = xy.left-410;                      
                    }                
      
                    break;
                   default:
                    if(that.isIE){
                    _top = xy.top+oh-20;
                    _left = xy.left;                     
                    }else{
                    _top = xy.top+oh-20;
                    _left = xy.left;                     
                    }                   
          
                    break;                                                                                                    
            }
            jQuery('#public_51face_box_new').css({top:_top, left:_left,zIndex:zindex*1000}).show();	//�򿪲�   
            try{
                jQuery('.close').bind('click',function(){
                    that.hide();
                });
            }catch(e){}

        },
        faceDocumentClick :function(e){/*�ȫ��������¼�,���ڹرձ����*/
            var that = this;
            e=e||event;
            var eo=e.srcElement;           
            if(TnewFace51.gID('public_51face_box_new').contains(eo) || eo==TnewFace51.gID('public_51face_select_box_new') || eo==TnewFace51.butt)return;
            TnewFace51.hide();
        },
        faceInstallIco :function(i){/*�������ICOͼ Ƭ*/
            var that = this;
            var s='[img]'+i+'[/img]'
            var o=that.otxt;
            //if(!o){
             
            //     return;
           // }
          
            if(!jQuery('#'+that.name).is(':hidden')){
                if(that.isIE){
                    if(o.createTextRange && o.caretPos){
                        var caretPos=o.caretPos;
                        try{
                            caretPos.text=caretPos.text.charAt(caretPos.text.length-1)=='   '?s+'   ':s;
                        }catch(e){
                            o.value=o.value+s;
                        }
                    }else{
                        o.value=o.value+s;
                    }
                }else{
                    if(o.setSelectionRange){
                        var rangeStart=o.selectionStart;

                        var rangeEnd=o.selectionEnd;
                        var tempStr1=o.value.substring(0,rangeStart);
                        var tempStr2=o.value.substring(rangeEnd);
                        o.value=tempStr1+s+tempStr2;
                    }else{
                        alert('����ǰ���������֧�ִ˲���,���ܲ������ͼ��.') //no setSelectionRange
                    }
                }            
            that.faceSetCaret(o);
            }else{
              // that.gID(that.name).innerHTML = s;
              jQuery('#'+that.name).val(s);
            }

            that.hide();	//�رձ����
        },
        hide :function(){/* �رձ���� */
            var that = this;
            jQuery('#public_51face_box_new').hide();
            jQuery(document).unbind('mousedown',that.faceDocumentClick); //ȡ��ȫ�ֵ�Click�¼�
            that.butt=null;
            that.otxt.removeAttribute('caretPos');
            that.otxt=null;
            that.faceEventclear();
        },   
        faceEventclear :function(){/* ����Ƴ���������� */
            var that = this;
            that.onimg='';
            jQuery('#public_51face_show_left_box_new,#public_51face_show_right_box_new,#public_51face_select_box_new').hide();
        },

        moveFaceOutEvent :function(e){/* ����Ƴ�������¼� */
            var that = this;
            e=e||event;
            var eo=e.toElement;
            if(eo==that.gID('public_51face_select_box_new')||eo==that.gID('public_51face_title_box_new'))return;
            that.faceEventclear();
        },
        moveFaceEvent :function(e){/* ����ڱ���ͼƬ���ƶ�ʱ���¼� */
            var that = this;
            e=e||event;
            var ey=that.isFF ? e.offsetY-12 : e.offsetY-10;
            var ex=e.offsetX-3;
            //var col=Math.floor((ex + Math.floor(ex/28)) / 28) + 1;//��
            //var row=Math.floor((ey + Math.floor(ey/27)) / 27) + 1;//��
            var col = parseInt(e.offsetX / 26) + 1;
            var row = parseInt(e.offsetY / 26);
            var no = (row-1) * 15 + col;
            var tag=that.onclass;
            var tit=that.titles['face8'][no];

            if(no>0 && col<16)
            {
                jQuery('#public_51face_select_box_new').css({top:(row*26+5),left:((col-1)*27+(!that.isIE?7:7))}).show();
                jQuery('#public_51face_title_box_new').attr('title',tit);

                if(tag=='face2')	  var endid=70;
                else if(tag=='face3') var endid=83;
                else if(tag=='face6') var endid=42;
                else var endid=90;

                if(no>endid) { //��������ڵ�
                    that.faceEventclear();
                    return;
                }
                no= 'face8' ? (no+201) : no;//alert(no);
                var img='http://static.51img1.com/v3/face/face8/'+(no-1)+'.gif';
                that.onimg=img;
                if(col<4){
                    jQuery('#public_51face_show_left_box_new').hide();
                    jQuery('#public_51face_show_right_img_new').attr('src',img);
                    jQuery('#public_51face_show_right_box_new').show();
                }else{
                    jQuery('#public_51face_show_right_box_new').hide();
                    jQuery('#public_51face_show_left_img_new').attr('src',img);
                    jQuery('#public_51face_show_left_box_new').show();
                }
            }else{
                that.faceEventclear();
            }
        },
        faceSetCaret :function(o){/*��¼��������*/
            var that = this;
            if(jQuery('#'+that.name).is(':hidden')){
                o.focus();
            }
            
        },
        gID :function(n){/* ��ID�������� */
            return document.getElementById(n);
        }
    };
    window.TnewFace51 = TnewFace51;
})();


if(!window.fouiData){
    window.fouiData = {};
}

/**
 * 防止Firefox报CollectGarbage未定义的错
 * CollectGarbage为IE专有函数
 */
if(!/msie/i.test(navigator.userAgent)) {
    var CollectGarbage = function() {}
}

var lastErrorHandler = window.onerror;
    window.onerror = function(message,url,line){
    //alert(url + "," + line + "," + message);
    window.onerror = lastErrorHandler;
    return true;
};
(function() {

var _doc = window.document,
	_docMode = document.compatMode,
	_browser = jQuery.browser;

var foui = {
	isIE: _browser.msie,
	isIE6: _browser.msie && _browser.version < 7,
	isIE7: _browser.msie && _browser.version == 7,
	isDTD: 'CSS1Compat' == _docMode,
    /**
     * online
     */
    onLine : navigator.onLine,

    /**
     * param element id
     * return object
     */
     $F:function(id){
         return document.getElementById(id);
     },
	/**
	 * 延迟加载css或js文件
	 * @param string f
	 * @return void
	 */
	load: function(f, fn) {
		if ('undefined' === typeof f || '' == f) return false;
		var doc = window.document,
			elem,
			head = doc.getElementsByTagName('head')[0],
			ext = f.substring(f.lastIndexOf('.'));
		if ('.css' == ext) {
			elem = doc.createElement('link');
			elem.rel = 'stylesheet';
			elem.type = 'text/css';
			elem.href = f;
			head.appendChild(elem);
			var styles = doc.styleSheets,
				callback = function(){
					for (var i = styles.length; i--; ) {
						if (elem === (styles[i].ownerNode || styles[i].owningElement)) return fn();
					}
					setTimeout(arguments.callee, 5);
				};
			fn && callback();
		} else if ('.js' == ext) {
			elem = doc.createElement('script');
			elem.type = 'text/javascript';
			elem.src = f;
			elem.onload = elem.onreadystatechange = function() {
				if (!elem.readyState || /loaded|complete/.test(elem.readyState)) {
					elem.onload = elem.onreadystatechange = null;
					elem.parentNode.removeChild(elem);
					elem = undefined;
					fn && fn();
				}
			};
			doc.body.appendChild(elem);
		}
		//head.insertBefore(elem, head.firstChild);
	},

	ltrim: function(s) {
		return s.replace(/(^\s*)/g, '');
	},

	rtrim: function(s) {
		return s.replace(/(\s*$)/g, '');
	},

	trim: function(s) {
		return s.replace(/(^\s*)|(\s*$)/g, '');
	},

	/**
	 * Cookie操作
	 */
	cookie: {
		get: function(name) {
			var dc = document.cookie;
			var val = null;
			if ('undefined' !== typeof dc && dc != '') {
				var cks = dc.split(';');
				for (var i = 0; i < cks.length; i++) {
					var ck = foui.trim(cks[i]);
					if (ck.substring(0, name.length + 1) == (name + '=')) {
						val = decodeURIComponent(ck.substring(name.length + 1));
						break;
					}
				}
			}
			return val;
		},
		set: function(name, value, options) {
			options = options || {};
			if (null === value) {
				value = '';
				options.expires = -1;
			}
			var expires = '';
			if (options.expires && ('number' == typeof options.expires || options.expires.toUTCString)) {
				var date;
				if ('number' == typeof options.expires) {
					date = new Date();
					date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
				} else {
					date = options.expires;
				}
				expires = '; expires=' + date.toUTCString();
			}
			var path   = options.path   ? '; path=' + (options.path) : '';
			var domain = options.domain ? '; domain=' + (options.domain) : '';
			var secure = options.secure ? '; secure' : '';
			document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
		}
	},

	/**
	 * 字符替换 var str = 'sssss%saaaaa%sccccc%s';
     *          var s =foui.sprintf(str,'tomasi','10086','456221');
     *          console.log(s); // ssssstomasiaaaaa10086ccccc456221
	 */
	sprintf:function(){
	    var arg = arguments;
		var init = function () {

			if (typeof arg == "undefined") { return null; }
			if (arg.length < 1) { return null; }
			if (typeof arg[0] != "string") { return null; }
			if (typeof RegExp == "undefined") { return null; }

			var string = arg[0];
			var exp = new RegExp(/(%([%]|(\-)?(\+|\x20)?(0)?(\d+)?(\.(\d)?)?([bcdfosxX])))/g);
			var matches = [];
			var strings = [];
			var convCount = 0;
			var stringPosStart = 0;
			var stringPosEnd = 0;
			var matchPosEnd = 0;
			var newString = '';
			var match = null;

			while (match = exp.exec(string)) {
				if (match[9]) { convCount += 1; }

				stringPosStart = matchPosEnd;
				stringPosEnd = exp.lastIndex - match[0].length;
				strings[strings.length] = string.substring(stringPosStart, stringPosEnd);

				matchPosEnd = exp.lastIndex;
				matches[matches.length] = {
					match: match[0],
					left: match[3] ? true : false,
					sign: match[4] || '',
					pad: match[5] || ' ',
					min: match[6] || 0,
					precision: match[8],
					code: match[9] || '%',
					negative: parseInt(arg[convCount]) < 0 ? true : false,
					argument: String(arg[convCount])
				};
			}
			strings[strings.length] = string.substring(matchPosEnd);

			if (matches.length == 0) { return string; }
			if ((arg.length - 1) < convCount) { return null; }

			var code = null;
			var match = null;
			var i = null;

			for (i=0; i<matches.length; i++) {

				if (matches[i].code == '%') { substitution = '%' }
				else if (matches[i].code == 'b') {
					matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(2));
					substitution = convert(matches[i], true);
				}
				else if (matches[i].code == 'c') {
					matches[i].argument = String(String.fromCharCode(parseInt(Math.abs(parseInt(matches[i].argument)))));
					substitution = convert(matches[i], true);
				}
				else if (matches[i].code == 'd') {
					matches[i].argument = String(Math.abs(parseInt(matches[i].argument)));
					substitution = convert(matches[i]);
				}
				else if (matches[i].code == 'f') {
					matches[i].argument = String(Math.abs(parseFloat(matches[i].argument)).toFixed(matches[i].precision ? matches[i].precision : 6));
					substitution = convert(matches[i]);
				}
				else if (matches[i].code == 'o') {
					matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(8));
					substitution = convert(matches[i]);
				}
				else if (matches[i].code == 's') {
					matches[i].argument = matches[i].argument.substring(0, matches[i].precision ? matches[i].precision : matches[i].argument.length)
					substitution = convert(matches[i], true);
				}
				else if (matches[i].code == 'x') {
					matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(16));
					substitution = convert(matches[i]);
				}
				else if (matches[i].code == 'X') {
					matches[i].argument = String(Math.abs(parseInt(matches[i].argument)).toString(16));
					substitution = convert(matches[i]).toUpperCase();
				}
				else {
					substitution = matches[i].match;
				}

				newString += strings[i];
				newString += substitution;

			}
			newString += strings[i];

			return newString;

		};

		var convert = function(match, nosign){
			if (nosign) {
				match.sign = '';
			} else {
				match.sign = match.negative ? '-' : match.sign;
			}
			var l = match.min - match.argument.length + 1 - match.sign.length;
			var pad = new Array(l < 0 ? 0 : l).join(match.pad);
			if (!match.left) {
				if (match.pad == "0" || nosign) {
					return match.sign + pad + match.argument;
				} else {
					return pad + match.sign + match.argument;
				}
			} else {
				if (match.pad == "0" || nosign) {
					return match.sign + match.argument + pad.replace(/0/g, ' ');
				} else {
					return match.sign + match.argument + pad;
				}
			}
		};
            return init();
	},
    getStringLength: function(value) {
		var lengths = 0;
		for (var i = 0,ln = value.length; i < ln; i ++) {
		    if (value.charCodeAt(i) > 255) {
			    lengths += 2;
		    }else {
			    lengths += 1;
		    }
		}
		return lengths;
	},
	IE:function(){
		if(/msie (\d+\.\d)/i.test(navigator.userAgent)){
			return document.documentMode || parseFloat(RegExp.$1);



	    }
		return 0;
    },
	getMousePosition:function(e){
		var e = e||window.event;
		var objSrc = e.srcElement;//event source element

		var left = 0;
		var top  = 0;
		var pos = [left + e.clientX,top + e.clientY];
		return pos;
	},
	addEvent:function(node,type,listaner){
		if (node.addEventListener) {
			// W3C
			node.addEventListener( type, listener, false );
			return true;
		} else if(node.attachEvent) {
			// MSIE
			node['e'+type+listener] = listener;
			node[type+listener] = function(){node['e'+type+listener]( window.event );}
			node.attachEvent( 'on'+type, node[type+listener] );
			return true;
		}
		return false;
	},
	removeEvent:function(node,type,listener){
		if (node.removeEventListener) {
			node.removeEventListener( type, listener, false );
			return true;
		} else if (node.detachEvent) {
			// MSIE
			node.detachEvent( 'on'+type, node[type+listener] );
			node[type+listener] = null;
			return true;
		}
		return false;
	},
	getEventObject:function(W3CEvent) {
		return W3CEvent || window.event;
	},
	getPointerPositionInDocument:function(eventObject) {
	    var that = this;
		eventObject = eventObject || that.getEventObject(eventObject);
		var x = eventObject.pageX || (eventObject.clientX +
			(document.documentElement.scrollLeft || document.body.scrollLeft));
		var y= eventObject.pageY || (eventObject.clientY +
			(document.documentElement.scrollTop || document.body.scrollTop));
		return {'x':x,'y':y};
	 },
	getMouseButton:function(eventObject) {
	    var that = this;
		eventObject = eventObject || that.getEventObject(eventObject);
		var buttons = {
			'left':false,
			'middle':false,
			'right':false
		};
		if(eventObject.toString && eventObject.toString().indexOf('MouseEvent') != -1) {
			// W3C
			switch(eventObject.button) {
				case 0: buttons.left = true; break;
				case 1: buttons.middle = true; break;
				case 2: buttons.right = true; break;
				default: break;
			}
		} else if(eventObject.button) {
			// MSIE
			switch(eventObject.button) {
				case 1: buttons.left = true; break;
				case 2: buttons.right = true; break;
				case 3:
					buttons.left = true;
					buttons.right = true;
				break;
				case 4: buttons.middle = true; break;
				case 5:
					buttons.left = true;
					buttons.middle = true;
				break;
				case 6:
					buttons.middle = true;
					buttons.right = true;
				break;
				case 7:
					buttons.left = true;
					buttons.middle = true;
					buttons.right = true;
				break;
				default: break;
			}
		} else {
			return false;
		}
		return buttons;

	},
	getBrowserWindowSize:function() {
		var de = document.documentElement,win = window,docB = document.body;
		return {
			'width':(win.innerWidth  || (de && de.clientWidth )  || docB.clientWidth),
			'height':(win.innerHeight || (de && de.clientHeight ) || docB.clientHeight)
		}
	},
	clone:function(myObj) {
		if(typeof(myObj) != 'object') {return myObj;}
		if(myObj == null){ return myObj;}
		var myNewObj = {};
		for(var i in myObj) {
			myNewObj[i] = clone(myObj[i]);
		}
		return myNewObj;
	},
    strSclice:function(str,n){
        if(str =='' || n =='' || typeof str !='string' ||typeof n !='number'){return;}
		var that = this;
		var st = that.trim(str);
		var ln = that.getByteLength(st);
  	    var s = (ln>=n)?str.slice(0,n):st;
		return s;
	},
	strSplit:function(str,mark,index){
	    if(str =='' || mark =='' || typeof str !='string' ||typeof index !='number'){return;}
	    var str = str.split(mark);
		return str[index];
	},
    getTime:function(params){
        var that = this;
        var today=new Date(),data;
        var h=today.getHours();
        var m=today.getMinutes();
        var s=today.getSeconds();
        m = that.checkTime(m);
        s = that.checkTime(s);
        switch(params){
            case 0:
                data=h+":"+m+":"+s;
                break;
            case 1:
                data=h+":"+m;
                break;               
        }

        return data;
    },
    checkTime:function(i){
        if (i<10){
            i="0" + i;
        }
        return i; 
    }, 
    lengthByte:function(str) {
        return str.replace(/[^\x00-\xff]/g,"**").length;
    },
  dimension: {
		clntWidth: function() {
			return foui.isDTD ? _doc.documentElement.clientWidth : _doc.body.clientWidth;
		},
		clntHeight: function() {
			return foui.isDTD ? _doc.documentElement.clientHeight : _doc.body.clientHeight;
		},
		docWidth: function() {
			var de = _doc.documentElement,
				db = _doc.body,
				desw = de.scrollWidth,
				decw = de.clientWidth,
				dbsw = db.scrollWidth,
				dbcw = db.clientWidth;
			return foui.isDTD ? (desw > decw ? desw : decw) : (dbsw > dbcw ? dbsw : dbcw);
		},
		docHeight: function() {
			var de = _doc.documentElement,
				db = _doc.body,
				desh = de.scrollHeight,
				dech = de.clientHeight,
				dbsh = db.scrollHeight,
				dbch = db.clientHeight;
			return foui.isDTD ? (desh > dech ? desh : dech) : (dbsh > dbch ? dbsh : dbch);
		},
		scrlLeft: function() {
			return foui.isDTD ? _doc.documentElement.scrollLeft : _doc.body.scrollLeft;
		},
		scrlTop: function() {
			return foui.isDTD ? _doc.documentElement.scrollTop : _doc.body.scrollTop;
		}
	},
	mouse: {
		clntPosition: function(e) {
			e = e || window.event;
			if (e.clientX || e.clientY) {
				return {x: e.clientX, y: e.clientY};
			}
			return {x:0,y:0};
		},
		docPosition: function(e) {
			e = e || window.event;
			if (e.pageX || e.pageY) {
				return {x: e.pageX, y: e.pageY};
			} else if (e.clientX || e.clientY) {
				return foui.isDTD
			       ? {x: e.clientX + dd.scrollLeft, y: e.clientY + dd.scrollTop}
			       : {x: e.clientX + db.scrollLeft, y: e.clientY + db.scrollTop};
			}
			return {x:0,y:0};
		}
	},
    
	frmTrans: function(obj) { // ie下iframe透明
		obj.onload = obj.onreadystatechange = function() { // making the iframe background transparent for ie6
			if (!obj.readyState || /loaded|complete/.test(obj.readyState)) {
				obj.onload = obj.onreadystatechange = null;
				var frmDoc = obj.contentDocument || obj.contentWindow.document;
				var headNode = frmDoc.getElementsByTagName('head')[0];
				var styleNode = frmDoc.createElement('style');
				styleNode.setAttribute('type', 'text/css');
				var cssText = 'body{background-color:transparent}';
				if (styleNode.styleSheet) {
					styleNode.styleSheet.cssText = cssText;
				} else if (frmDoc.createTextNode) {
					styleNode.appendChild(frmDoc.createTextNode(cssText));
				}
				obj.setAttribute('allowTransparency', true);
				headNode.appendChild(styleNode);
			}
		};
	},
    /**
     * 字符串过滤
     * 目标字符串中可能会影响数据构造的字符串进行过滤
     * @function
     * @param {string} str 目标字符串
     * 过滤符号 " ' < > \ / 
     * @shortcut escapeString
     */
    escapeString : function(str){
        if(!str || 'string' != typeof str){ return str;}
        return str.replace(/"/g,' ')
        .replace(/'/g,'')
        .replace(/</g,'')
        .replace(/>/g,'')
        .replace(/\\/g,'')
        .replace(/\//g,'');
    },
    /**
     * 对目标字符串进行html编码
     * @name foui.encodeHTML(source)     
     * @function
     * @param {string} source 目标字符串
     * 编码字符有5个：&<>"'
     * @returns {string} html编码后的字符串
     */
    encodeHTML : function(source){
    return String(source)
                .replace(/&/g,'&amp;')
                .replace(/</g,'&lt;')
                .replace(/>/g,'&gt;')
                .replace(/"/g, "&quot;")
                .replace(/'/g, "&#39;");    
    },
    /**
     * 对目标字符串进行html解码
     * @name foui.decodeHTML
     * @function
     * @param {string} source 目标字符串
     * @shortcut decodeHTML
     * @returns {string} html解码后的字符串
     */
    decodeHTML : function (source) {
        var str = String(source)
                    .replace(/&quot;/g,'"')
                    .replace(/&lt;/g,'<')
                    .replace(/&gt;/g,'>')
                    .replace(/&amp;/g, "&");
        /*处理转义的中文和实体字符*/
        return str.replace(/&#([\d]+);/g, function(_0, _1){
            return String.fromCharCode(parseInt(_1, 10));
        });
    },
    getByteLength : function (source) {
        return String(source).replace(/[^\x00-\xff]/g, "ci").length;
    },
    /**
    * 方法:Array.remove(dx) 
    * 功能:删除数组元素. 
    * 参数:dx删除元素的下标. 
    * 返回:在原数组上修改数组   
    *  经常用的是通过遍历,重构数组.
    */
    arrayRemove : function(dx,arr){  
         if(isNaN(dx)||dx>arr.length){return false;}  
         for(var i=0,n=0;i<arr.length;i++){  
             if(arr[i]!=arr[dx]){  
                 arr[n++] = arr[i]  
             }
         }  
         return arr.length-= 1;
    },  
    
 //在数组中获取指定值的元素索引  
    arrayGetIndexByValue: function(value,arr){  
        if(typeof arr!='function'){return;}
        var index = -1;  
        for (var i = 0; i < arr.length; i++){  
             if (arr[i] == value){  
                 index = i;  
                 break;  
             }
         }
         return index;  
    },
    /**
     * 新弹窗口
     * @name foui.publicWinOpen
     * @function
     * @param {string} string array
     * @returns 
     */    
    publicWinOpen: function(){
    //url,width,height,title,top,left
        var screenHeight= screen.availHeight;
        var screenWidth = screen.availWidth;
        var width=0,height=0,top=0,left=0,title='',url='';

        switch(arguments.length){
            case 0:
                break;
            case 1:
                if(typeof arguments[0]=='string'){
                        url = arguments[0];                                    
                }
                break;
            case 2:
                if(typeof arguments[0]=='string'){
                        url = arguments[0];                                    
                }
                if(typeof parseInt(arguments[1]) =='number'){
                    width = arguments[1];                  
                }
                break;
            case 3:
                if(typeof arguments[0]=='string'){
                        url = arguments[0];                                    
                }
                if(typeof parseInt(arguments[1]) =='number'){
                    width = arguments[1];                  
                } 
                if(typeof parseInt(arguments[2]) =='number'){
                    height = arguments[2];                  
                }                                          
                break;
            case 4:
                if(typeof arguments[0]=='string'){
                        url = arguments[0];                                    
                }
                if(typeof parseInt(arguments[1]) =='number'){
                    width = arguments[1];                  
                } 
                if(typeof parseInt(arguments[2]) =='number'){
                    height = arguments[2];                  
                }
                if(typeof arguments[3]=='string'){
                    title = arguments[3];
                }           
                break;
            case 5:
                if(typeof arguments[0]=='string'){
                    url = arguments[0];                                    
                }
                if(typeof parseInt(arguments[1]) =='number'){
                    width = arguments[1];                  
                } 
                if(typeof parseInt(arguments[2]) =='number'){
                    height = arguments[2];                  
                }
                if(typeof arguments[3]=='string'){
                    title = arguments[3];
                }
                if(typeof parseInt(arguments[4]) =='number'){
                   top = arguments[4];
                }             
                break;
            case 6:
                if(typeof arguments[0]=='string'){
                    url = arguments[0];                                    
                }
                if(typeof parseInt(arguments[1]) =='number'){
                    width = arguments[1];                  
                } 
                if(typeof parseInt(arguments[2]) =='number'){
                    height = arguments[2];                  
                }
                if(typeof arguments[3]=='string'){
                    title = arguments[3];
                }
                if(typeof parseInt(arguments[4]) =='number'){
                   top = arguments[4];
                }
                if(typeof parseInt(arguments[5]) =='number'){
                   left = arguments[5];
                }                            
                break;
            default:
                break;                                                                                                  
        }

                
        url = url?url:'http://jiaoyou.51.com/?c=webchat';
        width = width?width:865;
        height = height?height:645;
        title = title?title:'webchat';

        top = (parseInt(screenHeight)- parseInt(width))/2;
        left = (parseInt(screenWidth )- parseInt(height))/2;

        var G=window.open(url ,title ,'height='+height +',width='+width +',top='+top +',left='+left +',toolbar=no,menubar=no,scrollbars=no,location=no,status=no');
        try{
            if(G == null){
                //
            }
            G.focus()
        }catch(e){}
    }
};

window.foui = foui;
})();

(function() {
	jQuery.extend({
		cookie: function(n,v,o) {
			if ('undefined' === typeof v) {
				return foui.cookie.get(n);
			} else {
				return foui.cookie.set(n,v,o);
			}
		}
	});

})(jQuery);

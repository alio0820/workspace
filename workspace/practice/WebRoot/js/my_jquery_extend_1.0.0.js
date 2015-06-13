/// <reference path="jquery-1.4.2-vsdoc.js"/>
//JQ全局应用扩展 by Huzj
$.extend({
    Int: function(n) {
        return parseInt(n || 0, 10) || 0;
    },
    Fmt: function(s, j) {// 格式化字符串 Fmt("{0}.[{id}].{name}",{id:1,name:'Text'}) = "1.[1].Text"
        var r = [];
        if (j.constructor == Array) for (var i = 0; i < j.length; i++) r.push($.Fmt(s, j[i]));
        else r.push(s.replace(/{(\w+)?}/g, j.constructor == String ? j : function($0, $1) { if (/(\d+)/.test($1)) { var vI = 0, oJ = null; for (oJ in j) { if (vI == $1) { $1 = oJ; break; } vI += 1; } } return j[$1]; }));
        return r.join("");
    },
    Len: function(s) { //取字符串长度 一个汉字=两个字符
        return s.replace(/[^\x00-\xff]/g, "**").length;
    },
    JsonToStr: function(j) {
        if (j == null) return "";
        var arr = [], jt = j.constructor == Array;
        for (var i in j) arr.push((jt ? "" : (i + ":")) + (/number|function/.test(typeof j[i]) ? j[i] : typeof (j[i]) == "object" ? $.JsonToStr(j[i]) : ("\"" + j[i].replace("\"", "\\\"") + "\"")));
        return (jt ? ["[", arr, "]"] : ["{", arr, "}"]).join("");
    }
});

$.fn.extend({
    outerHTML: function() {
        return $('<div></div>').append(this.eq(0).clone()).html();
    },
    mousewheel: function(Func) { //滚动事件 Func(X) X参数=滚动方向 1 || -1 下正 上负
        var t = this[0];
        if ($.browser.msie || $.browser.safari) t.onmousewheel = function() { event.returnValue = false; Func && Func.call(t, event.wheelDelta < 0 ? 1 : -1); };
        else t.addEventListener("DOMMouseScroll", function(e) { e.preventDefault(); Func && Func.call(t, e.detail < 0 ? -1 : 1); }, false);
        return this;
    },
    SelectOff: function() {  //禁止用户选中任意内容
        window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty(); //释放拖选内容
        if ($.browser.mozilla) this.css({ "-moz-user-focus": "ignore", "-moz-user-input": "disabled", "-moz-user-select": "none" });
        if ($.browser.msie) { this[0].ReturnTrue = function() { return false; }; this.bind("selectstart", this[0].ReturnTrue); }
        return this;
    },
    SelectOn: function() { //允许用户选中任意内容
        if ($.browser.mozilla) this.css({ "-moz-user-focus": "normal", "-moz-user-input": "auto", "-moz-user-select": "auto" });
        if ($.browser.msie) { this.unbind("selectstart", this[0].ReturnTrue); this[0].ReturnTrue = null; }
        return this;
    }
});

//拖拽渲染功能 开始---------------------------- by HuZunJie 20100607
//拖拽渲染功能，$(dom).Drag(fns) 后该dom对象上即可进行鼠标拖动 
//fns：{tn: 'a', OffMask: false, MaskOpacity: 0.3, MaskColor: "#ccc",MouseDown:function(){/*拖动前执行*/},MouseMove:function(){/*拖动中执行*/},MouseUp:function(){/*拖动完执行*/},MoveObj: null,OffMod:true, MoveInY: false, MoveInX: false, BoxObj: null}
//     @MoveObj 拖动事件要绑定到的对象，不指定则为自己(jquery dom object)可用于模拟window时候拖动标题栏以移动窗体的效果
//     @OffMod [true|false]拖动时是否屏蔽虚线调制器（直接拖动mousedown对应对象） 默认false
//     @MouseDown @MouseMove @MouseUp 可用来指定整个过程中任意步骤下要需要随即执行的方法,所有方法中的this=(jquery dom object)是触发mousedown的对象 this.fns.MoveObj为拖动对象 MouseMove中可用this.InBox, this.OverBox判断拖动对象是否处于限制盒中或是否触碰到盒子
//     @MoveInY @MoveInX 是否将拖动对象锁定在Y轴或X轴上[true|false] 默认false
//     @BoxObj 拖拽效果容器，若指定则拖拽对象仅局限于本容器内部(jquery dom object)
//     @tn     拖拽虚线框的TagName,当用于显示要拖动的特定内容时候需要调整为DIV 默认为 A
//     @BindInBox[true|false] 是否将拖动对象的移动范围控制在BoxObj之中，未指定BoxObj则该属性无效，默认true（可用于不局限于框内，而计算与框的碰撞）
$.fn.Drag = function(fns) {
    if (this.length == 0) return this;
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).Drag(fns)); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    var cf = { tn: 'a', OffMask: false, MaskOpacity: 0.3, MaskColor: "#ccc", MouseDown: null, MouseMove: null, MouseUp: null, MoveObj: null, OffMod: false, MoveInY: false, MoveInX: false, BoxObj: null, BindInBox: true };
    fns = fns || cf;
    if (fns.BoxObj === "parent") fns.BoxObj = this.parent();
    if (fns.MoveObj === "parent") fns.MoveObj = this.parent();
    if (typeof fns.MoveObj == "function") fns.MoveObj = fns.MoveObj.call(this);
    fns.BindInBox = fns.BindInBox == null ? cf.BindInBox : fns.BindInBox;
    fns.MoveObj = fns.MoveObj || cf.MoveObj;
    fns.MoveInY = fns.MoveInY || cf.MoveInY; //若未指定是否锁定到Y轴则默认为不锁定
    fns.MoveInX = fns.MoveInX || cf.MoveInX; //若未指定是否锁定到X轴则默认为不锁定
    fns.OffMod = !(fns.OffMod || cf.OffMod); //若未指定是否屏蔽虚线调制器则默认为不屏蔽
    fns.OffMask = !(fns.OffMask || cf.OffMask); //若未指定是否关闭document遮罩则默认为不关闭
    fns.MaskOpacity = fns.MaskOpacity == null ? cf.MaskOpacity : fns.MaskOpacity; //若未指定遮罩透明度则默认为0.3
    fns.MaskColor = fns.MaskColor || cf.MaskColor; //若未指定遮罩透明度则默认为0.3
    fns.tn = fns.tn || cf.tn; this[0].fns = fns; //若未指定遮罩透颜色则默认为银灰色
    //_filter:alpha(opacity=30);opacity:0.3;background-color:#eeeeee;line-height:0px;font-size:0px;width:0px;height:0px;
    if (!$.DragRun) {
        $.DragRun = function(e) {
            e.preventDefault(); //取消容器默认的拖动动作（如部分浏览器可拖动图片到地址栏）
            if ($.browser.msie) this.setCapture(); //绑定UI容器的鼠标事件到对象上
            $.dVar = {};
            var o = $($.dVar.o = this), thisTL;
            this.fns.MoveObj = this.fns.MoveObj == null || this.fns.MoveObj.length == 0 ? o : (typeof this.fns.MoveObj == "object" && "selector" in this.fns.MoveObj ? this.fns.MoveObj : $(this.fns.MoveObj));
            this.mod = this.fns.OffMod ? $("<" + this.fns.tn + " id='" + this.fns.tn + "PyzyDrag' style='position:absolute;z-index:99999991;overflow:hidden;cursor:move;color:#000;border:dotted #333 " + ($.browser.opera ? 1 : 0) + "px ;margin:0px;padding:0px;text-decoration:none;' href='javascript:;'></" + this.fns.tn + ">").appendTo("body").show() : this.fns.MoveObj;
            var oH = this.mod[0].oH = this.fns.MoveObj.outerHeight(), oW = this.mod[0].oW = this.fns.MoveObj.outerWidth();
            this.fns.MoveObj.offset(function(i, c) { return thisTL = c; }).offset(thisTL); //为避免默认未设置CSS中top、left的对象产生错位需要重新设置一下，重复两次是因为一次的话IE下会有问题
            $.dVar.y = e.pageY - thisTL.top; $.dVar.x = e.pageX - thisTL.left;
            if (this.fns.OffMod) this.mod.css({ height: oH, width: oW, top: thisTL.top, left: thisTL.left }).offset(thisTL).focus(); //初始虚线调制模型
            if (this.fns.BoxObj != null) { //如果存在活动范围限制容器则初始必要参数
                var bo = $(this.fns.BoxObj);
                if (bo.length == 0) this.fns.BoxObj = null; //无匹配范围限制容器
                else {
                    var oT = bo.offset().top, oL = bo.offset().left, bs = bo[0].style;
                    this.mod[0].minTop = oT + $.Int(bs.borderTopWidth) + $.Int(bs.paddingTop);
                    this.mod[0].maxTop = oT + bo.outerHeight() - oH - $.Int(bs.borderTopWidth) - $.Int(bs.paddingTop);
                    this.mod[0].minLeft = oL + $.Int(bs.borderLeftWidth) + $.Int(bs.paddingLeft);
                    this.mod[0].maxLeft = oL + bo.outerWidth() - $.Int(bs.paddingRight) - oW;
                }
            }
            if ($.dVar.o.fns.OffMask) $.dVar.mask = $(document).Mask(this.fns.MaskOpacity == 0 ? { tn: 'iframe', iframe: 0} : null).css({ "opacity": this.fns.MaskOpacity, "z-index": "1", "background-color": this.fns.MaskColor }); //创建遮罩 避免鼠标拖动到iframe时无法获取坐标
            $("body").SelectOff(); //禁止页面内容拖选
            this.fns.MouseDown && this.fns.MouseDown.call(this, e); //执行传入的方法.css({ cursor: "move" })
        };
        $(document).mousemove(function(e) {
            if ($.dVar) {
                $.dVar.o.mod.offset(function(i, c) {
                    var t = e.pageY - $.dVar.y, l = e.pageX - $.dVar.x, b, bo, boxTF = ($.dVar.o.fns.BoxObj != null);
                    if (boxTF && $.dVar.o.fns.BindInBox) { //按指定容器进行活动范围限制
                        t = t < this.minTop ? this.minTop : t > this.maxTop ? this.maxTop : t;
                        l = l > this.maxLeft ? this.maxLeft : l < this.minLeft ? this.minLeft : l;
                    }
                    t = $.dVar.o.fns.MoveInY ? c.top : t;
                    l = $.dVar.o.fns.MoveInX ? c.left : l;
                    if (boxTF && !$.dVar.o.fns.BindInBox) {
                        $.dVar.o.InBox = this.maxTop >= t && t >= this.minTop && this.maxLeft >= l && l >= this.minLeft;
                        $.dVar.o.OverBox = this.maxTop + this.oH > t && t > this.minTop - this.oH && this.maxLeft + this.oW > l && l > this.minLeft - this.oW;
                    }
                    return { top: t, left: l };
                });
                $.dVar.o.fns.MouseMove && $.dVar.o.fns.MouseMove.call($.dVar.o, e); //执行传入的方法
            }
        });
        $(document).mouseup(function(e) {
            if ($.dVar) {
                if ($.dVar.o.fns.OffMod) { //若拖动时启用虚线框 释放时候需对拖动对象按虚线框重新定位
                    $.dVar.o.fns.MoveObj.offset($.dVar.o.mod.offset());
                    $.dVar.o.mod.blur(); //.hide();
                    $.dVar.o.mod.remove();
                }
                $.dVar.o.fns.MoveObj.css("cursor", "auto");
                $("body").SelectOn(); //允许页面内容拖选
                $.dVar.o.fns.MouseUp && $.dVar.o.fns.MouseUp.call($.dVar.o, e); //执行传入的方法
                if ($.browser.msie) $.dVar.o.releaseCapture(); //取消绑定UI容器的鼠标事件到对象上
                if ($.dVar.o.fns.OffMask) { $.dVar.mask.UnMask(); /*$.dVar.mask.hide(); $.dVar.mask[0].MaskObj.hide();*/ } //关闭遮罩
                $.dVar = null; //清理临时变量
            }
        });
    }
    this.bind("mousedown", $.DragRun);
    return this;
};
//取消拖拽渲染
$.fn.UnDrag = function() {
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).UnDrag()); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    return this.unbind("mousedown", $.DragRun);
 };
//----------拖拽渲染功能 完毕---------------------------- by HuZunJie 20100609

//----------遮罩渲染功能 开始---------------------------- by HuZunJie 20100609
//遮罩渲染功能，$(dom).Mask(fns) 后该dom对象上即产生一个遮罩层
//fns：{ appendToObj:"body",/*遮罩对象DIV创建到的容器对象，可JQ选择器字符串，可为JQ对象*/
//       tn: "遮罩层HTML TagName 默认为div",bind:true,/*将遮罩绑定到对象上 如果对象是按百分比显示或位于自动换行内容中 则窗体宽高变化后遮罩跟着移动 默认为true*/
//       fadeType:"fadeIn", /*淡入显示效果[fadeIn|show|slideDown] null为不启用该效果*/
//       fadeTime:500 /*淡入效果执行时间 默认500毫秒*/,
//       fun:function(){this==t0.MaskObj/*显示完毕后执行*/},
//       iframe:X/*任意值表示不启用iframe作为底遮罩 默认启用*/,
//       changeFun:function(){this==t0.MaskObj/*对象坐标调整时执行*/}
//     }
 $.fn.Mask = function(fns) {
     if (this.length == 0) return this;
     if (!$.PMFN) { $(window).resize(function() { $("[ispyzymask=bind]").each(function(i) { $(this).MaskChange(); }); }); $.PMFN = 1 } //窗口变化时自适应源对象位置
     if (this.length > 1) {
         var $retObjs;
         this.each(function() { $retObjs = $($retObjs).add($(this).Mask(fns)); });
         try { return $retObjs; } finally { $retObjs = null; }
     }
     var cf = { tn: 'div', bind: true, fadeType: null, fadeTime: 500, fun: function() { }, changeFun: function() { } };
     fns = typeof fns === "object" ? fns : cf;
     fns.tn = fns.tn || cf.tn;
     fns.fadeTime = fns.fadeTime || cf.fadeTime;
     var t = this, t0 = t[0];
     t0.MaskObj = t0.MaskObj || $("<" + fns.tn + " ispyzymask='" + (fns.bind || fns.bind == null ? "bind" : "nobind") + "' style='position:absolute;z-index:9999999;background-color:#000000;" + ($.browser.msie ? "filter:alpha(opacity=30);" : "opacity:0.3;") + "border:0px;margin:0px;padding:0px;overflow:hidden;display:none;'></" + fns.tn + ">").appendTo(fns.appendToObj || "body");
     t0.MaskObj[0].changeFun = fns.changeFun || function() { };
     t0.MaskObj[0].obj = this; //这里的obj付值用于反查操作
     t0.MaskObj.MaskChange();
     if (fns.fadeType) { t0.MaskObj[fns.fadeType](fns.fadeTime, fns.fun); } else { t0.MaskObj.show(); fns.fun && fns.fun.call(t0.MaskObj); };
     if (fns.iframe == null) t0.MaskObj.Mask({ appendToObj: fns.appendToObj, tn: "iframe", iframe: 0 }).css({ "opacity": "0", "z-index": $.Int(t0.MaskObj.css("z-index")) - 1 });
     setTimeout(function() { t0.MaskObj&&t0.MaskObj.MaskChange() }, $.browser.msie ? 300 : 0); //IE6下如果宽度自动的元素会先按document的宽展开 然后再按window 的宽缩放;FF下页面滚动后加载存在偏差
     return t0.MaskObj;
 };

//窗口变更时调整遮罩比例，避免按百分比显示的遮罩出现坐标错误
// $("#MaskId").MaskChange() 遮罩层对象
 $.fn.MaskChange = function() {
     if (this.length == 0) { /*alert("[" + this.selector + "]对应对象不存在，无法调整其遮罩。");*/return this; }
     if (this.length > 1) {
         var $retObjs;
         this.each(function() { $retObjs = $($retObjs).add($(this).MaskChange()); });
         try { return $retObjs; } finally { $retObjs = null; }
     }
     if (this[0].mc === true) return;
     var t = this, t0 = t[0]; t0.mc = true;
     if (t0.obj) {
         var oT = 0, oL = 0, oH = 100, oW = 100, isDoc = (t0.obj[0] == window || t0.obj[0] == document);
         if (isDoc) { //window or document
             t.height(1).width(1); //先将全屏遮罩设置为1象素以应用于自适应宽高的文档
             var bd = $("body"), doc = $(document), win = $(window);
             oH = Math.max(win.height(), bd.outerHeight(true), document.documentElement.scrollHeight); 
             oW = Math.max($.browser.msie ? bd.outerWidth(true) : doc.width(), win.width());
         } else {  //HtmlElement
             oH = t0.obj.outerHeight();
             oW = t0.obj.outerWidth();
             var oo = t0.obj.offset();
             oT = oo.top;
             oL = oo.left;
         }
         t[$.browser.msie ? "css" : "offset"]({ top: oT, left: oL }).height(oH).width(oW);
         t0.changeFun.call(t); //执行自定义方法
     }
     t0.mc = null;
 };
//遮罩关闭功能  ($("#MaskId") || $("#MaskId").obj ).UnMask() 遮罩层对象或其对应的对象 遮罩对象优先
//fns：{ fadeType:"fadeIn", /*淡出显示效果[fadeOut|hide|slideUp] null为不启用该效果*/
//       fadeTime:100 /*淡出效果执行时间 默认500毫秒*/,
//       fun:function(){/*对象删除完毕前执行*/}                                       }
$.fn.UnMask = function(fns) {
    var t = this;
    if (t.length == 0) return t;
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).UnMask(fns)); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    fns = typeof fns === "object" ? fns : { fadeType: null, fadeTime: 500, fun: null };
    fns.fun = typeof fns.fun === "function" ? fns.fun : function() { };
    fns.fadeTime = fns.fadeTime || 500;
    if (t[0].MaskObj) t[0].MaskObj.UnMask(fns); //存在子遮罩则先执行清除
    if (t.attr("ispyzymask")) {
        if (fns.fadeType) t[fns.fadeType](fns.fadeTime, function() { fns.fun.call(this); t.remove(); });
        else { fns.fun.call(t[0]); t.remove(); }
        t[0].obj[0].MaskObj = null;
    }
};
//----------遮罩渲染功能 结束---------------------------- by HuZunJie 20100611

//滚动条渲染功能，可自行配置样式，配置方法参见本方法中的cfg对象元素说明
$.fn.ScrollBar = function(fns) {
    if (this.length == 0) return this;
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).ScrollBar(fns)); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    var cfg = { //配置参数：即fns的默认参数，与fns中可配置属性相同
        fun: function() { }, /*滚动时执行的方法 方法中的this==t0*/
        y: {    //Y轴（纵向）滚动条属性
            BG: '#eee', /*背景属性可直接设置为颜色也可设置为 “url(img.url) 1px 2px”,下面所有有BG字样者相同*/
            width: 16,  /*总容器宽 可用来设置纵向滚动条宽度*/
            height: 200, /*总容器高 当下面的自适应关闭时有效*/
            autoHeight: true, /*自动适应目标元素的高*/
            showType: [0, 1, 2], /*显示方式当前值表示 [向上按钮][滑块容器][向下按钮]*/
            topBtn: { height: 16, BG: 'red', overBG: '#FFB1B4', downBG: '#B40000' }, //向上按钮
            dragBox: { height: 170, BG: null, topBG: null, btmBG: null }, //可拖动滑块的容器
            drag: { //可拖动滑块
                height: 20, BG: 'blue', minHeight: 15, /*滑块最小高度*/
                topBG: null, cenBG: null, btmBG: null, /*正常背景图片需要设置为不平铺切居上 url(img.jpg) 0px 0px*/
                overBG: '#1679FF', overTopBG: null, overBtmBG: null, overCenBG: null, /*鼠标浮上时的背景*/
                downBG: '#000076', downTopBG: null, downBtmBG: null, downCenBG: null  /*鼠标按下时的背景*/
            },
            btmBtn: { height: 16, BG: 'red', overBG: '#FFB1B4', downBG: '#B40000'} //向下按钮
        },
        x: {    //X轴（横向）滚动条属性
            height: 16, width: 300, BG: '#eee', showType: [0, 1, 2], autoWidth: true, /*自动适应目标元素的高*/
            leftBtn: { width: 16, BG: 'red', overBG: '#FFB1B4', downBG: '#B40000' },
            dragBox: { width: 200, BG: null, leftBG: null, rightBG: null },
            drag: {
                width: 20, BG: 'blue', leftBG: null, cenBG: null, rightBG: null, minWidth: 15, /*滑块最小宽度*/
                overBG: '#1679FF', overLeftBG: null, overRightBG: null, overCenBG: null, /*鼠标浮上时的背景*/
                downBG: '#000076', downLeftBG: null, downRightBG: null, downCenBG: null  /*鼠标按下时的背景*/
            },
            rightBtn: { width: 16, BG: 'red', overBG: '#FFB1B4', downBG: '#B40000' }
        },
        j: {    //右下脚两滚动条交叉空白处
            BG: "#ccc", duration: 800, /*按下该对对象中的按钮后卷动的速度[默认800毫秒]*/
            downUBG: '#B40000', /*按下后若为左上滚动则显示该背景*/
            downDBG: '#FFB1B4', /*按下后若为右下滚动则显示该背景*/
            overUBG: '#807B00', /*触摸后若为左上滚动则显示该背景*/
            overDBG: '#FF7679'  /*触摸后若为右下滚动则显示该背景*/
        }
    }, a = "ispyzyscroll", c = "font-size:0px;line-height:0px;border:0px;margin:0px;padding:0px;overflow:hidden;width:auto;background:none;", d = "<div " + a + "=", e = "</div>", t = this, t0 = t[0], tBGC = t.css("background-color").replace(/inherit|transparent/g, "#fff");
    (/iframe|textarea|select/.test(t0.tagName.toLowerCase()) || (fns && fns.appendToParent) ? t.parent() : t).append(t0.sDiv = $([d, "mode style='",c,"display:inline;'>", e].join(''))); //子DIV用于创建滚动条的遮罩,不在原对象直接遮罩以避免影响其正常使用遮罩
    fns = fns || cfg;
    //遮罩变更后对遮罩位置进行调整
    function MCFun(i, isX, yO, xO) {
        var m, W = isX ? "Height" : "Width", w = W.toLowerCase(), H = isX ? "Width" : "Height", wV, h = H.toLowerCase(), s = isX ? "left" : "top", z = isX ? "top" : "left", c = t[0]["client" + W], rV = t["inner" + W]() - c, v = (rV <= 0 ? 0 : fns[isX ? 'x' : 'y'][w]) || rV, o = t.offset(), f = {};
        f[s] = $.Int(yO ? yO.offset()[s] : (o[s] + $.Int(t.css("border-" + s + "-width")))); f[z] = $.Int(xO ? xO.offset()[z] : (o[z] + c - (v - 16) + $.Int(t.css("border-" + z + "-width"))));
        v = xO ? yO[h]() : v; wV = xO ? xO[w]() : t[0]["client" + H]; v = v < 0 ? 0 : v; wV = wV < 0 ? 0 : wV; i[h](wV)[w](v)[$.browser.msie ? "css" : "offset"](f)[wV == 0 || v == 0 ? "hide" : "show"]();
        (m = yO ? null : isX ? t.y : t.x) && m[0].CheckScroll && m[0].CheckScroll();
    };
    if ($.browser.msie) { document.execCommand("BackgroundImageCache", false, true); }
    //创建遮罩并进行批处理
    $([t.y = t0.sDiv.Mask({ appendToObj: t0.sDiv, iframe: 0, changeFun: function() { MCFun(this); } }), t.x = t.y.Mask({ appendToObj: t0.sDiv, iframe: 0, changeFun: function() { MCFun(this, true); } }), t.j = t.x.Mask({ appendToObj: t0.sDiv, iframe: 0, changeFun: function() { MCFun(this, true, t.y, t.x); } })]).each(function() {
        var i = this, isY, yxj = (isY = i == t.y) ? "y" : i == t.x ? "x" : "j", y = fns[yxj] || cfg[yxj];
        y.BG = y.BG || cfg[yxj].BG || tBGC;
        i.attr(a, yxj).css({ opacity: 1, background: y.BG });
        if (yxj == "j") {
            y.duration = y.duration || cfg[yxj].duration;
            i.attr("title", "滚动至左上角或右下角").bind("mouseover mousemove mousedown mouseup mouseout", function(e) {
                var m = $(this), mo = m.offset(), tST = t.scrollTop(), tSL = t.scrollLeft(), tsH = t0.scrollHeight, tsW = t0.scrollWidth, pt = (tST == 0 && tSL == 0) ? true : (tST == (tsH - t0.clientHeight) && tSL == (tsW - t0.clientWidth)) ? false : ((mo.top + m.height() - e.pageY) / (e.pageX - mo.left) < 1), et = e.type.replace(/mouse|up|out/g, '').replace('move', 'over'), bn = (et == '' ? '' : et + (pt ? 'D' : 'U')) + 'BG';
                if (y[bn]) m.css('background', y[bn]);
                if (et == "down") t.animate({ scrollTop: pt ? tsH : 0, scrollLeft: pt ? tsW : 0 }, y.duration);
            });
        } else {
            var ymH, L = isY ? "Left" : "Top", l = L.toLowerCase(), P = isY ? "Top" : "Left", p = P.toLowerCase(), B = isY ? "Btm" : "Right", b = B.toLowerCase(), W = isY ? "Width" : "Height", W = isY ? "Width" : "Height", w = W.toLowerCase(), H = isY ? "Height" : "Width", h = H.toLowerCase(), SBG = function(bg) { return bg == null ? '' : ('background:' + bg + ';'); };
            //初始化参数
            for (var a1 = [w, h, 'auto' + H, 'showType', p + 'Btn', 'dragBox', 'drag', b + 'Btn'], ai = 0, cfy = cfg[yxj], a2; ai < a1.length; ai++) {
                a2 = a1[ai]; y[a2] = y[a2] || cfy[a2]; y[a2][h] = y[a2][h] || cfy[a2][h];
                if (a2 == "drag") ymH = y[a2]['min' + H] = y[a2]['min' + H] || cfy[a2]['min' + H];
            }
            //输出纵向滚动条模拟元素到遮罩中
            i.append([d + 'box rm="滚动条总容器" style="' + c + 'width:' + y.width + 'px;margin-' + l + ':' + (t['inner' + W]() - t0['client' + W] - y[w]) + 'px;height:' + y.height + 'px;background:' + y.BG + ';">', function() { var i = 0, str = [], f = isY ? '' : 'float:left;', s = [d + p + 'Btn style="' + (c = isY ? c : [c, 'height:', y.height, 'px;'].join('')) + f + h + ':' + y[p + 'Btn'][h] + 'px;' + SBG(y[p + 'Btn'].BG) + '">' + e, d + 'outdragbox rm="滑块容器背景" style="' + c + f + SBG(y.dragBox.BG) + '">' + d + 'cendragbox rm="滑块容器上边框" style="' + c + SBG(y.dragBox[p + 'BG']) + '">' + d + 'inndragbox rm="滑块容器下边框" style="' + c + (isY ? h + ':' + y.dragBox[h] + 'px;' : '') + SBG(y.dragBox[b + 'BG']) + '">' + d + 'drag rm="滑块 背景色" style="' + c + 'position:relative;z-index:9999999;top:0px;left:0px;cursor:default;' + SBG(y.drag.BG) + '">' + d + P + ' rm="滑块上边框" style="' + c + SBG(y.drag[p + 'BG']) + '">' + d + B + ' rm="滑块下边框" style="' + c + SBG(y.drag[b + 'BG']) + '">' + d + 'Cen rm="滑块中背景 横线等" style="' + c + (isY ? (h + ':' + y.drag[h] + 'px;') : '') + SBG(y.drag.cenBG) + '">' + e + e + e + e + e + e + e, d + b + 'Btn style="' + c + f + h + ':' + y[b + 'Btn'][h] + 'px;' + SBG(y[b + 'Btn'].BG) + '">' + e]; for (; i < s.length; i++) { str.push(s[y.showType[i]]); } return str.join(''); } (), e].join(''));

            var dragObj = $("div[" + a + "=drag]", i), dragBox = dragObj.parent(), tBtn = $("div[" + a + "=" + p + "Btn]", i), dBtn = $("div[" + a + "=" + b + "Btn]", i);
            //矫正滑块宽高坐标
            i[0].MCDrag = function(tcH, tsH, fDBH) {
                var yH = tsH - tcH, f = {}, dc = $("[" + a + "=Cen]", dragObj), dBO = dragBox.offset(), dBH = fDBH || dragBox[h]();
                dH = tcH / (tsH - (t["inner" + W]() - t0["client" + W])), dH = dH > 1 ? 1 : dH; dH = dH * dBH; dH = dH < ymH ? ymH : dH;
                f[p] = $.Int((dBH - dH) * t0["scroll" + P] / yH + dBO[p]); f[p] = f[p] < 0 ? 0 : f[p]; f[l] = dBO[l];
                $("div", dragObj.offset(f)).andSelf()[h](dH); //滑块坐标调整、滑块各背景容器宽高同步
                if ($.Int(dragObj.css(l)) < 0) dragObj.css(l, 0); //滑块坐标校正
                if ($.Int(dragObj.css(p)) < 0) dragObj.css(p, 0); //滑块坐标校正 
                if (y.drag.cenBG && (dH == ymH || (dH > ymH && dc[0].bgNone))) dc.css("background", dH == ymH ? "none" : y.drag.cenBG)[0].bgNone = dH == ymH; //判断是否隐藏或显示滑动块中间背景
            };
            //检测内容及容器高度并按数据设置各滚动条元素尺寸 窗口变更时执行
            (i[0].CheckScroll = function(i, y, isY) {
                var sBox = $("div[" + a + "=box]", i), db = $("div[" + a + "$='dragbox']", i);
                return function() {
                    if (y["auto" + H]) {
                        var tH = t0["client" + H], tsH = t0["scroll" + H], dBoxH = tH - tBtn[h]() - dBtn[h](), sBoxMT = t["inner" + W]() - t0["client" + W] - sBox[w]();
                        sBox[h](tH).css("margin-" + l, (sBoxMT < 0 ? 0 : sBoxMT) + "px"); //滚动条容器宽高自适应
                        db[h](dBoxH); //滑块容器宽高自适应
                        i[0].MCDrag(tH, tsH, dBoxH); //滑块宽高坐标同步
                    }
                };
            } (i, y, isY))();
            //绑定滚动按钮对应方法
            tBtn.add(dBtn).bind("mouseup mouseout mousedown mouseover", function(e) {
                var i = $(this), isBtm = i.attr(a) == b + 'Btn', bn = isBtm ? b + 'Btn' : p + 'Btn', et = e.type.replace(/out|up|mouse/g, '');
                if (y[bn][et + 'BG']) i.css('background', y[bn][et + 'BG']);
                if (et == "" || et == 'over') clearInterval($.pyzYdown);
                else $.pyzYdown = setInterval(function() { t["scroll" + P](t["scroll" + P]() + (isBtm ? 18 : -18)); }, 50);
            });
            //滑块鼠标浮动后变背景
            dragObj.bind("mouseout mouseup mouseover mousedown", function(e) {
                var i = $(this), et = e.type.replace(/mouse|out|up/g, '');
                i.add($('div', i)).each(function() {
                    var m = $(this), bg = m.attr(a).replace(/drag/g, ''), bn = et + (bg = et == '' ? bg.toLowerCase() : bg) + "BG";
                    m.css("background", (bg.toLowerCase() == "cen" && m[0].bgNone) ? "none" : y.drag[bn]);
                });
            }).Drag({ //绑定拖拽方法到滑块
                MouseUp: function() { t0.scrollBindPyzyFun = null; },
                MouseDown: function(e) { t0.scrollBindPyzyFun = 1; e.stopPropagation(); },
                MouseMove: function(e) { var itop = (dragObj.offset()[p] - dragBox.offset()[p]); t["scroll" + P]((t0["scroll" + H] - t0["client" + H]) * (itop < 0 ? 0 : itop) / (dragBox[h]() - dragObj[h]())); },
                BoxObj: dragBox, MoveInX: (isY ? true : false), MoveInY: (isY ? false : true), OffMod: true, MaskOpacity: 0
            }).parent().mousedown(function(e) { //单击滑块容器时进行滑块定位
                var ey = e["page" + yxj.toUpperCase()], i = $(this), it = i.offset()[p], ih = i[h](), dh = dragObj[h](), dt = ey - dh / 2;
                t["scroll" + P]((t0["scroll" + H] - t0["client" + H]) * (((ey + dh / 2 > it + ih) ? it + ih - dh : dt < it ? it : dt) - it) / (ih - dh));
            });
        }
    });
    t0.CSS = function() { fns.fun && fns.fun.call(this); if (this.scrollBindPyzyFun == null) { t.y[0].MCDrag(this.clientHeight, this.scrollHeight); t.x[0].MCDrag(this.clientWidth, this.scrollWidth); } };
    t.scroll(t0.CSS); //滑块宽高坐标同步
    t0.CGS = function() { MCFun(t.y, false); MCFun(t.x, true); MCFun(t.j, true, t.y, t.x); };
    t0.CGSIE = function() { window.setTimeout(t0&&t0.CGS, 0); }; //IE下内容变更后不延迟获取不到正确clientWidth||clientHeight值
    if ($.browser.msie) t.bind('propertychange', t0.CGSIE);
    else t.bind("input", t0.CGS);
    return this;
};
//卸载滚动条渲染
$.fn.UnScrollBar = function() {
    var t = this;
    if (t.length == 0) return t;
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).UnScrollBar()); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    var t0 = t[0];
    if (!t0.sDiv) return t;
    t.unbind("scroll", t0.CSS).unbind($.browser.msie ? "propertychange" : "input", $.browser.msie ? t0.CGSIE : t0.CGS);
    t0.sDiv.UnMask();
    t0.sDiv.remove();
    return t;
};
//----------滚动条渲染功能 结束---------------------------- by HuZunJie 20100703

//----------选项卡渲染功能 开始---------------------------- by HuZunJie 20100727
//参数说明：p:{
//   tabs:tabDoms/*默认为操作元素第一个子元素的所有子节点*/,
//   cons:conDoms/*默认为操作元素最后一个子元素的所有子节点*/,
//   SelIndex:0/*要默认显示的标签序号，默认为0*/,
//   SelTabClass:"Sel"/*要默认显示的标签的CSS样式名，默认为"Sel"*/,
//   type:"show"/*标签切换时内容变换动画，默认为"show",可设置为淡入淡出fadeIn，或按JQuery对Dom的其他动画扩展如slideToggle、animate……*/,
//   typeVal:"slow"/*标签切换时内容变换动画对应方法的参数值，默认为"",type=show||fadeIn时可设置为三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000)
//   clickFun:function(tabs,cons,i){} /*点下tab时执行的方法 this=tabObj*/
//   play:false /*是否自动轮番显示各标签内容，默认为false，true则为启用 可用playVla控制播放间隔时间(耗秒) 播放到某标签时候对应的clickFun一样会被调用*/
//   playVla:2000 /*启动自动轮番显示后的交替间隔时间 单位为耗秒 默认2000*/
//   AutoRun:任意非null值 /*自动执行点击默认被选中Tab标签 默认为null 执行自动点击默认标签*/
//}
$.fn.Tab = function(p) {
    var t = this;
    if (t.length == 0) return t;
    if (t.length > 1) {var $retObjs;t.each(function() { $retObjs = $($retObjs).add($(this).Tab(p)); });try { return $retObjs; } finally { $retObjs = null; }}
    var t0 = t[0], i = 0;
    p = p || {};
    t0.tabs = p.t = p.tabs || t.children(":first").children();
    p.c = p.cons || t.children(":last").children();
    p.I = (p.I = p.SelIndex || -1) >= p.t.length ? p.t.length - 1 : p.I;
    p.S = p.SelTabClass || "Sel"; p.y = p.type || "show"; p.V = p.typeVal || "";
    p.playVal = p.playVal || 2000;
    t0.SI = 0;
    for (; i < p.t.length; i++) {
        if ((p.t[i].className.indexOf(p.S) != -1 && p.I == -1) || (p.I == i && p.I != -1)) t0.SI = i;
        else { $(p.t[i]).removeClass(p.S); $(p.c[i]).hide(); }
        p.t[i].tabMove = function(i, t0, t, c) { return function() { p.clickFun && p.clickFun.call(this, t, c, i); $(t[t0.SI]).removeClass(p.S); $(c[t0.SI]).stop(true, true).hide(); $(t[t0.SI = i]).addClass(p.S); $(c[i])[p.y](p.V); }; } (i, t0, p.t, p.c);
        $(p.t[i]).click(p.t[i].tabMove);
    }
    if(p.AutoRun==null)$(p.t[t0.SI]).click();
    if (p.play) (t0.Play = function(t0, t) { return function() { $(t[t0.SI + 1 >= t.length ? 0 : (t0.SI + 1)]).click(); t0.setTimeout = window.setTimeout(function() { t0 && t0.Play(); }, p.playVal); }; } (t0, p.t))();
    return this;
};
//卸载选项卡渲染
$.fn.UnTab = function() {
    var t = this;
    if (t.length == 0) return t;
    if (t.length > 1) {
        var $retObjs;
        t.each(function() { $retObjs = $($retObjs).add($(this).UnTab()); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    var t0 = t[0];
    if (t0.tabs == null) return t;
    for (var i = 0; i < t0.tabs.length; i++) { $(t0.tabs[i]).unbind("click", t0.tabs[i].tabMove); t0.tabs[i].tabMove = null; }
    if (t0.setTimeout) window.clearTimeout(t0.setTimeout);
    t0.SI = t0.tabs = t0.Play = null;
    return t;
};
//----------选项卡渲染功能 完毕---------------------------- by HuZunJie 20100727

//----------单(多)选框美化功能 开始---------------------------- by HuZunJie 20101011
//  -->示例样式表配置方案 Sta
//		.RadioBoxLabel{background:url(images/reg_icons.png) -236px -242px no-repeat;_background-image:url(images/reg_icons.gif);padding-left:20px;height:16px;line-height:16px;display:inline-table;}
//		.RadioBoxLabelSel{background-position:-236px -204px; }
//		.RadioBoxLabel input{display:none;display:inline\9;_height:16px;width:0px\9;} /* 带“\9”的属性对所有IE版本识别 这里用于兼容IE8*/
//  <--示例样式表配置方案 End
//  -->示例HTML配置方案 Sta
//       <div>
//            <label><input type="radio" />项目名称</label>
//            <label><input type="radio" />项目名称</label>
//        </div>
//  <--示例HTML配置方案 End
/* 操作对象为需进行渲染选框的lable的父容器
@ClassName     未选择状态下的选框样式
@SelClassName  已选择状态下的选框样式  */
$.fn.BindCheckBoxStyle = function(ClassName, SelClassName) {
    var t = this;
    if (t.length == 0) return t;
    if (t.length > 1) {
        var $retObjs;
        t.each(function() { $retObjs = $($retObjs).add($(this).BindCheckBoxStyle(ClassName, SelClassName)); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    $(t).find("label").each(function() {
        $(this).removeClass(ClassName).removeClass(SelClassName).addClass(ClassName + ($(this).find("input").attr("checked") ? " " + SelClassName : ""));
        if (!this.bindradioclass) {
            this.bindradioclass = { c: ClassName, sc: SelClassName, cfun: function() { /*$(this).find("input")[0].click();*/ $(t).BindCheckBoxStyle(ClassName, SelClassName); } };
            $(this).click(this.bindradioclass.cfun);
        }
    });
    return t;
}
//卸载N选框渲染
$.fn.UnBindCheckBoxStyle = function() {
    var t = $(this);
    if (t.length == 0) return t;
    if (t.length > 1) return t.each(function() { $(this).UnBindCheckBoxStyle(); });
    t.find("label").each(function() {
        if (this.bindradioclass) {
            $(this).removeClass(this.bindradioclass.c).removeClass(this.bindradioclass.sc);
            $(this).unbind("click", this.bindradioclass.cfun);
            this.bindradioclass = null;
        }
    });
    return this;
}
//----------单(多)选框美化功能 完毕---------------------------- by HuZunJie 20101011

//----------模拟下拉菜单功能 开始---------------------------- by HuZunJie 20101013
/*创建并显示菜单 返回菜单容器对象
@j 为JSON用于传递配置参数：{
    tn:"ul",//模拟菜单容器的tagName,默认为div
    css:{}, //按jquery默认格式设置对象css所需要的参数
    className:null, //菜单容器的样式表名称默认为null
    maxH:300, //菜单最大高度 默认值300，内容超出这个高度则显示滚动条
    html:"", //要在菜单容器中输出的HTML内容 若设置该项则 参数temp与data无效
    temp:"", //菜单项的HTML模板 如："<li id='{id}'>{name}</li>"
    data:{}, //菜单项对应的json数据 如：[{id:1,name:'第1个'},{id:2,name:'第2个'}]
    fun:function(){this==menuObj}, //可用于设置坐标校正等
    bind:[] //绑定菜单显示的触发事件到其他dom对象上，格式为[[触发对象,'事件名称'],[$(dom2),'click'],[function(){return this},'click']]，注意：function中的this指向当前对象等于$.fn.Menu中的t
             //若不设定bind则默认为[[t, "click"]]
} */
$.fn.Menu = function(j) {
    if (this.length == 0) return this;
    if (this.length > 1) {
        var $retObjs;
        this.each(function() { $retObjs = $($retObjs).add($(this).Menu(j)); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    var t = $(this), t0 = t[0], op = { tn: j.tn || "div" };
    //绑定菜单隐藏触发事件
    if ($.CheckPyzyMenu == null) $(document).click($.CheckPyzyMenu = function(e) { $(op.tn + "[ispyzymenu]").not(e.target).hide(0, function() { this.MaskObj && this.MaskObj.hide(); }); });
    if (t0.ShowMenu == null) { //避免重复创建浪费资源，若确实要重新创建则需要先调用 $(obj).UnMenu()执行清理
        var C = j.css || {}, c; op.css = {color:'#000',opacity:1,background:'#fff'}; for (c in C) { op.css[c] = C[c]; }; //复制CSS属性
        op.maxH = j.maxH || 180;op.html = j.html || $.Fmt(j.temp || "", j.data || {});op.changeFun = j.changeFun;
        t.Mask({ tn: op.tn, appendToObj: t.parent(), changeFun: function() {
            var rH = this.css("height", "auto")[0].scrollHeight, tot = t.offset().top, th = t.height(), top = tot + th + 2, overflow = 'hidden';
            if (rH >= op.maxH) { rH = op.maxH; overflow = "auto"; }
            op.css.overflow = overflow; op.css.height = rH;
            op.css.top = (rH + top > $("body").height() ? tot - rH : top);
            this.css(op.css);
            op.changeFun && op.changeFun.call(this);
            this[0].MaskObj && this[0].MaskObj.MaskChange();
        }}).html(op.html).css(op.css).attr({ "ispyzymenu": "yes" }).hide()[0].MaskObj.hide();
        t0.ShowMenu = function(e) {
            $.CheckPyzyMenu(e);
            t0.MaskObj.show();t0.MaskObj[0].MaskObj && t0.MaskObj[0].MaskObj.show(); t0.MaskObj.MaskChange();
            e.preventDefault(); e.stopPropagation();
        };
        C = j.bind || []; op.bind = []; for (c in C) { op.bind[c] = []; op.bind[c][0] = C[c][0]; op.bind[c][1] = C[c][1]; }; //复制bind属性
        for (var b = 0, bs = op.bind || [[t, "click"]]; b < bs.length; b++) (typeof bs[b][0] == "function" ? bs[b][0].call(t) : bs[b][0])[bs[b][1]](t0.ShowMenu); //绑定菜单显示触发事件
    }
    return t0.MaskObj;
}
//卸载菜单 返回当前对象
$.fn.UnMenu = function() {
    var t = $(this);
    if (t.length == 0) return t;
    if (t.length > 1) {
        var $retObjs;
        t.each(function() { $retObjs = $($retObjs).add($(this).UnMenu()); });
        try { return $retObjs; } finally { $retObjs = null; }
    }
    t.UnMask();
    t[0].ShowMenu = null;
    return this;
}
//----------模拟下拉菜单功能 完毕---------------------------- by HuZunJie 20101013

//不用图片实现DOM对象的渐变背景
//@staColor 开始颜色, @endColor 结束颜色, @gradientType 背景渐变方向1为横向，0为纵向[默认] 
$.fn.Gradient = (function(s) {
    if ($.browser.msie) {
        return function(staColor, endColor, gradientType) {
            var t = $(this), t0 = t[0];
			if (t.length == 0) return t;
            t0.oldStyle = t0.oldStyle || [];
            t0.oldStyle.unshift([s[4], t.css(s[4])]);
			if(t.css("height")=="auto"){t0.oldStyle.unshift(["height","auto"]);t.css("height",t.height());} //部分版本IE下必须设置宽或高才能生效
            t0.style.filter += ["progid:DXImageTransform.Microsoft.gradient(GradientType=", gradientType || 0, ",enabled=true,startColorstr=", staColor, ", endColorstr=", endColor, ")"].join("");
            return t;
        };
    } else {
        var newCanvas = document.createElement('canvas');
        if (newCanvas.getContext) {
            return function(staColor, endColor, gradientType) {
                var t = $(this), t0 = t[0];
				if (t.length == 0){newCanvas=null; return t;}
				newCanvas = newCanvas||document.createElement('canvas');
				var tW = t0.offsetWidth, tH = t0.offsetHeight,newCtx = newCanvas.getContext('2d'), newGradient = newCtx.createLinearGradient(0, 0, gradientType ? tW : 0, gradientType ? 0 : tH);
                newCanvas.width = gradientType ? tW : 1;
                newCanvas.height = gradientType ? 1 : tH;
                newGradient.addColorStop(0, staColor);
                newGradient.addColorStop(1, endColor);
                newCtx.fillStyle = newGradient;
                newCtx.fillRect(0, 0, gradientType ? tW : 1, gradientType ? 1 : tH);
                t0.oldStyle = t0.oldStyle || [];
                for (var i = 0, sN = [endColor,"0 0", "repeat-"+gradientType ? "y" : "x", ["url(", newCanvas.toDataURL('image/png'), ")"].join("")]; i < s.length - 1; i++) {t0.oldStyle.unshift([s[i], t.css(s[i])]);t.css(s[i], sN[i]);}
                newCanvas = newCtx = newGradient = null;
                return t;
            };
        } else {
            newCanvas = null;
            return function(staColor, endColor) {
                var t = $(this), t0 = t[0];
				if (t.length == 0)return t;
                t0.oldStyle = t0.oldStyle || [];
                t0.oldStyle.unshift([s[0], t.css(s[0])]);
                t.css(s[0], endColor);
                return t;
            };
        }
    }
})(["backgroundColor", "backgroundPosition", "backgroundRepeat", "backgroundImage", "filter"]);
//卸载渐变背景
$.fn.UnGradient = function() {
    var t = $(this), t0 = t[0];
    if (t0.oldStyle == null) return t;
    for (var i = 0; i < t0.oldStyle.length; i++) t.css(t0.oldStyle[i][0], t0.oldStyle[i][1]);
    t0.oldStyle = null;
    return t;
};

//----------阴影功能[用于浮动元素（如模拟菜单、窗体等）的阴影效果] 开始---------------------------- by HuZunJie 20101106
/*关联样式表*/
document.write("<style type='text/css'>.WinShadowIE{position:absolute;z-index:9999999; top:96px; left:195px; width:199px;height:171px;overflow:hidden;background-color:#000;filter:alpha(opacity=75) progid:DXImageTransform.Microsoft.Blur(pixelradius=6);}.WinShadow{position:absolute;z-index:9999999; top:95px; left:194px; width:214px;height:auto;}.WinShadow .BD{overflow:hidden;background:url(images/win/shadow_icons.png) no-repeat;height:15px;}.WinShadow .TL{background-position:left -29px;}.WinShadow .TR{margin-left:15px;background-position:right top;}.WinShadow .TC{margin-right:15px;background-position:left -58px;background-repeat:repeat-x;}.WinShadow .BL{background-position:left -43px;}.WinShadow .BR{margin-left:15px;background-position:right -14px;}.WinShadow .BC{margin-right:15px;background-position:left -73px;background-repeat:repeat-x;}.WinShadow .SL{background:url(images/win/shadow_icons_l.png) left repeat-y;}.WinShadow .SR{margin-left:15px;background:url(images/win/shadow_icons_r.png) right repeat-y;}.WinShadow .SC{height:auto;margin-right:15px;background:#000000;filter:alpha(opacity=75);-moz-opacity:0.75;opacity: 0.75;}</style>");
//为$(dom)对象生成对应阴影，返回当前对象；生成的Shadow模拟对象根DIV容器可用this[0].Shadow进行访问，Shadow对象上自定义有SizeTo、MoveTo接口方法
$.fn.Shadow = function() {
    var isIE6 = $.browser.msie && $.browser.version == '6.0';
    var tmp = isIE6 ? '<div class="WinShadowIE"></div>' : '<div class="WinShadow"><div class="BD TL"><div class="BD TR"><div class="BD TC"></div></div></div><div class="SL"><div class="SR"><div class="SC"></div></div></div><div class="BD BL"><div class="BD BR"><div class="BD BC"></div></div></div></div>';
    return function() {
        if (this.length < 1) return this;
        if (this.length > 1) { var $retObjs; this.each(function() { $retObjs = $($retObjs).add($(this).Shadow()); }); try { return $retObjs; } finally { $retObjs = null; } }
        var t0 = this[0], to = this.offset();
        t0.Shadow = (t0.Shadow || $(tmp).appendTo("body").extend({
            SizeTo: function(w, h) {
                if (typeof w == "object") { h = w.h || w.height; w = w.w || w.width; };
                if (w) this.width(w + (isIE6 ? -1 : 14));
                if (h) { if (isIE6) this.height(h - 3); else $(".SC", this).height(h - 18); }
                return this;
            },
            MoveTo: function(t, l) {
                if (typeof t == "object") { l = t.l || t.left; t = t.t || t.top; };
                if (t || l) this.offset({ top: t - (isIE6 ? 4 : 5), left: l - (isIE6 ? 5 : 6) });
                return this;
            }
        })).SizeTo(this.width(), this.height()).MoveTo(to.top, to.left).css("z-index", (parseInt(this.css("z-index"), 10) || 0) - 1);
        return this;
    };
} ();
//卸载$(dom)对象生成的阴影
$.fn.UnShadow = function() {
    this[0].Shadow && this[0].Shadow.remove();
    this[0].Shadow = null;
};
//----------阴影功能 结束---------------------------- by HuZunJie 20101106

//----------模拟窗体功能 开始---------------------------- by HuZunJie 20101104
/*关联样式表*/
document.write("<style type='text/css'>.Window{position:absolute;z-index:10000000; top:100px; left:200px; width:350px;height:auto;}.Window .Title{padding:4px 0px; height:auto; cursor:default;}.Window .Title *{background:url(images/reg_icons.png) no-repeat;_background-image:url(images/reg_icons.gif);}.Window .Title img{float:right; margin:-3px 3px auto auto; width:26px;height:25px; background-position:1px -58px;}.Window .Title img.mouseover,.Window .Title img.mouseup{background-position:-26px -58px;}.Window .Title img.mousedown{background-position:-53px -58px;}.Window .Title div{background-position:left 0px;margin-right:32px;height:19px;line-height:19px;font-size:12px;color:#FFFFFF;font-weight:bold;}.Window .Title div div{background-position:right -38px;margin:auto;}.Window .Title div div div{background-position:0px -19px; background-repeat:repeat-x;margin:auto 5px auto 6px;}.Window .BD{overflow:hidden;background:url(images/win/border_icons.gif) no-repeat;height:7px;}.Window .TL{background-position:left -7px;}.Window .TR{margin-left:7px;background-position:right -7px;}.Window .TC{margin-right:7px;background-repeat:repeat-x;}.Window .BL{background-position:left -14px;}.Window .BR{margin-left:7px;background-position:right -14px;}.Window .BC{margin-right:7px;background-position:0px -21px;background-repeat:repeat-x;}.Window .CB{background-color:#FAE5AD;/ *内容左右两边* /}.Window .CC{margin:0px 7px;background:#FCFAF1 url(images/reg_page_bg.png) repeat-x;height:auto;/ *内容背景* /}</style>");
/**调用对象属性方法$(dom).Window()在页面上产生一个窗体 
*参数 ops:{
* @Title   窗体标题
* @Content 窗体内容
* @Width @Height @Top @Left  窗体宽、高、与页面左上角的Top\Left距离
* @className 模拟窗体的HTML对象样式名称，默认为Window
* @Shadow 是否显示阴影[true(默认)|false]
* @Mask   是否遮罩页面[true(默认)|false]
* @MaskOpacity 页面遮罩层的透明度 0-1
* @appendTo 模拟窗体的HTML对象要创建到的容器对象
*} 返回当前对象；生成的Window模拟对象根DIV容器可用this[0].Window进行访问，Window对象上自定义有SizeTo、MoveTo、getTitle、setTitle、getContent、setContent等接口方法
*/
$.fn.Window = function(fns) {
    if (this.length < 1) return this;
    if (this.length > 1) { var $retObjs; this.each(function() { $retObjs = $($retObjs).add($(this).Window(fns)); }); try { return $retObjs; } finally { $retObjs = null; } }
    var ops = fns || (fns = {}), t = $(this).UnWindow(), t0 = t[0], isIE6 = $.browser.msie && $.browser.version == '6.0';
    ops.Shadow = fns.Shadow == null ? true : fns.Shadow; //是否显示阴影[true(默认)|false]
    ops.Mask = fns.Mask == null ? true : fns.Mask; //是否遮罩页面[true(默认)|false]
    ops.staColor = fns.staColor; //若需要为内容部分生成渐变背景，则需要指定该项作为渐变开始色
    ops.endColor = fns.endColor; //若需要为内容部分生成渐变背景，则需要指定该项作为渐变结束色 sta、end若只设置一项则为单色背景
    t0.Window = $(['<div class="', fns.className || 'Window', '"><div class="BD TL"><div class="BD TR"><div class="BD TC"></div></div></div><div class="CB"><div class="CC"><div class="Title"><img src="images/b.gif" alt="Close" /><div><div><div>', fns.Title || fns.title || fns.T || fns.t || 'New Window', '</div></div></div></div><div class="Content">', fns.Content || fns.content || fns.C || fns.c || 'New Content', '</div></div></div><div class="BD BL"><div class="BD BR"><div class="BD BC"></div></div></div></div>'].join("")).appendTo(fns.appendTo || "body");
    var CCBox = t0.Window.children(".CB").children(".CC"), TitleBox = CCBox.children(".Title");
    t0.Window.extend({
        BGMaskObj: fns.Mask ? $(document).Mask().css("opacity", fns.MaskOpacity || 0.3) : null,
        TitleObj: TitleBox.children().children().children(),
        getTitle: function() { return t0.Window.TitleObj.html(); },
        setTitle: function(str) { t0.Window.TitleObj.html(str); },
        ContentObj: CCBox.children(".Content"),
        getContent: function() { return t0.Window.ContentObj.html(); },
        setContent: function(str) { t0.Window.ContentObj.html(str); }
    });
    fns.Shadow && t0.Window.Shadow();
    (t0.Window.SizeTo = function(w, h) { //调整窗体大小
        if (typeof w == "object") { h = w.h || w.height; w = w.w || w.width; };
        if (w) t0.Window.width(w);
        if (h) t0.Window.ContentObj.height(h - (t0.Window.height() - t0.Window.ContentObj.height()));
        if (ops.staColor && ops.endColor) { CCBox.UnGradient(); CCBox.Gradient(ops.staColor, ops.endColor); } //"#F7DA96", "#D3944E" 
        else if (ops.staColor || ops.endColor) CCBox.css("background", ops.staColor || ops.endColor);
        t0.Window.children(".CB").UnGradient();
        t0.Window.children(".CB").Gradient("#FAE5AD", "#E0B26F");
        if (t0.Window[0].Shadow) t0.Window[0].Shadow.SizeTo(t0.Window.width(), t0.Window.height());
    })(fns.Width || fns.width || fns.W || fns.w, fns.Height || fns.height || fns.h || fns.H);
    (t0.Window.MoveTo = function(t, l) { //调整窗体坐标
        if (typeof t == "object") { l = t.l || t.left; t = t.t || t.top; };
        if (t || l) t0.Window.offset({ top: t, left: l });
        if (t0.Window[0].Shadow) t0.Window[0].Shadow.MoveTo(t0.Window.offset());
    })(fns.Top || fns.top || fns.Y || fns.y, fns.Left || fns.left || fns.X || fns.x);
    $("img:first-child", TitleBox).bind("mouseover mouseout mousedown mouseup", function(e) { this.className = e.type; }).click(function() { t.UnWindow(); }); //绑定关闭按钮样式切换
    t0.Window.TitleObj.Drag({ OffMask: true, MoveObj: function() { return t0.Window; }, MouseUp: function() { t0.Window.SizeTo(); t0.Window.MoveTo(); }, BoxObj: t0.Window.BGMaskObj }); //绑定拖拽功能到标题栏
    return t;
};
//卸载窗体效果
$.fn.UnWindow = function() {
    if (this.length < 1) return this;
    if (this.length > 1) { var $retObjs; this.each(function() { $retObjs = $($retObjs).add($(this).UnWindow()); }); try { return $retObjs; } finally { $retObjs = null; } }
    if (this[0].Window) {
        this[0].Window.BGMaskObj && this[0].Window.BGMaskObj.UnMask();
        this[0].Window.TitleObj && this[0].Window.TitleObj.UnDrag();
        this[0].Window[0].Shadow && this[0].Window.UnShadow();
        this[0].Window.remove();
        this[0].Window = null;
    }
    return this;
};
//----------模拟窗体功能 结束---------------------------- by HuZunJie 20101104

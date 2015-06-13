(function(){
var _1,_2,_3,_4,_5={},_6={},_7=/\\/g;
var _8=function(_9,_a){
if(_9==null){
return null;
}
if(_9.Slick===true){
return _9;
}
_9=(""+_9).replace(/^\s+|\s+$/g,"");
_4=!!_a;
var _b=(_4)?_6:_5;
if(_b[_9]){
return _b[_9];
}
_1={Slick:true,expressions:[],raw:_9,reverse:function(){
return _8(this.raw,true);
}};
_2=-1;
while(_9!=(_9=_9.replace(_c,parser))){
}
_1.length=_1.expressions.length;
return _b[_9]=(_4)?_d(_1):_1;
};
var _e=function(_f){
if(_f==="!"){
return " ";
}else{
if(_f===" "){
return "!";
}else{
if((/^!/).test(_f)){
return _f.replace(/^!/,"");
}else{
return "!"+_f;
}
}
}
};
var _d=function(_10){
var _11=_10.expressions;
for(var i=0;i<_11.length;i++){
var exp=_11[i];
var _14={parts:[],tag:"*",combinator:_e(exp[0].combinator)};
for(var j=0;j<exp.length;j++){
var _16=exp[j];
if(!_16.reverseCombinator){
_16.reverseCombinator=" ";
}
_16.combinator=_16.reverseCombinator;
delete _16.reverseCombinator;
}
exp.reverse().push(_14);
}
return _10;
};
var _17=function(_18){
return _18.replace(/[-[\]{}()*+?.\\^$|,#\s]/g,"\\$&");
};
var _c=new RegExp("^(?:\\s*(,)\\s*|\\s*(<combinator>+)\\s*|(\\s+)|(<unicode>+|\\*)|\\#(<unicode>+)|\\.(<unicode>+)|\\[\\s*(<unicode1>+)(?:\\s*([*^$!~|]?=)(?:\\s*(?:([\"']?)(.*?)\\9)))?\\s*\\](?!\\])|:+(<unicode>+)(?:\\((?:(?:([\"'])([^\\12]*)\\12)|((?:\\([^)]+\\)|[^()]*)+))\\))?)".replace(/<combinator>/,"["+_17(">+~`!@$%^&={}\\;</")+"]").replace(/<unicode>/g,"(?:[\\w\\u00a1-\\uFFFF-]|\\\\[^\\s0-9a-f])").replace(/<unicode1>/g,"(?:[:\\w\\u00a1-\\uFFFF-]|\\\\[^\\s0-9a-f])"));
function parser(_19,_1a,_1b,_1c,_1d,id,_1f,_20,_21,_22,_23,_24,_25,_26,_27){
if(_1a||_2===-1){
_1.expressions[++_2]=[];
_3=-1;
if(_1a){
return "";
}
}
if(_1b||_1c||_3===-1){
_1b=_1b||" ";
var _28=_1.expressions[_2];
if(_4&&_28[_3]){
_28[_3].reverseCombinator=_e(_1b);
}
_28[++_3]={combinator:_1b,tag:"*"};
}
var _29=_1.expressions[_2][_3];
if(_1d){
_29.tag=_1d.replace(_7,"");
}else{
if(id){
_29.id=id.replace(_7,"");
}else{
if(_1f){
_1f=_1f.replace(_7,"");
if(!_29.classList){
_29.classList=[];
}
if(!_29.classes){
_29.classes=[];
}
_29.classList.push(_1f);
_29.classes.push({value:_1f,regexp:new RegExp("(^|\\s)"+_17(_1f)+"(\\s|$)")});
}else{
if(_24){
_27=_27||_26;
_27=_27?_27.replace(_7,""):null;
if(!_29.pseudos){
_29.pseudos=[];
}
_29.pseudos.push({key:_24.replace(_7,""),value:_27});
}else{
if(_20){
_20=_20.replace(_7,"");
_23=(_23||"").replace(_7,"");
var _2a,_c;
switch(_21){
case "^=":
_c=new RegExp("^"+_17(_23));
break;
case "$=":
_c=new RegExp(_17(_23)+"$");
break;
case "~=":
_c=new RegExp("(^|\\s)"+_17(_23)+"(\\s|$)");
break;
case "|=":
_c=new RegExp("^"+_17(_23)+"(-|$)");
break;
case "=":
_2a=function(_2b){
return _23==_2b;
};
break;
case "*=":
_2a=function(_2c){
return _2c&&_2c.indexOf(_23)>-1;
};
break;
case "!=":
_2a=function(_2d){
return _23!=_2d;
};
break;
default:
_2a=function(_2e){
return !!_2e;
};
}
if(_23==""&&(/^[*$^]=$/).test(_21)){
_2a=function(){
return false;
};
}
if(!_2a){
_2a=function(_2f){
return _2f&&_c.test(_2f);
};
}
if(!_29.attributes){
_29.attributes=[];
}
_29.attributes.push({key:_20,operator:_21,value:_23,test:_2a});
}
}
}
}
}
return "";
}
var _30=(this.Slick||{});
_30.parse=function(_31){
return _8(_31);
};
_30.escapeRegExp=_17;
if(!this.Slick){
this.Slick=_30;
}
}).apply((typeof exports!="undefined")?exports:this);
(function(){
var _32=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,_33=0,_34=Object.prototype.toString,_35=false,_36=true;
[0,0].sort(function(){
_36=false;
return 0;
});
var _37=function(_38,_39,_3a,_3b){
_3a=_3a||[];
_39=_39||document;
var _3c=_39;
if(_39.nodeType!==1&&_39.nodeType!==9){
return [];
}
if(!_38||typeof _38!=="string"){
return _3a;
}
var m,set,_3f,_40,ret,cur,pop,i,_45=true,_46=_37.isXML(_39),_47=[],_48=_38;
do{
_32.exec("");
m=_32.exec(_48);
if(m){
_48=m[3];
_47.push(m[1]);
if(m[2]){
_40=m[3];
break;
}
}
}while(m);
if(_47.length>1&&_49.exec(_38)){
if(_47.length===2&&_4a.relative[_47[0]]){
set=_4b(_47[0]+_47[1],_39);
}else{
set=_4a.relative[_47[0]]?[_39]:_37(_47.shift(),_39);
while(_47.length){
_38=_47.shift();
if(_4a.relative[_38]){
_38+=_47.shift();
}
set=_4b(_38,set);
}
}
}else{
if(!_3b&&_47.length>1&&_39.nodeType===9&&!_46&&_4a.match.ID.test(_47[0])&&!_4a.match.ID.test(_47[_47.length-1])){
ret=_37.find(_47.shift(),_39,_46);
_39=ret.expr?_37.filter(ret.expr,ret.set)[0]:ret.set[0];
}
if(_39){
ret=_3b?{expr:_47.pop(),set:_4c(_3b)}:_37.find(_47.pop(),_47.length===1&&(_47[0]==="~"||_47[0]==="+")&&_39.parentNode?_39.parentNode:_39,_46);
set=ret.expr?_37.filter(ret.expr,ret.set):ret.set;
if(_47.length>0){
_3f=_4c(set);
}else{
_45=false;
}
while(_47.length){
cur=_47.pop();
pop=cur;
if(!_4a.relative[cur]){
cur="";
}else{
pop=_47.pop();
}
if(pop==null){
pop=_39;
}
_4a.relative[cur](_3f,pop,_46);
}
}else{
_3f=_47=[];
}
}
if(!_3f){
_3f=set;
}
if(!_3f){
_37.error(cur||_38);
}
if(_34.call(_3f)==="[object Array]"){
if(!_45){
_3a.push.apply(_3a,_3f);
}else{
if(_39&&_39.nodeType===1){
for(i=0;_3f[i]!=null;i++){
if(_3f[i]&&(_3f[i]===true||_3f[i].nodeType===1&&_37.contains(_39,_3f[i]))){
_3a.push(set[i]);
}
}
}else{
for(i=0;_3f[i]!=null;i++){
if(_3f[i]&&_3f[i].nodeType===1){
_3a.push(set[i]);
}
}
}
}
}else{
_4c(_3f,_3a);
}
if(_40){
_37(_40,_3c,_3a,_3b);
_37.uniqueSort(_3a);
}
return _3a;
};
_37.uniqueSort=function(_4d){
if(_4e){
_35=_36;
_4d.sort(_4e);
if(_35){
for(var i=1;i<_4d.length;i++){
if(_4d[i]===_4d[i-1]){
_4d.splice(i--,1);
}
}
}
}
return _4d;
};
_37.matches=function(_50,set){
return _37(_50,null,null,set);
};
_37.matchesSelector=function(_52,_53){
return _37(_53,null,null,[_52]).length>0;
};
_37.find=function(_54,_55,_56){
var set;
if(!_54){
return [];
}
for(var i=0,l=_4a.order.length;i<l;i++){
var _5a,_5b=_4a.order[i];
if((_5a=_4a.leftMatch[_5b].exec(_54))){
var _5c=_5a[1];
_5a.splice(1,1);
if(_5c.substr(_5c.length-1)!=="\\"){
_5a[1]=(_5a[1]||"").replace(/\\/g,"");
set=_4a.find[_5b](_5a,_55,_56);
if(set!=null){
_54=_54.replace(_4a.match[_5b],"");
break;
}
}
}
}
if(!set){
set=_55.getElementsByTagName("*");
}
return {set:set,expr:_54};
};
_37.filter=function(_5d,set,_5f,not){
var _61,_62,old=_5d,_64=[],_65=set,_66=set&&set[0]&&_37.isXML(set[0]);
while(_5d&&set.length){
for(var _67 in _4a.filter){
if((_61=_4a.leftMatch[_67].exec(_5d))!=null&&_61[2]){
var _68,_69,_6a=_4a.filter[_67],_6b=_61[1];
_62=false;
_61.splice(1,1);
if(_6b.substr(_6b.length-1)==="\\"){
continue;
}
if(_65===_64){
_64=[];
}
if(_4a.preFilter[_67]){
_61=_4a.preFilter[_67](_61,_65,_5f,_64,not,_66);
if(!_61){
_62=_68=true;
}else{
if(_61===true){
continue;
}
}
}
if(_61){
for(var i=0;(_69=_65[i])!=null;i++){
if(_69){
_68=_6a(_69,_61,i,_65);
var _6d=not^!!_68;
if(_5f&&_68!=null){
if(_6d){
_62=true;
}else{
_65[i]=false;
}
}else{
if(_6d){
_64.push(_69);
_62=true;
}
}
}
}
}
if(_68!==undefined){
if(!_5f){
_65=_64;
}
_5d=_5d.replace(_4a.match[_67],"");
if(!_62){
return [];
}
break;
}
}
}
if(_5d===old){
if(_62==null){
_37.error(_5d);
}else{
break;
}
}
old=_5d;
}
return _65;
};
_37.error=function(msg){
throw "Syntax error, unrecognized expression: "+msg;
};
var _4a=_37.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(['"]*)(.*?)\3|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(_6f){
return _6f.getAttribute("href");
}},relative:{"+":function(_70,_71){
var _72=typeof _71==="string",_73=_72&&!/\W/.test(_71),_74=_72&&!_73;
if(_73){
_71=_71.toLowerCase();
}
for(var i=0,l=_70.length,_77;i<l;i++){
if((_77=_70[i])){
while((_77=_77.previousSibling)&&_77.nodeType!==1){
}
_70[i]=_74||_77&&_77.nodeName.toLowerCase()===_71?_77||false:_77===_71;
}
}
if(_74){
_37.filter(_71,_70,true);
}
},">":function(_78,_79){
var _7a,_7b=typeof _79==="string",i=0,l=_78.length;
if(_7b&&!/\W/.test(_79)){
_79=_79.toLowerCase();
for(;i<l;i++){
_7a=_78[i];
if(_7a){
var _7e=_7a.parentNode;
_78[i]=_7e.nodeName.toLowerCase()===_79?_7e:false;
}
}
}else{
for(;i<l;i++){
_7a=_78[i];
if(_7a){
_78[i]=_7b?_7a.parentNode:_7a.parentNode===_79;
}
}
if(_7b){
_37.filter(_79,_78,true);
}
}
},"":function(_7f,_80,_81){
var _82,_83=_33++,_84=dirCheck;
if(typeof _80==="string"&&!/\W/.test(_80)){
_80=_80.toLowerCase();
_82=_80;
_84=dirNodeCheck;
}
_84("parentNode",_80,_83,_7f,_82,_81);
},"~":function(_85,_86,_87){
var _88,_89=_33++,_8a=dirCheck;
if(typeof _86==="string"&&!/\W/.test(_86)){
_86=_86.toLowerCase();
_88=_86;
_8a=dirNodeCheck;
}
_8a("previousSibling",_86,_89,_85,_88,_87);
}},find:{ID:function(_8b,_8c,_8d){
if(typeof _8c.getElementById!=="undefined"&&!_8d){
var m=_8c.getElementById(_8b[1]);
return m&&m.parentNode?[m]:[];
}
},NAME:function(_8f,_90){
if(typeof _90.getElementsByName!=="undefined"){
var ret=[],_92=_90.getElementsByName(_8f[1]);
for(var i=0,l=_92.length;i<l;i++){
if(_92[i].getAttribute("name")===_8f[1]){
ret.push(_92[i]);
}
}
return ret.length===0?null:ret;
}
},TAG:function(_95,_96){
return _96.getElementsByTagName(_95[1]);
}},preFilter:{CLASS:function(_97,_98,_99,_9a,not,_9c){
_97=" "+_97[1].replace(/\\/g,"")+" ";
if(_9c){
return _97;
}
for(var i=0,_9e;(_9e=_98[i])!=null;i++){
if(_9e){
if(not^(_9e.className&&(" "+_9e.className+" ").replace(/[\t\n\r]/g," ").indexOf(_97)>=0)){
if(!_99){
_9a.push(_9e);
}
}else{
if(_99){
_98[i]=false;
}
}
}
}
return false;
},ID:function(_9f){
return _9f[1].replace(/\\/g,"");
},TAG:function(_a0,_a1){
return _a0[1].toLowerCase();
},CHILD:function(_a2){
if(_a2[1]==="nth"){
if(!_a2[2]){
_37.error(_a2[0]);
}
_a2[2]=_a2[2].replace(/^\+|\s*/g,"");
var _a3=/(-?)(\d*)(?:n([+\-]?\d*))?/.exec(_a2[2]==="even"&&"2n"||_a2[2]==="odd"&&"2n+1"||!/\D/.test(_a2[2])&&"0n+"+_a2[2]||_a2[2]);
_a2[2]=(_a3[1]+(_a3[2]||1))-0;
_a2[3]=_a3[3]-0;
}else{
if(_a2[2]){
_37.error(_a2[0]);
}
}
_a2[0]=_33++;
return _a2;
},ATTR:function(_a4,_a5,_a6,_a7,not,_a9){
var _aa=_a4[1].replace(/\\/g,"");
if(!_a9&&_4a.attrMap[_aa]){
_a4[1]=_4a.attrMap[_aa];
}
if(_a4[2]==="~="){
_a4[4]=" "+_a4[4]+" ";
}
return _a4;
},PSEUDO:function(_ab,_ac,_ad,_ae,not){
if(_ab[1]==="not"){
if((_32.exec(_ab[3])||"").length>1||/^\w/.test(_ab[3])){
_ab[3]=_37(_ab[3],null,null,_ac);
}else{
var ret=_37.filter(_ab[3],_ac,_ad,true^not);
if(!_ad){
_ae.push.apply(_ae,ret);
}
return false;
}
}else{
if(_4a.match.POS.test(_ab[0])||_4a.match.CHILD.test(_ab[0])){
return true;
}
}
return _ab;
},POS:function(_b1){
_b1.unshift(true);
return _b1;
}},filters:{enabled:function(_b2){
return _b2.disabled===false&&_b2.type!=="hidden";
},disabled:function(_b3){
return _b3.disabled===true;
},checked:function(_b4){
return _b4.checked===true;
},selected:function(_b5){
_b5.parentNode.selectedIndex;
return _b5.selected===true;
},parent:function(_b6){
return !!_b6.firstChild;
},empty:function(_b7){
return !_b7.firstChild;
},has:function(_b8,i,_ba){
return !!_37(_ba[3],_b8).length;
},header:function(_bb){
return (/h\d/i).test(_bb.nodeName);
},text:function(_bc){
return "text"===_bc.type;
},radio:function(_bd){
return "radio"===_bd.type;
},checkbox:function(_be){
return "checkbox"===_be.type;
},file:function(_bf){
return "file"===_bf.type;
},password:function(_c0){
return "password"===_c0.type;
},submit:function(_c1){
return "submit"===_c1.type;
},image:function(_c2){
return "image"===_c2.type;
},reset:function(_c3){
return "reset"===_c3.type;
},button:function(_c4){
return "button"===_c4.type||_c4.nodeName.toLowerCase()==="button";
},input:function(_c5){
return (/input|select|textarea|button/i).test(_c5.nodeName);
}},setFilters:{first:function(_c6,i){
return i===0;
},last:function(_c8,i,_ca,_cb){
return i===_cb.length-1;
},even:function(_cc,i){
return i%2===0;
},odd:function(_ce,i){
return i%2===1;
},lt:function(_d0,i,_d2){
return i<_d2[3]-0;
},gt:function(_d3,i,_d5){
return i>_d5[3]-0;
},nth:function(_d6,i,_d8){
return _d8[3]-0===i;
},eq:function(_d9,i,_db){
return _db[3]-0===i;
}},filter:{PSEUDO:function(_dc,_dd,i,_df){
var _e0=_dd[1],_e1=_4a.filters[_e0];
if(_e1){
return _e1(_dc,i,_dd,_df);
}else{
if(_e0==="contains"){
return (_dc.textContent||_dc.innerText||_37.getText([_dc])||"").indexOf(_dd[3])>=0;
}else{
if(_e0==="not"){
var not=_dd[3];
for(var j=0,l=not.length;j<l;j++){
if(not[j]===_dc){
return false;
}
}
return true;
}else{
_37.error(_e0);
}
}
}
},CHILD:function(_e5,_e6){
var _e7=_e6[1],_e8=_e5;
switch(_e7){
case "only":
case "first":
while((_e8=_e8.previousSibling)){
if(_e8.nodeType===1){
return false;
}
}
if(_e7==="first"){
return true;
}
_e8=_e5;
case "last":
while((_e8=_e8.nextSibling)){
if(_e8.nodeType===1){
return false;
}
}
return true;
case "nth":
var _e9=_e6[2],_ea=_e6[3];
if(_e9===1&&_ea===0){
return true;
}
var _eb=_e6[0],_ec=_e5.parentNode;
if(_ec&&(_ec.sizcache!==_eb||!_e5.nodeIndex)){
var _ed=0;
for(_e8=_ec.firstChild;_e8;_e8=_e8.nextSibling){
if(_e8.nodeType===1){
_e8.nodeIndex=++_ed;
}
}
_ec.sizcache=_eb;
}
var _ee=_e5.nodeIndex-_ea;
if(_e9===0){
return _ee===0;
}else{
return (_ee%_e9===0&&_ee/_e9>=0);
}
}
},ID:function(_ef,_f0){
return _ef.nodeType===1&&_ef.getAttribute("id")===_f0;
},TAG:function(_f1,_f2){
return (_f2==="*"&&_f1.nodeType===1)||_f1.nodeName.toLowerCase()===_f2;
},CLASS:function(_f3,_f4){
return (" "+(_f3.className||_f3.getAttribute("class"))+" ").indexOf(_f4)>-1;
},ATTR:function(_f5,_f6){
var _f7=_f6[1],_f8=_4a.attrHandle[_f7]?_4a.attrHandle[_f7](_f5):_f5[_f7]!=null?_f5[_f7]:_f5.getAttribute(_f7),_f9=_f8+"",_fa=_f6[2],_fb=_f6[4];
return _f8==null?_fa==="!=":_fa==="="?_f9===_fb:_fa==="*="?_f9.indexOf(_fb)>=0:_fa==="~="?(" "+_f9+" ").indexOf(_fb)>=0:!_fb?_f9&&_f8!==false:_fa==="!="?_f9!==_fb:_fa==="^="?_f9.indexOf(_fb)===0:_fa==="$="?_f9.substr(_f9.length-_fb.length)===_fb:_fa==="|="?_f9===_fb||_f9.substr(0,_fb.length+1)===_fb+"-":false;
},POS:function(_fc,_fd,i,_ff){
var name=_fd[2],_101=_4a.setFilters[name];
if(_101){
return _101(_fc,i,_fd,_ff);
}
}}};
var _49=_4a.match.POS,_102=function(all,num){
return "\\"+(num-0+1);
};
for(var type in _4a.match){
_4a.match[type]=new RegExp(_4a.match[type].source+(/(?![^\[]*\])(?![^\(]*\))/.source));
_4a.leftMatch[type]=new RegExp(/(^(?:.|\r|\n)*?)/.source+_4a.match[type].source.replace(/\\(\d+)/g,_102));
}
var _4c=function(_106,_107){
_106=Array.prototype.slice.call(_106,0);
if(_107){
_107.push.apply(_107,_106);
return _107;
}
return _106;
};
try{
Array.prototype.slice.call(document.documentElement.childNodes,0)[0].nodeType;
}
catch(e){
_4c=function(_108,_109){
var i=0,ret=_109||[];
if(_34.call(_108)==="[object Array]"){
Array.prototype.push.apply(ret,_108);
}else{
if(typeof _108.length==="number"){
for(var l=_108.length;i<l;i++){
ret.push(_108[i]);
}
}else{
for(;_108[i];i++){
ret.push(_108[i]);
}
}
}
return ret;
};
}
var _4e,_10d;
if(document.documentElement.compareDocumentPosition){
_4e=function(a,b){
if(a===b){
_35=true;
return 0;
}
if(!a.compareDocumentPosition||!b.compareDocumentPosition){
return a.compareDocumentPosition?-1:1;
}
return a.compareDocumentPosition(b)&4?-1:1;
};
}else{
_4e=function(a,b){
var al,bl,ap=[],bp=[],aup=a.parentNode,bup=b.parentNode,cur=aup;
if(a===b){
_35=true;
return 0;
}else{
if(aup===bup){
return _10d(a,b);
}else{
if(!aup){
return -1;
}else{
if(!bup){
return 1;
}
}
}
}
while(cur){
ap.unshift(cur);
cur=cur.parentNode;
}
cur=bup;
while(cur){
bp.unshift(cur);
cur=cur.parentNode;
}
al=ap.length;
bl=bp.length;
for(var i=0;i<al&&i<bl;i++){
if(ap[i]!==bp[i]){
return _10d(ap[i],bp[i]);
}
}
return i===al?_10d(a,bp[i],-1):_10d(ap[i],b,1);
};
_10d=function(a,b,ret){
if(a===b){
return ret;
}
var cur=a.nextSibling;
while(cur){
if(cur===b){
return -1;
}
cur=cur.nextSibling;
}
return 1;
};
}
_37.getText=function(_11e){
var ret="",elem;
for(var i=0;_11e[i];i++){
elem=_11e[i];
if(elem.nodeType===3||elem.nodeType===4){
ret+=elem.nodeValue;
}else{
if(elem.nodeType!==8){
ret+=_37.getText(elem.childNodes);
}
}
}
return ret;
};
(function(){
var form=document.createElement("div"),id="script"+(new Date()).getTime(),root=document.documentElement;
form.innerHTML="<a name='"+id+"'/>";
root.insertBefore(form,root.firstChild);
if(document.getElementById(id)){
_4a.find.ID=function(_125,_126,_127){
if(typeof _126.getElementById!=="undefined"&&!_127){
var m=_126.getElementById(_125[1]);
return m?m.id===_125[1]||typeof m.getAttributeNode!=="undefined"&&m.getAttributeNode("id").nodeValue===_125[1]?[m]:undefined:[];
}
};
_4a.filter.ID=function(elem,_12a){
var node=typeof elem.getAttributeNode!=="undefined"&&elem.getAttributeNode("id");
return elem.nodeType===1&&node&&node.nodeValue===_12a;
};
}
root.removeChild(form);
root=form=null;
})();
(function(){
var div=document.createElement("div");
div.appendChild(document.createComment(""));
if(div.getElementsByTagName("*").length>0){
_4a.find.TAG=function(_12d,_12e){
var _12f=_12e.getElementsByTagName(_12d[1]);
if(_12d[1]==="*"){
var tmp=[];
for(var i=0;_12f[i];i++){
if(_12f[i].nodeType===1){
tmp.push(_12f[i]);
}
}
_12f=tmp;
}
return _12f;
};
}
div.innerHTML="<a href='#'></a>";
if(div.firstChild&&typeof div.firstChild.getAttribute!=="undefined"&&div.firstChild.getAttribute("href")!=="#"){
_4a.attrHandle.href=function(elem){
return elem.getAttribute("href",2);
};
}
div=null;
})();
if(document.querySelectorAll){
(function(){
var _133=_37,div=document.createElement("div"),id="__sizzle__";
div.innerHTML="<p class='TEST'></p>";
if(div.querySelectorAll&&div.querySelectorAll(".TEST").length===0){
return;
}
_37=function(_136,_137,_138,seed){
_137=_137||document;
_136=_136.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");
if(!seed&&!_37.isXML(_137)){
if(_137.nodeType===9){
try{
return _4c(_137.querySelectorAll(_136),_138);
}
catch(qsaError){
}
}else{
if(_137.nodeType===1&&_137.nodeName.toLowerCase()!=="object"){
var old=_137.getAttribute("id"),nid=old||id,_13c=_137.parentNode,_13d=/^\s*[+~]/.test(_136);
if(!old){
_137.setAttribute("id",nid);
}else{
nid=nid.replace(/'/g,"\\$&");
}
if(_13d&&_13c){
_137=_137.parentNode;
}
try{
if(!_13d||_13c){
return _4c(_137.querySelectorAll("[id='"+nid+"'] "+_136),_138);
}
}
catch(pseudoError){
}
finally{
if(!old){
_137.removeAttribute("id");
}
}
}
}
}
return _133(_136,_137,_138,seed);
};
for(var prop in _133){
_37[prop]=_133[prop];
}
div=null;
})();
}
(function(){
var html=document.documentElement,_140=html.matchesSelector||html.mozMatchesSelector||html.webkitMatchesSelector||html.msMatchesSelector,_141=false;
try{
_140.call(document.documentElement,"[test!='']:sizzle");
}
catch(pseudoError){
_141=true;
}
if(_140){
_37.matchesSelector=function(node,expr){
expr=expr.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");
if(!_37.isXML(node)){
try{
if(_141||!_4a.match.PSEUDO.test(expr)&&!/!=/.test(expr)){
return _140.call(node,expr);
}
}
catch(e){
}
}
return _37(expr,null,null,[node]).length>0;
};
}
})();
(function(){
var div=document.createElement("div");
div.innerHTML="<div class='test e'></div><div class='test'></div>";
if(!div.getElementsByClassName||div.getElementsByClassName("e").length===0){
return;
}
div.lastChild.className="e";
if(div.getElementsByClassName("e").length===1){
return;
}
_4a.order.splice(1,0,"CLASS");
_4a.find.CLASS=function(_145,_146,_147){
if(typeof _146.getElementsByClassName!=="undefined"&&!_147){
return _146.getElementsByClassName(_145[1]);
}
};
div=null;
})();
function dirNodeCheck(dir,cur,_14a,_14b,_14c,_14d){
for(var i=0,l=_14b.length;i<l;i++){
var elem=_14b[i];
if(elem){
var _151=false;
elem=elem[dir];
while(elem){
if(elem.sizcache===_14a){
_151=_14b[elem.sizset];
break;
}
if(elem.nodeType===1&&!_14d){
elem.sizcache=_14a;
elem.sizset=i;
}
if(elem.nodeName.toLowerCase()===cur){
_151=elem;
break;
}
elem=elem[dir];
}
_14b[i]=_151;
}
}
}
function dirCheck(dir,cur,_154,_155,_156,_157){
for(var i=0,l=_155.length;i<l;i++){
var elem=_155[i];
if(elem){
var _15b=false;
elem=elem[dir];
while(elem){
if(elem.sizcache===_154){
_15b=_155[elem.sizset];
break;
}
if(elem.nodeType===1){
if(!_157){
elem.sizcache=_154;
elem.sizset=i;
}
if(typeof cur!=="string"){
if(elem===cur){
_15b=true;
break;
}
}else{
if(_37.filter(cur,[elem]).length>0){
_15b=elem;
break;
}
}
}
elem=elem[dir];
}
_155[i]=_15b;
}
}
}
if(document.documentElement.contains){
_37.contains=function(a,b){
return a!==b&&(a.contains?a.contains(b):true);
};
}else{
if(document.documentElement.compareDocumentPosition){
_37.contains=function(a,b){
return !!(a.compareDocumentPosition(b)&16);
};
}else{
_37.contains=function(){
return false;
};
}
}
_37.isXML=function(elem){
var _161=(elem?elem.ownerDocument||elem:0).documentElement;
return _161?_161.nodeName!=="HTML":false;
};
var _4b=function(_162,_163){
var _164,_165=[],_166="",root=_163.nodeType?[_163]:_163;
while((_164=_4a.match.PSEUDO.exec(_162))){
_166+=_164[0];
_162=_162.replace(_4a.match.PSEUDO,"");
}
_162=_4a.relative[_162]?_162+"*":_162;
for(var i=0,l=root.length;i<l;i++){
_37(_162,root[i],_165);
}
return _37.filter(_166,_165);
};
window.Sizzle=_37;
})();
var Mustache=function(){
var _16a=function(){
};
_16a.prototype={otag:"{{",ctag:"}}",pragmas:{},buffer:[],pragmas_implemented:{"IMPLICIT-ITERATOR":true},context:{},render:function(_16b,_16c,_16d,_16e){
if(!_16e){
this.context=_16c;
this.buffer=[];
}
if(!this.includes("",_16b)){
if(_16e){
return _16b;
}else{
this.send(_16b);
return;
}
}
_16b=this.render_pragmas(_16b);
var html=this.render_section(_16b,_16c,_16d);
if(_16e){
return this.render_tags(html,_16c,_16d,_16e);
}
this.render_tags(html,_16c,_16d,_16e);
},send:function(line){
if(line!=""){
this.buffer.push(line);
}
},render_pragmas:function(_171){
if(!this.includes("%",_171)){
return _171;
}
var that=this;
var _173=new RegExp(this.otag+"%([\\w-]+) ?([\\w]+=[\\w]+)?"+this.ctag);
return _171.replace(_173,function(_174,_175,_176){
if(!that.pragmas_implemented[_175]){
throw ({message:"This implementation of mustache doesn't understand the '"+_175+"' pragma"});
}
that.pragmas[_175]={};
if(_176){
var opts=_176.split("=");
that.pragmas[_175][opts[0]]=opts[1];
}
return "";
});
},render_partial:function(name,_179,_17a){
name=this.trim(name);
if(!_17a||_17a[name]===undefined){
throw ({message:"unknown_partial '"+name+"'"});
}
if(typeof (_179[name])!="object"){
return this.render(_17a[name],_179,_17a,true);
}
return this.render(_17a[name],_179[name],_17a,true);
},render_section:function(_17b,_17c,_17d){
if(!this.includes("#",_17b)&&!this.includes("^",_17b)){
return _17b;
}
var that=this;
var _17f=new RegExp(this.otag+"(\\^|\\#)\\s*(.+)\\s*"+this.ctag+"\n*([\\s\\S]+?)"+this.otag+"\\/\\s*\\2\\s*"+this.ctag+"\\s*","mg");
return _17b.replace(_17f,function(_180,type,name,_183){
var _184=that.find(name,_17c);
if(type=="^"){
if(!_184||that.is_array(_184)&&_184.length===0){
return that.render(_183,_17c,_17d,true);
}else{
return "";
}
}else{
if(type=="#"){
if(that.is_array(_184)){
return that.map(_184,function(row){
return that.render(_183,that.create_context(row),_17d,true);
}).join("");
}else{
if(that.is_object(_184)){
return that.render(_183,that.create_context(_184),_17d,true);
}else{
if(typeof _184==="function"){
return _184.call(_17c,_183,function(text){
return that.render(text,_17c,_17d,true);
});
}else{
if(_184){
return that.render(_183,_17c,_17d,true);
}else{
return "";
}
}
}
}
}
}
});
},render_tags:function(_187,_188,_189,_18a){
var that=this;
var _18c=function(){
return new RegExp(that.otag+"(=|!|>|\\{|%)?([^\\/#\\^]+?)\\1?"+that.ctag+"+","g");
};
var _18d=_18c();
var _18e=function(_18f,_190,name){
switch(_190){
case "!":
return "";
case "=":
that.set_delimiters(name);
_18d=_18c();
return "";
case ">":
return that.render_partial(name,_188,_189);
case "{":
return that.find(name,_188);
default:
return that.escape(that.find(name,_188));
}
};
var _192=_187.split("\n");
for(var i=0;i<_192.length;i++){
_192[i]=_192[i].replace(_18d,_18e,this);
if(!_18a){
this.send(_192[i]);
}
}
if(_18a){
return _192.join("\n");
}
},set_delimiters:function(_194){
var dels=_194.split(" ");
this.otag=this.escape_regex(dels[0]);
this.ctag=this.escape_regex(dels[1]);
},escape_regex:function(text){
if(!arguments.callee.sRE){
var _197=["/",".","*","+","?","|","(",")","[","]","{","}","\\"];
arguments.callee.sRE=new RegExp("(\\"+_197.join("|\\")+")","g");
}
return text.replace(arguments.callee.sRE,"\\$1");
},find:function(name,_199){
name=this.trim(name);
function is_kinda_truthy(bool){
return bool===false||bool===0||bool;
}
var _19b;
if(is_kinda_truthy(_199[name])){
_19b=_199[name];
}else{
if(is_kinda_truthy(this.context[name])){
_19b=this.context[name];
}
}
if(typeof _19b==="function"){
return _19b.apply(_199);
}
if(_19b!==undefined){
return _19b;
}
return "";
},includes:function(_19c,_19d){
return _19d.indexOf(this.otag+_19c)!=-1;
},escape:function(s){
s=String(s===null?"":s);
return s.replace(/&(?!\w+;)|["'<>\\]/g,function(s){
switch(s){
case "&":
return "&amp;";
case "\\":
return "\\\\";
case "\"":
return "&quot;";
case "'":
return "&#39;";
case "<":
return "&lt;";
case ">":
return "&gt;";
default:
return s;
}
});
},create_context:function(_1a0){
if(this.is_object(_1a0)){
return _1a0;
}else{
var _1a1=".";
if(this.pragmas["IMPLICIT-ITERATOR"]){
_1a1=this.pragmas["IMPLICIT-ITERATOR"].iterator;
}
var ctx={};
ctx[_1a1]=_1a0;
return ctx;
}
},is_object:function(a){
return a&&typeof a=="object";
},is_array:function(a){
return Object.prototype.toString.call(a)==="[object Array]";
},trim:function(s){
return s.replace(/^\s*|\s*$/g,"");
},map:function(_1a6,fn){
if(typeof _1a6.map=="function"){
return _1a6.map(fn);
}else{
var r=[];
var l=_1a6.length;
for(var i=0;i<l;i++){
r.push(fn(_1a6[i]));
}
return r;
}
}};
return ({name:"mustache.js",version:"0.3.1-dev",to_html:function(_1ab,view,_1ad,_1ae){
var _1af=new _16a();
if(_1ae){
_1af.send=_1ae;
}
_1af.render(_1ab,view,_1ad);
if(!_1ae){
return _1af.buffer.join("\n");
}
}});
}();
if(!this.JSON){
this.JSON={};
}
(function(){
"use strict";
function f(n){
return n<10?"0"+n:n;
}
if(typeof Date.prototype.toJSON!=="function"){
Date.prototype.toJSON=function(key){
return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z":null;
};
String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(key){
return this.valueOf();
};
}
var cx=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,_1b4=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,_1b6,meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"},rep;
function quote(_1b9){
_1b4.lastIndex=0;
return _1b4.test(_1b9)?"\""+_1b9.replace(_1b4,function(a){
var c=meta[a];
return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
})+"\"":"\""+_1b9+"\"";
}
function str(key,_1bd){
var i,k,v,_1c1,mind=gap,_1c3,_1c4=_1bd[key];
if(_1c4&&typeof _1c4==="object"&&typeof _1c4.toJSON==="function"){
_1c4=_1c4.toJSON(key);
}
if(typeof rep==="function"){
_1c4=rep.call(_1bd,key,_1c4);
}
switch(typeof _1c4){
case "string":
return quote(_1c4);
case "number":
return isFinite(_1c4)?String(_1c4):"null";
case "boolean":
case "null":
return String(_1c4);
case "object":
if(!_1c4){
return "null";
}
gap+=_1b6;
_1c3=[];
if(Object.prototype.toString.apply(_1c4)==="[object Array]"){
_1c1=_1c4.length;
for(i=0;i<_1c1;i+=1){
_1c3[i]=str(i,_1c4)||"null";
}
v=_1c3.length===0?"[]":gap?"[\n"+gap+_1c3.join(",\n"+gap)+"\n"+mind+"]":"["+_1c3.join(",")+"]";
gap=mind;
return v;
}
if(rep&&typeof rep==="object"){
_1c1=rep.length;
for(i=0;i<_1c1;i+=1){
k=rep[i];
if(typeof k==="string"){
v=str(k,_1c4);
if(v){
_1c3.push(quote(k)+(gap?": ":":")+v);
}
}
}
}else{
for(k in _1c4){
if(Object.hasOwnProperty.call(_1c4,k)){
v=str(k,_1c4);
if(v){
_1c3.push(quote(k)+(gap?": ":":")+v);
}
}
}
}
v=_1c3.length===0?"{}":gap?"{\n"+gap+_1c3.join(",\n"+gap)+"\n"+mind+"}":"{"+_1c3.join(",")+"}";
gap=mind;
return v;
}
}
if(typeof JSON.stringify!=="function"){
JSON.stringify=function(_1c5,_1c6,_1c7){
var i;
gap="";
_1b6="";
if(typeof _1c7==="number"){
for(i=0;i<_1c7;i+=1){
_1b6+=" ";
}
}else{
if(typeof _1c7==="string"){
_1b6=_1c7;
}
}
rep=_1c6;
if(_1c6&&typeof _1c6!=="function"&&(typeof _1c6!=="object"||typeof _1c6.length!=="number")){
throw new Error("JSON.stringify");
}
return str("",{"":_1c5});
};
}
if(typeof JSON.parse!=="function"){
JSON.parse=function(text,_1ca){
var j;
function walk(_1cc,key){
var k,v,_1d0=_1cc[key];
if(_1d0&&typeof _1d0==="object"){
for(k in _1d0){
if(Object.hasOwnProperty.call(_1d0,k)){
v=walk(_1d0,k);
if(v!==undefined){
_1d0[k]=v;
}else{
delete _1d0[k];
}
}
}
}
return _1ca.call(_1cc,key,_1d0);
}
text=String(text);
cx.lastIndex=0;
if(cx.test(text)){
text=text.replace(cx,function(a){
return "\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
});
}
if(/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){
j=eval("("+text+")");
return typeof _1ca==="function"?walk({"":j},""):j;
}
throw new SyntaxError("JSON.parse");
};
}
}());
Object.keys=function(o){
var _1d3=[];
if(o===undefined||o===null){
return _1d3;
}
for(var name in o){
if(o.hasOwnProperty(name)){
_1d3.push(name);
}
}
if(o.call!==undefined&&o.call!==Function.prototype.call&&_1d3.indexOf("call")===-1){
_1d3.push("call");
}
return _1d3;
};
Array.isArray=Array.isArray||function(o){
return Object.prototype.toString.call(o)==="[object Array]";
};
Array.prototype.forEach=Array.prototype.forEach||function(fn,bind){
for(var i=0;i<this.length;i++){
fn.call(bind,this[i],i,this);
}
};
Array.prototype.indexOf=Array.prototype.indexOf||function(str){
for(var i=0;i<this.length;i++){
if(str===this[i]){
return i;
}
}
return -1;
};
Array.prototype.some=Array.prototype.some||function(fn,bind){
for(var i=0,l=this.length;i<l;i++){
if((i in this)&&fn.call(bind,this[i],i,this)){
return true;
}
}
return false;
};
Array.prototype.every=Array.prototype.every||function(fn,bind){
for(var i=0,l=this.length;i<l;i++){
if((i in this)&&!fn.call(bind,this[i],i,this)){
return false;
}
}
return true;
};
Array.prototype.map=Array.prototype.map||function(fn,bind){
var _1e5=[];
for(var i=0,l=this.length;i<l;i++){
if(i in this){
_1e5[i]=fn.call(bind,this[i],i,this);
}
}
return _1e5;
};
Array.prototype.filter=Array.prototype.filter||function(fn,bind){
var _1ea=[];
for(var i=0,l=this.length;i<l;i++){
if((i in this)&&fn.call(bind,this[i],i,this)){
_1ea.push(this[i]);
}
}
return _1ea;
};
Array.prototype.reduce=Array.prototype.reduce||function(fun){
"use strict";
if(this===undefined||this===null){
throw new TypeError();
}
var t=Object(this);
var len=t.length>>>0;
if(typeof fun!=="function"){
throw new TypeError();
}
if(len===0&&arguments.length==1){
throw new TypeError();
}
var k=0;
var _1f1;
if(arguments.length>=2){
_1f1=arguments[1];
}else{
do{
if(k in t){
_1f1=t[k++];
break;
}
if(++k>=len){
throw new TypeError();
}
}while(true);
}
while(k<len){
if(k in t){
_1f1=fun.call(undefined,_1f1,t[k],k,t);
}
k++;
}
return _1f1;
};
Array.prototype.reduceRight=Array.prototype.reduceRight||function(_1f2){
"use strict";
if(this===undefined||this===null){
throw new TypeError();
}
var t=Object(this);
var len=t.length>>>0;
if(typeof _1f2!=="function"){
throw new TypeError();
}
if(len===0&&arguments.length===1){
throw new TypeError();
}
var k=len-1;
var _1f6;
if(arguments.length>=2){
_1f6=arguments[1];
}else{
do{
if(k in this){
_1f6=this[k--];
break;
}
if(--k<0){
throw new TypeError();
}
}while(true);
}
while(k>=0){
if(k in t){
_1f6=_1f2.call(undefined,_1f6,t[k],k,t);
}
k--;
}
return _1f6;
};
String.prototype.trim=String.prototype.trim||function(){
return this.replace(/^\s\s*/,"").replace(/\s\s*$/,"");
};
if(!Function.prototype.bind||Function.prototype.bind===window.__hualuOldBind){
Function.prototype.bind=function(_1f7){
var _1f8=this;
return function(){
_1f8.apply(_1f7,arguments);
};
};
}
var object=new (function(_1f9){
var _1fa=this;
if((function TEST(){
}).name){
Function.__get_name__=function(func){
return func.name;
};
}else{
var _1fc=/(?:^|\()function ([\w$]+)/;
Function.__get_name__=function(func){
var _1fe=_1fc.exec(func.toString());
if(_1fe){
return _1fe[1];
}
return "";
};
}
this.extend=function(obj,_200,ov){
if(typeof ov!=="function"){
if(ov!==false){
ov=true;
}
ov=function(dest,src,prop){
return ov;
};
}
for(var _205 in _200){
if(ov(obj,_200,_205)){
obj[_205]=_200[_205];
}
}
if(_200&&_200.hasOwnProperty("call")&&ov(obj,_200,"call")){
obj.call=_200.call;
}
return obj;
};
this.clone=function(obj){
var _207={};
for(var key in obj){
_207[key]=obj[key];
}
return _207;
};
this.bind=function(host){
_1fa.extend(host,_1fa);
};
this._loader=null;
})(window);
(function(_20a){
var _20b=true;
for(var i in {toString:1}){
_20b=null;
}
if(_20b){
_20b=["hasOwnProperty","valueOf","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","constructor"];
}
var _20d=function(func,_20f){
return function(a,b){
if(a===null){
return this;
}
if(_20f||typeof a!="string"){
for(var k in a){
func.call(this,k,a[k]);
}
if(_20b){
for(var i=_20b.length;i>0;i--){
k=_20b[i];
if(a.hasOwnProperty(k)){
func.call(this,k,a[k]);
}
}
}
}else{
func.call(this,a,b);
}
return this;
};
};
var _214=function(prop){
var _216=this.__properties__[prop];
if(_216&&_216.fget){
return _216.fget.call(this.__this__,this);
}else{
throw "get not defined property "+prop;
}
};
var _217=function(prop,_219){
var _21a=this.__properties__[prop];
if(_21a&&_21a.fset){
_21a.fset.call(this.__this__,this,_219);
}else{
throw "set not defined property "+prop;
}
};
var _21b=function(name){
if(name=="@mixins"){
name="__mixins__";
}
var cls=this;
var _21e=this.prototype;
var _21f=_21e.__properties__;
if(name in cls){
return cls[name];
}
if(name in _21f){
return _21f[name];
}
if(!name in _21e){
throw new Error("no member named "+name+".");
}
var _220=_21e[name];
if(!_220){
return _220;
}
if(_220.__class__==_221){
return _221(_220.im_func,this);
}
return _220;
};
var _222=function(name){
if(name=="@mixins"){
name="__mixins__";
}
var _224=this.prototype;
return (name in this||name in _224||name in _224.__properties__);
};
var _225=_20d(function(name,_227){
var cls=this;
var _229=cls.prototype;
var _22a=_229.__properties__;
var subs=cls.__subclassesarray__;
var _22c=cls.__constructing__;
if(["__new__","__this__","__base__","@mixins","__mixins__"].indexOf(name)!=-1){
if(!_227||(typeof _227!="object"&&typeof _227!="function")){
return;
}
}
delete cls[name];
delete _229[name];
delete _22a[name];
if(name=="@mixins"){
name="__mixins__";
if(cls[name]){
cls[name]=cls[name].concat(_227);
}else{
cls[name]=_227;
}
}else{
if(["__new__","__metaclass__","__mixins__"].indexOf(name)!=-1){
if(_227&&(typeof _227=="object"||typeof _227=="function")){
cls[name]=_227;
}
}else{
if(["__this__","__base__"].indexOf(name)!=-1){
cls[name]=_229[name]=_227;
}else{
if(_227==null){
_229[name]=_227;
}else{
if(_227.__class__===undefined&&typeof _227=="function"){
_227.__name__=name;
_229[name]=_221(_227);
_229[name].__name__=name;
if(name=="initialize"){
cls[name]=_221(_227,cls);
}
}else{
if(_227.__class__===property){
_227.__name__=name;
_22a[name]=_227;
_229[name]=undefined;
}else{
if(_227.__class__===classmethod){
_227.im_func.__name__=name;
_227.__name__=name;
cls[name]=_229[name]=_227;
}else{
if(_227.__class__===staticmethod){
_227.im_func.__name__=name;
_227.__name__=name;
cls[name]=_229[name]=_227.im_func;
}else{
_229[name]=_227;
}
}
}
}
}
}
}
}
if(!_22c&&name in cls&&subs){
subs.forEach(function(sub){
if(!(name in sub)){
sub.set(name,_227);
}
});
}
});
var _22e=function(prop,_230){
this[prop]=_230;
};
var _231=function(){
return this.__subclassesarray__;
};
var _232=(function(){
if(!Array.push){
return false;
}
var a=function(){
};
a.prototype=new Array;
var b=new a;
b.push(null);
return !!b.length;
})();
var _235,_236;
var type=this.type=function(){
};
type.__new__=function(_238,name,base,dict){
var cls=Class.create();
cls.__constructing__=true;
cls.prototype=Class.getInstance(base);
cls.prototype.constructor=cls;
if(base.__subclassesarray__){
base.__subclassesarray__.push(cls);
}
var _23d=cls.prototype;
var _23e=_23d.__properties__||{};
_23d.__properties__=_20a.extend({},_23e);
if(base!==type){
for(var _23f in base){
if(_23f.indexOf("__")!=0&&cls[_23f]===undefined){
cls[_23f]=base[_23f];
}
}
}
cls.set("__base__",base);
cls.set("__this__",{base:base,parent:function(){
var name=arguments.callee.caller.__name__;
if(!name){
throw new Error("can not get function name when this.parent called");
}
while(cls&&!cls.prototype.hasOwnProperty(name)){
cls=cls.__base__;
}
var base=cls.__base__;
var _242=cls.__mixins__;
var _243,_244;
if(base&&base.get&&base.has(name)){
_244=base;
_243=base.get(name);
}else{
if(_242&&_242.length&&_242.some(function(_245){
_244=_245;
return _245.has(name);
})){
_243=_244.get(name);
}
}
if(!_243||typeof _243!="function"){
throw new Error("no such method in parent : '"+name+"'");
}else{
return _243.apply(base,arguments);
}
}});
cls.__new__=base.__new__;
cls.__metaclass__=base.__metaclass__;
cls.set(dict);
var _246=cls.__mixins__;
if(_246){
_246.forEach(function(_247){
Class.keys(_247).forEach(function(name){
if(cls.has(name)){
return;
}
var _249=_247.get(name);
if(typeof _249=="function"&&_249.__class__===_221){
cls.set(name,_249.im_func);
}else{
cls.set(name,_249);
}
});
});
}
delete cls.__constructing__;
cls.__dict__=dict;
cls.prototype.get=_214;
cls.prototype.set=_217;
cls.prototype._set=_22e;
return cls;
};
type.initialize=function(){
};
var _24a=this.Class=function(){
var _24b=arguments.length;
if(_24b<1){
throw new Error("bad arguments");
}
var base=_24b>1?arguments[0]:type;
if(typeof base!="function"&&typeof base!="object"){
throw new Error("base is not function or object");
}
if(base){
if(!_232){
if(base===Array){
base=_235;
}else{
if(base===String){
base=_236;
}
}
}
}
var dict=arguments[_24b-1];
if(typeof dict!="function"&&typeof dict!="object"){
throw new Error("constructor is not function or object");
}
if(dict instanceof Function){
var f=dict;
dict={};
f.call(dict);
}
var _24f=dict.__metaclass__||base.__metaclass__||type;
if(!_24f.__new__||!_24f.initialize){
throw new Error("__metaclass__ should have __new__ method and initialize method");
}
var cls=_24f.__new__(_24f,null,base,dict);
if(!cls||typeof cls!="function"){
throw new Error("__new__ method should return cls");
}
_24f.initialize(cls,null,base,dict);
return cls;
};
_24a.create=function(){
var cls=function(){
if(cls.__prototyping__){
return this;
}
this.__class__=cls;
_24a.initMixins(cls,this);
var _252=this.initialize?this.initialize.apply(this,arguments):null;
return _252;
};
cls.__subclassesarray__=[];
cls.__subclasses__=_231;
cls.__mixin__=cls.set=_225;
cls.get=_21b;
cls.has=_222;
return cls;
};
_24a.initMixins=function(cls,_254){
if(!cls){
return;
}
if(cls.__base__){
_24a.initMixins(cls.__base__,_254);
}
if(cls.__mixins__){
for(var i=0,l=cls.__mixins__.length,_257;i<l;i++){
_257=cls.__mixins__[i];
if(_257.prototype&&typeof _257.prototype.initialize=="function"){
_257.prototype.initialize.call(_254);
}
}
}
};
_24a.mixin=function(dict,cls){
if(!dict||typeof dict!="object"){
return;
}
if(cls===Array){
cls=_235;
}else{
if(cls===String){
cls=_236;
}
}
dict.__mixins__=dict.__mixins__||[];
dict.__mixins__.push(cls);
};
_24a.hasProperty=function(obj,name){
return (obj&&obj.__properties__)?(name in obj.__properties__):false;
};
_24a.getPropertyNames=function(obj){
return (obj&&obj.__properties__)?Object.keys(obj.__properties__):[];
};
_24a.inject=function(cls,host,args,_260){
if(typeof cls!="function"){
throw new Error("cls should be function");
}
var _261=arguments.length;
if(_261===2){
args=[];
_260=true;
}else{
if(_261===3){
if(Array.isArray(args)){
args=args||[];
_260=true;
}else{
_260=args;
args=[];
}
}
}
host.__class__=cls;
host.__properties__=cls.prototype.__properties__;
var p=_24a.getInstance(cls);
_20a.extend(host,p,_260);
_24a.initMixins(cls,host);
if(typeof cls.prototype.initialize=="function"){
cls.prototype.initialize.apply(host,args);
}
};
_24a.getChain=function(cls){
if(!cls){
return [];
}
var _264=[cls];
while(cls.__base__){
_264.push(cls.__base__);
cls=cls.__base__;
}
return _264;
};
_24a.getInstance=function(cls){
if(cls===Array||cls===String){
return new cls;
}
cls.__prototyping__=true;
var _266=new cls();
delete cls.__prototyping__;
return _266;
};
_24a.getAllSubClasses=function(cls){
if(!cls||!cls.__subclassesarray__){
return [];
}
var _268=cls.__subclassesarray__;
var _269=[].concat(_268),ele=_269.shift(),subs;
while(ele!=null){
subs=ele.__subclassesarray__;
if(subs!=null){
_269=_269.concat(subs);
_268=_268.concat(subs);
}
ele=_269.shift();
}
return _268;
};
_24a.keys=function(cls){
if(!cls||!cls.prototype){
return [];
}
keys=Object.keys(cls.prototype.__properties__);
for(var prop in cls.prototype){
keys.push(prop);
}
keys=keys.filter(function(name){
return !(["get","set","_set","initialize","constructor"].indexOf(name)!==-1||name.indexOf("__")==0);
});
return keys;
};
var _221=function(func,cls){
var _271=cls?function(){
return cls.prototype[func.__name__].im_func.apply(cls.__this__,arguments);
}:function(){
var args=[].slice.call(arguments,0);
args.unshift(this);
return func.apply(this.__this__,args);
};
_271.__class__=arguments.callee;
_271.im_func=func;
return _271;
};
var _273=this.staticmethod=function(func){
var _275=function(){
};
_275.__class__=arguments.callee;
_275.im_func=func;
return _275;
};
var _276=this.classmethod=function(func){
var _278=function(){
var args=[].slice.call(arguments,0);
var cls;
if(typeof this=="function"){
args.unshift(this);
return this.prototype[func.__name__].im_func.apply(this.__this__,args);
}else{
cls=this.__class__;
args.unshift(cls);
return func.apply(cls.__this__,args);
}
};
_278.__class__=arguments.callee;
_278.im_func=func;
return _278;
};
var _27b=this.property=function(fget,fset){
var p={};
p.__class__=arguments.callee;
p.fget=fget;
p.fset=fset;
return p;
};
var _27f=function(_280,_281){
var cls=new _24a(function(){
for(var i=0,l=_281.length;i<l;i++){
this[_281[i]]=(function(name){
return function(){
return _280.prototype[name].apply(arguments[0],[].slice.call(arguments,1));
};
})(_281[i]);
}
});
return cls;
};
_235=_27f(Array,["concat","indexOf","join","lastIndexOf","pop","push","reverse","shift","slice","sort","splice","toString","unshift","valueOf","forEach","some","every","map","filter","reduce","reduceRight"]);
_235.prototype.length=0;
_236=_27f(String,["charAt","charCodeAt","concat","indexOf","lastIndexOf","match","replace","search","slice","split","substr","substring","toLowerCase","toUpperCase","valueOf","trim"]);
_236.prototype.length=0;
})(object);
(function(_286){
function name2id(name){
return name.replace(/\./g,"/");
}
function Module(name){
this.__name__=name;
}
Module.prototype.toString=function(){
return "<module '"+this.__name__+"'>";
};
function NoModuleError(id){
this.message="no module named "+id;
}
NoModuleError.prototype=new Error();
function ModuleRequiredError(id){
this.message="module "+id+" required";
}
ModuleRequiredError.prototype=new Error();
function CyclicDependencyError(_28b){
this.runStack=_28b;
var msg="";
_28b.forEach(function(m,i){
msg+=m.id;
if(i!=_28b.length-1){
msg+="-->";
}
});
this.message=msg+" cyclic dependency.";
}
CyclicDependencyError.prototype=new Error();
function CommonJSPackage(id,deps,_291){
Package.apply(this,arguments);
}
CommonJSPackage.prototype=new Package();
CommonJSPackage.prototype.constructor=CommonJSPackage;
CommonJSPackage.prototype.execute=function(name,_293){
var _294=_293.modules[name]||new Module(name);
var _295=this.factory.call(_294,this.createRequire(name,_293),_294,this);
if(_295){
_295.__name__=_294.__name__;
_294=_295;
}
return _294;
};
CommonJSPackage.prototype.createRequire=function(name,_297){
var _298=_297.loader;
var _299=this;
function require(id){
var dep=_299.getDep(id);
if(!dep){
throw new ModuleRequiredError(id);
}
var _29c=dep.getRef(_297);
if(!_29c&&_299.dependencies.indexOf(id)!=-1){
throw new CyclicDependencyError(_297.stack);
}
return _29c;
}
require.async=function(deps,_29e){
deps=_299.parseDeps(deps);
var pkg=new CommonJSPackage(_299.id,deps,function(_2a0){
var args=[];
deps.forEach(function(dep){
args.push(_2a0(dep));
});
_29e.apply(null,args);
});
pkg.load(name,_297);
};
return require;
};
function ObjectPackage(id,deps,_2a5){
Package.apply(this,arguments);
}
ObjectPackage.prototype=new Package();
ObjectPackage.prototype.constructor=ObjectPackage;
ObjectPackage.prototype.execute=function(name,_2a7){
var _2a8=_2a7.modules[name]||new Module(name);
var args=[_2a8];
this.dependencies.forEach(function(_2aa){
var _2ab=this.getDep(_2aa).getRef(_2a7);
if(args.indexOf(_2ab)==-1){
args.push(_2ab);
}
},this);
var _2ac=this.factory.apply(_2a8,args);
if(_2ac){
if(_2a8.__empty_refs__){
_2a8.__empty_refs__.forEach(function(ref){
if(typeof console!="undefined"){
console.warn(ref+"\u65e0\u6cd5\u6b63\u786e\u83b7\u5f97"+name+"\u6a21\u5757\u7684\u5f15\u7528\u3002\u56e0\u4e3a\u8be5\u6a21\u5757\u662f\u901a\u8fc7return\u8fd4\u56de\u6a21\u5757\u5b9e\u4f8b\u7684\u3002");
}
});
}
_2ac.__name__=_2a8.__name__;
_2a8=_2ac;
}else{
delete _2a8.__empty_refs__;
}
return _2a8;
};
ObjectPackage.prototype.handleCyclicDependency=function(dep,pkg,_2b0,next){
var _2b2=_2b0.modules[dep.id]||new Module(dep.id);
_2b0.modules[dep.id]=_2b2;
if(!_2b2.__empty_refs__){
_2b2.__empty_refs__=[];
}
_2b2.__empty_refs__.push(pkg.id);
next(_2b2);
};
function Package(id,deps,_2b5){
if(!id){
return;
}
this.id=id;
this.dependencies=this.parseDeps(deps);
this.factory=_2b5;
this.deps={};
this.initDeps();
}
Package.prototype.initDeps=function(){
this.dependencies.forEach(function(_2b6){
var dep;
if(_2b6.indexOf("/")!=-1){
dep=new CommonJSDependency(_2b6,this);
}else{
dep=new ObjectDependency(_2b6,this);
}
this.deps[_2b6]=dep;
},this);
};
Package.prototype.execute=function(name,_2b9){
return new Module(name);
};
Package.prototype.load=function(name,_2bb,_2bc){
var _2bd=-1;
var pkg=this;
function nextDep(_2bf){
var deps=pkg.dependencies;
var _2c1=pkg.factory;
var dep,_2c3;
if(_2bf){
_2bb.stack.pop();
}
_2bd++;
if(_2bd==deps.length){
doneDep();
}else{
dep=pkg.getDep(deps[_2bd]);
_2c3=dep.getModule(_2bb);
_2bb.stack.push(_2c3);
if(_2bb.stack.indexOf(_2c3)!=_2bb.stack.length-1){
_2c3.handleCyclicDependency(dep,pkg,_2bb,nextDep);
}else{
dep.load(_2bb,nextDep);
}
}
}
function doneDep(){
if(!name){
name=pkg.id;
}
var _2c4=pkg.execute(name,_2bb);
_2bb.addModule(name,_2c4);
if(_2c4.__name__==="sys"){
_2c4.modules=_2bb.modules;
}
if(_2bc){
_2bc(_2c4);
}
}
nextDep();
};
Package.prototype.handleCyclicDependency=function(dep,pkg,_2c7,next){
next();
};
Package.prototype.getDep=function(id){
return this.deps[id];
};
Package.prototype.parseDeps=function(deps){
if(Array.isArray(deps)){
return deps;
}
if(!deps){
return [];
}
deps=deps.trim().replace(/^,*|,*$/g,"").split(/\s*,\s*/ig);
return deps;
};
function Dependency(name,_2cc){
if(!name){
return;
}
this.name=name;
this.owner=_2cc;
}
Dependency.prototype.getModule=function(_2cd){
var pkg=_2cd.loader.getModule(this.id);
return pkg;
};
function CommonJSDependency(name,_2d0){
var _2d1,_2d2;
if(name.indexOf("/")==0){
}else{
if(name.indexOf("./")==0||name.indexOf("../")==0){
_2d1=_2d0.id.split("/");
_2d1.pop();
_2d2=name.split(/\//ig);
_2d2.forEach(function(part){
if(part=="."){
}else{
if(part==".."){
_2d1.pop();
}else{
_2d1.push(part);
}
}
});
this.id=_2d1.join("/");
}else{
this.id=name2id(name);
}
}
Dependency.call(this,name,_2d0);
}
CommonJSDependency.prototype=new Dependency();
CommonJSDependency.prototype.constructor=CommonJSDependency;
CommonJSDependency.prototype.load=function(_2d4,_2d5){
_2d4.loadModule(this.id,_2d4.getName(this.id),_2d5);
};
CommonJSDependency.prototype.getRef=function(_2d6){
var root=_2d6.getName(this.id);
return _2d6.modules[root];
};
ObjectDependency=function(name,_2d9){
this.nameParts=name.split(".");
this.root=this.nameParts[0];
this.id=name2id(name);
Dependency.call(this,name,_2d9);
};
ObjectDependency.prototype=new Dependency();
ObjectDependency.prototype.constructor=ObjectDependency;
ObjectDependency.prototype.load=function(_2da,_2db){
var dep=this;
var _2dd,part,name,_2e0=-1;
function nextPart(_2e1){
var _2e2;
if(_2e1){
_2da.setModule(name,_2e1);
_2da.setMemberTo(_2dd,part,_2e1);
}
_2dd=name;
_2e0++;
if(_2e0==dep.nameParts.length){
_2db(_2da.modules[dep.root]);
}else{
part=dep.nameParts[_2e0];
name=(_2dd?_2dd+".":"")+part;
_2da.loadModule(name2id(name),_2da.getName(name),nextPart);
}
}
nextPart();
};
ObjectDependency.prototype.getRef=function(_2e3){
var root=_2e3.getName(this.root);
return _2e3.modules[root];
};
function LoaderRuntime(root){
this.modules={};
this.stack=[];
this.members={};
this.root=root;
}
LoaderRuntime.prototype={addModule:function(name,_2e7){
_2e7=_2e7||new Module(name);
this.modules[name]=_2e7;
var _2e8=this.members[name];
if(_2e8){
_2e8.forEach(function(_2e9){
this.modules[name][_2e9.id]=_2e9.value;
},this);
}
return _2e7;
},setModule:function(name,_2eb){
this.modules[name]=_2eb;
},loadModule:function(id,name,_2ee){
var _2ef=this.loader;
var _2f0=this.modules[name];
if(_2f0){
_2ee(_2f0);
}else{
_2ef.load(id,name,this,_2ee);
}
},getId:function(name){
return this.root+"."+name;
},getName:function(id){
var root=this.root;
if(id==root||id.indexOf(root+"/")==0){
id=id.slice(root.length+1);
}
return id.replace(/\//g,".");
},setMemberTo:function(host,_2f5,_2f6){
if(host){
if(this.modules[host]){
this.modules[host][_2f5]=_2f6;
}else{
if(!this.members[host]){
this.members[host]=[];
}
this.members[host].push({id:_2f5,value:_2f6});
}
}
}};
var _2f7=new Class(function(){
function calculatePageDir(){
var loc=window["location"];
var _2f9=loc.protocol+"//"+loc.host+(loc.pathname.charAt(0)!=="/"?"/":"")+loc.pathname;
if(_2f9.indexOf("\\")!=-1){
_2f9=_2f9.replace(/\\/g,"/");
}
var _2fa="./";
if(_2f9.indexOf("/")!=-1){
_2fa=_2f9.substring(0,_2f9.lastIndexOf("/")+1);
}
return _2fa;
}
var _2fb;
this._urlNodeMap={};
this.initialize=function(self){
self.useCache=true;
self.lib={"sys":new Package("sys",[],function(){
})};
self.fileLib={};
self.prefixLib={};
self.anonymousModuleCount=0;
self.scripts=document.getElementsByTagName("script");
};
this.load=function(self,id,name,_300,_301){
var pkg=self.getModule(id);
if(!pkg){
throw new NoModuleError(id);
}else{
if(pkg.file){
self.loadScript(pkg.file,function(){
var id=pkg.id;
var file=pkg.file;
pkg=self.lib[id];
if(!pkg){
throw new Error(file+" do not add "+id);
}
pkg.load(name,_300,_301);
},true);
}else{
pkg.load(name,_300,_301);
}
}
};
this.buildFileLib=function(self){
var _306=self.scripts;
for(var i=0,_308,_309,src,l=_306.length;i<l;i++){
_308=_306[i];
src=_308.getAttribute("data-src");
_309=_308.getAttribute("data-module");
if(!_309||!src){
continue;
}
_309.split(/\s+/ig).forEach(function(name){
self.defineFile(name2id(name),src);
});
}
};
this._getAbsolutePath=staticmethod(function(src){
function cleanPath(path){
path=path.replace(/([^:\/])\/+/g,"$1/");
if(path.indexOf(".")===-1){
return path;
}
var _30f=path.split("/");
var _310=[];
for(var i=0,part,len=_30f.length;i<len;i++){
part=_30f[i];
if(part===".."){
if(_310.length===0){
throw new Error("invalid path: "+path);
}
_310.pop();
}else{
if(part!=="."){
_310.push(part);
}
}
}
return _310.join("/").replace(/#$/,"");
}
if(src.indexOf("://")!=-1||src.indexOf("//")===0){
return cleanPath(src);
}
if(typeof _2fb=="undefined"){
_2fb=calculatePageDir();
}
return cleanPath(_2fb+src);
});
this.useScript=function(self,src,_316){
};
this.loadScript=classmethod(function(cls,src,_319,_31a){
if(!src||typeof src!="string"){
throw new Error("src should be string");
}
src=src.trim();
var _31b=cls._getAbsolutePath(src);
if(_31a){
var _31c=cls.get("_urlNodeMap"),_31d=_31c[_31b];
if(_31d){
if(_31d.loading){
_31d.callbacks.push(_319);
}else{
_319(_31d);
}
return;
}
}
var ele=document.createElement("script");
ele.type="text/javascript";
ele.src=src;
ele.async=true;
ele.loading=true;
ele.callbacks=[];
var _31f=function(){
ele.loading=null;
ele.callbacks.forEach(function(_320){
_320(ele);
});
for(var i=0,l=ele.callbacks.length;i<l;i++){
ele.callbacks[i]=null;
}
ele.callbacks=null;
};
ele.callbacks.push(_319);
if(window.ActiveXObject){
ele.onreadystatechange=function(){
var rs=this.readyState;
if("loaded"===rs||"complete"===rs){
ele.onreadystatechange=null;
_31f();
}
};
}else{
if(ele.addEventListener){
ele.addEventListener("load",_31f,false);
ele.addEventListener("error",_31f,false);
}else{
ele.onload=ele.onerror=_31f;
}
}
document.getElementsByTagName("head")[0].insertBefore(ele,null);
if(_31a){
_31c[_31b]=ele;
}
});
this.removeScript=classmethod(function(cls,src){
if(!src||typeof src!="string"){
throw new Error("src should be string");
}
src=src.trim();
var _326=cls._getAbsolutePath(src);
var _327=cls.get("_urlNodeMap"),_328=_327[_326];
if(_328){
delete _327[_326];
if(_328.parentNode){
_328.parentNode.removeChild(_328);
}
_328=null;
}
});
this.createRuntime=function(self,id){
var _32b=new LoaderRuntime(id);
_32b.loader=self;
return _32b;
};
this.definePrefixFor=function(self,id){
if(!id||typeof id!="string"){
return;
}
if(arguments.length<2){
return;
}
var _32e=id.split("/");
for(var i=0,_330,pkg,l=_32e.length-1;i<l;i++){
_330=_32e.slice(0,i+1).join("/");
self.definePrefix(_330);
}
};
this.definePrefix=function(self,id){
if(!id||typeof id!="string"){
return;
}
if(arguments.length<2){
return;
}
if(id in self.lib||id in self.prefixLib){
return;
}
self.prefixLib[id]=new Package(id,[],function(){
});
};
this.defineFile=function(self,id,src){
if(!id||typeof id!="string"){
return;
}
if(arguments.length<2){
return;
}
if(self.fileLib[id]){
return;
}
if(id in self.prefixLib){
delete self.prefixLib[id];
}else{
self.definePrefixFor(id);
}
self.fileLib[id]={id:id,file:src};
};
this.defineModule=function(self,_339,id,deps,_33c){
if(arguments.length<5){
return;
}
if(id in self.lib){
return;
}
if(id in self.prefixLib){
delete self.prefixLib[id];
}else{
if(id in self.fileLib){
delete self.fileLib[id];
}else{
self.definePrefixFor(id);
}
}
var pkg=new _339(id,deps,_33c);
self.lib[id]=pkg;
};
this.define=function(self,name,deps,_341){
if(typeof name!="string"){
return;
}
if(typeof deps=="function"){
_341=deps;
deps=[];
}
self.defineModule(CommonJSPackage,name2id(name),deps,_341);
};
this.add=function(self,name,deps,_345){
if(typeof name!="string"){
return;
}
if(typeof deps=="function"){
_345=deps;
deps=[];
}
self.defineModule(ObjectPackage,name2id(name),deps,_345);
};
this.getModule=function(self,id){
return self.lib[id]||self.fileLib[id]||self.prefixLib[id];
};
this.remove=function(self,id,all){
delete self.lib[id];
if(all){
Object.keys(self.lib).forEach(function(key){
if(key.indexOf(id+"/")==0){
delete self.lib[key];
}
});
}
};
this.execute=function(self,id){
if(!id||typeof id!="string"){
return;
}
self.buildFileLib();
var _34e=self.createRuntime(id);
_34e.loadModule(id.replace(/\./g,"/"),"__main__");
};
this.use=function(self,deps,_351){
if(!_351||typeof _351!="function"){
return;
}
self.buildFileLib();
var id="__anonymous_"+self.anonymousModuleCount+"__";
self.anonymousModuleCount++;
_286.define(id,deps,function(_353,_354,_355){
var args=[];
_355.dependencies.forEach(function(dep){
dep=_353(dep);
if(args.indexOf(dep)==-1){
args.push(dep);
}
});
if(_351.length==args.length+1){
if(typeof console!="undefined"){
console.warn("object.use\u5373\u5c06\u4e0d\u518d\u652f\u6301\u7b2c\u4e00\u4e2aexports\u53c2\u6570\uff0c\u8bf7\u5c3d\u5feb\u5220\u9664\u3002");
}
args.unshift(_354);
}
_351.apply(null,args);
});
var _358=self.createRuntime(id);
_358.loadModule(id.replace(/\./g,"/"),"__main__",function(){
});
};
});
_286.Loader=_2f7;
_286.NoModuleError=NoModuleError;
_286.ModuleRequiredError=ModuleRequiredError;
})(object);
(function(_359){
var _35a=new _359.Loader();
_359._loader=_35a;
_359.add=_35a.add.bind(_35a);
_359.define=_35a.define.bind(_35a);
_359.remove=_35a.remove.bind(_35a);
_359.use=_35a.use.bind(_35a);
_359.execute=_35a.execute.bind(_35a);
_359.define("window","sys",function(_35b){
var sys=_35b("sys");
var dom=sys.modules["dom"];
if(dom){
dom.wrap(window);
}
return window;
});
_359.define("loader",function(_35e,_35f){
_35f.Loader=_359.Loader;
});
})(object);
object.add("ua",function(_360){
var _361=this.numberify=function(s){
if(!s||typeof s!="string"){
}
var c=0;
return parseFloat(s.replace(/\./g,function(){
return (c++===0)?".":"";
}));
};
this.__detectUA=detectUA;
this.ua={};
var o=detectUA(navigator.userAgent);
object.extend(this.ua,o);
function detectUA(ua){
if(!ua&&typeof ua!="string"){
ua=navigator.userAgent;
}
var m,m2;
var o={},core,_36a;
if(!~ua.indexOf("Opera")&&(m=ua.match(/MSIE\s([^;]*)/))&&m[1]){
if((m2=ua.match(/Trident\/([\d\.]*)/))&&m2[1]){
o[core="ie"]=document.documentMode;
o[_36a="ieshell"]=_361(m2[1])+4;
}else{
o[_36a="ieshell"]=o[core="ie"]=_361(m[1]);
}
}else{
if((m=ua.match(/AppleWebKit\/([\d\.]*)/))&&m[1]){
o[core="webkit"]=_361(m[1]);
}else{
if(!~ua.indexOf("Opera")&&(m=ua.match(/Gecko/))){
o[core="gecko"]=0;
if((m=ua.match(/rv:([\d\.]*)/))&&m[1]){
o[core]=_361(m[1]);
}
}else{
if((m=ua.match(/Presto\/([\d\.]*)/))&&m[1]){
o[core="presto"]=_361(m[1]);
}
}
}
if((m=ua.match(/Chrome\/([\d\.]*)/))&&m[1]){
o[_36a="chrome"]=_361(m[1]);
}else{
if((m=ua.match(/\/([\d\.]*)( Mobile\/?[\w]*)? Safari/))&&m[1]){
o[_36a="safari"]=_361(m[1]);
}else{
if(/\/[\d\.]* \(KHTML, like Gecko\) Safari/.test(ua)){
o[_36a="safari"]=undefined;
}else{
if(!~ua.indexOf("Opera")&&(m=ua.match(/Firefox\/([\d\.]*)/))&&m[1]){
o[_36a="firefox"]=_361(m[1]);
}else{
if((m=ua.match(/Opera\/([\d\.]*)/))&&m[1]){
o[_36a="opera"]=_361(m[1]);
if((m=ua.match(/Opera\/.* Version\/([\d\.]*)/))&&m[1]){
o[_36a]=_361(m[1]);
}
}else{
if((m=ua.match(/Opera ([\d\.]*)/))&&m[1]){
core="presto";
o[_36a="opera"]=_361(m[1]);
}
}
}
}
}
}
}
o.shell=_36a;
o.core=core;
return o;
}
});
object.add("string",function(_36b){
this.substitute=function(){
return Mustache.to_html.apply(null,arguments);
};
this.camelCase=function(str){
return str.replace(/-\D/g,function(_36d){
return _36d.charAt(1).toUpperCase();
});
};
this.hyphenate=function(str){
return str.replace(/[A-Z]/g,function(_36f){
return ("-"+_36f.charAt(0).toLowerCase());
});
};
this.capitalize=function(str){
return str.replace(/\b[a-z]/g,function(_371){
return _371.toUpperCase();
});
};
this.trim=function(str){
return (str||"").replace(/^\s+|\s+$/g,"");
};
this.ltrim=function(str){
return (str||"").replace(/^\s+/,"");
};
this.rtrim=function(str){
return (str||"").replace(/\s+$/,"");
};
this.lengthZh=function(str){
return str.length;
};
this.toQueryString=function(_376){
var _377=[];
for(var key in _376){
var _379=_376[key];
var _37a;
if(_379&&_379.constructor===Array){
var qs={};
_379.forEach(function(val,i){
qs[i]=val;
});
_37a=arguments.callee(qs,key);
}else{
if(typeof _379=="object"){
_37a=arguments.callee(_379,key);
}else{
_37a=key+"="+encodeURIComponent(_379);
}
}
if(_379!==null){
_377.push(_37a);
}
}
return _377.join("&");
};
});
object.add("events","ua",function(_37e,ua){
var _380=(function(){
if(document.createEvent){
var _381=document.createEvent("Event");
_381.initEvent(type,false,true);
if(_381.preventDefault){
_381.preventDefault();
return !(_381.getPreventDefault?_381.getPreventDefault():_381.defaultPrevented);
}else{
return true;
}
}
return false;
})();
function IEEvent(){
}
IEEvent.prototype.stopPropagation=function(){
this.cancelBubble=true;
};
IEEvent.prototype.preventDefault=function(){
this.returnValue=false;
};
IEEvent.prototype.getPreventDefault=function(){
return this.returnValue===false;
};
IEEvent.prototype.stop=function(){
this.stopPropagation();
this.preventDefault();
};
this.fireevent=function(arg1){
var name,func,_385;
var _386=function(self){
var _388=arguments.callee.__name__;
if(!name){
name=_388;
}
var _389={};
var args=Array.prototype.slice.call(arguments,1);
if(_385){
for(var i=0;i<_385.length;i++){
_389[_385[i]]=arguments[i+1];
}
}
_389._args=args;
var _38c=self.fireEvent(name,_389,self);
var _38d=self[_388+"_createEvent"];
if(_38d){
args.unshift(_38c);
_38d.apply(self,args);
}
var _38e=_38c.getPreventDefault?_38c.getPreventDefault():_38c.defaultPrevented;
if(!_38e){
return func.apply(this,arguments);
}
};
if(typeof arg1=="function"){
func=arg1;
return _386;
}else{
if(Array.isArray(arguments[0])){
_385=arguments[0];
}else{
name=arg1;
if(arguments[1]){
_385=arguments[1];
}
}
return function(_38f){
func=_38f;
return _386;
};
}
};
this.HOLD=2;
this.CAPTURE=1;
this.wrapEvent=function(e){
e.target=e.srcElement;
e.stopPropagation=IEEvent.prototype.stopPropagation;
e.preventDefault=IEEvent.prototype.preventDefault;
e.getPreventDefault=IEEvent.prototype.getPreventDefault;
e.stop=IEEvent.prototype.stop;
return e;
};
this.wrapPreventDefault=function(e){
if(_380){
var _392=e.preventDefault;
e.preventDefault=function(){
this.defaultPrevented=true;
_392.apply(this,arguments);
};
}
};
var _393={click:2,dblclick:2,mouseup:2,mousedown:2,contextmenu:2,mousewheel:2,DOMMouseScroll:2,mouseover:2,mouseout:2,mousemove:2,selectstart:2,selectend:2,keydown:2,keypress:2,keyup:2,orientationchange:2,touchstart:2,touchmove:2,touchend:2,touchcancel:2,gesturestart:2,gesturechange:2,gestureend:2,focus:2,blur:2,change:2,reset:2,select:2,submit:2,paste:2,oninput:2,load:2,unload:1,beforeunload:2,resize:1,move:1,DOMContentLoaded:1,readystatechange:1,error:1,abort:1,scroll:1};
function isNativeEventForNode(node,type){
if(node.nativeEventNames){
return node.nativeEventNames.indexOf(type)!=-1;
}
return type in _393;
}
this.Events=new Class(function(){
function moveNativeEventsToTail(self,type){
var boss=self.__boss||self;
if(self.__nativeEvents&&self.__nativeEvents[type]){
boss.removeEventListener(type,self.__nativeEvents[type].run,false);
boss.addEventListener(type,self.__nativeEvents[type].run,false);
}
}
function handle(self,type){
var boss=self.__boss||self;
boss.attachEvent("on"+type,function(_39c){
var _39d=arguments.length>1?_39c:_37e.wrapEvent(window.event);
var _39e=self.__eventListeners?self.__eventListeners[type]:null;
if(_39e){
_39e=_39e.slice(0);
_39e.forEach(function(func){
try{
func.call(self,_39d);
}
catch(e){
}
});
_39e=null;
}
var _3a0=self.__nativeEvents?self.__nativeEvents[type]:null;
if(_3a0){
_3a0=_3a0.slice(0);
_3a0.forEach(function(func){
func.call(self,_39d);
});
_3a0=null;
}
});
}
function addOnHandlerAsEventListener(self,type){
if(type in _393&&self.nodeType==1){
return;
}
var boss=self.__boss||self;
var _3a5=self["on"+type],_3a6=boss["__on"+type];
if(!_3a5&&_3a6){
boss.removeEventListener(type,_3a6,false);
boss["__on"+type]=null;
}else{
if(_3a5&&_3a5!=_3a6){
boss.removeEventListener(type,_3a6,false);
boss.addEventListener(type,_3a5,false);
boss["__on"+type]=_3a5;
}
}
}
function attachOnHandlerAsEventListener(self,type){
if(self.nodeType==1&&isNativeEventForNode(self,type)&&isNodeInDOMTree(self)){
return;
}
if(!self.__eventListeners){
self.__eventListeners={};
}
if(!self.__eventListeners[type]){
self.__eventListeners[type]=[];
}
var _3a9=self.__eventListeners[type];
var l=_3a9.length;
var _3ab=self["on"+type],_3ac=self["__on"+type];
if(!_3ab&&_3ac){
for(var i=0;i<l;i++){
if(_3a9[i]==_3ac){
_3a9.splice(i,1);
break;
}
}
self["__on"+type]=null;
}else{
if(_3ab&&_3ab!=_3ac){
for(var i=0;i<l;i++){
if(_3a9[i]==_3ac){
_3a9.splice(i,1);
break;
}
}
_3a9.push(_3ab);
self["__on"+type]=_3ab;
}
}
}
function isNodeInDOMTree(node){
if(!node){
return false;
}
var _3af=node.parentNode;
var top=document.documentElement;
while(_3af){
if(_3af==top){
return true;
}
_3af=_3af.parentNode;
}
return false;
}
function insertWrapPreventDefaultHandler(boss,type,cap){
if(!boss["__preEventAdded_"+type]){
boss["__preEventAdded_"+type]=true;
if(boss["on"+type]){
boss["__on"+type]=boss["on"+type];
boss["on"+type]=null;
}
boss.addEventListener(type,function(_3b4){
_37e.wrapPreventDefault(_3b4);
},cap);
if(boss["__on"+type]){
boss["on"+type]=boss["__on"+type];
boss["__on"+type]=null;
try{
delete boss["__on"+type];
}
catch(e){
}
}
}
}
this.initialize=function(self){
if(!self.addEventListener){
if(!self.__eventListeners){
self.__eventListeners={};
}
if(!self.__nativeEvents){
self.__nativeEvents={};
}
}
if(!self.addEventListener&&!self.attachEvent){
self.__boss=document.createElement("div");
}
};
this.addEvent=document.addEventListener?function(self,type,func,cap){
var boss=self.__boss||self;
if(cap===null){
cap=false;
}
cap=!!(cap&_37e.CAPTURE);
if(!ua.ua.ie&&type=="mouseleave"){
var _3bb=function(_3bc,_3bd){
var p=_3bc.relatedTarget;
while(p&&p!=_3bd){
try{
p=p.parentNode;
}
catch(error){
p=_3bd;
}
}
return p!==_3bd;
};
var _3bf=func;
func=function(_3c0){
var p=_3c0.relatedTarget;
while(p&&p!=self){
try{
p=p.parentNode;
}
catch(e){
p=self;
}
}
if(p!==self&&_3bf){
_3bf.call(self,_3c0);
}
};
func.innerFunc=_3bf;
type="mouseout";
if(!self.__eventListeners){
self.__eventListeners={};
}
if(!self.__eventListeners[type]){
self.__eventListeners[type]=[];
}
self.__eventListeners[type].push(func);
}
if(_380){
insertWrapPreventDefaultHandler(boss,type,cap);
}
addOnHandlerAsEventListener(self,type);
boss.addEventListener(type,func,cap);
moveNativeEventsToTail(self,type);
}:function(self,type,func){
var boss=self.__boss||self;
var _3c6;
if(!self.__eventListeners){
self.__eventListeners={};
}
if(!self.__eventListeners[type]){
_3c6=[];
self.__eventListeners[type]=_3c6;
if(!self.__nativeEvents||!self.__nativeEvents[type]){
handle(self,type);
}
}else{
_3c6=self.__eventListeners[type];
}
if(_3c6.some(function(f){
return f===func;
})){
return;
}
attachOnHandlerAsEventListener(self,type);
_3c6.push(func);
};
this.addNativeEvent=document.addEventListener?function(self,type,func){
var boss=self.__boss||self;
if(_380){
insertWrapPreventDefaultHandler(boss,type,false);
}
var _3cc;
if(!self.__nativeEvents){
self.__nativeEvents={};
}
if(!self.__nativeEvents[type]){
_3cc=[];
self.__nativeEvents[type]=_3cc;
self.__nativeEvents[type].run=function(_3cd){
_3cc.forEach(function(func){
func.call(self,_3cd);
});
};
moveNativeEventsToTail(self,type);
}else{
_3cc=self.__nativeEvents[type];
}
_3cc.push(func);
}:function(self,type,func){
var boss=self.__boss||self;
var _3d3;
if(!self.__nativeEvents){
self.__nativeEvents={};
}
if(!self.__nativeEvents[type]){
_3d3=[];
self.__nativeEvents[type]=_3d3;
if(!self.__nativeEvents||!self.__eventListeners[type]){
handle(self,type);
}
}else{
_3d3=self.__nativeEvents[type];
}
if(_3d3.some(function(f){
return f===func;
})){
return;
}
_3d3.push(func);
};
this.removeEvent=document.removeEventListener?function(self,type,func,cap){
var boss=self.__boss||self;
cap=!!(cap&_37e.CAPTURE);
if(!ua.ua.ie&&type=="mouseleave"){
type="mouseout";
if(self.__eventListeners&&self.__eventListeners[type]){
var _3da=self.__eventListeners[type];
for(var i=0,_3dc,l=_3da.length;i<l;i++){
_3dc=_3da[i];
if(_3dc.innerFunc===func){
boss.removeEventListener(type,_3dc,cap);
_3da.splice(i,1);
break;
}
}
}
}else{
boss.removeEventListener(type,func,cap);
}
}:function(self,type,func,cap){
var boss=self.__boss||self;
if(!self.__eventListeners){
self.__eventListeners={};
}
var _3e3=self.__eventListeners[type];
if(!_3e3){
return;
}
for(var i=0;i<_3e3.length;i++){
if(_3e3[i]===func){
_3e3.splice(i,1);
break;
}
}
};
this.fireEvent=document.dispatchEvent?function(self,type,_3e7){
if(!ua.ua.ie&&type=="mouseleave"){
type="mouseout";
}
addOnHandlerAsEventListener(self,type);
var boss=self.__boss||self;
var _3e9=document.createEvent("Event");
_3e9.initEvent(type,false,true);
object.extend(_3e9,_3e7);
_37e.wrapPreventDefault(_3e9);
boss.dispatchEvent(_3e9);
return _3e9;
}:function(self,type,_3ec){
if(!_3ec){
_3ec={};
}
if(self.nodeType==1&&isNativeEventForNode(self,type)){
var _3ed=_37e.wrapEvent(document.createEventObject());
object.extend(_3ed,_3ec);
if(isNodeInDOMTree(self)){
var _3ee=self["__on"+type];
var _3ef=self.__eventListeners[type];
if(_3ee&&_3ef){
for(var i=0,l=_3ef.length;i<l;i++){
if(_3ef[i]==_3ee){
_3ef.splice(i,1);
break;
}
}
self["__on"+type]=null;
}
if(self._oldFireEventInIE){
self._oldFireEventInIE("on"+type,_3ed);
return _3ed;
}else{
if(typeof console!="undefined"){
console.warn("\u8bf7\u4f7f\u7528dom.wrap\u65b9\u6cd5\u5305\u88c5\u5bf9\u8c61\u4ee5\u6dfb\u52a0\u4e8b\u4ef6\u5904\u7406\u51fd\u6570");
}
}
}
}
attachOnHandlerAsEventListener(self,type);
var _3ed=_37e.wrapEvent(_3ec);
var _3ef=self.__eventListeners[type];
if(_3ef){
_3ef=_3ef.slice(0);
for(var i=0,j=_3ef.length;i<j;i++){
if(_3ef[i]){
try{
_3ef[i].call(self,_3ed,true);
}
catch(e){
}
}
}
_3ef=null;
}
var _3f3=self.__nativeEvents[type];
if(_3f3){
_3f3=_3f3.slice(0);
_3f3.forEach(function(func){
func.call(self,_3ed);
});
_3f3=null;
}
return _3ed;
};
});
});
object.add("options",function(_3f5){
var _3f6=true,_3f7=Array.prototype.slice;
for(var i in {toString:1}){
_3f6=null;
}
if(_3f6){
_3f6=["hasOwnProperty","valueOf","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","constructor"];
}
this.overloadsetter=function(func){
return function(){
var a=arguments[func.length-2]||null;
var b=arguments[func.length-1];
var _3fc=args=_3f7.call(arguments,0,func.length-2);
if(a===null){
return this;
}
if(typeof a!="string"){
for(var k in a){
args=_3fc.slice(0);
args.push(k);
args.push(a[k]);
func.apply(this,args);
}
if(_3f6){
for(var i=_3f6.length;i>0;i--){
k=_3f6[i];
if(a.hasOwnProperty(k)){
func.call(this,k,a[k]);
}
}
}
}else{
args.push(a);
args.push(b);
func.apply(this,args);
}
return this;
};
};
this.Arguments=new Class(function(){
this.initialize=function(self,_400,opts){
if(opts==undefined){
opts={};
}
var _402={};
for(var key in _400){
_402[key]=(opts[key]!=undefined?opts[key]:_400[key]);
}
return _402;
};
});
this.Options=new Class({initialize:function(self,_405){
if(_405){
self._provider=_405;
}
self._options={};
},setOptions:function(self,_407,host){
if(!host){
host=self._options;
}
for(var i in _407){
if(i in host){
host[i]=_407[i];
}
}
},setOption:function(self,name,type,_40d){
if(_40d!==undefined){
self._options[name]=_40d;
}else{
if(self._provider&&self._provider.makeOption){
_40d=self._provider.makeOption(name,type);
if(_40d===null){
return;
}else{
self._options[name]=_40d;
}
}
}
},getOptions:function(self){
return self._options;
}});
});
object.add("dom","ua, events, string, dom/dd, sys",function(_40f,ua,_411,_412,dd,sys){
window.UID=1;
var _415={};
var get=function(uid){
return (_415[uid]||(_415[uid]={}));
};
var $uid=this.$uid=(window.ActiveXObject)?function(item){
if(item===undefined||item===null){
return null;
}
return (item.uid||(item.uid=[window.UID++]))[0];
}:function(item){
if(item===undefined||item===null){
return null;
}
return item.uid||(item.uid=window.UID++);
};
$uid(window);
$uid(document);
if(!window.__domloadHooks){
window.__domLoaded=false;
window.__domloadHooks=[];
if(document.addEventListener){
document.addEventListener("DOMContentLoaded",function(){
document.removeEventListener("DOMContentLoaded",arguments.callee,false);
window.__domLoaded=true;
},false);
}
var _41b=null;
if(ua.ua.webkit&&ua.ua.webkit<525){
_41b=setInterval(function(){
if(/loaded|complete/.test(document.readyState)){
clearInterval(_41b);
window.__domLoaded=true;
runHooks();
}
},10);
}else{
if(ua.ua.ie){
_41b=setInterval(function(){
try{
document.body.doScroll("left");
clearInterval(_41b);
window.__domLoaded=true;
runHooks();
}
catch(e){
}
},20);
}
}
}
function runHooks(){
var _41c=window.__domloadHooks;
var fn;
while(_41c[0]){
try{
fn=_41c.shift();
fn();
}
catch(e){
if(XN&&XN.DEBUG_MODE){
throw e;
}
}
}
}
this.ready=function(_41e){
if(typeof _41e!="function"){
return;
}
if(window.__domLoaded==true){
_41e();
return;
}
if(document.readyState=="complete"){
window.__domLoaded=true;
runHooks();
_41e();
return;
}
if((ua.ua.webkit&&ua.ua.webkit<525)||!document.addEventListener){
window.__domloadHooks.push(_41e);
}else{
if(document.addEventListener){
document.addEventListener("DOMContentLoaded",_41e,false);
}
}
};
var wrap=this.wrap=function(node){
if(!node){
return null;
}
if(Array.isArray(node)){
return new _40f.Elements(node);
}else{
if(node._wrapped){
return node;
}
if(ua.ua.ie&&node.fireEvent){
node._oldFireEventInIE=node.fireEvent;
}
var _421;
if(node===window){
_421=_40f.Window;
}else{
if(node===window.document){
_421=_40f.Document;
}else{
if(node.nodeType===1){
_421=getWrapper(node.tagName);
}else{
return node;
}
}
}
node._wrapped=true;
$uid(node);
Class.inject(_421,node,function(dest,src,prop){
if(typeof src[prop]!="function"){
if(!(prop in dest)){
return true;
}else{
return false;
}
}else{
return true;
}
});
return node;
}
};
this.getElements=function(_425,_426){
if(!_425||typeof _425!="string"){
return null;
}
if(!_426){
_426=document;
}
var _427=Slick.parse(_425);
var eles=Sizzle(_425,_426);
var _429,part;
if(_427.expressions.length==1){
part=_427.expressions[0];
_429=getWrapper(part[part.length-1].tag);
}else{
for(var i=0,_42c,_42d;i<_427.expressions.length;i++){
part=_427.expressions[i];
_429=getWrapper(part[part.length-1].tag);
_42c=Class.getChain(_429).slice(0,-1).reverse();
if(_42d){
_42c=getCommon(_42c,_42d);
}
if(_42c.length==1){
break;
}
_42d=_42c;
}
_429=_42c[_42c.length-1];
}
return new _40f.Elements(eles,_429);
};
this.getElement=function(_42e,_42f){
if(!_42e||typeof _42e!="string"){
return null;
}
if(!_42f){
_42f=document;
}
var ele=Sizzle(_42e,_42f)[0];
ele=wrap(ele);
return ele;
};
this.id=function(id){
return _40f.wrap(document.getElementById(id));
};
var _432=this.eval_inner_JS=function(ele){
if(!ele){
return;
}
if(typeof ele=="string"){
var node=document.createElement("div");
node.innerHTML="<div>&nbsp;</div> "+ele;
ele=node;
}
var js=[];
if(ele.nodeType==11){
for(var i=0,l=ele.childNodes.length,_438;i<l;i++){
_438=ele.childNodes[i];
if(_438.tagName&&_438.tagName.toUpperCase()=="SCRIPT"){
js.push(_438);
}else{
if(_438.nodeType===1){
var _439=_438.getElementsByTagName("script");
for(var j=0,_43b=_439.length;j<_43b;j++){
js.push(_439[j]);
}
}
}
}
}else{
if(ele.nodeType==1){
if(ele.tagName&&ele.tagName.toUpperCase()=="SCRIPT"){
js.push(ele);
}else{
js=ele.getElementsByTagName("script");
}
}
}
var arr=[];
for(i=0;i<js.length;i++){
arr.push(js[i]);
}
arr.forEach(function(s,i){
if(s.src){
return;
}else{
var _43f="__inner_js_out_put = [];\n";
_43f+=s.innerHTML.replace(/document\.write/g,"__inner_js_out_put.push");
eval(_43f);
if(__inner_js_out_put.length!==0){
var tmp=document.createDocumentFragment();
var div=document.createElement("div");
div.innerHTML=__inner_js_out_put.join("");
while(div.firstChild){
tmp.appendChild(div.firstChild);
}
s.parentNode.insertBefore(tmp,s);
}
}
});
};
var _442=(function(){
var t=document.createElement("div");
t.innerHTML="<TEST_TAG></TEST_TAG>";
return !(t.firstChild===null);
})();
var _444=(function(){
if(ua.ua.ie<8){
return false;
}
return true;
})();
var _445="placeholder" in document.createElement("input");
var _446="naturalWidth" in document.createElement("img");
var _447="checkValidity" in document.createElement("input");
var _448="hidden" in document.createElement("div");
var _449="formAction" in document.createElement("input");
var _44a="selectionStart" in document.createElement("input");
var _44b=function(){
var prop=property(function(self){
return self[prop.__name__];
},function(self,_44f){
self._set(prop.__name__,_44f);
});
return prop;
};
var _450=function(_451,attr){
var prop=property(function(self){
if(!attr){
attr=prop.__name__.toLowerCase();
}
var _455=self.getAttribute(attr);
return _455!=null?_455:_451;
},function(self,_457){
if(!attr){
attr=prop.__name__.toLowerCase();
}
if(!_457){
_457="";
}
self.setAttribute(attr,_457);
});
return prop;
};
this.getDom=function(str){
var tmp=document.createElement("div");
var _45a=document.createDocumentFragment();
if(!_442){
tmp.style.display="none";
document.body.appendChild(tmp);
}
tmp.innerHTML=str;
while(tmp.firstChild){
_45a.appendChild(wrap(tmp.firstChild));
}
if(!_442){
tmp.parentNode.removeChild(tmp);
}
return _45a;
};
this.ElementClassList=new Class(Array,function(){
this.initialize=function(self,ele){
self.length=0;
self._ele=ele;
self._loadClasses();
};
this._loadClasses=function(self){
self._classes=self._ele.className.replace(/^\s+|\s+$/g,"").split(/\s+/);
};
this.toggle=function(self,_45f){
if(self.contains(_45f)){
self.remove(_45f);
}else{
self.add(_45f);
}
};
this.add=function(self,_461){
if(!self.contains(_461)){
self._ele.className=(self._ele.className+" "+_461).trim();
self._loadClasses();
}
};
this.remove=function(self,_463){
if(!_463||typeof _463!="string"){
return;
}
if(!self.contains(_463)){
return;
}
self._ele.className=self._ele.className.replace(new RegExp(_463.trim(),"i"),"").trim();
self._loadClasses();
};
this.contains=function(self,_465){
if(self._classes.indexOf(_465)!=-1){
return true;
}else{
return false;
}
};
this.item=function(self,i){
return self._classes[i]||null;
};
this.toString=function(self){
return self._ele.className;
};
});
var _469=["click","dblclick","mouseup","mousedown","contextmenu","mouseover","mouseout","mousemove","selectstart","selectend","keydown","keypress","keyup"];
this.Element=new Class(function(){
Class.mixin(this,_411.Events);
Class.mixin(this,dd.DragDrop);
this.nativeEventNames=_469;
this.initialize=function(self,_46b){
if(_46b){
self=document.createElement(_46b);
wrap(self);
}else{
}
if(!self.__eventListeners){
self.__eventListeners={};
}
if(!self.__nativeEvents){
self.__nativeEvents={};
}
if(self.classList===undefined&&self!==document&&self!==window){
self.classList=new _40f.ElementClassList(self);
}
self.delegates={};
};
this.hidden=_448?_44b():property(function(self){
return self.style.display=="none";
},function(self,_46e){
if(_46e==true){
if(self.style.display!=="none"){
self.__oldDisplay=self.style.display;
}
self.style.display="none";
}else{
self.style.display=self.__oldDisplay||"";
}
});
this.retrieve=function(self,_470,_471){
var _472=get(self.uid);
if(!(_470 in _472)&&_471!==undefined){
_472[_470]=_471;
}
return _472[_470];
};
this.store=function(self,_474,_475){
var _476=get(self.uid);
_476[_474]=_475;
return self;
};
this.delegate=function(self,_478,type,fn,_47b){
function wrapper(e){
var ele=e.srcElement||e.target;
do{
if(ele&&_40f.Element.get("matchesSelector")(ele,_478)){
fn.call(wrap(ele),e);
}
}while((ele=ele.parentNode));
}
var key=_478+"_"+type;
if(!self.delegates){
self.delegates={};
}
if(!(key in self.delegates)){
self.delegates[key]=[];
}
self.delegates[key].push({wrapper:wrapper,fn:fn});
self.addEvent(type,wrapper,_47b);
};
this.undelegate=function(self,_480,type,fn,_483){
var key=_480+"_"+type;
if(!self.delegates){
self.delegates={};
}
if(!(key in self.delegates)){
return;
}
self.delegates[key].forEach(function(item){
if(item.fn===fn){
self.removeEvent(type,item.wrapper,_483);
return;
}
});
};
this.matchesSelector=function(self,_487){
return Sizzle.matches(_487,[self]).length>0;
};
this.getData=function(self,name){
return self.getAttribute("data-"+name);
};
this.setHTML=function(self,str){
self.set("innerHTML",str);
};
this.setContent=this.setHTML;
this.getElement=function(self,_48d){
return _40f.getElement(_48d,self);
};
this.getElements=function(self,_48f){
return _40f.getElements(_48f,self);
};
var _490={before:function(_491,_492){
var _493=_492.parentNode;
if(_493){
_493.insertBefore(_491,_492);
}
},after:function(_494,_495){
var _496=_495.parentNode;
if(_496){
_496.insertBefore(_494,_495.nextSibling);
}
},bottom:function(_497,_498){
_498.appendChild(_497);
},top:function(_499,_49a){
_49a.insertBefore(_499,_49a.firstChild);
}};
_490.inside=_490.bottom;
this.grab=function(self,el,_49d){
_490[_49d||"bottom"](el,self);
return self;
};
this.inject=function(self,el,_4a0){
_490[_4a0||"bottom"](self,el);
return self;
};
this.getPrevious=function(self,_4a2){
var _4a3=_4a2?_40f.Element.get("matchesSelector"):null;
var _4a4=self;
while(_4a4=_4a4.previousSibling){
if(_4a4.nodeType==8){
continue;
}
if(!_4a3||_4a3(_4a4,_4a2)){
return wrap(_4a4);
}
}
return null;
};
this.getAllPrevious=function(self,_4a6){
var _4a7=_4a6?_40f.Element.get("matchesSelector"):null;
var _4a8=[];
var _4a9=self;
while(_4a9=_4a9.previousSibling){
if(_4a9.nodeType==8){
continue;
}
if(!_4a7||_4a7(_4a9,_4a6)){
_4a8.push(wrap(_4a9));
}
}
return _4a8;
};
this.getNext=function(self,_4ab){
var _4ac=_4ab?_40f.Element.get("matchesSelector"):null;
var _4ad=self;
while(_4ad=_4ad.nextSibling){
if(_4ad.nodeType==8){
continue;
}
if(!_4ac||_4ac(_4ad,_4ab)){
return wrap(_4ad);
}
}
return null;
};
this.getAllNext=function(self,_4af){
var _4b0=_4af?_40f.Element.get("matchesSelector"):null;
var _4b1=[];
var _4b2=self;
while(_4b2=_4b2.nextSibling){
if(_4b2.nodeType==8){
continue;
}
if(!_4b0||_4b0(_4b2,_4af)){
_4b1.push(wrap(_4b2));
}
}
return _4b1;
};
this.getFirst=function(self,_4b4){
var _4b5=_4b4?_40f.Element.get("matchesSelector"):null;
var _4b6=self.childNodes,l=_4b6.length;
for(var i=0,_4b9;i<l;i++){
_4b9=_4b6[i];
if(_4b9.nodeType==8){
continue;
}
if(!_4b5||_4b5(_4b9,_4b4)){
return wrap(_4b9);
}
}
return null;
};
this.getLast=function(self,_4bb){
var _4bc=_4bb?_40f.Element.get("matchesSelector"):null;
var _4bd=self.childNodes,l=_4bd.length;
for(var i=l-1,_4c0;i>=0;i--){
_4c0=_4bd[i];
if(_4c0.nodeType==8){
continue;
}
if(!_4bc||_4bc(_4c0,_4bb)){
return wrap(_4c0);
}
}
return null;
};
this.getParent=function(self,_4c2){
if(!_4c2){
return wrap(self.parentNode);
}
var _4c3=_40f.Element.get("matchesSelector");
var _4c4=self;
do{
if(_4c3(_4c4,_4c2)){
return wrap(_4c4);
}
}while((_4c4=_4c4.parentNode));
return null;
};
this.getParents=function(self,_4c6){
var _4c7=_4c6?_40f.Element.get("matchesSelector"):null;
var _4c8=[];
var _4c9=self;
while(_4c9=_4c9.parentNode){
if(_4c9.nodeType==8){
continue;
}
if(!_4c7||_4c7(_4c9,_4c6)){
_4c8.push(wrap(_4c9));
}
}
return _4c8;
};
this.getSiblings=function(self,_4cb){
return self.getAllPrevious(_4cb).concat(self.getAllNext(_4cb));
};
this.getChildren=function(self,_4cd){
var _4ce=_4cd?_40f.Element.get("matchesSelector"):null;
var _4cf=self.childNodes,l=_4cf.length,_4d1=[];
for(var i=0,_4d3;i<l;i++){
_4d3=_4cf[i];
if(_4d3.nodeType==8){
continue;
}
if(!_4ce||_4ce(_4d3,_4cd)){
_4d1.push(wrap(_4d3));
}
}
return _4d1;
};
this.addClass=function(self,name){
self.classList.add(name);
};
this.removeClass=function(self,name){
self.classList.remove(name);
};
this.toggleClass=function(self,name){
self.classList.toggle(name);
};
this.hasClass=function(self,name){
return self.classList.contains(name);
};
var html=document.documentElement;
var _4dd=(html.style.cssFloat==null)?"styleFloat":"cssFloat",_4de=(html.style.opacity!=null),_4df=(html.style.filter!=null),_4e0=/alpha\(opacity=([\d.]+)\)/i;
this.opacity=property(function(self){
if(_4de){
return self.style.opacity;
}else{
if(_4df){
var _4e2=self.style.filter||self.currentStyle.filter;
if(_4e2){
opacity=_4e2.match(_4e0);
}
return (opacity==null||_4e2==null)?1:(opacity[1]/100);
}else{
return self.retrieve("opacity");
}
}
},function(self,_4e4){
if(_4de){
self.style.opacity=_4e4;
}else{
if(_4df){
if(!self.currentStyle||!self.currentStyle.hasLayout){
self.style.zoom=1;
}
_4e4=parseInt(_4e4*100);
if(_4e4>100){
_4e4=100;
}else{
if(_4e4<0){
_4e4=0;
}
}
var _4e5=_4e4==100?"":"alpha(opacity="+_4e4+")";
var _4e6=self.style.filter||self.currentStyle.filter||"";
self.style.filter=_4e0.test(_4e6)?_4e6.replace(_4e0,_4e5):_4e6+_4e5;
}else{
self.store("opacity",_4e4);
self.style.visibility=_4e4>0?"visible":"hidden";
}
}
});
this.setStyle=function(self,_4e8,_4e9){
switch(_4e8){
case "opacity":
return self.set("opacity",parseFloat(_4e9));
case "float":
_4e8=_4dd;
break;
default:
break;
}
_4e8=_412.camelCase(_4e8);
self.style[_4e8]=_4e9;
return null;
};
this.dispose=function(self){
return (self.parentNode)?self.parentNode.removeChild(self):self;
};
this.hide=function(self){
if(self.style.display!=="none"){
self.oldDisplay=self.style.display;
}
self.style.display="none";
};
this.show=function(self){
self.style.display=self.oldDisplay||"";
};
this.toggle=function(self){
if(self.style.display=="none"){
self.show();
}else{
self.hide();
}
};
this.innerHTML=property(null,function(self,html){
if(_442){
self.innerHTML=html;
}else{
var _4f0=_40f.getDom(html);
self.innerHTML="";
while(_4f0.firstChild){
self.appendChild(_4f0.firstChild);
}
}
});
this.tagName=property(function(self){
return self.tagName.toUpperCase();
});
this.fromString=staticmethod(function(str){
var tmp=document.createElement("div");
if(!_442){
tmp.style.display="none";
document.body.appendChild(tmp);
}
tmp.innerHTML=str.trim();
var _4f4=wrap(tmp.firstChild);
if(!_442){
tmp.parentNode.removeChild(tmp);
}
return _4f4;
});
});
this.ImageElement=new Class(_40f.Element,function(){
this.nativeEventNames=_469.concat(["error","abort"]);
function _getNaturalSize(img){
var _4f6=new Image();
_4f6.src=img.src;
return {width:_4f6.width,height:_4f6.height};
}
this.naturalWidth=property(function(self){
if(_446){
return self.naturalWidth;
}else{
return _getNaturalSize(self).width;
}
});
this.naturalHeight=property(function(self){
if(_446){
return self.naturalHeight;
}else{
return _getNaturalSize(self).height;
}
});
});
this.FormElement=new Class(_40f.Element,function(){
this.nativeEventNames=_469.concat(["reset","submit"]);
this.initialize=function(self){
this.parent(self);
if(self.elements){
for(var i=0;i<self.elements.length;i++){
wrap(self.elements[i]);
}
}
if(!_444){
self.elements.namedItem=function(name){
return Sizzle("*[name="+name+"]",self)[0];
};
}
if(!_449){
self.addNativeEvent("submit",function(_4fc){
if(!self.__submitButton){
return;
}
var _4fd=self.__submitButton;
self.__submitButton=null;
var _4fe=self.action;
var _4ff=self.method;
var _500=self.encoding||self.enctype;
var _501=self.noValidate;
var _502=self.target;
var _503=_4fd.getAttribute("formaction");
var _504=_4fd.getAttribute("formmethod");
var _505=_4fd.getAttribute("formenctype");
var _506=_4fd.getAttribute("formnovalidate");
var _507=_4fd.getAttribute("formtarget");
if(_503){
self.action=_503;
}
if(_504){
self.method=_504;
}
if(_505){
self.enctype=self.encoding=_505;
}
if(_506){
self.formNoValidate=_506;
}
if(_507){
self.target=_507;
}
var _508=_4fc.getPreventDefault?_4fc.getPreventDefault():_4fc.defaultPrevented;
if(!_508){
_4fc.preventDefault();
self.submit();
}
if(ua.ua.webkit<=534.12){
setTimeout(function(){
self.action=_4fe;
self.method=_4ff;
self.enctype=self.encoding=_500;
self.formNoValidate=_501;
self.target=_502;
},0);
}else{
self.action=_4fe;
self.method=_4ff;
self.enctype=self.encoding=_500;
self.formNoValidate=_501;
self.target=_502;
}
});
}
};
this.createRequest=function(self,_50a){
if(!_50a){
_50a={};
}
if(!_50a.method){
_50a.method=self.method;
}
if(!_50a.url){
_50a.url=self.action;
}
if(!_50a.data){
_50a.data=self.toQueryString();
}
if(!_50a.onsuccess){
_50a.onsuccess=function(_50b){
self.fireEvent("requestSuccess",{request:_50b.request});
};
}
if(!_50a.onerror){
_50a.onerror=function(_50c){
self.fireEvent("requestError",{request:_50c.request});
};
}
var net=sys.modules["net"];
if(net){
xhr=new net.Request(_50a);
}else{
throw new ModuleRequiredError("net");
}
return xhr;
};
this.send=function(self,data){
var _510=self.createRequest();
_510.send(data);
return _510;
};
this.toQueryString=function(self){
var _512=[];
function addItem(name,_514){
if(typeof _514!="undefined"){
_512.push(encodeURIComponent(name)+"="+encodeURIComponent(_514));
}
}
self.getElements("input, select, textarea, output").forEach(function(el){
var type=el.type;
if(!el.name||el.disabled||type=="submit"||type=="reset"||type=="file"||type=="image"){
return;
}
if(el.tagName.toLowerCase()=="select"){
el.getSelected().map(function(opt){
var _518=wrap(opt).get("value");
addItem(el.name,_518);
});
}else{
if(type=="radio"||type=="checkbox"){
if(el.checked){
addItem(el.name,el.get("value"));
}
}else{
addItem(el.name,el.get("value"));
}
}
});
return _512.join("&");
};
this.checkValidity=function(self){
return self.getElements("input, select, textarea, output").every(function(el){
return el.checkValidity();
});
};
});
this.FormItemElement=new Class(_40f.Element,function(){
this.nativeEventNames=_469.concat(["focus","blur","change","select","paste"]);
this.required=_447?_44b():_450(false);
this.pattern=_447?_44b():_450("");
this.maxlength=_44b();
this.type=_447?_44b():_450("text");
this.min=_447?_44b():_450("");
this.max=_447?_44b():_450("");
this.selectionStart=property(function(self){
try{
if(typeof self.selectionStart=="number"){
return self.selectionStart;
}
}
catch(e){
return -1;
}
if(document.selection){
var _51c=document.selection.createRange();
if(_51c==null||_51c.parentElement()!=self){
if(self.__selectionPos){
return self.__selectionPos.start;
}else{
return -1;
}
}
return calculateSelectionPos(self).start;
}else{
return -1;
}
});
this.selectionEnd=property(function(self){
try{
if(typeof self.selectionEnd=="number"){
return self.selectionEnd;
}
}
catch(e){
return -1;
}
if(document.selection){
var _51e=document.selection.createRange();
if(_51e==null||_51e.parentElement()!=self){
if(self.__selectionPos){
return self.__selectionPos.end;
}else{
return -1;
}
}
return calculateSelectionPos(self).end;
}else{
return -1;
}
});
this.getSelected=function(self){
self.selectedIndex;
var _520=[];
for(var i=0;i<self.options.length;i++){
if(self.options[i].selected){
_520.push(self.options[i]);
}
}
return _520;
};
this.value=property(function(self){
if(self.classList.contains("placeholder")){
return "";
}
return self.value;
},function(self,_524){
if(self.classList.contains("placeholder")){
self.classList.remove("placeholder");
self.removeAttribute("autocomplete");
self.value="";
}
self.value=_524;
if(!_445&&!self.value&&self.getAttribute("placeholder")){
self.classList.add("placeholder");
self.value=self.getAttribute("placeholder");
self.setAttribute("autocomplete","off");
}
self.checkValidity();
});
this.validity=_447?property(function(self){
return self.validity;
}):property(function(self){
var _527=self.get("value");
var _528={valueMissing:self.getAttribute("required")&&!_527?true:false,typeMismatch:(function(type){
if(type=="url"){
return !(/^\s*(?:(\w+?)\:\/\/([\w-_.]+(?::\d+)?))(.*?)?(?:;(.*?))?(?:\?(.*?))?(?:\#(\w*))?$/i).test(_527);
}
if(type=="tel"){
return !(/[^\r\n]/i).test(_527);
}
if(type=="email"){
return !(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/i).test(_527);
}
return false;
})(self.getAttribute("type")),patternMismatch:(function(){
var _52a=self.getAttribute("pattern");
if(_52a){
return !(new RegExp("^"+_52a+"$")).test(_527);
}else{
return false;
}
})(),tooLong:(function(){
var _52b=self.get("maxlength");
var n=Number(_52b);
if(n!=_52b){
return false;
}
return _527.length>n;
})(),customError:!!self.__customValidity,rangeUnderflow:false,rangeOverflow:false,stepMismatch:false};
_528.valid=["valueMissing","typeMismatch","patternMismatch","tooLong","rangeUnderflow","rangeOverflow","stepMismatch","customError"].every(function(name){
return _528[name]===false;
});
self.__validationMessage=(function(){
if(_528.valid){
return "";
}
if(_528.customError){
return self.__customValidity;
}
if(_528.valueMissing){
return "\u8bf7\u586b\u5199\u6b64\u5b57\u6bb5\u3002";
}
if(_528.typeMismatch){
return "\u8bf7\u8f93\u5165\u4e00\u4e2a"+self.getAttribute("type")+"\u3002";
}
if(_528.patternMismatch){
return "\u8bf7\u5339\u914d\u8981\u6c42\u7684\u683c\u5f0f\u3002";
}
if(_528.tooLong){
return "\u8bf7\u5c06\u8be5\u6587\u672c\u51cf\u5c11\u4e3a "+self.get("maxlength")+" \u4e2a\u5b57\u7b26\u6216\u66f4\u5c11\uff08\u60a8\u5f53\u524d\u4f7f\u7528\u4e86"+self.get("value").length+"\u4e2a\u5b57\u7b26\uff09\u3002";
}
if(_528.rangeUnderflow){
return "\u503c\u5fc5\u987b\u5927\u4e8e\u6216\u7b49\u4e8e"+self.getAttribute("min")+"\u3002";
}
if(_528.rangeOverflow){
return "\u503c\u5fc5\u987b\u5c0f\u4e8e\u6216\u7b49\u4e8e"+self.getAttribute("max")+"\u3002";
}
if(_528.stepMismatch){
return "\u503c\u65e0\u6548\u3002";
}
})();
self._set("validationMessage",self.__validationMessage);
self._set("validity",_528);
return _528;
});
this.validationMessage=_447?property(function(self){
return self.validationMessage;
}):property(function(self){
self.get("validity");
return self.__validationMessage;
});
if(!_447){
this.setCustomValidity=function(self,_531){
self.__customValidity=_531;
self.get("validity");
};
this.checkValidity=function(self){
self.get("validity");
return self.validity.valid;
};
}
this.focusToPosition=function(self,_534){
if(_534===undefined){
_534=self.get("value").length;
}
if(self.setSelectionRange){
self.focus();
self.setSelectionRange(self.get("value").length,_534);
}else{
if(self.createTextRange){
var _535=self.createTextRange();
_535.moveStart("character",_534);
_535.collapse(true);
_535.select();
self.focus();
}else{
self.focus();
}
}
};
});
this.TextBaseElement=new Class(_40f.FormItemElement,function(){
this.initialize=function(self){
this.parent(self);
if(!_445){
self.bindPlaceholder();
}
if(!_44a){
self.addEvent("beforedeactivate",function(){
self.__selectionPos=calculateSelectionPos(self);
});
}
};
this.placeholder=property(function(self){
return self.getAttribute("placeholder");
},function(self,_539){
self.setAttribute("placeholder",_539);
if(!_445){
self.bindPlaceholder();
if(self.get("_placeholding")){
self.value=_539;
}
}
});
this._placeholding=property(function(self){
return self.classList.contains("placeholder");
},function(self,_53c){
if(_53c){
self.classList.add("placeholder");
self.setAttribute("autocomplete","off");
}else{
self.classList.remove("placeholder");
self.removeAttribute("autocomplete");
}
});
this.bindPlaceholder=function(self){
if(self._binded){
return;
}
self._binded=true;
function checkEmpty(_53e){
var _53f=self.get("placeholder");
if(!_53f){
return;
}
if(self.get("_placeholding")){
if(_53e.type=="focus"&&self.value===_53f){
self.value="";
}
self.set("_placeholding",false);
}else{
if(!self.value||((ua.ua.ie==6||ua.ua.ie==7)&&!_53e&&self.value==_53f)){
self.set("_placeholding",true);
self.value=_53f;
}
}
}
self.addNativeEvent("focus",function(_540){
return checkEmpty(_540);
});
self.addNativeEvent("blur",function(_541){
return checkEmpty(_541);
});
if(self.form){
wrap(self.form).addNativeEvent("submit",function(){
if(self.classList.contains("placeholder")){
self.set("_placeholding",false);
self.value="";
setTimeout(function(){
checkEmpty();
},0);
}
});
}
checkEmpty();
};
});
this.InputElement=new Class(_40f.TextBaseElement,function(){
this.formAction=_449?_44b():_450("");
this.formEnctype=_449?_44b():_450("application/x-www-form-urlencoded");
this.formMethod=_449?_44b():_450("get");
this.formNoValidate=_449?_44b():_450(false);
this.formTarget=_449?_44b():_450("");
this.initialize=function(self){
this.parent(self);
if(!_449){
self.addNativeEvent("click",function(_543){
if(self.type=="submit"){
self.form.__submitButton=self;
}
});
}
};
this.send=function(self,data){
if(self.type!="submit"){
return;
}
var _546=self.form.createRequest({method:self.getAttribute("formmethod")||self.form.method,url:self.getAttribute("formaction")||self.form.action,onsuccess:function(_547){
self.fireEvent("requestSuccess",{request:_547.request});
},onerror:function(_548){
self.fireEvent("requestError",{request:_548.request});
}});
_546.send(data);
return _546;
};
});
this.TextAreaElement=new Class(_40f.TextBaseElement,function(){
});
this.Window=new Class(_40f.Element,function(){
this.nativeEventNames=_469.concat(["load","unload","beforeunload","resize","move","DomContentLoaded","readystatechange","scroll","mousewheel","DOMMouseScroll"]);
});
this.Document=new Class(_40f.Element,function(){
this.nativeEventNames=_469.concat(["load","unload","beforeunload","resize","move","DomContentLoaded","readystatechange","scroll","mousewheel","DOMMouseScroll"]);
});
this.Elements=new Class(Array,function(){
this.initialize=function(self,_54a,_54b){
if(!_54b){
_54b=_40f.Element;
}
for(var i=0;i<_54a.length;i++){
self.push(wrap(_54a[i]));
}
Class.keys(_54b).forEach(function(name){
if(typeof _54b.get(name)!="function"){
return;
}
self[name]=function(){
var _54e;
for(var i=0;i<self.length;i++){
_54e=self[i];
if(typeof _54e[name]=="function"){
_54e[name].apply(self[i],[].slice.call(arguments,0));
}
}
};
});
self.set=function(key,_551){
for(var i=0;i<self.length;i++){
self[i].set(key,_551);
}
};
self.get=function(key){
var _554=[];
for(var i=0;i<self.length;i++){
_554.push(self[i].get(key));
}
return _554;
};
};
});
var _556={"IMG":_40f.ImageElement,"FORM":_40f.FormElement,"INPUT":_40f.InputElement,"TEXTAREA":_40f.TextAreaElement,"OUTPUT":_40f.FormItemElement,"SELECT":_40f.FormItemElement,"OPTION":_40f.FormItemElement,"BUTTON":_40f.FormItemElement};
function getWrapper(_557){
var tag=_557.toUpperCase();
var cls=_556[tag];
if(cls){
return cls;
}else{
return _40f.Element;
}
}
function getCommon(arr1,arr2){
var i;
for(i=0,l=arr1.length;i<l;i++){
if(!arr2[i]||arr2[i]!==arr1[i]){
break;
}
}
return arr1.slice(0,i);
}
function calculateSelectionPos(_55d){
var _55e=document.selection.createRange();
if(_55e==null||_55e.parentElement()!=_55d){
return {start:-1,end:-1};
}
var _55f=_55d.createTextRange();
var _560=_55f.duplicate();
_55f.moveToBookmark(_55e.getBookmark());
_560.setEndPoint("EndToStart",_55f);
return {start:_560.text.length,end:_560.text.length+_55e.text.length};
}
});
object.add("dom.dd","ua, events, sys",function(_561,ua,_563,sys){
function isEventSupported(_565,_566){
var _567={"select":"input","change":"input","submit":"form","reset":"form","error":"img","load":"img","abort":"img"};
_566=_566||document.createElement(_567[_565]||"div");
_565="on"+_565;
var _568=(_565 in _566);
if(!_568){
if(!_566.setAttribute){
_566=document.createElement("div");
}
if(_566.setAttribute&&_566.removeAttribute){
_566.setAttribute(_565,"");
_568=typeof _566[_565]=="function";
if(typeof _566[_565]!="undefined"){
_566[_565]=undefined;
}
_566.removeAttribute(_565);
}
}
_566=null;
return _568;
}
var iOS=!!navigator.userAgent.match("iPhone OS")||!!navigator.userAgent.match("iPad");
var _56a=!iOS&&isEventSupported("dragstart")&&isEventSupported("drop");
this.DragDrop=new Class(function(){
var _56b=["display","position","width","height","border","backgroundColor","filter","opacity","zIndex","left","top"];
var _56c=["IMG","A"];
Class.mixin(this,_563.Events);
if(ua.ua.ie){
document.ondragstart=returnFalse;
}
this.initialize=function(self){
if(self.get("draggable")==true&&(_56c.indexOf(self.tagName)==-1)){
self.__docForDD=sys.modules["dom"].wrap(document);
self.__binderForDD={checkDragging:self._checkDragging.bind(self),cancel:self._cancelDrag.bind(self),dragging:self._dragging.bind(self),finish:self._finishDrag.bind(self)};
self.set("draggable",true);
self._forbidAutoDraggableNodes();
}
if(self.get("dropzone")!=undefined&&self.get("dropzone")!=""){
self.set("dropzone","default");
}
};
this.draggable=property(function(self){
return self.draggable;
},function(self,_570){
self._set("draggable",_570);
if(_570){
if(self.__canDrag==true){
return;
}
self.addEvent("mousedown",self._handleMouseDownForDD,false);
self.__canDrag=true;
if(self.__belongToDroppable!=null){
return;
}
self.__droppables=[];
var _571=self.parentNode;
while(_571&&_571.tagName!="BODY"&&_571.tagName!="HTML"){
if(_571.dropzone!=undefined&&_571.dropzone!=""){
_571=sys.modules["dom"].wrap(_571);
self.__belongToDroppable=_571;
self.__droppables.push(_571);
break;
}
_571=_571.parentNode;
}
}else{
if(self.__canDrag==true){
self.removeEvent("mousedown",self._handleMouseDownForDD,false);
self.__canDrag=false;
}
}
});
this.dropzone=property(function(self){
return self.dropzone;
},function(self,_574){
self._set("dropzone",_574);
if(_574!=undefined&&_574!=""){
if(self.__canDrop!=true){
self.__canDrop=true;
}
}else{
if(self.__canDrop==true){
self.__canDrop=false;
}
}
});
this.getDroppableList=function(self){
return self.__canDrag?self.__droppables:null;
};
this.getCurrentDroppable=function(self){
return self.__canDrag?self.__belongToDroppable:null;
};
this.addDraggables=function(self,_578,_579){
if(self.__canDrop!=true){
return self;
}
_579=_579||false;
if(!self.__draggables){
self.__draggables=[];
}
for(var i=0,l=_578.length,_57c;i<l;i++){
_57c=_578[i];
if(!_57c._canDrag){
_57c.enableDrag();
}
if(_57c.__droppables.indexOf(self)==-1){
_57c.__droppables.push(self);
}
if(_579){
_57c.__belongToDroppable=self;
}
}
return self;
};
this.addDroppable=function(self,_57e,_57f){
if(self.__canDrag!=true){
return self;
}
_57f=_57f||false;
self.__droppables=self.__droppables||[];
self.__droppables.push(_57e);
if(_57f){
self.__belongToDroppable=_57e;
}
return self;
};
if(_56a){
this._forbidAutoDraggableNodes=function(self){
if(self.__canDrag!=true){
return self;
}
var _581=sys.modules["dom"].getElements(_56c.join(","),self);
for(var i=0,l=_581.length;i<l;i++){
_581[i].draggable=false;
}
return self;
};
}else{
this._forbidAutoDraggableNodes=function(self){
return self;
};
}
this._addEventToDoc=function(self,type,_587,_588){
var _589=window.asyncHTMLManager?window.asyncHTMLManager.dom.Element.prototype.addEvent:self._doc.addEvent;
_589.call(self.__docForDD,type,_587,_588);
};
this._removeEventFromDoc=function(self,type,_58c,_58d){
var _58e=window.asyncHTMLManager?window.asyncHTMLManager.dom.Element.prototype.removeEvent:self._doc.removeEvent;
_58e.call(self.__docForDD,type,_58c,_58d);
};
this._handleMouseDownForDD=function(self,e){
if(e.preventDefault){
e.preventDefault();
}
if(e.stopPropagation){
e.stopPropagation();
}
var _591=getMousePos(e);
var _592=self.position();
self.__originMouseX=_591.x;
self.__originMouseY=_591.y;
if(ua.ua.chrome){
self.__originX=_592.x;
self.__originY=_592.y;
self.removeEvent("click",fixChromeClick,false);
}
self.__deltaX=_591.x-_592.x;
self.__deltaY=_591.y-_592.y;
self._addEventToDoc("mousemove",self.__binderForDD.checkDragging,false);
self._addEventToDoc("mouseup",self.__binderForDD.cancel,false);
self.__selectionEventName=ua.ua.ie?"selectstart":"mousedown";
self._addEventToDoc(self.__selectionEventName,returnFalse,false);
};
this._checkDragging=function(self,e){
if(e.preventDefault){
e.preventDefault();
}
var _595=getMousePos(e);
var _596=Math.round(Math.sqrt(Math.pow(_595.x-self.__originMouseX,2)+Math.pow(_595.y-self.__originMouseY,2)));
if(_596>3){
self._removeEventFromDoc("mousemove",self.__binderForDD.checkDragging,false);
self._removeEventFromDoc("mouseup",self.__binderForDD.cancel,false);
self._addEventToDoc("mousemove",self.__binderForDD.dragging,false);
self._addEventToDoc("mouseup",self.__binderForDD.finish,false);
addDraggingStyle(self);
self.fireEvent("dragstart",{dragging:self,event:e});
if(self.__belongToDroppable){
self.__belongToDroppable.fireEvent("dropinit",{dragging:self,event:e});
}
}
};
this._dragging=function(self,e){
if(e.preventDefault){
e.preventDefault();
}
var _599=getMousePos(e);
self.style.left=(_599.x-self.__deltaX)+"px";
self.style.top=(_599.y-self.__deltaY)+"px";
self.fireEvent("drag",{dragging:self,event:e});
var _59a=self.position();
var _59b={top:_59a.y,left:_59a.x,right:_59a.x+parseInt(self.getStyle("width")),bottom:_59a.y+parseInt(self.getStyle("height"))};
for(var i=0,_59d,_59e,_59f,l=self.__droppables.length;i<l;i++){
_59d=self.__droppables[i];
_59e=_59d.position();
_59f={top:_59e.y,left:_59e.x,right:_59e.x+parseInt(_59d.getStyle("width")),bottom:_59e.y+parseInt(_59d.getStyle("height"))};
if(_59d==self.__belongToDroppable){
if(isInContainer(_59f,_59b)){
_59d.fireEvent("dragover",{from:_59d,to:_59d,dragging:self});
}else{
_59d.fireEvent("dragleave",{from:_59d,to:null,dragging:self});
self.__belongToDroppable=null;
}
}else{
if(isInContainer(_59f,_59b)){
if(self.__belongToDroppable){
self.__belongToDroppable.fireEvent("dragleave",{from:self.__belongToDroppable,to:_59d,dragging:self});
}
_59d.fireEvent("dragenter",{from:self.__belongToDroppable,to:_59d,dragging:self});
self.__belongToDroppable=_59d;
}
}
}
};
this._finishDrag=function(self,e){
if(e.preventDefault){
e.preventDefault();
}
self._removeEventFromDoc("mousemove",self.__binderForDD.dragging,false);
self._removeEventFromDoc("mouseup",self.__binderForDD.finish,false);
self._removeEventFromDoc(self.__selectionEventName,returnFalse,false);
removeDraggingStyle(self);
if(self.__belongToDroppable){
self.__belongToDroppable.fireEvent("drop",{dragging:self,event:e});
}
self.fireEvent("dragend",{dragging:self,event:e});
if(ua.ua.chrome){
var pos=self.position();
if(pos.x==self.__originX&&pos.y==self.__originY){
self.addEvent("click",fixChromeClick,false);
}
}
};
this._cancelDrag=function(self,e){
self._removeEventFromDoc("mousemove",self.__binderForDD.checkDragging,false);
self._removeEventFromDoc("mouseup",self.__binderForDD.cancel,false);
self._removeEventFromDoc(self.__selectionEventName,returnFalse,false);
self.fireEvent("cancel",{dragging:self,event:e});
};
function fixChromeClick(e){
this.removeEvent("click",arguments.callee,false);
e.preventDefault();
e.stopPropagation();
}
function addDraggingStyle(_5a7){
_5a7.oldStyle={};
var _5a8=_5a7.style;
_56b.forEach(function(prop){
_5a7.oldStyle[prop]=_5a8[prop];
});
_5a7.style.display="block";
_5a7.style.width=parseInt(_5a7.getStyle("width"))+"px";
_5a7.style.height=parseInt(_5a7.getStyle("height"))+"px";
_5a7.style.position="absolute";
_5a7.style.backgroundColor="#ccc";
if(ua.ua.ie){
_5a7.style.filter="Alpha(opacity=70)";
}else{
_5a7.style.opacity="0.7";
}
_5a7.style.zIndex="10000";
}
function removeDraggingStyle(_5aa){
_56b.forEach(function(prop){
_5aa.style[prop]=_5aa.oldStyle[prop];
});
_5aa.oldStyle=null;
}
function getMousePos(ev){
return {x:(ev.pageX!=null)?ev.pageX:ev.clientX+document.body.scrollLeft-document.body.clientLeft,y:(ev.pageY!=null)?ev.pageY:ev.clientY+document.body.scrollTop-document.body.clientTop};
}
function isInContainer(_5ad,_5ae){
return _5ae.bottom>=_5ad.top&&_5ae.top<=_5ad.bottom;
}
function returnFalse(){
return false;
}
this.getStyle=function(self,_5b0){
if(ua.ua.ie){
_5b0=(_5b0=="float"||_5b0=="cssFloat")?"styleFloat":_5b0;
var _5b1=self.style[_5b0];
if(!_5b1&&self.currentStyle){
_5b1=self.currentStyle[_5b0];
}
if(_5b0=="opacity"){
if(_5b1=(self.style["filter"]||"").match(/alpha\(opacity=(.*)\)/)){
if(_5b1[1]){
return parseFloat(_5b1[1])/100;
}
}
return 1;
}
if(_5b1=="auto"){
if((_5b0=="width"||_5b0=="height")&&(self.getStyle("display")!="none")){
return self["offset"+(_5b0=="width"?"Width":"Height")]+"px";
}
return null;
}
return _5b1;
}else{
_5b0=_5b0=="float"?"cssFloat":_5b0;
var _5b1=self.style[_5b0];
if(!_5b1){
var css=document.defaultView.getComputedStyle(self,null);
_5b1=css?css[_5b0]:null;
}
if(_5b0=="opacity"){
return _5b1?parseFloat(_5b1):1;
}
return _5b1=="auto"?null:_5b1;
}
};
this.position=function(self){
if(self.parentNode===null||self.style.display=="none"){
return false;
}
var _5b4=null;
var pos=[];
var box;
if(self.getBoundingClientRect){
box=self.getBoundingClientRect();
var _5b7=Math.max(document.documentElement.scrollTop,document.body.scrollTop);
var _5b8=Math.max(document.documentElement.scrollLeft,document.body.scrollLeft);
return {x:box.left+_5b8,y:box.top+_5b7};
}else{
if(document.getBoxObjectFor){
box=document.getBoxObjectFor(self);
var _5b9=(self.style.borderLeftWidth)?parseInt(self.style.borderLeftWidth):0;
var _5ba=(self.style.borderTopWidth)?parseInt(self.style.borderTopWidth):0;
pos=[box.x-_5b9,box.y-_5ba];
}else{
pos=[self.offsetLeft,self.offsetTop];
_5b4=self.offsetParent;
if(_5b4!=self){
while(_5b4){
pos[0]+=_5b4.offsetLeft;
pos[1]+=_5b4.offsetTop;
_5b4=_5b4.offsetParent;
}
}
if(ua.ua.opera||(ua.ua.safari&&self.style.position=="absolute")){
pos[0]-=document.body.offsetLeft;
pos[1]-=document.body.offsetTop;
}
}
}
_5b4=self.parentNode||null;
while(_5b4&&_5b4.tagName!="BODY"&&_5b4.tagName!="HTML"){
pos[0]-=_5b4.scrollLeft;
pos[1]-=_5b4.scrollTop;
_5b4=_5b4.parentNode;
}
return {x:pos[0],y:pos[1]};
};
});
});
object.add("net","dom, events",function(_5bb,dom,_5bd){
var _5be=this.ajaxProxies={};
this.ajaxRequest=function(url,_5c0){
if(!url||typeof url!="string"||url.trim().length==0){
return;
}
if(!_5c0||typeof _5c0!="function"){
_5c0=function(){
};
}
var tmpA=document.createElement("a");
tmpA.href=url;
var _5c2=tmpA.hostname;
var _5c3=tmpA.protocol;
if(_5c2&&(_5c2!=location.hostname)){
var xhr=null;
if(_5be[_5c2]){
_5c0(_5be[_5c2].getTransport());
}else{
var _5c5=document.createElement("iframe");
_5c5.style.display="none";
dom.ready(function(){
document.body.insertBefore(_5c5,document.body.firstChild);
_5c5.src=_5c3+"//"+_5c2+"/ajaxproxy.htm";
if(_5c5.attachEvent){
_5c5.attachEvent("onload",function(){
try{
var _5c6=_5c5.contentWindow.getTransport();
}
catch(e){
throw new Error("message : "+e.message+" from url : "+url);
}
_5be[_5c2]=_5c5.contentWindow;
_5c0(_5c6);
});
}else{
_5c5.onload=function(){
try{
var _5c7=_5c5.contentWindow.getTransport();
}
catch(e){
throw new Error("message : "+e.message+" from url : "+url);
}
_5be[_5c2]=_5c5.contentWindow;
_5c0(_5c7);
};
}
});
}
}else{
if(window.ActiveXObject){
try{
_5c0(new ActiveXObject("Msxml2.XMLHTTP"));
}
catch(e){
_5c0(new ActiveXObject("Microsoft.XMLHTTP"));
}
}else{
_5c0(new XMLHttpRequest());
}
}
};
this.ping=function(url){
var n="_net_ping_"+(new Date()).getTime();
var c=window[n]=new Image();
c.onload=(c.onerror=function(){
window[n]=null;
});
c.src=url;
c=null;
};
this.Request=new Class(function(){
Class.mixin(this,_5bd.Events);
this.initialize=function(self,_5cc){
_5cc=_5cc||{};
self.url=_5cc.url||"";
self.method=_5cc.method||"get";
self.headers={};
self.data=_5cc.data||null;
self._xhr=null;
self.onSuccess=_5cc.onSuccess;
self.onsuccess=_5cc.onsuccess;
self.onerror=_5cc.onerror;
self.oncomplete=_5cc.oncomplete;
};
this.send=function(self,data){
_5bb.ajaxRequest(self.url,function(xhr){
self._xhr=xhr;
var _5d0={request:self};
xhr.onreadystatechange=function(){
var xhr=self._xhr;
if(xhr.readyState===4){
self.responseText=xhr.responseText;
self.responseXML=xhr.responseXML;
_5d0.responseText=xhr.responseText;
_5d0.responseXML=xhr.responseXML;
if(xhr.status===undefined||xhr.status===0||(xhr.status>=200&&xhr.status<300)){
self.fireEvent("success",_5d0);
if(self.onSuccess){
self.onSuccess(_5d0);
}
}else{
self.fireEvent("error",_5d0);
}
self.fireEvent("complete",_5d0);
}
};
var xhr=self._xhr;
var url=self.url;
if(!data){
data=self.data;
}
if(data&&self.method=="get"){
url+=(url.indexOf("?")!=-1?"&":"?")+data;
data=null;
}
xhr.open(self.method,url,true);
xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
for(var name in self.headers){
xhr.setRequestHeader(name,self.headers[name]);
}
self._xhr.send(data);
});
};
this.abort=function(self){
self._xhr.abort();
};
this.getResponseHeader=function(self,key){
return self._xhr.getResponseHeader(key);
};
this.setHeader=function(self,name,_5d9){
self.headers[name]=_5d9;
};
});
});
object.add("mvc","events",function(_5da,_5db){
this.Action=new Class(_5db.Events,function(){
this.initialize=function(self){
_5db.Events.initialize(self);
self.view=null;
};
this.execute=function(self,view){
self.view=view;
view.load(self);
};
});
});
object.add("ui","string, options, dom, events",function(_5df,_5e0,_5e1,dom,_5e3){
var _5e4=new Class(function(){
Class.keys(dom.Element).forEach(function(name){
var _5e6=dom.Element.get(name);
if(["initialize"].indexOf(name)!=-1){
return;
}
if(typeof _5e6!="function"){
return;
}
this[name]=function(self){
var args=[];
var arg;
for(var i=1;i<arguments.length;i++){
arg=arguments[i];
args.push((arg&&arg._node)?arg._node:arg);
}
return dom.Element.prototype[name].apply(self._node,args);
};
},this);
});
this.Components=new Class(Array,function(){
this.initialize=function(self,_5ec,type,_5ee){
if(!type){
type=_5df.Component;
}
for(var i=0;i<_5ec.length;i++){
self.push(new type(_5ec[i],_5ee));
}
Class.keys(type).forEach(function(name){
if(typeof type.prototype[name]!="function"){
return;
}
self[name]=function(){
var _5f1;
for(i=0;i<self.length;i++){
_5f1=self[i];
if(typeof _5f1[name]=="function"){
_5f1[name].apply(self[i],arguments);
}
}
};
});
self.set=function(key,_5f3){
for(var i=0;i<self.length;i++){
self[i].set(key,_5f3);
}
};
self.get=function(key){
var _5f6=[];
for(var i=0;i<self.length;i++){
_5f6.push(self[i].get(key));
}
return _5f6;
};
};
});
this.define=function(_5f8,type,_5fa){
var prop=property(function(self){
return self[prop.__name__];
});
prop.isComponent=true;
prop.selector=_5f8;
prop.type=type||_5df.Component;
prop.single=_5fa;
return prop;
};
this.define1=function(_5fd,type){
return _5df.define(_5fd,type,1);
};
var _5ff=function(type){
if(type==="number"){
return Number;
}else{
if(type==="string"){
return String;
}else{
if(type==="boolean"){
return Boolean;
}
}
}
};
this.option=function(_601,_602,_603){
var prop;
function fget(self){
return self.getOption(prop.__name__);
}
function fset(self,_607){
return self.setOption(prop.__name__,_607);
}
prop=property(fget,fset);
prop.isOption=true;
prop.defaultValue=_601;
prop.getter=_602||function(self,name,_60a){
var _60b=self._node.getData(name.toLowerCase());
if(_60b){
return _5ff(typeof _60a)(_60b);
}
};
prop.setter=_603;
return prop;
};
this.component=new Class(function(){
this.__new__=function(cls,name,base,dict){
if(dict.__metaclass__){
dict.__defaultOptions=[];
dict.__subs=[];
dict.__subEvents={};
dict.__onEvents=[];
dict.__handles=["init","destory","invalid","error","revert","reset"];
dict.__methods=[];
}else{
dict.__defaultOptions=[];
dict.__subs=[];
dict.__subEvents={};
dict.__onEvents=[];
dict.__handles=[];
dict.__methods=[];
Object.keys(dict).forEach(function(name){
if(name=="initialize"||name.indexOf("__")==0){
return;
}
var _611=dict[name];
if(_611!=null&&_611.__class__===property){
if(_611.isComponent){
dict.__subs.push(name);
}else{
if(_611.isOption){
dict.__defaultOptions.push(name);
}
}
}else{
if(typeof _611=="function"){
if(name.match(/^(_?[a-zA-Z]+)_([a-zA-Z]+)$/)){
(dict.__subEvents[RegExp.$1]=dict.__subEvents[RegExp.$1]||[]).push(RegExp.$2);
}else{
if(name.match(/^on([a-zA-Z]+)$/)){
dict.__onEvents.push(RegExp.$1);
}else{
if(name.slice(0,1)=="_"&&name.slice(0,2)!="__"&&name!="_set"){
dict.__handles.push(name.slice(1));
}else{
dict.__methods.push(name);
}
}
}
}
}
});
}
return type.__new__(cls,name,base,dict);
};
this.initialize=function(cls,name,base,dict){
var _616=cls.prototype;
var _617=base.prototype;
_616.__handles.forEach(function(_618){
cls.set(_618,_5e3.fireevent(function(self){
return cls.get("_"+_618).apply(cls,arguments);
}));
});
if(base&&_617.addons){
_616.addons.push.apply(_616.addons,_617.addons);
}
if(_616.addons){
_616.addons.forEach(function(comp){
if(!comp){
throw new Error("bad addon");
}
var _61b=comp.prototype;
_61b.__defaultOptions.forEach(function(name){
var _61d=_616.__defaultOptions;
if(_61d.indexOf(name)!=-1){
return;
}
_61d.push(name);
cls.set(name,comp.get(name));
});
_61b.__subs.forEach(function(name){
var subs=_616.__subs;
if(subs.indexOf(name)!=-1){
return;
}
subs.push(name);
cls.set(name,comp.get(name));
});
_61b.__handles.forEach(function(_620){
var _621=_616.__handles;
var _622="_"+_620;
if(_621.indexOf(_620)!=-1){
return;
}
_621.push(_620);
cls.set(_620,_61b[_620].im_func);
cls.set(_622,_61b[_622].im_func);
});
_61b.__methods.forEach(function(name){
var _624=_616.__methods;
if(_624.indexOf(name)!=-1){
return;
}
_624.push(name);
cls.set(name,_61b[name].im_func);
});
});
}
if(base&&base!==type){
_617.__defaultOptions.forEach(function(name){
var _626=_616.__defaultOptions;
if(_626.indexOf(name)==-1){
_626.push(name);
}
});
_617.__subs.forEach(function(name){
var subs=_616.__subs;
if(subs.indexOf(name)==-1){
subs.push(name);
}
});
_617.__handles.forEach(function(_629){
var _62a=_616.__handles;
if(_62a.indexOf(_629)==-1){
_616.__handles.push(_629);
}
});
_617.__methods.forEach(function(name){
var _62c=_616.__methods;
if(_62c.indexOf(name)==-1){
_62c.push(name);
}
});
Object.keys(_617.__subEvents).forEach(function(_62d){
var _62e=_616.__subEvents;
_617.__subEvents[_62d].forEach(function(_62f){
var _630=_62e[_62d];
if(_630&&_630.indexOf(_62f)!=-1){
return;
}
(_62e[_62d]=_62e[_62d]||[]).push(_62f);
});
});
_617.__onEvents.forEach(function(_631){
var _632=_616.__onEvents;
if(_632.indexOf(_631)==-1){
_632.push(_631);
}
});
}
};
});
this.Component=new Class(function(){
this.__metaclass__=_5df.component;
this.__mixins__=[_5e4];
this.initialize=function(self,node,_635){
if(!node.nodeType){
if(typeof node=="string"){
node={template:node};
}
var data={};
self.__defaultOptions.forEach(function(key){
if(_635[key]===undefined){
data[key]=self.get(key);
}
});
object.extend(data,_635);
var _638;
if(node.section){
_638={};
_638[node.section]=data;
}else{
_638=data;
}
var str=_5e0.substitute(node.template,_638);
node=dom.Element.fromString(str);
}
self.__nodeMap={};
self.__rendered={};
self._node=dom.wrap(node);
self.__initOptions(_635);
self.__initEvents();
self.__initSubs();
self.__initAddons();
self.init();
};
this.__initAddons=function(self){
if(!self.addons){
return;
}
self.addons.forEach(function(_63b){
_63b.get("init")(self);
});
};
this.__initEvents=function(self){
if(!self.addons){
return;
}
self.addons.forEach(function(_63d){
_63d.prototype.__onEvents.forEach(function(_63e){
var _63f;
if(self.__handles.some(function(_640){
if(_640.toLowerCase()==_63e){
_63f=_640;
return true;
}
return false;
})){
self.addEvent(_63f,function(_641){
var args=[self,_641].concat(_641._args);
_63d.get("on"+_63e).apply(_63d,args);
});
}
});
});
};
this.__initOptions=function(self,_644){
if(!_644){
_644={};
}
self._options={};
Object.keys(_644).forEach(function(name){
self._options[name]=_644[name];
});
self.__defaultOptions.forEach(function(name){
var sub=self.__properties__[name];
var _648=sub.defaultValue;
var _649=sub.getter(self,name,_648);
if(_649){
self.__setOption(name,_649);
}else{
if(_644[name]){
self.__setOption(name,_644[name]);
}else{
self.__setOption(name,_648);
}
}
var _64a=function(_64b,cls){
if(_64b){
_64b.forEach(function(_64d){
var _64e="__option_"+_64d+"_"+name;
var _64f=name+"_"+_64d;
self.addEvent(_64e,function(_650){
if(cls){
cls.get(_64f).call(cls,self,_650.value);
}else{
self[_64f](_650.value);
}
});
});
}
};
_64a(self.__subEvents[name]);
if(self.addons){
self.addons.forEach(function(_651){
_64a(_651.prototype.__subEvents[name],_651);
});
}
});
};
this.__initSubs=function(self){
self.__subs.forEach(function(name){
var sub=self.__properties__[name];
var _655=self._options[name];
if(_655&&_655.addons){
sub.type=new Class(sub.type,function(){
_655.addons.forEach(function(_656){
_5df.addon(this,_656);
},this);
});
}
self.__initSub(name,self.__querySub(name));
});
};
this.__initSub=function(self,name,_659){
if(!self._node){
return null;
}
var sub=self.__properties__[name];
var _65b;
var _65c=self._options[name];
if(sub.single){
if(_659){
_65b=new sub.type(_659,_65c);
self.__fillSub(name,_65b);
}
}else{
if(_659){
_65b=new _5df.Components(_659,sub.type,_65c);
_65b.forEach(function(comp){
self.__fillSub(name,comp);
});
}else{
_65b=new _5df.Components([],sub.type);
}
}
self["_"+name]=_659;
self._set(name,_65b);
return _65b;
};
this.__fillSub=function(self,name,comp){
var sub=self.__properties__[name];
var node=comp._node;
self.__addNodeMap(name,String(node.uid),comp);
comp=self.__nodeMap[name][String(node.uid)];
var _663=function(_664,cls){
if(_664){
_664.forEach(function(_666){
var _667=name+"_"+_666;
node.addEvent(_666,function(_668){
if(cls){
cls.get(_667).apply(cls,[self,_668,comp].concat(_668._args));
}else{
self[_667].apply(self,[_668,comp].concat(_668._args));
}
});
});
}
};
_663(self.__subEvents[name]);
if(self.addons){
self.addons.forEach(function(_669){
_663(_669.prototype.__subEvents[name],_669);
});
}
};
this.__querySub=function(self,name){
var sub=self.__properties__[name];
if(typeof sub.selector=="function"){
return sub.selector(self);
}else{
return sub.single?self._node.getElement(sub.selector):self._node.getElements(sub.selector);
}
};
this.__setOption=function(self,name,_66f){
var _670="_"+name;
self[_670]=_66f;
self._set(name,_66f);
};
this.__addRendered=function(self,name,node){
var _674=self.__rendered;
if(!_674[name]){
_674[name]=[];
}
_674[name].push(node);
};
this.__addNodeMap=function(self,name,id,comp){
var _679=self.__nodeMap;
if(!_679[name]){
_679[name]={};
}
_679[name][id]=comp;
};
this._init=function(self){
};
this._invalid=function(self,msg){
if(!msg){
msg="\u8f93\u5165\u9519\u8bef";
}
alert(msg);
};
this._error=function(self,msg){
if(!msg){
msg="\u51fa\u9519\u5566\uff01";
}
alert(msg);
};
this._destory=function(self,_680){
if(!_680){
_680="destory";
}
self.__subs.forEach(function(name){
var sub=self.__properties__[name];
var _683="_"+name;
if(self.__rendered[name]){
self.__rendered[name].forEach(function(node){
var comp=self.__nodeMap[name][node.uid];
delete self.__nodeMap[name][node.uid];
node.dispose();
if(sub.single){
self[name]=self[_683]=null;
}else{
self[name].splice(self[name].indexOf(comp),1);
self[_683].splice(self[_683].indexOf(node),1);
}
});
}
if(!sub.single){
self[name].forEach(function(comp){
comp[_680]();
});
}else{
if(self[name]){
self[name][_680]();
}
}
});
};
this._revert=function(self){
self._destory("revert");
};
this._reset=function(self){
self._destory("reset");
};
this.getOption=function(self,name){
var _68b="_"+name;
if(self[_68b]===undefined){
self[_68b]=self.__properties__[name].defaultValue;
}
return self[_68b];
};
this.setOption=_5e1.overloadsetter(function(self,name,_68e){
(function(self,name,_691){
var _692=Array.isArray(name)?name:name.split(".");
if(_692.length>1){
_5df.setOptionTo(self._options,_692,_691);
if(self[_692[0]]){
arguments.callee(self[_692[0]],_692.slice(1),_691);
}
}else{
self.__setOption(name,_691);
self.fireEvent("__option_change_"+name,{value:_691});
}
})(self,name,_68e);
});
this.render=function(self,name,data){
var sub=self.__properties__[name];
var _697="render"+_5e0.capitalize(name);
var _698=name+"Render";
var _699;
if(!!(sub.single?self[name]:self[name].length)){
return;
}
if(self[_698]){
_699=self[_698](function(){
return self.make(name,data);
});
}else{
if(self[_697]){
_699=self[_697](data);
}else{
_699=self.__querySub(name);
}
}
if(_699){
if(sub.single){
if(Array.isArray(_699)||_699.constructor===dom.Elements){
throw "\u8fd9\u662f\u4e00\u4e2a\u552f\u4e00\u5f15\u7528\u5143\u7d20\uff0c\u8bf7\u4e0d\u8981\u8fd4\u56de\u4e00\u4e2a\u6570\u7ec4";
}
self.__addRendered(name,_699);
}else{
if(!Array.isArray(_699)&&_699.constructor!==dom.Elements){
throw "\u8fd9\u662f\u4e00\u4e2a\u591a\u5f15\u7528\u5143\u7d20\uff0c\u8bf7\u8fd4\u56de\u4e00\u4e2a\u6570\u7ec4";
}
_699=new dom.Elements(_699);
_699.forEach(function(node){
self.__addRendered(name,node);
});
}
self.__initSub(name,_699);
}
};
this.make=function(self,name,data){
var sub=self.__properties__[name];
var _69f="_"+name;
var _6a0={};
var _6a1=self._options[name];
object.extend(_6a0,_6a1);
if(data){
Object.keys(data).forEach(function(key){
_6a0[key]=data[key];
});
}
var comp=new sub.type({template:_6a0.template||sub.template,section:_6a0.templateSection||sub.section},_6a0);
var node=comp._node;
if(sub.single){
self[name]=comp;
self[_69f]=node;
}else{
self[name].push(comp);
self[_69f].push(node);
}
self.__fillSub(name,comp);
self.__addRendered(name,node);
return comp;
};
this.setTemplate=function(self,name,_6a7,_6a8){
if(!self._options[name]){
self._options[name]={};
}
var _6a9=self._options[name];
_6a9.template=_6a7;
_6a9.templateSection=_6a8;
};
this.getNode=function(self){
return self._node;
};
this.define=staticmethod(_5df.define);
this.define1=staticmethod(_5df.define1);
});
this.addon=function(dict,_6ac){
if(!dict.addons){
dict.addons=[];
}
dict.addons.push(_6ac);
};
this.parseOptions=function(_6ad){
var _6ae={};
Object.keys(_6ad).forEach(function(name){
_5df.setOptionTo(_6ae,name,_6ad[name]);
});
return _6ae;
};
this.setOptionTo=function(_6b0,name,_6b2){
var _6b3=Array.isArray(name)?name:name.split(".");
for(var i=0,part;i<_6b3.length-1;i++){
part=_6b3[i];
if(_6b0[part]===undefined){
_6b0[part]={};
}
_6b0=_6b0[part];
}
_6b0[_6b3[_6b3.length-1]]=_6b2;
};
});
object.add("ui.decorators","events",function(_6b6,_6b7){
this.fireevent=_6b7.fireevent;
});
object.add("urlparse",function(){
this.urljoin=function(base,url){
if(!base||!url||typeof base!="string"||typeof url!="string"){
return "";
}
var _6ba=_6bb(base);
var _6bc=_6bb(url);
var _6bd=[];
if(_6bc[0]){
return url;
}else{
_6bd[0]=_6ba[0];
_6bd[1]=_6ba[1];
}
if(_6bc[2]){
if(_6bc[2].charAt(0)=="/"){
_6bd[2]=_6bc[2];
}else{
path=_6ba[2];
if(path){
_6bd[2]=path.substring(0,path.lastIndexOf("/")+1)+_6bc[2];
}else{
_6bd[2]="/"+_6bc[2];
}
}
}else{
return base;
}
return _6be(_6bd);
};
var _6bb=this.urlparse=function(url){
if(!url||typeof url!="string"){
return null;
}
url=url.trim();
if(url.indexOf("file")==0){
var reg=/^(file)\:\/\/()([^\?]*?)?(?:;(.*?))?(?:\?(.*?))?(?:\#(.*))?$/i;
}else{
var reg=/^(?:(\w+?)\:\/(?:\/)?([\w-_.]+(?::\w+)?))?([^\?]*?)?(?:;(.*?))?(?:\?(.*?))?(?:\#(.*))?$/i;
}
if(reg.test(url)){
return url.match(reg).slice(1);
}
};
var _6be=this.urlunparse=function(_6c1){
if(!_6c1){
return "";
}
var url="";
if(_6c1[0]){
url+=_6c1[0]+"://"+_6c1[1];
}
url+=_6c1[2];
if(_6c1[3]){
url+=";"+_6c1[3];
}
if(_6c1[4]){
url+="?"+_6c1[4];
}
if(_6c1[5]){
url+="#"+_6c1[5];
}
return url;
};
});
object.add("validator",function(_6c3){
this.isUrl=function(text){
return /^(?:(\w+?)\:\/\/([\w-_.]+(?::\d+)?))(.*?)?(?:;(.*?))?(?:\?(.*?))?(?:\#(\w*))?$/i.test(text);
};
this.isEmail=function(text){
return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/i.test(text);
};
this.isIP=function(text){
return /^(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5])$/.i.test(text);
};
});
object.add("ua.extra","sys",function(_6c7,sys){
var _6c9=sys.modules["ua"];
if(_6c9){
this.__detectUAExtra=detectUAExtra;
var o=detectUAExtra();
object.extend(_6c9.ua,o);
}
function detectUAExtra(ua){
if(!ua&&typeof ua!="string"){
ua=navigator.userAgent;
}
var m,_6cd,o={},_6ce=_6c9.numberify;
var _6cf=function(key){
try{
return window.external[key];
}
catch(e){
return null;
}
};
if(m=ua.match(/360SE/)||(_6cf("twGetRunPath")&&window.external.twGetRunPath().indexOf("360se.exe")!=-1)){
o[_6cd="se360"]=3;
}else{
if(m=ua.match(/Maxthon|MAXTHON/)||_6cf("max_version")){
_6cd="maxthon";
try{
o[_6cd]=_6ce(window.external["max_version"]);
}
catch(ex){
o[_6cd]=0;
}
}else{
if(m=ua.match(/TencentTraveler\s([\d\.]*)/)){
o[_6cd="tt"]=m[1]?_6ce(m[1]):0;
}else{
if(m=ua.match(/TheWorld/)){
o[_6cd="theworld"]=3;
}else{
if(m=ua.match(/SE\s([\d\.]*)/)){
o[_6cd="sogou"]=m[1]?_6ce(m[1]):0;
}else{
if(m=ua.match(/QQBrowser.([\d\.]*)/)){
o[_6cd="qqbrowser"]=m[1]?_6ce(m[1]):0;
}
}
}
}
}
}
_6cd&&(o.shell=_6cd);
return o;
}
});
object.add("ua.os","sys",function(_6d1,sys){
var _6d3=sys.modules["ua"];
var _6d4=function(s){
var c=0;
return parseFloat(s.replace(/_/g,".").replace(/\./g,function(){
return (c++===0)?".":"";
}));
};
if(_6d3){
this._detectOS=detectOS;
var o=detectOS(navigator.userAgent.toLowerCase());
object.extend(_6d1,o);
}
function is(obj,type){
type=type.replace(/\b[a-z]/g,function(_6da){
return _6da.toUpperCase();
});
return Object.prototype.toString.call(obj)=="[object "+type+"]";
}
function assertTrue(bool,msg){
if(!bool){
throw new Error(msg);
}
}
function assertNotNull(obj,msg){
if(obj==null){
throw new Error(msg);
}
}
function detectOS(ua){
ua=ua||navigator.userAgent;
ua=ua.toLowerCase();
var _6e0=[{core:"windowsnt",match:function(ua){
return /windows\snt/.test(ua)&&!/xblwp7/.test(ua);
},versionRule:/windows nt\s([\.\d]*)/},{core:"windowsnt",match:/windows\sxp/,version:5.1},{core:"windowsnt",match:/windows\s2000/,version:5},{core:"windowsnt",match:/winnt/,version:4},{core:"windows",match:/windows me/,version:"me"},{core:"windows",match:/windows 98|win98/,version:"98"},{core:"windows",match:/windows 95|win95/,version:"95"},{core:"windows",match:/win16/,version:"3.1"},{core:"windows/phone",match:/windows\sphone/,versionRule:/windows phone os ([\d\.]*)/},{core:"windows/phone",match:/xblwp7/,version:7},{core:"windows/mobile",match:/windows mobile|wce|windows ce|pocket pc|wince/,versionRule:/iemobile ([\.\d]*)/},{core:"windows",match:/win/,version:"unknown"},{core:"android",match:/\sandroid/,versionRule:/android ([^\s]*);/},{core:"linux/debian",match:/debian/,versionRule:/debian[\s\/-]([\.\d]*)/},{core:"linux/redhat",match:/red\shat/,versionRule:/red hat[\s\/-]([\.\d]*)/},{core:"linux/fedora",match:/fedora/,versionRule:/fedora[\s\/-]([\.\d]*)/},{core:"linux/ubuntu",match:/ubuntu/,versionRule:/ubuntu[\s\/-]([\.\d]*)/},{core:"linux/suse",match:/suse/,versionRule:/suse[\s\/-]([\.\d]*)/},{core:"linux/mint",match:/mint/,versionRule:/mint[\s\/-]([\.\d]*)/},{core:"linux/centos",match:/centos/,versionRule:/centos[\s\/-]([\.\d]*)/},{core:"linux/gentoo",match:/gentoo/,version:"unknown"},{core:"linux",match:/linux/,version:"unknown"},{core:"chromeos",match:/cros/,version:"unknown"},{core:"unix/sunos",match:/sunos/,version:"unknown"},{core:"unix/freebsd",match:/freebsd/,version:"unknown"},{core:"unix/openbsd",match:/openbsd/,version:"unknown"},{core:"unix/aix",match:/aix/,version:"unknown"},{core:"unix/hp_ux",match:/hp-ux/,version:"unknown"},{core:"unix",match:/x11/,version:"unknown"},{core:"macos",match:/mac_powerpc|ppc/,version:"ppc"},{core:"macos",match:/intel/,version:"intel"},{core:"macos",match:/mac_68000|68k/,version:"68k"},{core:"ios",match:function(ua){
return /applewebkit/.test(ua)&&/ mobile\//.test(ua)&&/like/.test(ua);
},versionRule:/os ([\_\.\d]*)/},{core:"macos",match:/mac/,version:"unknown"},{core:"os2",match:function(ua){
return /os\/2|ibm-webexplorer/.test(ua)||navigator.appVersion.indexOf("os/2")!=-1;
},version:"unknown"},{core:"symbian",match:/symbian|s60|symbos|symbianos|series40|series60|nokian/,versionRule:/symbian(?:os)?\/([\d\.]*);/},{core:"blackberry",match:/blackberry|rim\stablet\sos/,versionRule:/(?:version\/|blackberry[\d]{4}\/)([\d\.]*)/},{core:"webos",match:/webos/,versionRule:/webos\/([^\s]*);/},{core:"palmos",match:/palmos/,version:"unknown"}];
var o={};
for(var i=0,l=_6e0.length,_6e7,_6e8=false;i<l;i++){
_6e7=_6e0[i];
var _6e9=_6e7.match;
assertTrue(is(_6e9,"RegExp")||is(_6e9,"Function"),"match rule should be regexp or function");
if(is(_6e9,"RegExp")){
_6e8=_6e9.test(ua);
}else{
if(is(_6e9,"Function")){
_6e8=_6e9(ua);
assertNotNull(_6e8,"match function must return true/false");
}
}
if(!_6e8){
continue;
}
var _6ea=null,_6eb=_6e7.core.split("/"),_6ec=_6eb.length;
if(_6ec>1){
o.oscore=_6eb[0];
_6ea=o;
for(var m=0;m<_6ec-1;m++){
_6ea=_6ea[_6eb[m]]={};
}
}else{
o.oscore=_6e7.core;
}
var _6ee=_6e7.version||"unknown";
if(_6e7.versionRule){
assertTrue(is(_6e7.versionRule,"RegExp"),"version rule should be regexp");
m=ua.match(_6e7.versionRule);
if(m&&m[1]){
_6ee=_6d4(m[1]);
}
}
if(_6ea){
_6ea[_6eb[_6ec-1]]=_6ee;
}else{
o[o.oscore]=_6ee;
}
break;
}
if(o.ios){
m=ua.match(/ipad|ipod|iphone/);
if(m&&m[0]){
o[m[0]]=o.ios;
}
}
if(navigator&&navigator.cajaVersion){
o.caja=navigator.cajaVersion;
}
if(!_6e8){
o.oscore="unknown";
}
if(/wow64|x64|win64|ia64|x86_64|amd64|sparc64|ppc64/.test(ua)){
o.processor=64;
}else{
o.processor=32;
}
if(window.devicePixelRatio>=2){
o.resolution={width:screen.width*window.devicePixelRatio,height:screen.height*window.devicePixelRatio};
}else{
o.resolution={width:screen.width,height:screen.height};
}
var _6ef=typeof window.orientation!="undefined"?true:false;
if(_6ef){
if(window.innerWidth!=undefined){
o.orientation=window.innerWidth>window.innerHeight?"profile":"landscape";
}else{
o.orientation=window.screen.width>window.screen.height?"profile":"landscape";
}
}else{
o.orientation="unknown";
}
return o;
}
});
object.add("ua.flashdetect",function(_6f0){
this.getFlashVersion=function(){
var _ver=false;
if(navigator.plugins&&navigator.mimeTypes.length){
var x=navigator.plugins["Shockwave Flash"];
if(x&&x.description){
_ver=x.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split(".")[0];
}
}else{
if(navigator.userAgent&&navigator.userAgent.indexOf("Windows CE")>=0){
var axo=1;
var _6f4=3;
while(axo){
try{
_6f4++;
axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+_6f4);
_ver=_6f4;
}
catch(e){
axo=null;
}
}
}else{
try{
var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
}
catch(e){
try{
var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
_ver=6;
axo.AllowScriptAccess="always";
}
catch(e){
if(_ver==6){
return _ver;
}
}
try{
axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
}
catch(e){
}
}
if(axo!=null){
_ver=axo.GetVariable("$version").split(" ")[1].split(",")[0];
}
}
}
return _ver;
};
});
object.add("XN","dom, ua",function(_6f5,dom,ua){
this.DEBUG_MODE=false;
var _6f8="http://s.xnimg.cn/";
this.debug={log:function(){
},on:function(){
_6f5.DEBUG_MODE=true;
if(window.console&&console.log){
_6f5.debug.log=function(s){
console.log(s);
};
}
},off:function(){
_6f5.debug.log=function(){
};
}};
this.namespace=function(){
var a=arguments,o=null,i,j,d;
for(i=0;i<a.length;i++){
d=a[i].split(".");
o=_6f5;
for(j=(d[0]=="XN")?1:0;j<d.length;j++){
o[d[j]]=o[d[j]]||{};
o=o[d[j]];
}
}
return o;
};
this.log=function(s){
_6f5.debug.log(s);
};
this.isUndefined=function(_700){
return typeof _700=="undefined";
};
this.isString=function(_701){
return typeof _701=="string";
};
this.isElement=function(_702){
return _702&&_702.nodeType==1;
};
this.isFunction=function(_703){
return typeof _703=="function";
};
this.isObject=function(_704){
return typeof _704=="object";
};
this.isArray=function(_705){
return Object.prototype.toString.call(_705)==="[object Array]";
};
this.isNumber=function(_706){
return typeof _706=="number";
};
this.$extend=function(){
var _707=arguments[0];
for(var i=1;i<arguments.length;i++){
if(typeof arguments[i]=="object"){
for(var key in arguments[i]){
_707[key]=arguments[i][key];
}
}
}
return _707;
};
this.namespace("config");
this.config.jumpOut=true;
(function(){
var _70a={};
var _70b={};
_6f5.getFileVersionNum=function(file){
return _70b[file];
};
function hasLoad(file){
return !!getFile(file);
}
function getFile(file){
return _70a[encodeURIComponent(file)];
}
function mark(file){
var obj={};
obj.file=file;
obj.isLoad=true;
obj.isLoaded=true;
_70a[encodeURIComponent(file)]=obj;
}
function enableCustomEvent(_711){
_711.addEvent=function(type,func){
if(!this._customEventListeners){
this._customEventListeners={};
}
var _714=this._customEventListeners;
if(_6f5.isUndefined(_714[type])){
_714[type]=[];
}
_714[type].push(func);
return this;
},_711.delEvent=function(type,func){
var _717=this._customEventListeners[type];
if(_717){
for(var i=_717.length-1;i>=0;i--){
if(_717[i]==func){
_717[i]=null;
break;
}
}
}
return this;
},_711.fireEvent=function(type){
if(!this._customEventListeners||!this._customEventListeners[type]){
return;
}
var _71a=this._customEventListeners[type],ars=buildArray(arguments);
ars.shift();
for(var i=0,j=_71a.length;i<j;i++){
if(_71a[i]){
try{
_71a[i].apply(this,ars);
}
catch(ox){
if(_6f5.DEBUG_MODE){
throw ox;
}
}
}
}
};
}
function buildArray(o){
var rt=[];
for(var i=0,j=o.length;i<j;i++){
rt.push(o[i]);
}
return rt;
}
function addFile(file,_723){
var obj={};
obj.file=file;
obj.isLoaded=false;
enableCustomEvent(obj);
obj.addEvent("load",function(){
this.isLoaded=true;
});
if(!_723){
_70a[encodeURIComponent(file)]=obj;
}
var el=document.createElement("script");
el.type="text/javascript";
el.src=file;
el.async=true;
obj.element=el;
if(ua.ua.shell=="ieshell"){
el.onreadystatechange=function(){
if((this.readyState=="loaded"||this.readyState=="complete")&&!this.hasLoad){
this.hasLoad=true;
var _726=getFile(file);
if(_726!=null){
_726.fireEvent("load");
}else{
try{
_6f5.loadFile(file);
}
catch(e){
}
}
}
};
}else{
el.onerror=el.onload=function(){
var tmp=getFile(file);
if(tmp){
tmp.fireEvent("load");
}
};
}
Sizzle("head")[0].insertBefore(el,null);
}
function loadFile(file,_729,_72a,_72b){
var isJS=false,_72d=false;
if(_6f5.isObject(file)){
isJS=(file.type=="js");
_72d=(file.type=="css");
file=file.file;
}
file=getFullName(file);
if(/\.js(\?|$)/.test(file)||isJS){
if(_72a||!hasLoad(file)){
addFile(file,_72b);
}
if(!_729){
return;
}
if(getFile(file).isLoaded){
_729.call(getFile(file),true);
}else{
getFile(file).addEvent("load",function(){
_729(true);
});
getFile(file).addEvent("error",function(){
_729(false);
});
}
}else{
if(/\.css(\?|$)/.test(file)||_72d){
if(!_72a&&hasLoad(file)){
if(_729){
_729.call(getFile(file));
}
return;
}
mark(file);
var el=document.createElement("link");
el.rel="stylesheet";
el.type="text/css";
el.href=file;
Sizzle("head")[0].insertBefore(el,null);
if(_729){
_729.call(getFile(file));
}
}
}
}
function getFullName(file){
runOnce(loadVersion);
if(!_70b[file]){
return file;
}
return _70b[file].file;
}
var _730=new RegExp("("+_6f8+")"+"(a?\\d+)/([^?]*)");
var _731=new RegExp("(.*)\\?ver=(d+)(..*)");
function getVersion(file){
var _733;
if(_733=_730.exec(file)){
_70b[_733[1]+_733[3]]={file:file,version:_733[2]};
}else{
if(_733=_731.exec(file)){
_70b[_733[1]]={file:file,version:_733[2]};
}
}
}
_6f5.getFileVersion=function(_734){
_734.forEach(function(v,i){
getVersion(v);
});
};
_6f5.loadFile=function(file,_738,_739){
dom.ready(function(){
loadFile(file,_738,_739);
});
};
_6f5.loadFileForever=function(file,_73b,_73c){
dom.ready(function(){
loadFile(file,_73b,_73c,true);
});
};
_6f5.unloadFile=function(node){
if(node.parentNode){
node.parentNode.removeChild(node);
_70a[encodeURIComponent(node.src)]=null;
}
};
_6f5.clearFiles=function(){
for(var i in _70a){
if(_70a.hasOwnProperty(i)){
if(_70a[i]&&_70a[i].element){
_6f5.unloadFile(_70a[i].element);
}
}
}
};
_6f5.loadFiles=function(_73f,_740){
var f=_73f.length;
function isAllLoad(){
f--;
if(f===0&&_740){
_740();
}
}
_73f.forEach(function(v,i){
_6f5.loadFile(v,isAllLoad);
});
};
_6f5.getVersion=function(file){
getVersion(file);
};
function loadVersion(){
buildArray(document.getElementsByTagName("script")).forEach(function(v,i){
if(v.src){
mark(v.src);
getVersion(v.src);
}
if(v.getAttribute("vsrc")){
getVersion(v.getAttribute("vsrc"));
}
});
buildArray(document.getElementsByTagName("link")).forEach(function(v,i){
if(v.rel&&v.rel=="stylesheet"){
mark(v.href);
getVersion(v.href);
}
if(v.getAttribute("vhref")){
getVersion(v.getAttribute("vhref"));
}
});
_6f5.log("load file version:");
_6f5.log(_70b);
}
_6f5.dynamicLoad=function(file){
file.funcs.forEach(function(func,i){
window[func]=function(){
var ars=arguments;
window[func]=null;
if(file.file){
file.files=[file.file];
}
_6f5.loadFiles(file.files,function(){
window[func].apply(null,ars);
if(file.callBack){
file.callBack.call(null);
}
});
};
});
};
_6f5.namespace("img");
_6f5.img.getVersion=function(file){
runOnce(loadVersion);
if(!_70b[file]){
return "";
}
return _70b[file].version;
};
_6f5.img.getFullName=function(file){
return getFullName(file);
};
function runOnce(func){
if(window.runOnceFunc==null){
window.runOnceFunc={};
}
if(window.runOnceFunc[func]){
return null;
}
window.runOnceFunc[func]=true;
return func();
}
})();
});
object.add("XN.array","XN",function(_750,XN){
this.toQueryString=function(a,key){
var rt=[],t;
for(var k in a){
t=a[k];
if(XN.isFunction(t)){
continue;
}
if(XN.isObject(t)){
rt.push(arguments.callee(t,k));
}else{
if(/^\d+$/.test(k)){
rt.push((key||k)+"="+encodeURIComponent(t));
}else{
rt.push(k+"="+encodeURIComponent(t));
}
}
}
return rt.join("&");
};
this.each=function(a,func){
if(!a){
return;
}
if(!XN.isUndefined(a.length)||!XN.isUndefined(a[0])){
for(var i=0,j=a.length;i<j;i++){
if(func.call(a,i,a[i])===false){
break;
}
}
}else{
for(var key in a){
if(!XN.isFunction(a[key])){
if(func.call(a,key,a[key])===false){
break;
}
}
}
}
};
this.include=function(a,_75d){
var r=false;
_750.each(a,function(i,v){
if(v===_75d){
r=true;
return false;
}
});
return r;
};
this.build=function(o){
var rt=[];
for(var i=0,j=o.length;i<j;i++){
rt.push(o[i]);
}
return rt;
};
});
object.add("XN.func",function(_765){
if(window.runOnceFunc==null){
window.runOnceFunc={};
}
this.empty=function(){
};
this.runOnce=function(func){
if(window.runOnceFunc[func]){
return null;
}
window.runOnceFunc[func]=true;
return func();
};
});
object.add("XN.string","XN",function(_767,XN){
this.nl2br=function(str){
return (str||"").replace(/([^>])\n/g,"$1<br />");
};
this.trim=function(str){
return (str||"").replace(/^\s+|\s+$/g,"");
};
this.ltrim=function(str){
return (str||"").replace(/^\s+/,"");
};
this.rtrim=function(str){
return (str||"").replace(/\s+$/,"");
};
this.strip=function(str){
return _767.trim(str);
};
this.stripTags=function(str){
return str.replace(/<\/?[^>]+>/igm,"");
};
this.escapeHTML=function(str){
return str.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
this.unescapeHTML=function(str){
return str.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&nbsp;/g," ").replace(/&quot;/g,"\"").replace(/&amp;/g,"&");
};
this.include=function(str,key){
return str.indexOf(key)>-1;
};
this.startsWith=function(str,key){
return str.indexOf(key)===0;
};
this.endsWith=function(str,key){
var d=str.length-key.length;
return d>=0&&str.lastIndexOf(key)===d;
};
this.isBlank=function(str){
return /^\s*$/.test(str);
};
this.isEmail=function(str){
return /^[A-Z_a-z0-9-\.]+@([A-Z_a-z0-9-]+\.)+[a-z0-9A-Z]{2,4}$/.test(str);
};
this.isMobile=function(str){
return /^((\(\d{2,3}\))|(\d{3}\-))?((1[345]\d{9})|(18\d{9}))$/.test(str);
};
this.isUrl=function(str){
return /^(http:|ftp:)\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"])*$/.test(str);
};
this.isIp=function(str){
return /^(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5])$/.test(str);
};
this.isNumber=function(str){
return /^\d+$/.test(str);
};
this.isZip=function(str){
return /^[1-9]\d{5}$/.test(str);
};
this.isEN=function(str){
return /^[A-Za-z]+$/.test(str);
};
this.isJSON=function(str){
if(!XN.isString(str)||str===""){
return false;
}
str=str.replace(/\\./g,"@").replace(/"[^"\\\n\r]*"/g,"");
return (/^[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]*$/).test(str);
};
this.getQuery=function(key,url){
url=url||window.location.href+"";
if(url.indexOf("#")!==-1){
url=url.substring(0,url.indexOf("#"));
}
var rts=[],rt;
var _785=new RegExp("(^|\\?|&)"+key+"=([^&]*)(?=&|#|$)","g");
while((rt=_785.exec(url))!=null){
rts.push(decodeURIComponent(rt[2]));
}
if(rts.length==0){
return null;
}
if(rts.length==1){
return rts[0];
}
return rts;
};
this.setQuery=function(key,_787,url){
url=url||window.location.href+"";
var hash="";
if(!/^http/.test(url)){
return url;
}
if(url.indexOf("#")!==-1){
hash=url.substring(url.indexOf("#"));
}
url=url.replace(hash,"");
url=url.replace(new RegExp("(^|\\?|&)"+key+"=[^&]*(?=&|#|$)","g"),"");
_787=XN.isArray(_787)?_787:[_787];
for(var i=_787.length-1;i>=0;i--){
_787[i]=encodeURIComponent(_787[i]);
}
var p=key+"="+_787.join("&"+key+"=");
return url+(/\?/.test(url)?"&":"?")+p+hash;
};
this.isNum=this.isNumber;
});
object.add("XN.json",function(_78c){
this._PARSE_DATE=/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z$/;
this.dateToString=function(d){
function _zeroPad(v){
return v<10?"0"+v:v;
}
return "\""+d.getUTCFullYear()+"-"+_zeroPad(d.getUTCMonth()+1)+"-"+_zeroPad(d.getUTCDate())+"T"+_zeroPad(d.getUTCHours())+":"+_zeroPad(d.getUTCMinutes())+":"+_zeroPad(d.getUTCSeconds())+"Z\"";
};
this.stringToDate=function(str){
if(_78c._PARSE_DATE.test(str)){
var d=new Date();
d.setUTCFullYear(RegExp.$1,(RegExp.$2|0)-1,RegExp.$3);
d.setUTCHours(RegExp.$4,RegExp.$5,RegExp.$6);
return d;
}
};
this.parse=function(str){
return eval("("+str+")");
};
this.build=function(o,w,d){
return JSON.stringify(o,w,d);
};
});
object.add("XN.util","XN, XN.json, XN.array, XN.event, XN.string",function(_795,XN){
if(!window.__timeouts==null){
window.__timeouts=[];
window.__intervals=[];
}
this.setTimeout=function(a,b){
var _799=setTimeout(a,b);
window.__timeouts.push(_799);
return _799;
};
this.setInterval=function(a,b){
var _79c=setInterval(a,b);
window.__intervals.push(_79c);
return _79c;
};
this.clearTimeout=function(_79d){
for(var i=0;i<window.__timeouts.length;i++){
if(window.__timeouts[i]==_79d){
window.__timeouts.slice(i,1);
}
}
clearTimeout(_79d);
};
this.clearInterval=function(_79f){
for(var i=0;i<window.__intervals.length;i++){
if(window.__intervals[i]==_79f){
window.__intervals.slice(i,1);
}
}
clearInterval(_79f);
};
this.clearAllTimer=function(){
for(var i=0;i<window.__timeouts.length;i++){
clearTimeout(window.__timeouts[i]);
}
for(var i=0;i<window.__intervals.length;i++){
clearInterval(window.__intervals[i]);
}
window.__timeouts=[];
window.__intervals=[];
};
this.cache=function(_7a2){
XN.$extend(this,_7a2);
this._cacheData=[];
};
this.cache.prototype={cacheLength:null,_cacheData:null,isExist:function(key){
return this.get(key);
},add:function(key,_7a5){
if(!XN.isUndefined(this.isExist(key))){
return;
}
if(this.cacheLength&&this.cacheLength==this._cacheData.length){
this._cacheData.shift();
}
this._cacheData.push({"key":key,"value":_7a5});
},get:function(key){
for(var i=this._cacheData.length-1;i>=0;i--){
if(this._cacheData[i].key==key){
return this._cacheData[i].value;
}
}
},clear:function(){
this._cacheData=[];
}};
(function(){
var _7a8={};
_795.hotKey={add:function(key,func,obj){
key=String(key).toLowerCase();
var ctrl=false;
var alt=false;
var _7ae=false;
var _7af=null;
if(/^\d+$/.test(key)){
_7af=parseInt(key);
}else{
ctrl=/ctrl|ctr|c/.test(key);
alt=/alt|a/.test(key);
_7ae=/shift|s/.test(key);
if(/\d+/.test(key)){
_7af=parseInt(/\d+/.exec(key)[0]);
}else{
_7af=false;
}
}
_7a8[key]=_7a8[key]||{};
_7a8[key][func]=function(e){
e=e||window.event;
code=e.keyCode;
if(ctrl&&!e.ctrlKey){
return;
}
if(alt&&!e.altKey){
return;
}
if(_7ae&&!e.shiftKey){
return;
}
if(_7af&&code!==_7af){
return;
}
func.call(obj||null);
XN.event.stop(e);
};
XN.event.addEvent(document,"keydown",_7a8[key][func]);
},del:function(key,func){
key=String(key).toLowerCase();
XN.event.delEvent(document,"keydown",_7a8[key][func]);
delete _7a8[key][func];
}};
})();
(function(){
var id=0;
_795.createObjID=function(){
id++;
return id;
};
})();
});
object.add("XN.datasource","XN, XN.json, XN.net, XN.string, XN.array",function(_7b4,XN){
this.DS_JSON=function(p){
XN.$extend(this,p);
};
this.DS_JSON.prototype={DS_TYPE:"JSON",url:null,queryParam:"query",attachParam:"",rootKey:null,method:"get",_request:null,query:function(v,_7b8){
var This=this;
try{
this._request.abort();
}
catch(e){
}
function parseDS_JSON(r){
r=r.responseText;
var pp;
try{
var rt=XN.json.parse(r);
if(This.rootKey&&rt[This.rootKey]){
pp=rt[This.rootKey];
}else{
pp=rt;
}
}
catch(e){
pp=[];
}
_7b8(pp);
}
this._request=new XN.net.xmlhttp({url:this.url,data:this.queryParam+"="+encodeURIComponent(v)+"&"+this.attachParam,method:this.method,onSuccess:parseDS_JSON});
}};
this.DS_friends=function(p){
var ds=new _7b4.DS_JSON(p);
ds.queryParam="p";
ds.rootKey="candidate";
ds.net="";
ds.group="";
ds.page=XN.isUndefined(p.page)?false:p.page;
ds.param=XN.json.build(p.param||{});
var _7bf=XN.isUndefined(p.limit)?24:p.limit;
ds.query=function(name,_7c1){
XN.log("start query");
name=name.replace(/[^a-zA-Z\u0391-\uFFE5]/g,"");
if(XN.string.isBlank(name)&&this.group==""&&this.net==""){
_7c1([]);
return;
}
var p=["{\"init\":false,","\"qkey\":\""+this.qkey+"\",","\"uid\":true,","\"uname\":true,","\"uhead\":true,","\"limit\":"+_7bf+",","\"param\":"+this.param+",","\"query\":\""+name+"\",","\"group\":\""+this.group+"\",","\"net\":\""+this.net+"\",","\"page\":\""+this.page+"\"","}"].join("");
_7b4.DS_JSON.prototype.query.call(this,p,_7c1);
};
return ds;
};
this.DS_Array=function(p){
XN.$extend(this,p);
this.init();
};
this.DS_Array.prototype={DS_TYPE:"array",data:null,searchKey:null,init:function(){
var key=this.searchKey,_7c5=this._index=[];
XN.array.each(this.data,function(i,v){
_7c5.push(v[key]);
});
},query:function(v,_7c9){
_7c9(this._search(v));
},_search:function(v){
var keys=this._index,data=this.data,rt=[],reg=new RegExp("^"+v,"i");
XN.array.each(keys,function(i,v){
if(reg.test(v)){
rt.push(data[i]);
}
});
return rt;
}};
this.DS_XHR=function(p){
XN.$extend(this,p);
};
this.DS_XHR.prototype={url:null,queryParam:"query",_request:null,query:function(v,_7d3){
var This=this;
try{
this._request.abort();
}
catch(e){
}
function parseDS_XML(r){
r=r.responseXML;
var rt=[];
function getResult(r){
var tmp={};
XN.array.each(r.childNodes,function(i,v){
tmp[v.tagName.toLowerCase()]=v.firstChild.nodeValue;
});
return tmp;
}
try{
var rs=r.getElementsByTagName("Result");
XN.array.each(rs,function(i,v){
rt.push(getResult(v));
});
}
catch(e){
rt=[];
}
_7d3(rt);
}
this._request=new XN.net.xmlhttp({url:this.url,data:this.queryParam+"="+encodeURIComponent(v),onSuccess:parseDS_XML});
}};
});
object.add("XN.browser","sys, XN",function(_7de,sys,XN){
this.IE=!!(window.attachEvent&&!window.opera);
this.IE6=navigator.userAgent.indexOf("MSIE 6.0")>-1;
this.IE7=navigator.userAgent.indexOf("MSIE 7.0")>-1;
this.IE8=navigator.userAgent.indexOf("MSIE 8.0")>-1;
this.Opera=!!window.opera,this.WebKit=navigator.userAgent.indexOf("AppleWebKit/")>-1;
this.Gecko=navigator.userAgent.indexOf("Gecko")>-1&&navigator.userAgent.indexOf("KHTML")==-1;
this.copy=function(o){
function onfail(){
if(XN.isElement(o)){
o.select();
}
}
var str;
if(XN.isElement(o)){
str=o.value;
}else{
str=o;
}
var _do=sys.modules["XN.Do"];
if(window.clipboardData&&clipboardData.setData){
if(clipboardData.setData("text",str)){
return true;
}
}else{
if(_do){
_do.alert({message:"\u60a8\u7684\u6d4f\u89c8\u5668\u4e0d\u652f\u6301\u811a\u672c\u590d\u5236,\u8bf7\u5c1d\u8bd5\u624b\u52a8\u590d\u5236",callBack:function(){
onfail();
}});
}else{
alert("\u60a8\u7684\u6d4f\u89c8\u5668\u4e0d\u652f\u6301\u811a\u672c\u590d\u5236,\u8bf7\u5c1d\u8bd5\u624b\u52a8\u590d\u5236");
}
return false;
}
if(_do){
_do.alert({message:"\u60a8\u7684\u6d4f\u89c8\u5668\u8bbe\u7f6e\u4e0d\u5141\u8bb8\u811a\u672c\u8bbf\u95ee\u526a\u5207\u677f",callBack:function(){
onfail();
}});
}else{
alert("\u60a8\u7684\u6d4f\u89c8\u5668\u8bbe\u7f6e\u4e0d\u5141\u8bb8\u811a\u672c\u8bbf\u95ee\u526a\u5207\u677f");
}
return false;
};
});
object.add("XN.cookie","XN",function(_7e4,XN){
this.get=function(name){
var _7e7=name+"=";
var ca=document.cookie.split(";");
for(var i=0;i<ca.length;i++){
var c=ca[i];
while(c.charAt(0)==" "){
c=c.substring(1,c.length);
}
if(c.indexOf(_7e7)==0){
return decodeURIComponent(c.substring(_7e7.length,c.length));
}
}
return null;
};
this.set=function(name,_7ec,days,path,_7ef,_7f0){
var _7f1;
if(XN.isNumber(days)){
var date=new Date();
date.setTime(date.getTime()+(days*24*60*60*1000));
_7f1=date.toGMTString();
}else{
if(XN.isString(days)){
_7f1=days;
}else{
_7f1=false;
}
}
document.cookie=name+"="+encodeURIComponent(_7ec)+(_7f1?";expires="+_7f1:"")+(path?";path="+path:"")+(_7ef?";domain="+_7ef:"")+(_7f0?";secure":"");
};
this.del=function(name,path,_7f5,_7f6){
_7e4.set(name,"",-1,path,_7f5,_7f6);
};
});
object.add("XN.net","XN, XN.form, XN.util, XN.event, XN.func, XN.browser, XN.element",function(_7f7,XN){
if(!window.__ajaxProxies){
window.__ajaxProxies={};
}
this.sendForm=function(_7f9){
XN.log("send form");
_7f9.data=XN.form.serialize(_7f9.form);
return new _7f7.xmlhttp(_7f9);
};
this.sendStats=function(url){
var n="log_"+(new Date()).getTime();
var c=window[n]=new Image();
c.onload=(c.onerror=function(){
window[n]=null;
});
c.src=url;
c=null;
};
this.xmlhttp=function(_7fd){
var This=this;
if(!_7f7.cache){
_7f7.cache=new XN.util.cache();
}
if(arguments.length>1){
this.url=arguments[0]||null;
this.data=arguments[1]||"";
this.onSuccess=arguments[2];
extendObject(this,arguments[3]);
init(window);
return this;
}
extendObject(this,_7fd);
var _7ff;
if(this.useCache&&(_7ff=_7f7.cache.get(this.url+encodeURIComponent(this.data)))){
this.transport={};
this.transport.responseText=_7ff;
setTimeout(function(){
This._onComplete();
This._onSuccess();
},0);
return this;
}
function init(w){
This.transport=This.getTransport(w);
return This.url&&This.send(This.method);
}
var tmp=XN.element.$element("a");
tmp.href=this.url;
var _802=tmp.hostname;
var _803=tmp.protocol;
if(/^http/.test(this.url)&&location.hostname!=_802){
if(window.__ajaxProxies[_802]){
(function(){
if(window.__ajaxProxies[_802].loaded){
init(window.__ajaxProxies[_802].contentWindow);
}else{
setTimeout(arguments.callee,100);
}
})();
}else{
var _804=XN.element.$element("iframe").hide();
document.body.insertBefore(_804,document.body.firstChild);
var _805=_803+"//"+_802+"/ajaxproxy.htm";
if(_802.indexOf("notice.")!=-1){
_805=_805+"?v=1";
}
_804.src=_805;
window.__ajaxProxies[_802]=_804;
window.__ajaxProxies[_802].loaded=false;
XN.event.addEvent(_804,"load",function(){
if(_804.contentWindow.location.href!==_804.src){
_804.contentWindow.location.href=_804.src;
}else{
try{
init(_804.contentWindow);
window.__ajaxProxies[_802]=_804;
window.__ajaxProxies[_802].loaded=true;
}
catch(e){
}
}
});
}
}else{
init(window);
}
return This;
};
this.xmlhttp.prototype={url:null,data:"",onStart:new Function(),onSuccess:null,onFailure:null,onError:null,fillTo:null,method:"post",asynchronous:true,transport:null,headers:null,iAmXmlhttp:true,useCache:false,requestToken:true,binary:false,formData:false,abort:function(){
this.transport.abort();
},send:function(_806){
var _url;
if(_806=="get"&&this.data!==""){
_url=this.url+(/\?/.test(this.url)?"&":"?")+this.data;
}else{
_url=this.url;
}
this.transport.onreadystatechange=this.onStateChange.bind(this);
this.transport.open(_806,_url,this.asynchronous);
if(!this.formData){
this.transport.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
}
if(this.headers!==null){
for(var i in this.headers){
this.transport.setRequestHeader(i,this.headers[i]);
}
}
var _809=null;
if(_806=="post"){
_809=this.data;
if(this.requestToken&&XN.get_check){
_809+=(_809?"&":"")+"requestToken="+XN.get_check;
}
if(this.requestToken&&XN.get_check_x){
_809+=(_809?"&":"")+"_rtk="+XN.get_check_x;
}
}
try{
if(window.event&&document.body.id=="profile"&&_806=="get"&&/(none|null)\b/.test(this.url)&&XN.user.id%10==0){
var temp=document.createElement("div");
var obj=event.srcElement;
temp.appendChild(obj);
if(obj){
var _809={from:"profile",nodeHTML:temp.innerHTML};
nullOrNoneLog(_809);
}
}
}
catch(e){
}
function nullOrNoneLog(data){
var _80d="";
for(var i in data){
_80d=_80d+"&"+i+"="+encodeURIComponent(data[i]);
}
var _80f=new Image().src="http://123.125.44.44/r/?t="+new Date().getTime()+_80d;
}
if(this.binary){
this.transport.sendAsBinary(_809);
}else{
this.transport.send(_809);
}
},_onSuccess:function(obj){
var _811=this.transport;
if(this.fillTo!==null){
try{
this.fillTo.stopLoading();
}
catch(e){
}
this.fillTo.innerHTML=_811.responseText;
}
try{
if(this.onSuccess){
this.onSuccess.call(null,_811);
}
}
catch(e){
if(XN.DEBUG_MODE){
throw e;
}
}
},_onComplete:function(obj){
var _813=this.transport;
try{
if(this.onComplete){
this.onComplete.call(null,_813);
}
}
catch(e){
if(XN.DEBUG_MODE){
throw e;
}
}
},onStateChange:function(){
var _814=this.transport;
if(_814.readyState==1&&!this.hasRunStart){
this.onStart();
this.hasRunStart=true;
}else{
if(_814.readyState==4){
if(_814.status==undefined||_814.status==0||(_814.status>=200&&_814.status<300)){
if(this.useCache){
_7f7.cache.add(this.url+encodeURIComponent(this.data),this.transport.responseText);
}
this._onSuccess();
}else{
(this.onError||this.onFailure||XN.func.empty).call(null,_814);
}
this._onComplete();
}
}
}};
this.xmlhttp.prototype.getTransport=function(w){
if(w!=window){
return w.getTransport();
}else{
if(XN.browser.IE){
try{
return new ActiveXObject("Msxml2.XMLHTTP");
}
catch(e){
return new ActiveXObject("Microsoft.XMLHTTP");
}
}else{
return new XMLHttpRequest();
}
}
};
this.ajax=this.xmlhttp;
XN.$extend(this.xmlhttp.prototype,{get:function(url,data,_818,_819){
this.url=url;
this.data=data;
this.onSuccess=_818;
XN.$extend(this,_819);
this.send("get");
},post:function(url,data,_81c,_81d){
this.url=url;
this.data=data;
this.onSuccess=_81c;
XN.$extend(this,_81d);
this.send("post");
}});
if(typeof Ajax=="undefined"){
Ajax={};
Ajax.Request=function(url,o){
var p=o.parameters;
o["url"]=url;
o["data"]=p;
delete o.parameters;
return new _7f7.xmlhttp(o);
};
}
});
object.add("XN.env",function(_821){
this.shortSiteName="\u4eba\u4eba";
this.siteName="\u4eba\u4eba\u7f51";
this.domain="renren.com";
this.domain_reg=this.domain.replace(/\./g,"\\.");
this.staticRoot="http://s.xnimg.cn/";
this.CDNstaticRoot="http://a.xnimg.cn/";
this.swfRoot="http://static.xiaonei.com/";
this.wwwRoot="http://"+this.domain+"/";
});
object.add("XN.event","XN, XN.browser, XN.array, XN.element",function(_822,XN){
var _824=XN.browser;
var _825=[];
this.ignoreEvent=false;
this.logEvents=false;
this.isCapsLockOn=function(e){
var c=e.keyCode||e.which;
var s=e.shiftKey;
if(((c>=65&&c<=90)&&!s)||((c>=97&&c<=122)&&s)){
return true;
}
return false;
};
this.element=function(e){
var n=e.target||e.srcElement;
return _822.resolveTextNode(n);
};
this.relatedTarget=function(e){
var t=e.relatedTarget;
if(!t){
if(e.type=="mouseout"||e.type=="mouseleave"){
t=e.toElement;
}else{
if(e.type=="mouseover"){
t=e.fromElement;
}
}
}
return _822.resolveTextNode(t);
};
this.resolveTextNode=function(n){
try{
if(n&&3==n.nodeType){
return n.parentNode;
}
}
catch(e){
}
return n;
};
this.pointerX=function(_82e){
return _82e.pageX||(_82e.clientX+(document.documentElement.scrollLeft||document.body.scrollLeft));
};
this.pointerY=function(_82f){
return _82f.pageY||(_82f.clientY+(document.documentElement.scrollTop||document.body.scrollTop));
};
this.isStrictMode=document.compatMode!="BackCompat";
this.pageHeight=function(){
return this.isStrictMode?Math.max(document.documentElement.scrollHeight,document.documentElement.clientHeight):Math.max(document.body.scrollHeight,document.body.clientHeight);
};
this.pageWidth=function(){
return this.isStrictMode?Math.max(document.documentElement.scrollWidth,document.documentElement.clientWidth):Math.max(document.body.scrollWidth,document.body.clientWidth);
};
this.winWidth=function(){
return this.isStrictMode?document.documentElement.clientWidth:document.body.clientWidth;
};
this.winHeight=function(){
return this.isStrictMode?document.documentElement.clientHeight:document.body.clientHeight;
};
this.scrollTop=function(){
if(XN.browser.WebKit){
return window.pageYOffset;
}
return this.isStrictMode?document.documentElement.scrollTop:document.body.scrollTop;
};
this.scrollLeft=function(){
if(XN.browser.WebKit){
return window.pageXOffset;
}
return this.isStrictMode?document.documentElement.scrollLeft:document.body.scrollLeft;
};
this.stop=null;
this.clearEvents=function(){
for(var _830,i=0;_830=_825[i];i++){
_822.delEvent.apply(_822,_830);
}
_825=[];
};
this.addEvent=function(el,name,func,cap){
if(_822.ignoreEvent){
return;
}
var els=[];
el=XN.element.$(el);
if(XN.isArray(el)){
els=el;
}else{
els.push(el);
}
if(els.length==0){
return el;
}
XN.array.each(els,function(i,v){
if(_822.logEvents){
_825.push([v,name,func,cap]);
}
_822._addEvent(v,name,func,cap);
});
return el;
};
this.delEvent=function(el,name,func,cap){
var els=[];
el=XN.element.$(el);
if(XN.isArray(el)){
els=el;
}else{
els.push(el);
}
if(els.length==0){
return el;
}
XN.array.each(els,function(i,v){
_822._delEvent(v,name,func,cap);
});
return el;
};
this._addEvent=null;
this._delEvent=null;
this.enableCustomEvent=function(obj){
XN.$extend(obj,{addEvent:function(type,func){
if(!this._customEventListeners){
this._customEventListeners={};
}
var _843=this._customEventListeners;
if(XN.isUndefined(_843[type])){
_843[type]=[];
}
_843[type].push(func);
return this;
},delEvent:function(type,func){
var _846=this._customEventListeners[type];
if(_846){
for(var i=_846.length-1;i>=0;i--){
if(_846[i]==func){
_846[i]=null;
break;
}
}
}
return this;
},fireEvent:function(type){
if(!this._customEventListeners||!this._customEventListeners[type]){
return;
}
var _849=this._customEventListeners[type],ars=XN.array.build(arguments);
ars.shift();
for(var i=0,j=_849.length;i<j;i++){
if(_849[i]){
try{
_849[i].apply(this,ars);
}
catch(ox){
if(XN.DEBUG_MODE){
throw ox;
}
}
}
}
}});
return obj;
};
if(_824.IE){
this.stop=function(_84d){
_84d.returnValue=false;
_84d.cancelBubble=true;
};
}else{
this.stop=function(_84e){
_84e.preventDefault();
_84e.stopPropagation();
};
}
var _84f=function(_850,_851){
var p=_850.relatedTarget;
while(p&&p!=_851){
try{
p=p.parentNode;
}
catch(error){
p=_851;
}
}
return p!==_851;
};
if(window.attachEvent&&!_824.Opera){
function wrapEvent(_853){
_853.stopPropagation=function(){
this.cancelBubble=true;
};
_853.preventDefault=function(){
this.returnValue=false;
};
return _853;
}
this._addEvent=function(_854,name,func){
_854=XN.element.$(_854);
if(name=="input"){
name="propertychange";
}
if(name=="keypress"){
name="keydown";
}
if(!_854._eventListeners[name]){
_854._eventListeners[name]=[];
}
var _857=function(){
var e=wrapEvent(window.event);
func.call(_854,e);
};
_857.innerFunc=func;
_854._eventListeners[name].push(_857);
_854.attachEvent("on"+name,_857);
return _854;
};
this._delEvent=function(_859,name,func){
_859=XN.element.$(_859);
if(name=="input"){
name="propertychange";
}
if(name=="keypress"){
name="keydown";
}
if(!_859._eventListeners[name]){
return;
}
for(var i=0,_85d;i<_859._eventListeners[name].length;i++){
_85d=_859._eventListeners[name][i];
if(_85d.innerFunc===func){
break;
}
}
_859.detachEvent("on"+name,_85d);
return _859;
};
}else{
if(window.addEventListener){
this._addEvent=function(_85e,name,func,_861){
_85e=XN.element.$(_85e);
if(name=="mouseleave"){
_85e.onmouseleave=function(e){
e=e||window.event;
if(_84f(e,_85e)&&func){
func.call(_85e,e);
}
};
_85e.addEventListener("mouseout",_85e.onmouseleave,_861);
return _85e;
}
if(name=="keypress"&&_824.WebKit){
name="keydown";
}
_85e.addEventListener(name,func,_861);
return _85e;
};
this._delEvent=function(_863,name,func,_866){
_863=XN.element.$(_863);
if(name=="mouseleave"){
_863.removeEventListener("mouseout",_863.onmouseleave,_866);
return _863;
}
if(name=="keypress"&&_824.WebKit){
name="keydown";
}
_863.removeEventListener(name,func,_866);
return _863;
};
}
}
});
object.add("XN.dom","dom, ua, XN, XN.event, XN.array, XN.browser, XN.element",function(_867,dom,ua,XN){
var _86b=XN.event;
var _86c=XN.array;
var _86d=XN.browser;
var _86e=null;
function createShadow(_86f,_870){
_86f=_86f||0.3;
_870=_870||2000;
var el=XN.element.$element("div");
_86e=el;
el.style.position="absolute";
el.style.top=0;
el.style.left=0;
el.style.background="#000";
el.style.zIndex=_870;
el.style.opacity=_86f;
el.style.filter="alpha(opacity="+(_86f*100)+")";
el.innerHTML=["<iframe width=\"100%\" height=\"100%\" frameBorder=\"0\" style=\"position:absolute;top:0;left:0;z-index:1;\"></iframe>","<div style=\"position:absolute;top:0;left:0;width:100%;height:100%;background-color:#000000;z-index:2;height:expression(this.parentNode.offsetHeight);\"></div>"].join("");
function resize(){
el.hide();
el.style.height=XN.event.pageHeight()+"px";
el.style.width=XN.event.pageWidth()+"px";
el.show();
}
resize();
XN.event.addEvent(window,"resize",function(e){
if(_86e&&_86e.style.display!="none"){
try{
resize();
}
catch(e){
}
}
});
document.body.insertBefore(el,document.body.firstChild);
}
this.disable=function(_873,_874){
if(!_86e){
createShadow(_873,_874);
}
};
this.enable=function(){
if(_86e){
_86e.remove();
_86e=null;
}
};
this.insertAfter=function(_875,_876){
_875=XN.element.$(_875);
_876=XN.element.$(_876);
var _877=_876.parentNode;
if(_877.lastChild==_876){
_877.appendChild(_875);
}else{
_877.insertBefore(_875,_876.nextSibling);
}
};
this.getElementsByClassName=function(_878,_879,_87a){
var c=(XN.element.$(_879)||document).getElementsByTagName(_87a||"*")||document.all;
var _87c=[];
var _exp=new RegExp("(^|\\s)"+_878+"(\\s|$)");
_86c.each(c,function(i,v){
if(_exp.test(v.className)){
_87c.push(v);
}
});
return _87c;
};
this.findFirstClass=function(_880,_881){
_880=XN.element.$(_880);
var els=_867.getElementsByClassName(_881,_880);
return XN.element.$(els[0])||null;
};
this.ready=function(_883,_884){
if(XN.isUndefined(_884)){
_884=false;
}
var func=_884?function(){
setTimeout(_883,0);
}:_883;
dom.ready(func);
};
this.preloadImg=function(src){
src=XN.isArray(src)?src:[src];
_86c.each(src,function(i,v){
new Image().src=v;
});
};
this.readyDo=this.ready;
});
object.add("XN.element","sys, XN, XN.browser, XN.env",function(_889,sys,XN){
var _88c=XN.browser;
var _88d=["clear","hover","scrollTo","visible","toggleClass","toggleText","hasClassName","addClass","delClass","show","hide","remove","setStyle","getStyle","addEvent","delEvent","_eventListeners","matchesSelector","getData","delegate","addChild","delChild","setContent","setHTML","getPosition","realLeft","realTop","appendHTML","html","parent","startLoading","stopLoading","eval_inner_JS","extend","setOpacity","findFirstClass"];
var _88e=sys.modules["XN.effect"];
function getDom(str){
var tmp=document.createElement("div");
tmp.style.display="none";
document.body.appendChild(tmp);
tmp.innerHTML=str;
var dom=document.createElement("div");
while(tmp.firstChild){
dom.appendChild(tmp.firstChild);
}
tmp.parentNode.removeChild(tmp);
return dom;
}
var t=document.createElement("div");
t.innerHTML="<TEST_TAG></TEST_TAG>";
var _893=t.firstChild===null;
this.clear=function(_894){
_894=_889.$(_894);
_894.innerHTML="";
return _894;
};
this.hover=function(_895,_896,_897){
_895=_889.$(_895);
_897=_897?_889.$(_897):_895;
var _898=sys.modules["XN.event"];
if(_898){
_898.addEvent(_895,"mouseover",function(){
_897.addClass(_896);
},false);
_898.addEvent(_895,"mouseleave",function(){
_897.delClass(_896);
},false);
}else{
throw new Error("\u8bf7\u5148\u5bfc\u5165XN.event\u6a21\u5757\uff0c\u518d\u4f7f\u7528XN.event.addEvent");
}
return _895;
};
this.scrollTo=function(_899,_89a){
_899=_889.$(_899);
if(!_88e){
_89a="normal";
}
switch(_89a){
case "slow":
XN.effect.scrollTo(_899);
break;
default:
window.scrollTo(0,_899.realTop());
break;
}
return _899;
};
this.visible=function(_89b){
_89b=_889.$(_89b);
return _89b.style.display!="none"&&_89b.style.visibility!="hidden";
};
this.toggleClass=function(_89c,_89d,_89e){
if(XN.isUndefined(_89e)){
if(_889.hasClassName(_89c,_89d)){
_889.delClass(_89c,_89d);
}else{
_889.addClass(_89c,_89d);
}
}else{
if(_889.hasClassName(_89c,_89d)){
_889.delClass(_89c,_89d);
_889.addClass(_89c,_89e);
}else{
_889.addClass(_89c,_89d);
_889.delClass(_89c,_89e);
}
}
return _889.$(_89c);
};
this.toggleText=function(_89f,_8a0,_8a1){
if(_89f.innerHTML==_8a0){
_89f.innerHTML=_8a1;
}else{
_89f.innerHTML=_8a0;
}
};
this.hasClassName=function(_8a2,_8a3){
return new RegExp("(^|\\s+)"+_8a3+"(\\s+|$)").test(_889.$(_8a2).className);
};
this.addClass=function(_8a4,_8a5){
_8a4=_889.$(_8a4);
if(_889.hasClassName(_8a4,_8a5)){
return _8a4;
}
_8a4.className+=" "+_8a5;
return _8a4;
};
this.delClass=function(_8a6,_8a7){
_8a6=_889.$(_8a6);
_8a6.className=_8a6.className.replace(new RegExp("(^|\\s+)"+_8a7+"(\\s+|$)","g")," ");
return _8a6;
};
this.show=function(_8a8,_8a9){
_8a8=_889.$(_8a8);
if(_8a8.style.display!="none"){
return;
}
if(!_88e||!_8a9){
_8a9="normal";
}
switch(_8a9){
case "normal":
_8a8.style.display="";
break;
case "fade":
XN.effect.fadeIn(_8a8,function(e){
e.style.display="";
});
break;
case "slide":
XN.effect.slideOpen(_8a8);
break;
case "delay":
setTimeout(function(){
_8a8.style.display="";
},2000);
break;
}
return _8a8;
};
this.hide=function(_8ab,_8ac){
_8ab=_889.$(_8ab);
if(_8ab.style.display=="none"){
return;
}
if(!_88e||!_8ac){
_8ac="normal";
}
switch(_8ac){
case "normal":
_8ab.style.display="none";
break;
case "fade":
XN.effect.fadeOut(_8ab,function(e){
e.style.display="none";
});
break;
case "slide":
XN.effect.slideClose(_8ab);
break;
case "delay":
setTimeout(function(){
_8ab.style.display="none";
},2000);
break;
}
return _8ab;
};
this.remove=function(_8ae){
var _8ae=_889.$(_8ae);
_8ae.parentNode.removeChild(_8ae);
return _8ae;
};
this.setStyle=function(_8af,_8b0){
var _8af=_889.$(_8af);
_8af.style.cssText+=";"+_8b0;
return _8af;
};
this.getStyle=function(_8b1,_8b2){
_8b1=_889.$(_8b1);
_8b2=_8b2=="float"?"cssFloat":_8b2;
var _8b3=_8b1.style[_8b2];
if(!_8b3){
var css=document.defaultView.getComputedStyle(_8b1,null);
_8b3=css?css[_8b2]:null;
}
if(_8b2=="opacity"){
return _8b3?parseFloat(_8b3):1;
}
return _8b3=="auto"?null:_8b3;
};
this.addEvent=function(){
var _8b5=sys.modules["XN.event"];
if(_8b5){
_8b5.addEvent.apply(null,arguments);
}else{
throw new Error("\u8bf7\u5148\u5bfc\u5165XN.event\u6a21\u5757\uff0c\u518d\u4f7f\u7528XN.event.addEvent");
}
return arguments[0];
};
this.delEvent=function(){
var _8b6=sys.modules["XN.event"];
if(_8b6){
_8b6.delEvent.apply(null,arguments);
}else{
throw new Error("\u8bf7\u5148\u5bfc\u5165XN.event\u6a21\u5757\uff0c\u518d\u4f7f\u7528XN.event.delEvent");
}
return arguments[0];
};
this._eventListeners={};
this.matchesSelector=function(_8b7,_8b8){
return Sizzle.matches(_8b8,[_8b7]).length>0;
};
this.getData=function(_8b9,name){
return _8b9.getAttribute("data-"+name);
};
this.delegate=function(_8bb,_8bc,type,_8be){
_889.$(_8bb).addEvent(type,function(e){
var ele=_889.$(e.target||e.srcElement);
do{
if(ele&&ele.matchesSelector(_8bc)){
_8be.call(ele,e);
}
}while(ele=_889.$(ele.parentNode));
});
};
this.addChild=function(_8c1,_8c2){
_8c1=_889.$(_8c1);
if(XN.isString(_8c2)||XN.isNumber(_8c2)){
var _8c3=String(_8c2).charAt(0)=="#"?Sizzle(_8c2)[0]:_8c2;
if(XN.isString(_8c2)||XN.isNumber(_8c2)){
_8c1.innerHTML+=_8c3;
}else{
_8c1.appendChild(_8c3);
}
}else{
if(XN.isElement(_8c2)){
_8c1.appendChild(_8c2);
}else{
if(_8c2.iAmUIelement){
_8c1.appendChild(_889.$(_8c2.frame));
}else{
if(_8c2.iAmXmlhttp){
_8c2.fillTo=_8c1;
_8c1.startLoading();
}
}
}
}
return _8c1;
};
this.delChild=function(_8c4,_8c5){
_8c5=_889.$(_8c5);
_8c5.remove();
return _889.$(_8c4);
};
this.setContent=function(_8c6,c){
_8c6=_889.$(_8c6);
_8c6.innerHTML="";
_8c6.addChild(c);
return _8c6;
};
this.setHTML=function(_8c8,str){
if(_893){
_8c8.innerHTML="";
var _8ca=getDom(str);
while(_8ca.firstChild){
_8c8.appendChild(_8ca.firstChild);
}
}else{
_8c8.innerHTML=str;
}
};
this.getPosition=function(_8cb,_8cc){
_8cc=_889.$(_8cc)||document.body;
_8cb=_889.$(_8cb);
var rl=0;
var rt=0;
var p=_8cb;
try{
while(p&&p!=_8cc){
rl+=p.offsetLeft;
rt+=p.offsetTop;
p=p.offsetParent;
}
}
catch(e){
}
return {"left":rl,"top":rt};
};
this.realLeft=function(_8d0,p){
return _889.getPosition(_8d0,p||null).left;
};
this.realTop=function(_8d2,p){
return _889.getPosition(_8d2,p||null).top;
};
this.appendHTML=function(_8d4,str,_8d6){
_8d4=_889.$(_8d4);
var f=document.createDocumentFragment();
var t=_889.$element("div");
t.innerHTML=str;
while(t.firstChild){
f.appendChild(t.firstChild);
}
var tmp=XN.array.build(f.childNodes);
_8d4.appendChild(f);
if(_8d6){
return tmp;
}
return _8d4;
};
this.html=function(_8da,str){
_8da.innerHTML=str;
};
this.parent=function(_8dc,_8dd){
while(_8dc){
_8dc=_889.$(_8dc.parentNode);
if(_8dc.matchesSelector(_8dd)){
return _8dc;
}
}
};
this.startLoading=function(_8de,msg){
_8de=_889.$(_8de);
_8de.innerHTML="<center><img src=\""+XN.env.staticRoot+"img/indicator.gif\" />"+(msg||"\u52a0\u8f7d\u4e2d...")+"</center>";
return _8de;
};
this.stopLoading=function(_8e0){
_8e0=_889.$(_8e0);
return _8e0;
};
this.eval_inner_JS=function(el){
var js=_889.$(el).getElementsByTagName("script");
XN.array.each(js,function(i,s){
if(s.src){
XN.loadFile(s.src);
}else{
var _8e5="__inner_js_out_put = [];\n";
_8e5+=s.innerHTML.replace(/document\.write/g,"__inner_js_out_put.push");
eval(_8e5);
if(__inner_js_out_put.length!==0){
var tmp=document.createDocumentFragment();
_889.$(tmp).appendHTML(__inner_js_out_put.join(""));
s.parentNode.insertBefore(tmp,s);
}
}
});
};
this.extend=function(_8e7){
var _8e8=_889.extend.cache;
for(var i=0,m,len=_88d.length;i<len;i++){
m=_88d[i];
if(_889[m]!=null&&!(m in _8e7)){
_8e7[m]=_8e8.findOrStore(_889[m]);
}
}
return _8e7;
};
this.extend.cache={findOrStore:function(_8ec){
return this[_8ec]=this[_8ec]||function(){
return _8ec.apply(null,[this].concat(XN.array.build(arguments)));
};
}};
if(_88c.IE){
this.getStyle=function(_8ed,_8ee){
_8ed=_889.$(_8ed);
_8ee=(_8ee=="float"||_8ee=="cssFloat")?"styleFloat":_8ee;
var _8ef=_8ed.style[_8ee];
if(!_8ef&&_8ed.currentStyle){
_8ef=_8ed.currentStyle[_8ee];
}
if(_8ee=="opacity"){
if(_8ef=(_8ed.getStyle("filter")||"").match(/alpha\(opacity=(.*)\)/)){
if(_8ef[1]){
return parseFloat(_8ef[1])/100;
}
}
return 1;
}
if(_8ef=="auto"){
if((_8ee=="width"||_8ee=="height")&&(_8ed.getStyle("display")!="none")){
return _8ed["offset"+(_8ee=="width"?"Width":"Height")]+"px";
}
return null;
}
return _8ef;
};
}
if(document.addEventListener){
this.setOpacity=function(_8f0,_8f1){
_8f0=_889.$(_8f0);
_8f0.style.opacity=_8f1;
return _8f0;
};
}else{
this.setOpacity=function(_8f2,_8f3){
_8f2=_889.$(_8f2);
_8f2.style.zoom=1;
_8f2.style.filter="Alpha(opacity="+Math.ceil(_8f3*100)+")";
return _8f2;
};
}
this.$element=function(tag){
return _889.$(document.createElement(tag));
};
this.$=function(id){
var _8f6;
if(id==null){
_8f6=null;
}else{
if(XN.isString(id)||XN.isNumber(id)){
_8f6=Sizzle("#"+id)[0];
}else{
_8f6=id;
}
}
if(_8f6){
_889.extend(_8f6);
}
return _8f6||null;
};
});
object.add("XN.template","XN.env",function(_8f7,XN){
this.smediaPlayer=function(o){
return ["<object classid=\"CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95\" width=\""+(o.width||"352")+"\" height=\""+(o.height||"70")+"\" >\n","<param name=\"autostart\" value=\""+(o.autostart||"1")+"\" >\n","<param name=\"showstatusbar\" value=\""+(o.showstatusbar||"1")+"\">\n","<param name=\"filename\" value=\""+o.filename+"\">\n","<embed type=\"application/x-oleobject\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701\" ","flename=\"mp\"","autostart=\""+(o.autostart||"1")+"\" showstatusbar=\""+(o.showstatusbar||"1")+"\" ","src=\""+o.filename+"\" width=\""+(o.width||"352")+"\" height=\""+(o.height||"70")+"\"></embed>"].join("");
};
this.flashPlayer=function(o){
return "<embed src=\""+XN.env.staticRoot+"/swf/player.swf?url="+o.filename+"&Rwid="+(o.width||"450")+"&Autoplay="+(o.autostart||"1")+"\" wmode=\""+(o.wmode||"transparent")+"\" loop=\"false\" menu=\"false\" quality=\"high\" scale=\"noscale\" salign=\"lt\" bgcolor=\"#ffffff\" width=\""+(o.width||"450")+"\" height=\""+(o.height||"30")+"\" align=\"middle\" allowScriptAccess=\""+(o.allowScriptAccess||"sameDomain")+"\" allowFullScreen=\"false\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" />";
};
this.flash=function(o){
return "&nbsp;<embed src=\""+o.filename+"\" type=\"application/x-shockwave-flash\" "+"width=\""+(o.width||"320")+"\" height=\""+(o.height||"240")+"\" allowFullScreen=\"true\" wmode=\""+(o.wmode||"transparent")+"\" allowNetworking=\""+(o.allowNetworking||"all")+"\" allowScriptAccess=\""+(o.allowScriptAccess||"sameDomain")+"\"></embed>";
};
});
object.add("XN.form","sys, XN, XN.event, XN.json, XN.array, XN.element, XN.string, XN.env",function(_8fc,sys,XN){
this.fillWithJSON=function(form,json){
form=XN.element.$(form);
_8fc.fillWithArray(form,XN.json.parse(json));
};
this.fillWithArray=function(form,a){
form=XN.element.$(form);
for(var p in a){
_8fc.Element.setValue(p,a[p],form);
}
};
this.setValue=function(_904,_905){
return _8fc.Element.setValue(_904,_905);
};
this.getValue=function(_906){
return _8fc.Element.getValue(_906);
};
this.serialize=function(form,type){
return _8fc.serializeElements(_8fc.getElements(form),type||"string");
};
this.serializeElements=function(_909,type,_90b){
type=type||"array";
if(XN.isUndefined(_90b)){
_90b=false;
}
var data=[],_key,_90e;
XN.array.each(_909,function(i,v){
if(!v.disabled&&v.name){
_key=v.name;
_90e=_90b?encodeURIComponent(_8fc.Element.getValue(v)):_8fc.Element.getValue(v);
if(_90e!==null){
if(_key in data){
if(!XN.isArray(data[_key])){
data[_key]=[data[_key]];
}
data[_key].push(_90e);
}else{
data[_key]=_90e;
}
}
}
});
if(type=="array"){
return data;
}else{
if(type=="string"){
return XN.array.toQueryString(data);
}else{
if(type=="hash"){
var tmp={};
for(var p in data){
if(!XN.isFunction(data[p])){
tmp[p]=data[p];
}
}
return tmp;
}
}
}
};
this.getElements=function(form){
form=XN.element.$(form);
var _914=[];
var all=form.getElementsByTagName("*");
XN.array.each(all,function(i,v){
if(!XN.isUndefined(_8fc.Element.Serializers[v.tagName.toLowerCase()])){
_914.push(v);
}
});
return _914;
};
this.Element={getValue:function(_918){
_918=XN.element.$(_918);
var _919=_918.tagName.toLowerCase();
return _8fc.Element.Serializers[_919](_918);
},setValue:function(_91a,_91b,form){
if(form){
_91a=form[_91a];
if((XN.isElement(_91a)&&_91a.tagName.toLowerCase()=="select")){
_8fc.Element.Serializers["select"](_91a,_91b);
}else{
if(XN.isElement(_91a)){
_8fc.Element.Serializers[_91a.tagName.toLowerCase()](_91a,_91b);
}else{
if(_91a[0]){
var _91d=_91a[0].tagName.toLowerCase();
for(var i=0,j=_91a.length;i<j;i++){
_8fc.Element.Serializers[_91d](_91a[i],(_91b[i]||_91b||""));
}
}
}
}
return _91a;
}else{
_91a=XN.element.$(_91a);
var _91d=_91a.tagName.toLowerCase();
_8fc.Element.Serializers[_91d](_91a,_91b);
return _91a;
}
}};
this.Element.Serializers={input:function(_920,_921){
switch(_920.type.toLowerCase()){
case "checkbox":
case "radio":
return _8fc.Element.Serializers.inputSelector(_920,_921);
default:
return _8fc.Element.Serializers.textarea(_920,_921);
}
},inputSelector:function(_922,_923){
if(XN.isUndefined(_923)){
return _922.checked?_922.value:null;
}else{
_922.checked=!!_923;
}
},textarea:function(_924,_925){
if(XN.isUndefined(_925)){
return _924.value;
}else{
_924.value=_925;
}
},select:function(_926,_927){
if(XN.isUndefined(_927)){
return this[_926.type=="select-one"?"selectOne":"selectMany"](_926);
}else{
var opt,_929,_92a=!XN.isArray(_927);
for(var i=0,_92c=_926.length;i<_92c;i++){
opt=_926.options[i];
_929=this.optionValue(opt);
if(_92a){
if(_929==_927){
opt.selected=true;
return;
}
}else{
opt.selected=XN.array.include(_927,_929);
}
}
}
},selectOne:function(_92d){
var _92e=_92d.selectedIndex;
return _92e>=0?this.optionValue(_92d.options[_92e]):null;
},selectMany:function(_92f){
var _930=[],_931=_92f.length;
if(!_931){
return null;
}
for(var i=0;i<_931;i++){
var opt=_92f.options[i];
if(opt.selected){
_930.push(this.optionValue(opt));
}
}
return _930;
},optionValue:function(opt){
return opt.value||opt.text;
}};
$F=function(id,type){
var el=XN.element.$(id);
if(el.tagName.toLowerCase()=="form"){
return _8fc.serialize(el,type);
}else{
return _8fc.getValue(el);
}
};
this._helper=function(el){
el=XN.element.$(el);
try{
if(el._helper){
return el._helper;
}
}
catch(e){
console.log(arguments.callee.caller);
}
el._helper=this;
this.element=el;
};
this._helper.prototype={maxSize:9999,limit:function(max,cut){
var This=this;
this.maxLength=max;
if(XN.isUndefined(cut)){
cut=true;
}
this._limit_cut=cut;
if(this._limit){
return this;
}
this._limit=true;
var el=this.element;
XN.event.addEvent(el,"focus",check);
XN.event.addEvent(el,"keyup",check);
function check(){
This.limitCheck();
}
return this;
},limitCheck:function(){
var This=this;
var el=this.element;
setTimeout(function(){
var v=el.value;
if(v.length>This.maxLength){
if(This._limit_cut){
el.value=v.substr(0,This.maxLength);
}
This.fireEvent("overmaxLength");
}else{
This.fireEvent("normalLength");
}
This.fireEvent("checkover");
},0);
},count:function(show,_941){
if(this._count){
return this;
}
this._count=true;
var This=this,show=XN.element.$(show);
if(XN.isUndefined(_941)){
_941=true;
}
if(!this.maxLength){
_941=false;
}
var el=this.element;
this.addEvent("overmaxLength",function(){
show.addClass("full");
});
this.addEvent("normalLength",function(){
show.delClass("full");
});
this.addEvent("checkover",update);
function update(){
show.innerHTML=el.value.length+(_941?"/"+This.maxLength:"");
}
return this;
},countSize:function(show,max,_946){
return this.limit(max).count(show,_946);
},getRealValue:function(){
var el=this.element;
if(el.value==this._defaultValue||el.value==el.getAttribute("placeholder")){
return "";
}
return el.value;
},reloadDefaultValue:function(){
this.element.value=this._defaultValue;
this.element.style.color="#888";
},defaultValue:function(v){
var This=this;
var el=this.element;
v=v||el.value;
if(!XN.isUndefined(this._defaultValue)&&el.value==this._defaultValue){
el.value=v;
}
this._defaultValue=v;
if(this._default){
return this;
}
this._default=true;
if(document.activeElement!==el){
el.value=v;
}
el.style.color="#888";
XN.event.addEvent(el,"focus",function(){
if(el.value==This._defaultValue){
el.value="";
el.style.color="#333";
}
});
XN.event.addEvent(el,"blur",function(){
if(el.value==""){
el.value=This._defaultValue;
el.style.color="#888";
}
});
return this;
},focus:function(_94b){
var el=this.element;
if(XN.isUndefined(_94b)){
_94b=el.value.length;
}
try{
if(el.setSelectionRange){
el.focus();
el.setSelectionRange(el.value.length,_94b);
}else{
if(el.createTextRange){
var _94d=el.createTextRange();
_94d.moveStart("character",_94b);
_94d.collapse(true);
_94d.select();
el.focus();
}else{
el.focus();
}
}
}
catch(e){
}
return this;
},onEnter:function(_94e){
var el=this.element;
var _950=el.tagName.toLowerCase()=="textarea";
XN.event.addEvent(el,"keydown",function(e){
e=e||window.event;
if(e.keyCode==13){
if(_950&&!e.ctrlKey){
return false;
}
XN.event.stop(e);
_94e(el);
return false;
}
},false);
return this;
},onEsc:function(_952){
var el=this.element;
XN.event.addEvent(el,"keydown",function(e){
e=e||window.event;
if(e.keyCode==27){
XN.event.stop(e);
_952(el);
return false;
}
},false);
return this;
},autoResize:function(min,max){
var This=this,el=this.element,type;
this.minSize=min||this.minSize;
this.maxSize=max||this.maxSize;
if(el.tagName.toLowerCase()=="textarea"){
this.resizeType="height";
}else{
this.resizeType="width";
}
if(!_8fc.inputShadow){
var d=XN.element.$element("div");
d.setStyle("position:absolute;left:-99999px;top:-99999px");
document.body.appendChild(d);
_8fc.inputShadow=d;
}
this.shadow=_8fc.inputShadow;
setTimeout(function(){
if(min){
return;
}
This.minSize=type=="width"?el.offsetWidth:el.offsetHeight;
},10);
el.style.overflow="hidden";
XN.event.addEvent(el,"focus",function(){
This.timer=setInterval(This._resize.bind(This),200);
});
XN.event.addEvent(el,"blur",function(){
clearInterval(This.timer);
This.timer=null;
});
return this;
},_resize:function(){
var el=this.element,sh=this.shadow,oh,type=this.resizeType;
sh.style.fontSize=el.getStyle("fontSize");
var fs=parseInt(el.getStyle("fontSize"),0);
sh.style.fontFamily=el.getStyle("fontFamily");
(type=="width")?sh.style.height=el.offsetHeight:sh.style.width=el.offsetWidth;
sh.innerHTML=XN.string.escapeHTML(el.value).replace(/\r\n/mg,"<br>").replace(/\r/mg,"<br>").replace(/\n/mg,"<br>");
(type=="width")?oh=sh.offsetWidth:oh=sh.offsetHeight+fs+3;
if(oh>this.minSize&&oh<this.maxSize){
el.style[type]=oh+"px";
}else{
if(oh<this.minSize){
el.style[type]=this.minSize+"px";
}else{
if(oh>this.maxSize){
el.style[type]=this.maxSize+"px";
}
}
}
},cursorPosition:function(){
var _960=this.element;
var _961=0,end=0;
try{
if(typeof (_960.selectionStart)=="number"){
_961=_960.selectionStart;
end=_960.selectionEnd;
}else{
if(document.selection){
var _963=document.selection.createRange();
if(_963.parentElement()==_960){
var _964=document.body.createTextRange();
_964.moveToElementText(_960);
for(_961=0;_964.compareEndPoints("StartToStart",_963)<0;_961++){
_964.moveStart("character",1);
}
for(var i=0;i<=_961;i++){
if(_960.value.charAt(i)=="\n"){
_961++;
}
}
var _964=document.body.createTextRange();
_964.moveToElementText(_960);
for(end=0;_964.compareEndPoints("StartToEnd",_963)<0;end++){
_964.moveStart("character",1);
}
for(var i=0;i<=end;i++){
if(_960.value.charAt(i)=="\n"){
end++;
}
}
}
}
}
}
catch(e){
}
return {"start":_961,"end":end,"item":[_961,end]};
}};
this._helper.prototype.setDefaultValue=this._helper.prototype.defaultValue;
XN.event.enableCustomEvent(this._helper.prototype);
this.help=function(id){
return new _8fc._helper(id);
};
this.inputHelper=this.textAreaHelper=this.help;
$CursorPosition=function(el){
return _8fc.help(el).cursorPosition();
};
this.userInfoAutoComplete=function(id,type){
var _ui=sys.modules["XN.ui"];
if(_ui){
return _ui.userInfoAutoComplete(id,type);
}else{
throw new Error("\u8bf7\u5728use\u4e2d\u5bfc\u5165XN.ui\u6a21\u5757\uff0c\u624d\u53ef\u4f7f\u7528XN.form\u4e0b\u7684\u6b64\u65b9\u6cd5");
}
};
});
object.add("XN.effect","XN.func, XN.element, XN.event",function(_96b,XN){
this.fadeIn=function(_96d,_96e){
if(_96d.fadetimer){
return;
}
_96e=_96e||XN.func.empty;
var op=0;
_96d.setOpacity(0);
_96d.style.display="";
_96d.fadetimer=setInterval(function(){
XN.element.setOpacity(_96d,(op+=0.2));
if(op>=1){
clearInterval(_96d.fadetimer);
_96d.fadetimer=null;
_96e(_96d);
}
},60);
};
this.fadeOut=function(_970,_971){
if(_970.fadetimer){
return;
}
_971=_971||XN.func.empty;
var op=1;
_970.setOpacity(1);
_970.fadetimer=setInterval(function(){
XN.element.setOpacity(_970,(op-=0.2));
if(op<=0){
clearInterval(_970.fadetimer);
_970.fadetimer=null;
_971(_970);
_970.setOpacity(1);
}
},60);
};
this.gradient=function(_973,r,g,b,_977){
if(_973.gradientTimer){
return;
}
_977=_977||XN.func.empty;
_973.style.backgroundColor="#fff";
_973.style.backgroundColor="rgb("+r+","+g+","+b+")";
_973.gradientTimer=setInterval(function(){
b+=10;
_973.style.backgroundColor="rgb("+r+","+g+","+(b>255?255:b)+")";
if(b>255){
clearInterval(_973.gradientTimer);
_973.gradientTimer=null;
_977(_973);
}
},60);
};
this.slideOpen=function(_978){
if(_978.slidetimer){
return;
}
if(!_978.slideHeight){
var _979=_978.getStyle("position");
_978.setStyle("position:absolute;left:-99999px;top:-99999px;");
_978.show();
_978.slideHeight=_978.offsetHeight;
_978.hide();
_978.setStyle("position:"+_979+";left:auto;top:auto;");
}
var eh=_978.slideHeight,h=0;
var step=parseInt(eh/10);
_978.style.height="0px";
_978.style.display="";
_978.style.overflow="hidden";
_978.slidetimer=setInterval(function(){
_978.style.height=(h+=step)+"px";
if(h>=eh){
clearInterval(_978.slidetimer);
_978.slidetimer=null;
_978.style.height=eh;
_978.style.overflow=_978.slideOverflow;
}
},50);
};
this.slideClose=function(_97d){
if(_97d.slidetimer){
return;
}
var eh=_97d.offsetHeight,h=eh;
_97d.slideHeight=eh;
_97d.slideOverflow=_97d.getStyle("overflow");
_97d.style.overflow="hidden";
var step=parseInt(eh/10);
_97d.slidetimer=setInterval(function(){
_97d.style.height=(h-=step)+"px";
if(h<=0){
clearInterval(_97d.slidetimer);
_97d.slidetimer=null;
_97d.style.display="none";
_97d.style.height=eh;
_97d.style.overflow=_97d.slideOverflow;
}
},50);
};
this.scrollTo=function(_981,_982,_983){
if(_981.scrolltimer){
return;
}
_982=_982||10;
_983=_983||XN.func.empty;
var d=_981.realTop();
var i=XN.event.winHeight();
var h=document.body.scrollHeight;
var a=XN.event.scrollTop();
var _988=null;
if(d>a){
if(d+_981.offsetHeight<i+a){
return;
}
_981.scrolltimer=setInterval(function(){
a+=Math.ceil((d-a)/_982)||1;
window.scrollTo(0,a);
if(a==d){
clearInterval(_981.scrolltimer);
_981.scrolltimer=null;
}
},10);
}else{
_981.scrolltimer=setInterval(function(){
a+=Math.ceil((d-a)/_982)||-1;
window.scrollTo(0,a);
if(a==d){
clearInterval(_981.scrolltimer);
_981.scrolltimer=null;
}
},10);
}
};
(function(_989){
var _98a={linear:function(t,b,c,d){
return c*t/d+b;
},easeIn:function(t,b,c,d){
return c*(t/=d)*t+b;
},easeOut:function(t,b,c,d){
return -c*(t/=d)*(t-2)+b;
},easeBoth:function(t,b,c,d){
if((t/=d/2)<1){
return c/2*t*t+b;
}
return -c/2*((--t)*(t-2)-1)+b;
},easeInStrong:function(t,b,c,d){
return c*(t/=d)*t*t*t+b;
},easeOutStrong:function(t,b,c,d){
return -c*((t=t/d-1)*t*t*t-1)+b;
},easeBothStrong:function(t,b,c,d){
if((t/=d/2)<1){
return c/2*t*t*t*t+b;
}
return -c/2*((t-=2)*t*t*t-2)+b;
},elasticIn:function(t,b,c,d,a,p){
if(t===0){
return b;
}
if((t/=d)==1){
return b+c;
}
if(!p){
p=d*0.3;
}
if(!a||a<Math.abs(c)){
a=c;
var s=p/4;
}else{
var s=p/(2*Math.PI)*Math.asin(c/a);
}
return -(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;
},elasticOut:function(t,b,c,d,a,p){
if(t===0){
return b;
}
if((t/=d)==1){
return b+c;
}
if(!p){
p=d*0.3;
}
if(!a||a<Math.abs(c)){
a=c;
var s=p/4;
}else{
var s=p/(2*Math.PI)*Math.asin(c/a);
}
return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b;
},elasticBoth:function(t,b,c,d,a,p){
if(t===0){
return b;
}
if((t/=d/2)==2){
return b+c;
}
if(!p){
p=d*(0.3*1.5);
}
if(!a||a<Math.abs(c)){
a=c;
var s=p/4;
}else{
var s=p/(2*Math.PI)*Math.asin(c/a);
}
if(t<1){
return -0.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;
}
return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*0.5+c+b;
},backIn:function(t,b,c,d,s){
if(typeof s=="undefined"){
s=1.70158;
}
return c*(t/=d)*t*((s+1)*t-s)+b;
},backOut:function(t,b,c,d,s){
if(typeof s=="undefined"){
s=1.70158;
}
return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b;
},backBoth:function(t,b,c,d,s){
if(typeof s=="undefined"){
s=1.70158;
}
if((t/=d/2)<1){
return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;
}
return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b;
},bounceIn:function(t,b,c,d){
return c-_98a["bounceOut"](d-t,0,c,d)+b;
},bounceOut:function(t,b,c,d){
if((t/=d)<(1/2.75)){
return c*(7.5625*t*t)+b;
}else{
if(t<(2/2.75)){
return c*(7.5625*(t-=(1.5/2.75))*t+0.75)+b;
}else{
if(t<(2.5/2.75)){
return c*(7.5625*(t-=(2.25/2.75))*t+0.9375)+b;
}
}
}
return c*(7.5625*(t-=(2.625/2.75))*t+0.984375)+b;
},bounceBoth:function(t,b,c,d){
if(t<d/2){
return _98a["bounceIn"](t*2,0,c,d)*0.5+b;
}
return _98a["bounceOut"](t*2-d,0,c,d)*0.5+c*0.5+b;
}};
var _9d7=function(){
_9d8(this.onTweening,this);
if(this.current>=this.frames){
this.stop();
_9d8(this.onComplete,this);
this.tweening=false;
return;
}
this.current++;
};
var _9d8=function(func,_9da){
var args=Array.prototype.slice.call(arguments);
args=args.slice(2);
if(typeof func=="function"){
try{
return func.apply(_9da||this,args);
}
catch(e){
_9da.errors=_9da.errors||[];
_9da.errors.push(e);
}
}
};
_989.Motion=function(_9dc,_9dd){
this.duration=_9dd||1000;
this.tween=_9dc||"linear";
};
_989.Motion.getTweens=function(){
return _98a;
};
_989.Motion.prototype={init:function(){
_9d8(this.onInit,this);
this.fps=this.fps||35;
this.frames=Math.ceil((this.duration/1000)*this.fps);
if(this.frames<1){
this.frames=1;
}
var f=("function"==typeof this.tween)?this.tween:_98a[this.tween]||_98a["linear"];
this.equation=function(from,to){
return f((this.current/this.frames)*this.duration,from,to-from,this.duration);
};
this.current=this.tweening=1;
},start:function(){
this.init();
_9d8(this.onStart,this);
var _9e1=this,d=this.duration/this.frames;
this.timer=setInterval(function(){
_9d7.call(_9e1);
},d);
},stop:function(){
if(this.timer){
clearInterval(this.timer);
}
this.tweening=false;
}};
})(_96b);
});
object.add("XN.ui","XN, XN.array, XN.element, XN.event, XN.browser, XN.util, XN.dom, XN.func, XN.string, XN.env, XN.net, XN.json, XN.form, XN.datasource",function(_9e3,XN){
(function(){
_9e3.element={frame:null,iAmUIelement:true};
XN.array.each(["addClass","delClass","show","hide","remove"],function(i,v){
_9e3.element[v]=function(){
XN.element[v].apply(null,[this.frame].concat(XN.array.build(arguments)));
};
});
_9e3.container={container:null};
XN.array.each(["addChild","delChild","setContent"],function(i,v){
_9e3.container[v]=function(){
XN.element[v].apply(null,[this.container].concat(XN.array.build(arguments)));
};
});
XN.$extend(_9e3.container,_9e3.element);
})();
this.Element=this.element;
this.Content=this.container;
(function(ns){
var UI=_9e3;
var _9eb=XN.event.addEvent;
var _9ec=true;
function log(s){
if(_9ec){
XN.log(XN.isString(s)?"xn.ui.button:"+s:s);
}
}
ns.button=function(_9ee){
XN.$extend(this,_9ee);
this.init();
};
ns.button.prototype=XN.$extend({},UI.Element);
ns.button.prototype.text=null;
ns.button.prototype.className="";
ns.button.prototype.disableClassName="gray";
ns.button.prototype.init=function(){
var This=this;
var el;
if(this.getConfig("el")){
el=XN.element.$(this.getConfig("el"));
}else{
el=XN.element.$element("input");
}
this.frame=el;
el.type="button";
this.addClass("input-submit");
this.addClass(this.getConfig("className"));
this.setText(this.getConfig("text"));
_9eb(el,"click",function(){
if(This.onclick){
This.onclick();
}
},false);
};
ns.button.prototype.getConfig=function(key){
if(key=="el"){
return this.id;
}
return this[key];
};
ns.button.prototype.getEl=function(){
return this.frame;
};
ns.button.prototype.setText=function(text){
this.text=text;
this.getEl().value=text;
};
ns.button.prototype.disable=function(){
var el=this.getEl();
el.blur();
el.disabled=true;
el.addClass(this.getConfig("disableClassName"));
};
ns.button.prototype.enable=function(){
var el=this.getEl();
el.disabled=false;
el.delClass(this.getConfig("disableClassName"));
};
ns.button.prototype.focus=function(){
this.getEl().focus();
};
ns.button.prototype.blur=function(){
this.getEl().blur();
};
})(this);
(function(){
var rl="realLeft",rt="realTop",ow="offsetWidth",oh="offsetHeight";
_9e3.fixPositionMethods={"1-1":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+"px";
f.style.top=y+el[rt]()-p[rt]()+"px";
},"1-2":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+"px";
},"1-3":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()-f[oh]+"px";
},"1-4":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+"px";
f.style.top=y+el[rt]()-p[rt]()-f[oh]+"px";
},"2-1":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+"px";
},"2-2":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+"px";
},"2-3":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()-f[oh]+"px";
},"2-4":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()-f[oh]+"px";
},"3-1":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]+"px";
},"3-2":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]-f[ow]+"px";
f.style.top=y+el[rt]()+el[oh]+"px";
},"3-3":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]-f[oh]+"px";
},"3-4":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+el[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]-f[oh]+"px";
},"4-1":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]+"px";
},"4-2":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]+"px";
},"4-3":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()-f[ow]+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]-f[oh]+"px";
},"4-4":function(f,el,x,y,p){
f.style.left=x+el[rl]()-p[rl]()+"px";
f.style.top=y+el[rt]()-p[rt]()+el[oh]-f[oh]+"px";
}};
})();
this.fixPositionElement=function(_a49){
var This=this;
this.config={tagName:"div",useIframeInIE6:true};
XN.$extend(this.config,_a49);
var f,x,y;
if(this.getConfig("id")){
this.frame=f=XN.element.$(this.getConfig("id"));
x=f.realLeft();
y=f.realTop();
}else{
if(this.getConfig("tagName")){
this.frame=this.container=f=XN.element.$element(this.getConfig("tagName"));
}else{
return;
}
}
this.container=XN.element.$element("div");
this.frame.appendChild(this.container);
XN.array.each(["alignWith","alignType","offsetX","offsetY","alignParent"],function(i,v){
This[v]=This.getConfig(v)||This[v];
});
XN.element.setStyle(f,"position:absolute;z-index:10001;left:-9999px;top:-9999px");
if(!XN.element.$(this.alignParent)){
this.alignParent=XN.element.$(document.body);
}
XN.element.$(this.alignParent).appendChild(this.frame);
if((XN.browser.IE6&&this.getConfig("useIframeInIE6"))||this.getConfig("addIframe")){
var _a50;
this._iframe=_a50=XN.element.$element("iframe");
_a50.frameBorder=0;
_a50.scrolling="no";
_a50.setStyle("position:absolute;border:0px;left:0px;top:0px;z-index:-1;");
if(XN.browser.Gecko){
_a50.setAttribute("style","position:absolute;border:0px;left:0px;top:0px;z-index:-1;");
}
if(XN.browser.IE){
_a50.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";
}
this.frame.appendChild(_a50);
}
if(XN.element.visible(f)){
this.show();
}
f.style.display="block";
};
this.fixPositionElement.prototype=XN.$extend({},this.container);
XN.$extend(this.fixPositionElement.prototype,{alignWith:null,alignType:"4-1",offsetX:0,offsetY:0,alignParent:"dropmenuHolder",left:null,top:null,_isShow:false,getConfig:function(key){
return this.config[key];
},setOffsetX:function(x){
this.offsetX=x;
this.refresh();
return this;
},setOffsetY:function(y){
this.offsetY=y;
this.refresh();
return this;
},setAlignType:function(t){
this.alignType=t;
this.refresh();
return this;
},setAlignParent:function(p){
this.alignParent=p;
XN.element.$(this.alignParent).appendChild(this.frame);
this.refresh();
return this;
},refresh:function(){
if(this.visible()){
this.show();
}else{
this.hide();
}
return this;
},visible:function(){
return this._isShow;
},show:function(){
this._isShow=true;
this.frame.show();
if(this.alignWith){
this._moveToElement(this.alignWith);
}else{
var x=this.left===null?parseInt(((XN.element.$(this.alignParent).offsetWidth-this.frame.offsetWidth)/2),10):this.left;
var y=this.top===null?XN.event.scrollTop()+200:this.top;
this._moveToPosition(x,y);
}
if(this._iframe){
try{
this._iframe.style.height=this.frame.offsetHeight-2+"px";
this._iframe.style.width=this.frame.offsetWidth+"px";
}
catch(e){
}
}
return this;
},hide:function(){
this._isShow=false;
var f=this.frame;
f.style.left="-9999px";
f.style.top="-9999px";
return this;
},moveTo:function(x,y){
if(!x&&!y){
return;
}
if(XN.isNumber(x)){
this.left=x;
this.alignWith=null;
}else{
if(XN.isString(x)||XN.isElement(x)){
this.alignWith=XN.element.$(x);
}
}
if(XN.isNumber(y)){
this.top=y;
this.alignWith=null;
}
this.refresh();
return this;
},setX:function(x){
this.moveTo(x);
return this;
},setY:function(y){
this.moveTo(null,y);
return this;
},setIndex:function(i){
this.frame.style.zIndex=i;
return this;
},_moveToElement:function(el){
_9e3.fixPositionMethods[this.alignType](this.frame,XN.element.$(el),this.offsetX,this.offsetY,XN.element.$(this.alignParent));
},_moveToPosition:function(x,y){
if(x){
this.frame.style.left=x+"px";
}
if(y){
this.frame.style.top=y+"px";
}
}});
(function(){
var _a61=_9e3.fixPositionElement.prototype;
var _a62=XN.event;
var _a63=null;
_9e3.clearDialog=function(){
if(_a63&&_a63.parent){
_a63.remove();
}
};
_9e3.dialog=function(_a64){
var This=this;
_a63=this;
_9e3.fixPositionElement.call(this,_a64);
this.container=XN.element.$element("div");
this.frame.appendChild(this.container);
if(this.getConfig("HTML")){
this.setContent(this.getConfig("HTML"));
}else{
this.setContent(this.buildHTML());
}
this.dialogContainer=XN.element.$("ui_dialog_container");
this.header=this.title=XN.element.$("ui_dialog_header");
this.body=this.msg=this.message=XN.element.$("ui_dialog_body");
this.footer=XN.element.$("ui_dialog_footer");
this.closeButton=XN.element.$("ui_dialog_close");
this.header.addChild=this.body.addChild=this.footer.addChild=function(s){
XN.element.addChild(this,s);
setTimeout(function(){
This.refresh();
},0);
};
this.dialogContainer.removeAttribute("id");
this.header.removeAttribute("id");
this.body.removeAttribute("id");
this.footer.removeAttribute("id");
this.closeButton.removeAttribute("id");
if(this.getConfig("showCloseButton")){
this.closeButton.show();
XN.event.addEvent(this.closeButton,"click",function(){
This.hide();
This.fireEvent("close");
});
}
this.frame.style.zIndex=10000;
this.setWidth(this.getConfig("width")||400);
if(this.getConfig("height")){
this.setHeight(this.getConfig("height"));
}
XN.array.each(["title","msg","message","header","body","footer"],function(i,v){
if(This.getConfig(v)){
This[v].setContent(This.getConfig(v));
}
});
if(this.getConfig("type")){
this.setType(this.getConfig("type"));
}
this._buttons=[];
XN.event.addEvent(this.footer,"click",function(e){
This._parseButtonEvent(e||window.event);
});
XN.util.hotKey.add("27",this._hotKeyEvent,this);
if(this.getConfig("modal")===true){
XN.dom.disable();
}
if(this.getConfig("noHeader")){
this.header.hide();
}
if(this.getConfig("noFooter")){
this.footer.hide();
}
if(this.getConfig("noPadding")){
this.body.addClass("no_padding");
}
};
_9e3.dialog.prototype=XN.$extend({},_a61);
XN.$extend(_9e3.dialog.prototype,{header:null,body:null,footer:null,_iframe:null,_buttons:null,buildHTML:function(){
return ["<table id=\"ui_dialog_container\" style=\"width: 100%; height: 100%;\" class=\"pop_dialog_table\">","<tbody>","<tr>","<td class=\"pop_topleft\"></td>","<td class=\"pop_border\"></td>","<td class=\"pop_topright\"></td>","</tr>","<tr>","<td class=\"pop_border\"></td>","<td class=\"pop_content\">","<h2><span id=\"ui_dialog_header\"></span><a style=\"display:none;\" class=\"close-button\" id=\"ui_dialog_close\" href=\"#nogo\" onclick=\"return false;\">\u5173\u95ed</a></h2>","<div class=\"dialog_content\">","<div id=\"ui_dialog_body\" class=\"dialog_body\"></div>","<div id=\"ui_dialog_footer\" class=\"dialog_buttons\"></div>","</div>","</td>","<td class=\"pop_border\"></td>","</tr>","<tr>","<td class=\"pop_bottomleft\"></td>","<td class=\"pop_border\"></td>","<td class=\"pop_bottomright\"></td>","</tr>","</tbody>","</table>"].join("");
},getButton:function(text){
var _a6b=this._buttons;
for(var i=_a6b.length-1;i>=0;i--){
if(_a6b[i].text==text){
return _a6b[i];
}
}
return null;
},addButton:function(b){
var o={text:b.text,_onclickForDialog:b.onclick};
if(b.className){
o.className=b.className;
}
var _a6f=new _9e3.button(o);
_a6f.frame.setAttribute("dialog","1");
this._buttons.push(_a6f);
this.footer.addChild(_a6f);
return this;
},delButton:function(b){
if(XN.isString(b)){
b=this.getButton(b);
}
this.footer.delChild(b);
return this;
},_preventHide:false,preventHide:function(){
this._preventHide=true;
return this;
},setAutoHide:function(boo){
this._preventHide=!boo;
return this;
},_parseButtonEvent:function(e){
var el=_a62.element(e);
if(el.tagName.toLowerCase()!=="input"||el.type!=="button"){
return;
}
if(!el.getAttribute("dialog")){
return;
}
var _a74=this.getButton(el.value);
if(_a74&&_a74._onclickForDialog){
_a74._onclickForDialog.call(this);
}
if(this._preventHide){
this._preventHide=true;
}else{
this.hide();
}
},_hotKeyEvent:function(){
this.hide();
},setType:function(t){
if(t=="normal"){
this.frame.delClass("errorDialog");
}else{
if(t=="error"){
this.frame.addClass("errorDialog");
}
}
return this;
},setWidth:function(w){
if(!w){
return this;
}
if(w=="auto"){
this.frame.style.width="auto";
this.dialogContainer.style.height="";
this.dialogContainer.style.width="";
this.width=this.frame.offsetWidth;
}else{
this.width=w;
this.frame.style.width=w+"px";
this.dialogContainer.style.height="100%";
this.dialogContainer.style.width="100%";
}
this.refresh();
return this;
},setHeight:function(h){
if(!h){
return this;
}
this.hegith=h;
this.frame.style.height=h+"px";
this.refresh();
return this;
},resizeTo:function(w,h){
this.setWidth(w);
this.setHeight(h);
return this;
},clear:function(){
this.header.setContent("");
this.body.setContent("");
this.footer.setContent("");
this._buttons=[];
return this;
},setTitle:function(s){
this.header.setContent(s);
return this;
},setBody:function(s){
this.body.setContent(s);
return this;
},remove:function(_a7c){
XN.util.hotKey.del("27",this._hotKeyEvent);
_9e3.element.remove.call(this);
if(!_a7c){
XN.dom.enable();
}
return this;
},refresh:function(){
if(this.visible()){
_a61.show.apply(this,arguments);
}else{
this.hide();
}
return this;
},reLocate:function(){
var w=this.frame;
var s=XN.event.scrollTop();
var _a7f=(XN.event.winHeight()-w.offsetHeight)/2;
_a7f=(_a7f<=0)?s:_a7f+s;
w.style.top=_a7f+"px";
},show:function(){
this._clearHideTimer();
if(this.getConfig("modal")===true){
XN.dom.disable();
}
_a61.show.apply(this,arguments);
this.fireEvent("show");
return this;
},hide:function(){
this._clearHideTimer();
_a61.hide.apply(this,arguments);
XN.dom.enable();
this.fireEvent("hide");
return this;
},_hideTimer:null,_clearHideTimer:function(){
if(this._hideTimer){
clearTimeout(this._hideTimer);
this._hideTimer=null;
}
},autoHide:function(t){
var This=this;
this._hideTimer=setTimeout(function(){
This.hide();
},t*1000);
return this;
}});
XN.event.enableCustomEvent(_9e3.dialog.prototype);
})();
this.panel=this.dialog;
this.dialog.prototype.setHeader=function(h){
if(h&&h!==""){
this.header.addChild(h);
}else{
this.header.innerHTML="";
}
};
this.dialog.prototype.setFooter=function(f){
if(f&&f!==""){
this.footer.addChild(f);
}else{
this.footer.innerHTML="";
}
};
this.menu=function(_a84){
var This=this;
this.config={alignType:"4-1",barOnshowClass:"",tagName:"div",disalbeButtonClickEvent:true,fireOn:"click",keep:0.2,useIframeInIE6:true,effectTime:50};
XN.$extend(this.config,_a84);
var _a86;
if(this.getConfig("text")){
this.frame=_a86=XN.element.$element(this.getConfig("tagName"));
_a86.setContent(this.getConfig("text"));
}else{
if(this.getConfig("button")){
this.frame=_a86=XN.element.$(this.getConfig("button"));
}else{
return false;
}
}
this._alignType=this.getConfig("alignType");
if(this.getConfig("menu")){
XN.element.$(this.getConfig("menu")).hide();
this.menu=new _9e3.fixPositionElement({id:this.getConfig("menu"),alignType:this._alignType,alignWith:this.getConfig("alignWith")||this.frame,addIframe:this.getConfig("addIframe"),useIframeInIE6:this.getConfig("useIframeInIE6")});
this.container=this.menu.frame;
this._canAddSubMenu=false;
}else{
var dt=XN.element.$element("div");
dt.hide();
this.menu=new _9e3.fixPositionElement({id:dt,alignType:this._alignType,alignWith:this.getConfig("alignWith")||this.frame,addIframe:this.getConfig("addIframe"),useIframeInIE6:this.getConfig("useIframeInIE6")});
this.container=XN.element.$element("div");
this._menu.setContent(this.container);
}
this.menu.setIndex(10001);
XN.event.addEvent(this.menu.frame,"click",function(e){
e=e||window.event;
This._frameOnClick(e);
},false);
this.menu.setOffsetX(this.getConfig("offsetX")||0);
this.menu.setOffsetY(this.getConfig("offsetY")||0);
var _a89=this.getConfig("event");
if(_a89=="click"){
XN.event.addEvent(this.frame,"click",function(e){
This._buttonClick(e||window.event);
});
XN.event.addEvent(document,"click",function(e){
This._documentClick(e||window.event);
});
}else{
if(_a89=="mouseover"){
XN.event.addEvent(this.frame,"mouseover",function(e){
This._frameMouseOver(e||window.event);
});
if(this.getConfig("disalbeButtonClickEvent")){
XN.event.addEvent(this.frame,"onclick",function(e){
XN.event.stop(e||window.event);
});
}
XN.event.addEvent(this.frame,"mouseleave",function(){
This._buttonMouseLeave();
});
XN.event.addEvent(this.menu.frame,"mouseleave",function(){
This._menuMouseLeave();
});
XN.event.addEvent(this.menu.frame,"mouseover",function(){
This._mouseOverMenu=true;
});
}else{
if(_a89=="manual"){
}
}
}
XN.event.addEvent(window,"resize",function(){
This.menu.refresh();
});
this.hide();
};
this.menu.prototype=XN.$extend({},this.container);
XN.$extend(this.menu.prototype,{isShow:true,menu:null,_alignType:null,_button:null,_canAddSubMenu:true,_delayTimer:null,_mouseOverMenu:false,_mouseOverButton:false,_clearTimer:function(){
if(this._delayTimer){
clearTimeout(this._delayTimer);
this._delayTimer=null;
}
},_buttonClick:function(e){
XN.event.stop(e);
if(this.isShow){
this.hide();
}else{
this.show();
}
},_documentClick:function(e){
this.hide();
},_frameOnClick:function(e){
var This=this;
var el=XN.event.element(e);
var tag=el.tagName.toLowerCase();
if(tag=="a"){
return true;
}
if((tag=="input"&&(el.type=="radio"||el.type=="checkbox"))||tag=="label"){
this.isShow=false;
setTimeout(function(){
This.isShow=true;
},20);
return true;
}
while(el!=this.menu.frame&&el.tagName&&el.tagName.toLowerCase()!="a"){
el=el.parentNode;
}
if(el.tagName.toLowerCase()=="a"){
return true;
}
XN.event.stop(e);
},_frameMouseOver:function(e){
var This=this;
this._mouseOverButton=true;
this._clearTimer();
var _a96=this.getConfig("delay");
if(_a96){
this._delayTimer=setTimeout(function(){
if(This._mouseOverButton){
This.show();
}
},_a96*1000);
}else{
This.show();
}
XN.event.stop(e);
},_buttonMouseLeave:function(){
var This=this;
this._mouseOverButton=false;
this._clearTimer();
setTimeout(function(){
if(!This._mouseOverMenu){
This.hide();
}
},this.getConfig("effectTime"));
},_menuMouseLeave:function(){
var This=this;
this._mouseOverMenu=false;
this._clearTimer();
setTimeout(function(){
if(!This._mouseOverButton){
This.hide();
}
},this.getConfig("effectTime"));
},getConfig:function(key){
var _a9a={"hoverClass":"barOnshowClass","event":"fireOn","button":"bar","delay":"keep"};
if(_a9a[key]){
return this.config[key]||this.config[_a9a[key]];
}
return this.config[key];
},show:function(){
if(this.isShow){
return this;
}
this.menu.show();
var _a9b=this.getConfig("hoverClass");
if(_a9b!=""){
this.frame.addClass(this.getConfig("hoverClass"));
}
this.onShow();
this.isShow=true;
return this;
},setWidth:function(w){
this.menu.frame.style.width=w+"px";
this.menu.refresh();
return this;
},hide:function(){
if(!this.isShow){
return this;
}
this.menu.hide();
this.frame.delClass(this.getConfig("hoverClass"));
this.isShow=false;
this.onHide();
return this;
},refresh:function(){
if(this.isShow){
this.menu.show();
}
return this;
},onShow:XN.func.empty,onHide:XN.func.empty});
XN.event.enableCustomEvent(this.menu.prototype);
this.autoComplete=function(p){
var This=this;
this.config=this.config||{};
XN.$extend(this.config,{inputTip:null,searchDelay:0.2,DS:null,enableCache:true,maxCache:10});
XN.$extend(this.config,p);
if(this.getConfig("enableCache")){
this.cache=new XN.util.cache({cacheLength:this.getConfig("maxCache")});
}
if(this.getConfig("input")){
var _a9f=this.input=XN.element.$(this.getConfig("input"));
}else{
var _a9f=this.input=XN.element.$element("input");
_a9f.type="text";
_a9f.addClass("input-text");
}
this.frame=_a9f;
XN.event.addEvent(_a9f,"focus",function(e){
This._startCheck();
This.fireEvent("focus");
});
XN.event.addEvent(_a9f,"blur",function(e){
This._endCheck();
This.fireEvent("blur");
});
this.addEvent("focus",function(){
var v=this.input.value;
if(v==""||v==this.getConfig("inputTip")){
this.fireEvent("noinput");
}
});
this.addEvent("blur",function(){
this._lastInput=null;
});
XN.event.addEvent(_a9f,"click",function(e){
XN.event.stop(e||window.event);
});
XN.event.addEvent(_a9f,"keydown",function(e){
This._userInput=true;
e=e||window.event;
if(e.keyCode==13){
XN.event.stop(e);
}
This.fireEvent("keydown",e);
});
_a9f.setAttribute("AutoComplete","off");
this.DS=this.getConfig("DS");
};
this.autoComplete.prototype=XN.$extend({},this.element);
XN.$extend(this.autoComplete.prototype,{input:null,cache:null,_userInput:false,_lastInput:null,getConfig:function(key){
if(key=="input"){
return this.config["input"]||this.config["id"];
}
return this.config[key];
},_startCheck:function(){
var This=this;
this._inputTimer=setInterval(function(){
if(This._userInput){
This._userInput=false;
return;
}
This._checkInput();
},this.getConfig("searchDelay")*1000);
},_endCheck:function(){
clearInterval(this._inputTimer);
this._inputTimer=null;
},_checkInput:function(){
var This=this;
var cv=this.input.value;
if(XN.string.isBlank(cv)){
if(this._lastInput===""){
return;
}
this._lastInput="";
this.fireEvent("noinput");
return;
}
if(cv==this._lastInput){
return;
}
this._lastInput=cv;
this.fireEvent("searchbegin");
if(this.cache){
var _aa9=this.cache.get(cv);
if(_aa9){
this.fireEvent("searchover",_aa9);
return;
}
}
if(!this.DS){
XN.log("no ds");
this.fireEvent("NO_DS");
return;
}
this.DS.query(cv,function(r){
if(This.cache){
This.cache.add(cv,r);
}
This.fireEvent("searchover",r);
});
}});
XN.event.enableCustomEvent(this.autoComplete.prototype);
(function(){
var _aab={};
getCompleteMenu=function(id){
return _aab[id];
};
_9e3.autoCompleteMenu=function(p){
var This=this;
this._MID=XN.util.createObjID();
_aab[this._MID]=this;
this.config=this.config||{};
XN.$extend(this.config,{ulClassName:"",liClassName:"",liHoverClass:"m-autosug-hover",aClassName:"",noResult:"\u6ca1\u6709\u5339\u914d\u7ed3\u679c",dataLoading:"\u6b63\u5728\u52a0\u8f7d\u6570\u636e...",noInput:null,autoSelectFirst:false,noHighlightClass:"noHighlight"});
_9e3.autoComplete.call(this,p);
var _aaf=this.input;
var m=XN.element.$element("div");
m.innerHTML=this.getConfig("wrapper")||this._wrapper();
this._menuList=m.firstChild;
this._ul=this._menuList.getElementsByTagName("ul")[0];
this.menu=new _9e3.menu({button:_aaf,menu:this._menuList,fireOn:"manual"});
this.addEvent("keydown",this._inputOnkeydown);
XN.event.addEvent(this._ul,"mousedown",function(e){
This._menuOnclick(e||window.event);
});
XN.event.addEvent(_aaf,"blur",function(){
This.menu.hide();
});
this.menu.hide();
this.addEvent("noinput",function(){
var tip=this.getConfig("noInput");
if(!tip){
this.menu.hide();
return;
}
this._ul.innerHTML="<li>"+tip+"</li>";
this.menu.show();
});
this.addEvent("NO_DS",function(){
this._noDataShow();
});
this.addEvent("searchover",function(_ab3){
this._buildMenu(_ab3);
});
};
_9e3.autoCompleteMenu.prototype=XN.$extend({},_9e3.autoComplete.prototype);
XN.$extend(_9e3.autoCompleteMenu.prototype,{menu:null,_menuList:null,_ul:null,_currentLi:null,_highlightMenuItem:function(li){
if(li==this._currentLi){
return;
}
var _ab5=this.getConfig("liHoverClass");
if(this._currentLi!==null){
XN.element.delClass(this._currentLi,_ab5);
}
XN.element.addClass(li,_ab5);
this._currentLi=li;
var aid=this._currentLi.getAttribute("aid");
if(aid){
this.fireEvent("highlight",this.result[parseInt(aid)]);
}
},_checkOnlyOneNoHightlightEl:function(){
return (this._ul.lastChild==this._ul.firstChild&&XN.element.hasClassName(this._ul.firstChild,this.config.noHighlightClass));
},_inputOnkeydown:function(_ab7){
var li;
if(_ab7.keyCode==13){
if(this.menu.isShow&&this._currentLi){
var aid=this._currentLi.getAttribute("aid");
if(aid){
this._selectMenuItem(parseInt(aid));
}
}
return false;
}
if(_ab7.keyCode==38){
if(this._checkOnlyOneNoHightlightEl()){
return;
}
if(this._currentLi&&this._currentLi.previousSibling){
li=this._currentLi.previousSibling;
}else{
li=this._ul.lastChild;
}
while(XN.element.hasClassName(li,this.config.noHighlightClass)){
if(li.previousSibling){
li=li.previousSibling;
}else{
li=this._ul.lastChild;
}
}
this._highlightMenuItem(li);
return false;
}
if(_ab7.keyCode==40){
if(this._checkOnlyOneNoHightlightEl()){
return;
}
if(this._currentLi&&this._currentLi.nextSibling){
li=this._currentLi.nextSibling;
}else{
li=this._ul.firstChild;
}
while(XN.element.hasClassName(li,this.config.noHighlightClass)){
if(li.nextSibling){
li=li.nextSibling;
}else{
li=this._ul.firstChild;
}
}
this._highlightMenuItem(li);
return false;
}
return true;
},_menuOnclick:function(_aba){
var el=XN.event.element(_aba);
while(el&&el.tagName&&el.tagName.toLowerCase()!=="li"){
el=el.parentNode;
}
if(!el||el.nodeType!==1||!el.getAttribute("aid")){
return false;
}
this._selectMenuItem(parseInt(el.getAttribute("aid")));
return false;
},_menuOnmouseover:function(_abc){
var el=XN.event.element(_abc);
if(el.parentNode==XN.element.$("dropmenuHolder")){
return;
}
while(el&&el.tagName&&el.tagName.toLowerCase()!=="li"){
el=el.parentNode;
}
if(!el||el.nodeType!==1||!el.getAttribute("aid")){
return false;
}
this._highlightMenuItem(el);
return false;
},_selectMenuItem:function(id){
this.menu.hide();
this.input.focus();
this.fireEvent("select",this.result[id]);
this._lastInput=this.input.value;
},_buildMenu:function(_abf){
var This=this;
this.result=_abf;
if(_abf.length>0){
this.fireEvent("hasResult");
}
if(_abf.length==0){
this.fireEvent("noResult");
var _ac1=this.getConfig("noResult");
if(XN.isFunction(_ac1)){
_ac1=_ac1.call(this);
}
this._ul.innerHTML="<li>"+_ac1+"</li>";
this.menu.show();
this._currentLi=null;
return;
}
var lis=[];
lis.push(this.firstMenuItem());
var len=_abf.length-1;
XN.array.each(_abf,function(i,v){
lis.push("<li onmouseover=\"getCompleteMenu("+This._MID+")._highlightMenuItem(this);\" aid=\""+i+"\">"+This.buildMenu(v)+"</li>");
});
lis.push(this.lastMenuItem());
this._ul.innerHTML=lis.join("");
if(this.getConfig("autoSelectFirst")){
this._highlightMenuItem(this._ul.firstChild);
}
this.menu.show();
},_noDataShow:function(){
var tip=this.getConfig("dataLoading");
this._ul.innerHTML="<li>"+tip+"</li>";
this.menu.show();
},firstMenuItem:function(){
return "";
},lastMenuItem:function(){
return "";
},buildMenu:function(r){
return "<li>"+r.name+"</li>";
},setMenuWidth:function(w){
this.menu.setWidth(w);
},getCurrentItem:function(){
return this._currentLi;
},setCurrentItem:function(item){
this._currentLi=item;
}});
_9e3.autoCompleteMenu.prototype._wrapper=function(){
return ["<div class=\"m-autosug\">","<span class=\"x1\">","<span class=\"x1a\"></span>","</span>","<span class=\"x2\">","<span class=\"x2a\"></span>","</span>","<div class=\"m-autosug-minwidth\">","<div class=\"m-autosug-content\">","<ul></ul>","</div>","</div>","</div>"].join("");
};
})();
this.friendSelector=function(_aca){
var This=this;
this.config=this.config||{};
XN.$extend(this.config,{getFriendsUrl:"http://browse."+XN.env.domain+"/getfriendsajax.do?s=1",url:"http://sg."+XN.env.domain+"/s/f",aurl:"http://friend."+XN.env.domain+"/friendsSelector.do",param:{}});
if(this.config.url.indexOf("sg.renren.com/s/m")!=-1){
this.config.aurl="http://friend."+XN.env.domain+"/friendSelectorForVip";
}
XN.$extend(this.config,_aca.params);
if(XN.isUndefined(this.getConfig("page"))){
this.config["page"]=false;
}
_9e3.autoCompleteMenu.call(this,_aca);
this.addEvent("select",function(r){
this.input.value=r.name;
if(this.onSelectOne){
this.onSelectOne(r);
}
});
this.buildMenu=function(r){
return r.name;
};
this.addEvent("focus",function(){
if(this._ready){
return;
}
if(this._isLoading){
return;
}
this.loadFriends();
});
};
this.friendSelector.prototype=XN.$extend({},this.autoCompleteMenu.prototype);
XN.$extend(this.friendSelector.prototype,{_isLoading:false,_ready:false,isReady:function(){
return this._ready;
},isLoading:function(){
return this._isLoading;
},loadFriends:function(r){
if(this.isLoading()){
return;
}
this._isLoading=true;
var This=this;
var p={};
p["init"]=true;
p["uid"]=false;
p["uhead"]=false;
p["uname"]=false;
p["group"]=false;
p["net"]=false;
p["param"]=this.getConfig("param");
p["page"]=this.getConfig("page");
new XN.net.xmlhttp({useCache:true,url:this.getConfig("aurl"),method:"get",data:"p="+XN.json.build(p),onSuccess:function(r){
r=XN.json.parse(r.responseText);
This._onload(r);
}});
},_onload:function(r){
this.isLoading=false;
this._ready=true;
this.config.qkey=r.qkey;
this.DS=new XN.util.DS_friends({url:this.getConfig("url"),qkey:this.getConfig("qkey"),limit:this.getConfig("limit"),page:this.getConfig("page"),param:this.getConfig("param")});
this.DS.query=function(v,_ad4){
var This=this;
try{
this._request.abort();
}
catch(e){
}
function parseDS_JSON(r){
r=r.responseText;
var pp;
try{
var rt=XN.JSON.parse(r);
if(This.rootKey&&rt[This.rootKey]){
pp=rt[This.rootKey];
}else{
pp=rt;
}
}
catch(e){
pp=[];
}
_ad4(pp);
}
var _ad9=XN.json.parse(this.param);
this._request=new XN.net.xmlhttp({url:this.url,data:"q="+encodeURIComponent(v)+(!!this.limit?("&l="+this.limit):"")+(!!_ad9.friendId?("&friend="+_ad9.friendId):""),method:this.method,onSuccess:parseDS_JSON});
};
}});
this.friendSelectorSynchronous=function(a,b){
function s(id,ac,v){
if(XN.isObject(id)){
id=id.id;
}
if(v.isReady()){
try{
v[ac](id);
}
catch(e){
}
}else{
v.addEvent("load",function(){
try{
v[ac](id);
}
catch(e){
}
});
v.loadFriends();
}
}
a.addEvent("select",function(id){
s(id,"select",b);
});
a.addEvent("deselect",function(id){
s(id,"deselect",b);
});
b.addEvent("select",function(id){
s(id,"select",a);
});
b.addEvent("deselect",function(id){
s(id,"deselect",a);
});
};
(function(){
_9e3.multiFriendSelector=function(_ae3){
var This=this;
this._ID=XN.util.createObjID();
this.config=this.config||{};
XN.$extend(this.config,{inputName:"ids",nameInputName:"names",aurl:"http://friend."+XN.env.domain+"/friendsSelector.do",url:"http://sg."+XN.env.domain+"/s/f",initParam:{},param:{},noInput:false,maxNum:-1});
XN.$extend(this.config,_ae3);
if(this.config.url.indexOf("sg.renren.com/s/m")!=-1){
this.config.aurl="http://friend."+XN.env.domain+"/friendSelectorForVip";
}
this.frame=XN.element.$element("div");
var div=XN.element.$element("div");
div.hide();
document.body.appendChild(div);
div.appendChild(this.frame);
this.frame.innerHTML=["<div id=\""+this.getID("friendsContainer")+"\" class=\"tokenizer friendAutoSelector\">","<span id=\""+this.getID("inputContainer")+"\" class=\"tokenizer_input\"><input id=\""+this.getID("input")+"\" type=\"text\" /></span>","</div>","<div class=\"float-right\" id=\""+this.getID("menu")+"\"></div>"].join("");
this.input=this.getEl("input");
this.menuContainer=this.getEl("menu");
XN.event.addEvent(this.getEl("friendsContainer"),"click",function(e){
This._parseClickEvent(e||window.event);
});
this.autoComplete=new _9e3.friendSelector({id:this.input,inputTip:"\u8f93\u5165\u597d\u53cb\u59d3\u540d...",autoSelectFirst:true,url:this.getConfig("url"),aurl:this.getConfig("aurl"),param:this.getConfig("param")});
this.autoComplete.loadFriends=function(r){
if(this.isLoading()){
return;
}
this._isLoading=true;
var p={};
p["init"]=true;
p["uid"]=true;
p["uhead"]=false;
p["uname"]=true;
p["group"]=false;
p["net"]=false;
XN.$extend(p,This.getConfig("initParam"));
p["param"]=this.getConfig("param");
new XN.net.xmlhttp({useCache:true,url:this.getConfig("aurl"),method:This.getConfig("loadMethod")||"get",data:"p="+XN.json.build(p),onSuccess:function(r){
r=XN.json.parse(r.responseText);
This._allFriends=r.candidate;
This.fireEvent("load");
This.autoComplete._onload(r);
}});
};
this.autoComplete.buildMenu=function(r){
return "<p>"+r.name+"</p>";
};
this.autoComplete.setMenuWidth(129);
this.autoComplete.addEvent("keydown",function(e){
This._onInputKeydown(e);
});
this.autoComplete.addEvent("select",function(r){
XN.log(this.input);
this.input.value="";
This.selectFriend(r);
});
if(this.getConfig("noInput")){
this.input.hide();
}
this.fireEvent("init");
};
var _aed=_9e3.multiFriendSelector.prototype=XN.$extend({},_9e3.element);
XN.$extend(_aed,{isReady:function(){
return this.autoComplete.isReady();
},isLoading:function(){
return this.autoComplete.isLoading();
},loadFriends:function(){
this.autoComplete.loadFriends();
},getUserByID:function(id){
id=String(id);
var rt=null;
XN.array.each(this._allFriends,function(i,v){
if(String(v.id)==id){
rt=v;
return false;
}
});
return rt;
},getConfig:function(key){
if(key=="inputName"){
return this.config["idInputName"]||this.config["inputName"];
}
return this.config[key];
},getID:function(id){
return "mfs_"+this._ID+id;
},getFriendID:function(id){
return this.getID("friend_"+id);
},getFriendEl:function(id){
return XN.element.$(this.getFriendID(id));
},getEl:function(id){
return XN.element.$(this.getID(id));
},getFriendsNum:function(){
return this.getEl("friendsContainer").getElementsByTagName("a").length;
},getSelectedFriends:function(){
var rt=[];
var a=XN.array.build(this.getEl("friendsContainer").getElementsByTagName("a"));
XN.array.each(a,function(i,v){
rt.push(v.getAttribute("uid")+"");
});
return rt;
},reset:function(){
this.deselectAll();
},deselectAll:function(){
var els=XN.array.build(this.getEl("friendsContainer").getElementsByTagName("a"));
XN.array.each(els,function(i,v){
XN.element.remove(v);
});
this.fireEvent("deselectAll",this.getIds());
},selectFriends:function(fs){
var This=this;
XN.array.each(fs,function(i,v){
This.select(v);
});
},deselectFriends:function(fs){
var This=this;
XN.array.each(fs,function(i,v){
This.deselect(v);
});
},select:function(o){
if(XN.isUndefined(o)){
return;
}
XN.log("mfs select:");
XN.log(o);
var _b07=this.getConfig("maxNum");
if(_b07!==-1){
if(this.getFriendsNum()==_b07){
this.fireEvent("overMaxNum",_b07);
return;
}
}
if(XN.isString(o)||XN.isNumber(o)){
o={id:o,name:this.getUserByID(o).name};
}
if(this.getFriendEl(o.id)){
return;
}
this.getEl("friendsContainer").insertBefore(this.createFriendHTML(o.id,o.name),this.getEl("inputContainer"));
this.fireEvent("select",o.id);
},deselect:function(uid){
if(!this.getFriendEl(uid)){
return;
}
this.getFriendEl(uid).remove();
this.fireEvent("deselect",uid);
},_parseClickEvent:function(e){
var el=XN.event.element(e);
XN.event.stop(e);
if(el&&el.getAttribute("action")){
this.deselectFriend(el.getAttribute("uid"));
}
},createFriendHTML:function(uid,_b0c){
var a=XN.element.$element("a");
a.id=this.getFriendID(uid);
a.setAttribute("uid",uid);
a.href="#nogo";
a.className="token";
a.tabindex="-1";
a.innerHTML=["<span>\n<span>\n<span>\n<span>\n<input type=\"hidden\" value=\"",uid,"\" name=\"",this.getConfig("inputName"),"\" />\n","<input type=\"hidden\" value=\"",_b0c,"\" name=\"",this.getConfig("nameInputName"),"\" />\n",_b0c,"<span uid=\"",uid,"\" action=\"x\" class=\"x\" onmouseout=\"this.className='x'\" onmouseover=\"this.className='x_hover'\" >\n</span>\n</span>\n</span>\n</span>\n</span>"].join("");
return a;
},_onInputKeydown:function(_b0e){
var i=this.getEl("inputContainer"),pa=i.previousSibling,na=i.nextSibling,_b12=this.input,c=this.getEl("friendsContainer");
if(_b0e.keyCode==8&&this.input.value==""){
if(pa){
this.deselectFriend(pa.getAttribute("uid"));
}
return true;
}else{
if(_b0e.keyCode==37&&this.input.value==""){
if(pa&&pa.tagName.toLowerCase()=="a"){
i.parentNode.removeChild(i);
c.insertBefore(i,pa);
setTimeout(function(){
_b12.focus();
},0);
}
return true;
}else{
if(_b0e.keyCode==39&&this.input.value==""){
if(na&&na.tagName.toLowerCase()=="a"){
i.parentNode.removeChild(i);
XN.dom.insertAfter(i,na);
setTimeout(function(){
_b12.focus();
},0);
}
return true;
}
}
}
return false;
}});
XN.event.enableCustomEvent(_aed);
_aed.deSelectAll=_aed.deselectAll;
_aed.deSelectFriend=_aed.deselectFriend=_aed.deselect;
_aed.selectFriend=_aed.select;
_aed.getSelectedFriendsID=_aed.getSelectedFriends;
_aed.getIds=_aed.getSelectedFriends;
})();
this.friendSelectorWithMenu=function(p){
var _b15=new _9e3.friendSelector(p);
var menu=new _9e3.friendSelectorMenu({url:_b15.getConfig("url"),aurl:_b15.getConfig("aurl"),param:_b15.getConfig("param"),multi:false,alignType:p.alignType,offsetX:p.offsetX,offsetY:p.offsetY,initParam:p.initParam});
var div=XN.element.$element("div");
div.addChild(_b15);
div.addChild(menu);
_b15.frame=div;
_b15.addEvent("focus",function(){
menu.menu.hide();
});
menu.addEvent("select",function(p){
var This=this;
setTimeout(function(){
This.menu.hide();
},30);
_b15.fireEvent("select",this.getUserByID(p));
});
menu.menu.menu.setOffsetY(9);
return _b15;
};
this.multiFriendSelectorWithMenu=function(p){
var _b1b=new _9e3.multiFriendSelector(p);
var menu=new _9e3.friendSelectorMenu({url:_b1b.getConfig("url"),aurl:_b1b.getConfig("aurl"),param:_b1b.getConfig("param"),multi:true,showSelectAllCheckbox:_b1b.getConfig("showSelectAllCheckbox")||false});
menu.addEvent("submit",function(){
menu.menu.hide();
});
_b1b.menuContainer.setContent(menu);
_9e3.friendSelectorSynchronous(_b1b,menu);
return _b1b;
};
(function(ns){
var _b1e=false;
var _b1f=XN.event.addEvent;
var log=function(s){
if(_b1e){
XN.log(XN.isString(s)?"ui.tabView:"+s:s);
}
return s;
};
ns.tabView=function(_b22){
this.config={selectedClass:"select",event:"click",alwaysReload:false,mouseOverDelay:0.2};
XN.$extend(this.config,_b22);
this.init();
};
ns.tabView.prototype={_tabs:null,_currentTab:null,_idPre:null,_tabIndex:0,init:function(){
this._idPre=XN.util.createObjID();
this._tabs=[];
},getConfig:function(key){
if(key=="activeClass"){
return this.config["activeClass"]||this.config["selectedClass"];
}
return this.config[key];
},_getID:function(el){
if(el.nodeType&&el.nodeType==1){
return this._setID(el).id;
}
return el;
},_setID:function(el){
if(!el.id){
this._tabIndex++;
el.setAttribute("id","tabview_"+this._idPre+"_"+this._tabIndex);
}
return XN.element.$(el);
},_getTab:function(id){
log("_getTab start");
log("param:id");
log(id);
if(!id){
return log(id);
}
if(id.label){
return log(id);
}
var key=this._getID(id);
log("key:"+key);
var tabs=this._tabs;
log("all tabs");
log(tabs);
for(var i=tabs.length-1;i>=0;i--){
if(tabs[i].key==key){
log("_getTab end");
return log(tabs[i]);
}
}
log("_getTab end");
return log(null);
},getCurrentTab:function(){
return this._getTab(this._currentTab);
},setCurrentTab:function(tab,_b2b){
log("setCurrentTab start");
var oldC=this.getCurrentTab();
var nowC=this._getTab(tab);
log("old current:");
log(oldC);
log("now current:");
log(nowC);
if(oldC&&oldC.key==nowC.key&&!_b2b){
return;
}
if(oldC){
this._deactiveTab(oldC);
}
this._activeTab(nowC);
this._setCurrentTab(nowC);
log("setCurrentTab end");
this.fireEvent("change",nowC);
return this;
},reset:function(){
var tab=this.getCurrentTab();
if(tab){
this._deactiveTab(tab);
}
this._setCurrentTab(null);
return this;
},_activeTab:function(tab){
log("_activeTab:");
log(tab);
tab.getEl("label").addClass(this.getConfig("activeClass"));
if(tab.content){
tab.getEl("content").show();
}
tab.onActive(tab);
log("_activeTab end");
},_deactiveTab:function(tab){
if(tab.getEl("label")){
tab.getEl("label").delClass(this.getConfig("activeClass"));
}
if(tab.content){
tab.getEl("content").hide();
}
tab.onInactive(tab);
},_setCurrentTab:function(tab){
log("_setCurrentTab start");
tab=this._getTab(tab);
log("currentTab:");
log(tab);
this._currentTab=tab?tab.key:null;
log("this._currentTab");
log(this._currentTab);
log("_setCurrentTab end");
},addTab:function(t){
log("addTab start");
log("params:");
log(t);
var This=this;
var tab={onActive:XN.func.empty,onClick:XN.func.empty,onInactive:XN.func.empty,onInit:XN.func.empty,getEl:function(key){
return XN.element.$(this[key]);
},active:false};
t.label=this._setID(XN.element.$(t.label));
t.key=t.key||t.label.id;
if(t.content){
t.content=this._getID(t.content);
log("get content id:"+t.content);
}
XN.$extend(tab,t);
this._tabs.push(tab);
log("all tabs");
log(this._tabs);
if(tab.active&&this._currentTab===null){
if(tab.content){
tab.getEl("content").show();
}
tab.label.addClass(this.getConfig("activeClass"));
this._setCurrentTab(tab);
}else{
if(tab.content){
tab.getEl("content").hide();
}
}
var ev=this.getConfig("event");
if(ev=="click"){
_b1f(tab.label,"click",function(e){
e=e||window.event;
XN.event.stop(e);
This._eventHander(e,tab.label);
},false);
}else{
if(ev=="mouseover"){
var _b38=true;
var _b39=null;
_b1f(tab.label,"mouseover",function(e){
var el=this;
_b38=true;
_b39=setTimeout(function(){
if(!_b38){
return;
}
e=e||window.event;
This._eventHander(e,tab.label);
},This.getConfig("mouseOverDelay")*1000);
},false);
_b1f(tab.label,"mouseleave",function(e){
_b38=false;
if(_b39){
clearTimeout(_b39);
}
},false);
}
}
tab.onInit(tab);
log("addTab end");
return this;
},_eventHander:function(e,el){
log("on click,el:");
log(el);
log("get tab form by el:");
var tab=this._getTab(el);
if(this.getConfig("alwaysReload")){
this.setCurrentTab(tab,true);
}else{
this.setCurrentTab(tab);
}
tab.onClick(e,tab);
},refresh:function(){
this._activeTab(this.getCurrentTab());
return this;
},showTab:function(id,_b41){
this.setCurrentTab(id,_b41);
},hideAll:function(){
this.reset();
}};
XN.event.enableCustomEvent(ns.tabView.prototype);
})(this);
this.refreshAll=function(){
document.body.style.zoom=1.1;
document.body.style.zoom=1;
};
this.getHiddenDiv=function(){
if(!this._hiddenDiv){
this._hiddenDiv=XN.element.$element("div").hide();
document.body.appendChild(this._hiddenDiv);
}
return this._hiddenDiv;
};
this.friendSearchBar=function(p){
var _b43=XN.element.$(p.input);
var _b44=XN.element.$(p.submit||null);
var form=XN.element.$(p.form);
var tip=p.tip||"\u627e\u4eba...";
var _b47=p.action||function(p){
if(p.type&&p.type=="PAGE"){
window.location.href="http://page."+XN.env.domain+"/"+p.id+"?from=opensearch";
}else{
window.location.href="http://www."+XN.env.domain+"/profile.do?id="+p.id+"&from=opensearch";
}
};
var _b49=false;
(new XN.form.inputHelper(_b43)).setDefaultValue(tip).onEnter(function(el){
if(_b49){
return;
}
if(!XN.string.isBlank(el.value)){
form.submit();
}
});
var _b4b=16;
var _b4c={id:_b43,noResult:function(){
return "\u641c\u7d22\""+this.input.value+"\"";
},limit:_b4b,params:p.params};
var _b4d=new _9e3.friendSelector(_b4c);
_b4d.lastMenuItem=function(){
if(this.result.length==_b4b){
return "<li><p><a onmousedown=\"window.location.href=this.href\" href=\"http://friend."+XN.env.domain+"/myfriendlistx.do?qu="+this.input.value+"\">\u70b9\u51fb\u67e5\u770b\u66f4\u591a..</a></p></li>";
}else{
return "";
}
};
_b4d.setMenuWidth(_b43.offsetWidth);
_b4d.onSelectOne=function(p){
_b49=true;
_b47(p);
};
if(_b44){
_b44.onclick=function(){
if(_b49){
return false;
}
var v=_b43.value;
if(v!=tip&&!XN.string.isBlank(v)){
form.submit();
return false;
}
if(_b44.tagName.toLowerCase()=="a"){
return true;
}else{
return false;
}
};
}
};
this.navSearchBar=function(p){
var _b51=XN.element.$(p.input);
var _b52=XN.element.$(p.submit||null);
var form=XN.element.$(p.form);
var tip=p.tip||"\u627e\u4eba...";
var _b55=p.action||function(p){
if(p.type&&p.type=="PAGE"){
window.location.href="http://page."+XN.env.domain+"/"+(p.id||p.uid)+"?from=opensearch";
}else{
window.location.href="http://www."+XN.env.domain+"/profile.do?id="+(p.id||p.uid)+"&from=opensearch";
}
};
var _b57=false;
(new XN.form.inputHelper(_b51)).setDefaultValue(tip).onEnter(function(el){
if(_b57){
return;
}
if(!XN.string.isBlank(el.value)){
form.submit();
}
});
var _b59=7;
var _b5a={id:_b51,noResult:function(){
return "<a onmousedown=\"window.location.href=this.href\" href=\"http://browse."+XN.env.domain+"/searchEx.do?from=opensearchclick&q="+encodeURIComponent(this.input.value)+"\" title=\"\u641c\u7d22"+this.input.value+"\">\u641c\u7d22\""+this.input.value+"\"</a>";
},limit:_b59,params:p.params,wrapper:["<div class=\"\">","<span class=\"x1\">","<span class=\"x1a\"></span>","</span>","<span class=\"x2\">","<span class=\"x2a\"></span>","</span>","<div class=\"m-autosug-minwidth\">","<div class=\"m-autosug-content\">","<ul class=\"search-Result\"></ul>","</div>","</div>","</div>"].join(""),url:"http://sg."+XN.env.domain+"/s/h"};
var _b5b=new _9e3.friendSelector(_b5a);
_b5b.loadFriends=function(r){
if(this.isLoading()){
return;
}
this._isLoading=true;
var This=this;
this._onload();
};
_b5b._onload=function(){
this.isLoading=false;
this._ready=true;
this.DS=new XN.util.DS_friends({url:this.getConfig("url"),qkey:this.getConfig("qkey"),limit:this.getConfig("limit"),page:this.getConfig("page"),param:this.getConfig("param")});
this.DS.query=function(v,_b5f){
var This=this;
try{
this._request.abort();
}
catch(e){
}
function parseDS_JSON(r){
r=r.responseText;
var pp;
try{
var rt=XN.json.parse(r);
if(This.rootKey&&rt[This.rootKey]){
pp=rt[This.rootKey];
}else{
pp=rt;
}
}
catch(e){
pp=[];
}
_b5f(pp);
}
this._request=new XN.net.xmlhttp({url:this.url,data:"q="+encodeURIComponent(v)+"&l="+this.limit,method:this.method,onSuccess:parseDS_JSON});
};
};
_b5b.buildMenu=function(r){
return "<img src=\""+(r.head||r.uhead)+"\" width=\"50\" height=\"50\" alt=\""+(r.name||r.uname)+"\"/>"+"<strong>"+(r.name||r.uname)+"</strong>";
};
_b5b._noDataShow=function(){
var tip=this.getConfig("dataLoading");
this._ul.innerHTML="<li class=\"lookMore\">"+tip+"</li>";
this.menu.show();
};
_b5b._buildMenu=function(_b66){
var This=this;
this.result=_b66;
if(_b66.length==0){
var _b68=this.getConfig("noResult");
if(XN.isFunction(_b68)){
_b68=_b68.call(this);
}
this._ul.innerHTML="<li class=\"lookMore\">"+_b68+"</li>";
this.menu.show();
this._currentLi=null;
return;
}
var lis=[];
lis.push(this.firstMenuItem());
var len=_b66.length-1;
XN.array.each(_b66,function(i,v){
lis.push("<li onmouseover=\"getCompleteMenu("+This._MID+")._highlightMenuItem(this);\" aid=\""+i+"\">"+This.buildMenu(v)+"</li>");
});
lis.push(this.lastMenuItem());
this._ul.innerHTML=lis.join("");
if(this.getConfig("autoSelectFirst")){
this._highlightMenuItem(this._ul.firstChild);
}
this.menu.show();
};
_b5b.lastMenuItem=function(){
if(this.result.length==_b59){
return "<li class=\"lookMore\"><a onmousedown=\"window.location.href=this.href\" href=\"http://friend."+XN.env.domain+"/myfriendlistx.do?qu="+this.input.value+"\">\u70b9\u51fb\u67e5\u770b\u66f4\u591a..</a></li>";
}else{
return "";
}
};
_b5b.setMenuWidth(_b51.offsetWidth);
_b5b.onSelectOne=function(p){
_b57=true;
_b55(p);
};
if(_b52){
_b52.onclick=function(){
if(_b57){
return false;
}
var v=_b51.value;
if(v!=tip&&!XN.string.isBlank(v)){
form.submit();
return false;
}
if(_b52.tagName.toLowerCase()=="a"){
return true;
}else{
return false;
}
};
}
};
this.userInfoAutoComplete=function(id,type){
var _b71={"elementaryschool":"http://www."+XN.env.domain+"/autocomplete_elementaryschool.jsp","juniorhighschool":"http://www."+XN.env.domain+"/autocomplete_juniorhighschool.jsp","workplace":"http://www."+XN.env.domain+"/autocomplete_workplace.jsp","highschool":"http://www."+XN.env.domain+"/autocomplete_highschool.jsp","allnetwork":"http://www."+XN.env.domain+"/autocomplete_all_network.jsp","allSchool":"http://www."+XN.env.domain+"/autocomplete-school.jsp","city":"http://www."+XN.env.domain+"/autocomplete-city.jsp","college":"http://www."+XN.env.domain+"/autocomplete_college.jsp"};
var ds=new XN.datasource.DS_XHR({url:_b71[type]});
var at=new _9e3.autoCompleteMenu({DS:ds,input:id});
at.buildMenu=function(r){
return "<p>"+(r.name||r.Name)+"</p>";
};
at.addEvent("select",function(r){
this.input.value=(r.name||r.Name);
});
return at;
};
});
object.add("XN.Do","XN, XN.func, XN.array, XN.ui",function(_b76,XN){
this.currentAlert=null;
this.currentConfirm=null;
this.alert=function(_b78,_b79,type,X,Y,w,h,_b7f){
var _b80={type:"normal",width:400,button:"\u786e\u5b9a",modal:false,callBack:XN.func.empty,autoHide:0,addIframe:true,closeFire:true};
if(!XN.isString(_b78)){
extendObject(_b80,_b78);
}else{
if(XN.isString(_b78)||arguments.length>1){
var ars=arguments;
XN.array.each(["message","title","type","X","Y","width","height","callBack"],function(i,v){
if(ars[i]){
_b80[v]=ars[i];
}
});
}
}
var temp=_b80.params;
delete _b80.params;
_b80=extendObject({},_b80,temp);
_b80.callback=_b80.callback||_b80.callBack;
try{
_b76.currentAlert.remove(_b80.modal===true);
}
catch(e){
}
var _b85=new XN.ui.dialog(_b80).setType(_b80.type).setTitle(_b80.title||(_b80.type=="error"?"\u9519\u8bef\u63d0\u793a":"\u63d0\u793a")).setWidth(_b80.width).setHeight(_b80.height).setX(_b80.X).setY(_b80.Y).addButton({text:(_b80.yes||_b80.button),onclick:function(){
_b85.setAutoHide(true);
return _b80.callback.call(_b85);
}}).show();
if(_b80.closeFire===true){
_b85.addEvent("close",function(){
_b80.callback.call(_b85);
});
}
_b76.currentAlert=_b85;
try{
_b85.getButton(_b80.button).focus();
}
catch(e){
}
if(_b80.autoHide){
_b85.autoHide(_b80.autoHide);
}
return _b85;
};
this.confirm=function(_b86,_b87,_b88,yes,no,X,Y,w,h){
var _b8f={type:"normal",width:400,modal:false,yes:"\u786e\u5b9a",no:"\u53d6\u6d88",callBack:XN.func.empty,focus:null,addIframe:true,closeFire:false};
if(!XN.isString(_b86)&&!XN.isNumber(_b86)){
extendObject(_b8f,_b86);
}else{
if(XN.isString(_b86)||arguments.length>1){
var ars=arguments;
XN.array.each(["message","title","callBack","yes","no","X","Y","w","h"],function(i,v){
if(ars[i]){
_b8f[v]=ars[i];
}
});
}
}
var temp=_b8f.params;
delete _b8f.params;
_b8f=extendObject({},_b8f,temp);
_b8f.callback=_b8f.callback||_b8f.callBack;
try{
_b76.currentConfirm.remove(_b8f.modal===true);
}
catch(e){
}
var _b94=new XN.ui.dialog(_b8f).setType(_b8f.type).setTitle(_b8f.title||(_b8f.type=="error"?"\u9519\u8bef\u63d0\u793a":"\u63d0\u793a")).setBody(_b8f.msg||_b8f.message||"").setWidth(_b8f.width).setHeight(_b8f.height).setX(_b8f.X).setY(_b8f.Y).addButton({text:(_b8f.submit||_b8f.yes),onclick:function(){
_b94.setAutoHide(true);
return _b8f.callback.call(_b94,true);
}}).addButton({text:(_b8f.cancel||_b8f.no),onclick:function(){
_b94.setAutoHide(true);
return _b8f.callback.call(_b94,false);
}}).show();
_b94.getButton(_b8f.cancel||_b8f.no).addClass("gray");
if(_b8f.focus=="submit"){
_b8f.focus=_b8f.submit;
}else{
if(_b8f.focus=="cancel"){
_b8f.focus=_b8f.cancel;
}
}
if(_b8f.closeFire===true){
_b94.addEvent("close",function(){
_b8f.callback.call(_b94,false);
});
}
_b94.getButton(_b8f.focus||_b8f.submit||_b8f.yes).focus();
_b76.currentConfirm=_b94;
return _b94;
};
this.showMessage=this.showMsg=function(msg,_b96,time){
var _b98=_b76.alert({msg:msg,title:(_b96||"\u63d0\u793a"),noFooter:true,autoHide:(time||2)});
return _b98;
};
this.showError=function(msg,_b9a,time){
var _b9c=_b76.alert({msg:msg,type:"error",title:(_b9a||"\u9519\u8bef\u63d0\u793a"),noFooter:true,autoHide:(time||2)});
return _b9c;
};
});
object.use(["XN","XN.array","XN.browser","XN.cookie","XN.Do","XN.dom","XN.effect","XN.element","XN.env","XN.event","XN.form","XN.func","XN.json","XN.net","XN.string","XN.template","XN.ui","XN.util","XN.datasource"],function(_b9d,XN){
$extend=XN.$extend;
if(window.XN==null){
window.XN=XN;
}else{
var _b9f=window.XN;
window.XN=XN;
for(var prop in _b9f){
if(window.XN[prop]===undefined){
window.XN[prop]=_b9f[prop];
}
}
XN.$extend(window.XN.env,_b9f.env);
}
isUndefined=XN.isUndefined;
isString=XN.isString;
isElement=XN.isElement;
isFunction=XN.isFunction;
isObject=XN.isObject;
isArray=XN.isArray;
isNumber=XN.isNumber;
$=XN.element.$;
$element=XN.element.$element;
XN.element.findFirstClass=XN.dom.findFirstClass;
extendObject=$extend;
xn_getEl=ge=getEl=$X=$;
$xElement=XN.element.$element;
XN.DEBUG=XN.Debug=XN.debug;
XN.debug.On=XN.debug.on;
XN.debug.Off=XN.debug.off;
XN.namespace("ui");
XN.namespace("util");
XN.namespace("app");
XN.namespace("page");
XN.APP=XN.App=XN.app;
XN.PAGE=XN.Page=XN.page;
XN.CONFIG=XN.Config=XN.config;
XN.ENV=XN.Env=XN.env=XN.env;
XN.ARRAY=XN.Array=XN.array=XN.array;
XN.String=XN.STRING=XN.string=XN.string;
XN.BROWSER=XN.Browser=XN.browser=XN.browser;
XN.COOKIE=XN.Cookie=XN.cookie=XN.cookie;
XN.EVENT=XN.Event=XN.event=XN.event;
XN.DO=XN.Do;
XN.DOM=XN.Dom=XN.dom=XN.dom;
XN.EFFECT=XN.Effect=XN.effect=XN.effect;
XN.ELEMENT=XN.Element=XN.element=XN.element;
XN.FORM=XN.Form=XN.form=XN.form;
XN.FUNC=XN.Func=XN.func=XN.func;
XN.JSON=XN.Json=XN.json=XN.json;
XN.NET=XN.Net=XN.net;
XN.Template=XN.TEMPLATE=XN.template=XN.template;
XN.UI=XN.Ui=XN.ui;
XN.UTIL=XN.Util=XN.util;
XN.ui.DS_JSON=XN.util.DS_JSON=XN.datasource.DS_JSON;
XN.ui.DS_friends=XN.util.DS_friends=XN.datasource.DS_friends;
XN.ui.DS_Array=XN.util.DS_Array=XN.datasource.DS_Array;
XN.ui.DS_XHR=XN.util.DS_XHR=XN.datasource.DS_XHR;
try{
document.domain=String(XN.env.domain);
}
catch(e){
}
if(window.isJSON==null){
window.isJSON=XN.string.isJSON;
}
if(XN.events==null){
XN.timeLog={};
XN.events={};
XN.event.enableCustomEvent(XN.events);
}
});
if(!window.console){
window.console={log:function(){
},warn:function(){
},error:function(){
}};
}
if(!Function.prototype.bind){
Function.prototype.bind=function(_ba1){
var _ba2=this;
return function(){
_ba2.apply(_ba1,arguments);
};
};
}
window.now=new Date();
XN.dom.ready(function(){
if(XN.config.parentDomain||(!XN.config.jumpOut)){
return;
}
try{
top.location.href.indexOf("x");
}
catch(e){
try{
top.location=self.location;
}
catch(e){
}
}
});
function writepipe(uin,nick){
if(uin>0){
var s=GetCookie("_pipe");
if(s){
s+=":";
}
SetCookie("_pipe",s+uin+":"+escape(nick),null,"/",""+XN.env.domain+"");
}
var _ba6=GetCookie("_wi");
if("opening"!=_ba6&&"running"!=_ba6){
SetCookie("_wi","opening",null,"/",XN.ENV.domain);
window.wiw=window.open("http://"+XN.env.domain+"/webpager.do?toid="+uin,"_blank","height=600,width=650,resizable=yes,location=yes");
if(window.wiw_checker){
window.clearInterval(window.wiw_checker);
}
window.wiw_checker=window.setInterval(function(){
if(window.wiw.closed){
window.clearInterval(window.wiw_checker);
SetCookie("_wi","",null,"/",XN.ENV.domain);
}
},1000);
return true;
}
if(window.wiw){
try{
wiw.focus();
}
catch(e){
}
}
return false;
}
function talkto(uin,nick,tiny,_baa){
try{
var a=new ActiveXObject("xntalk.Application");
if(a){
a.openChat("",uin);
return true;
}
}
catch(e){
}
try{
if(top.frames["imengine"].gPagerType==4){
if(top.frames["imengine"].imHelper.isLoginUser()){
var tabs=top.frames["imengine"].imui.chatTabs;
tabs.onActivateWidget(uin,nick,tiny,_baa);
tabs.switchFocus(uin);
return true;
}
}
}
catch(e){
}
}
function jump_and_download(link){
if(XN.BROWSER.IE){
window.open(link,"download_window","toolbar=0,location=no,directories=0,status=0,scrollbars=0,resizeable=0,width=1,height=1,top=0,left=0");
window.focus();
}
}
function GetCookieVal(_70){
var _71=document.cookie.indexOf(";",_70);
if(_71==-1){
_71=document.cookie.length;
}
return unescape(document.cookie.substring(_70,_71));
}
function GetCookie(_72){
var arg=_72+"=";
var _74=arg.length;
var _75=document.cookie.length;
var i=0;
while(i<_75){
var j=i+_74;
if(document.cookie.substring(i,j)==arg){
return GetCookieVal(j);
}
i=document.cookie.indexOf(" ",i)+1;
if(i==0){
break;
}
}
return null;
}
function SetCookie(_78,_79){
var _7a=SetCookie.arguments;
var _7b=SetCookie.arguments.length;
var _7c=(_7b>2)?_7a[2]:null;
var _7d=(_7b>3)?_7a[3]:null;
var _7e=(_7b>4)?_7a[4]:null;
var _7f=(_7b>5)?_7a[5]:false;
document.cookie=_78+"="+escape(_79)+((_7c==null)?"":("; expires="+_7c.toGMTString()))+((_7d==null)?"":("; path="+_7d))+((_7e==null)?"":("; domain="+_7e))+((_7f==true)?"; secure":"");
}
if(XN.browser.Gecko&&XN.string.getQuery("debug_mode")){
XN.debug.on();
}
(function(){
var _bbe=false;
window.load_jebe_ads=function(s,r,_bc1){
if(!s){
return;
}
if(_bbe&&!_bc1){
return;
}
_bbe=true;
XN.dom.ready(function(){
if(!r){
r=location.href;
}
if(r.match(/http:\/\/www\.renren\.com\/home/ig)){
r="http://www.renren.com/Home.do";
}
var p=XN.cookie.get("id");
if(!p||XN.string.isBlank(p)){
p="";
}
var src="http://ebp.renren.com/ebpn/show?userid="+encodeURIComponent(p)+"&isvip="+XN.user.isVip+"&hideads="+XN.user.hideAds+(!XN.pageId?"":"&pageType="+XN.pageId)+"&tt="+new Date().getTime();
if(XN.app.share&&XN.app.share.pageInfo){
r=r.replace(/\?.*$/,"")+"?shareType="+XN.app.share.pageInfo.type;
}
if(r){
src+="&r="+encodeURIComponent(r);
}
XN.loadFile({file:src,type:"js"},function(){
var _bc4="http://jebe.xnimg.cn/"+jebe_json.ad_js_version+"/xn.jebe.js";
XN.loadFile({file:_bc4,type:"js"});
});
});
};
})();
XN.USER=XN.user=currentUser={};
XN.USER.me=function(_bc5){
};
XN.event.enableCustomEvent(currentUser);
XN.USER.addFriendAction=function(p){
this.config={commentLength:45,needComment:true,requestURI:"http://friend."+XN.env.domain+"/ajax_request_friend.do"};
$extend(this.config,p);
};
XN.user.addFriendAction.prototype={getConfig:function(key){
return this.config[key];
},send:function(id,why,from,code,_bcc){
var code=code!=1?0:1;
var _bcc=_bcc||"";
var This=this;
if(this.getConfig("needComment")){
if(XN.STRING.isBlank(why)){
this.fireEvent("checkError","\u60a8\u8f93\u5165\u7684\u4fe1\u606f\u4e0d\u80fd\u4e3a\u7a7a");
return;
}
}
if(why.length>this.getConfig("commentLength")){
this.fireEvent("checkError","\u60a8\u8f93\u5165\u7684\u4fe1\u606f\u4e0d\u80fd\u8d85\u8fc7"+this.getConfig("commentLength")+"\u4e2a\u5b57\u7b26");
return;
}
var data="id="+id+"&why="+why+"&codeFlag="+code+"&code="+_bcc;
if(this.getConfig("matchmaker")){
data=data+"&matchmaker="+this.getConfig("matchmaker");
}
this.fireEvent("beforePost");
new XN.NET.xmlhttp({url:this.getConfig("requestURI")+"?from="+from,"data":data,onSuccess:function(r){
r=r.responseText;
if(r&&isJSON(r)){
var re=XN.JSON.parse(r);
}else{
This.fireEvent("error");
return;
}
if(re.result=="-1"){
This.fireEvent("flagError");
return;
}
This.fireEvent("success",id,r,from);
if(!window.currentUser){
return;
}
if(currentUser.fireEvent){
currentUser.fireEvent("addFriendSuccess",id,r,from);
}
if(currentUser.onaddFriendSuccess){
currentUser.onaddFriendSuccess(id,r);
}
},onError:function(){
This.fireEvent("error",id,from);
if(!window.currentUser){
return;
}
currentUser.fireEvent("addFriendError",id,r,from);
}});
}};
XN.EVENT.enableCustomEvent(XN.USER.addFriendAction.prototype);
XN.dynamicLoad({file:"http://s.xnimg.cn/jspro/xn.app.addFriend.js",funcs:["showRequestFriendDialog"]});
XN.DOM.readyDo(function(){
if(XN.get_check){
var _bd1=Sizzle("form");
for(var i=0;i<_bd1.length;i++){
var _bd3=document.createElement("input");
_bd3.type="hidden";
_bd3.name="requestToken";
_bd3.value=XN.get_check;
_bd1[i].appendChild(_bd3);
_bd3=document.createElement("input");
_bd3.type="hidden";
_bd3.name="_rtk";
_bd3.value=XN.get_check_x;
_bd1[i].appendChild(_bd3);
}
}
});
XN.namespace("widgets");
XN.WIDGETS=XN.Widgets=XN.widgets;
function getImageType(_bd4,_bd5,_bd6,_bd7){
var type="";
if(_bd4.naturalHeight!=undefined){
if(_bd4.naturalHeight*(_bd5/_bd4.naturalWidth)<=_bd6){
type="normal";
}else{
type="too-height";
}
_bd7(type);
return;
}
if(XN.browser.IE&&parseInt(_bd4.height)==0){
var img=new Image();
img.onload=function(){
if(img.height<=_bd6){
type="normal";
}else{
type="too-height";
}
_bd7(type);
img.parentNode.removeChild(img);
};
img.width=_bd4.getAttribute("width")||_bd5;
img.style.cssText="position:absolute;top:-9999em;left:-9999em;";
document.body.appendChild(img);
img.src=_bd4.src+"?"+new Date().getTime();
}else{
if(!_bd4.getAttribute("width")){
_bd4.width=_bd5;
}
if(_bd4.height<=_bd6){
type="normal";
}else{
type="too-height";
}
_bd7(type);
}
}
function fixImage(_bda,_bdb,_bdc){
if(XN.browser.IE&&_bda.naturalHeight==undefined){
XN.dom.ready(function(){
getImageType(_bda,_bdb,_bdc,function(type){
if(type=="normal"){
return;
}else{
if(type=="too-height"){
clipImage2(_bda,_bdb,_bdc,"h");
}
}
});
});
}else{
getImageType(_bda,_bdb,_bdc,function(type){
if(type=="normal"){
_bda.width=_bdb;
return;
}else{
if(type=="too-height"){
clipImage2(_bda,_bdb,_bdc,"h");
}
}
});
}
}
function clipImage2(_bdf,w,h,type){
var _be3=document.createElement("span");
var _be4=document.createElement("i");
_be4.className=_bdf.className;
var _be5=_bdf.parentNode;
if(!_be5){
return;
}
_be3.style.cssText="display:block;zoom:1;overflow:hidden;width:"+w+"px;padding:0;margin:0;background:transparent none;";
var _be6=new Image();
_be6.onload=function(){
if(type=="h"){
var _be7=_be6.height*(w/_be6.width);
_be6.height=_be7;
_be6.width=w;
if(_be7>h){
_be3.style.height=h+"px";
}
}else{
if(type=="w"){
_be6.width=_be6.width*(h/_be6.height);
_be6.height=h;
}
}
_be6.style.cssText="display:block;margin:0 auto;";
_be3.appendChild(_be6);
_be4.appendChild(_be3);
_be5.replaceChild(_be4,_bdf);
if(true||_be5.tagName.toLowerCase()=="a"){
_be4.style.cursor="pointer";
_be5.style.textDecoration="none";
if(XN.browser.IE){
_be5.style.position="relative";
var _be8=$element("div");
_be8.style.cssText="position:absolute;top:0;left:0;cursor:pointer;width:"+_be3.style.width+";height:"+(_be3.style.height?_be3.style.height:h+"px")+";background:url(about:_blank);";
_be5.insertBefore(_be8,_be5.firstChild);
}
}
};
_be6.src=_bdf.src;
}
function clipImage(_be9){
if(!_be9.getAttribute("width")||!_be9.getAttribute("height")){
return;
}
var _bea=parseInt(_be9.getAttribute("width"));
var _beb=parseInt(_be9.getAttribute("height"));
if(_be9.naturalWidth&&_be9.naturalHeight&&_be9.naturalWidth==_bea&&_be9.naturalHeight==_beb){
return;
}
var _bec=new Image();
_bec.onload=function(){
if(_bec.width==_bea&&_bec.height==_beb){
return;
}
var _bed=document.createElement("i");
var _bee=_be9.parentNode;
if(!_bee){
return;
}
_bee.replaceChild(_bed,_be9);
_bed.style.width=_bea+"px";
_bed.style.height=_beb+"px";
if(!XN.browser.IE){
_bed.style.display="inline-block";
_bed.appendChild(_bec);
_bed.style.overflow="hidden";
if(_bec.width>_bea){
_bec.style.marginLeft="-"+parseInt((_bec.width-_bea)/2)+"px";
}
if(_bec.height>_beb){
_bec.style.marginTop="-"+parseInt((_bec.height-_beb)/2)+"px";
}
}else{
_bed.style.zoom="1";
var top=parseInt((_bec.height-_beb)/2);
_bed.style.background="url("+_be9.src+") no-repeat -"+parseInt((_bec.width-_bea)/2)+"px -"+(top>0?top:0)+"px";
if(_bed.parentNode.tagName=="A"){
_bed.style.cursor="pointer";
}
}
};
_bec.src=_be9.src;
}
function roundify(_bf0,_bf1){
if(!_bf1){
_bf1=50;
}
if(_bf0.height<=_bf1){
return;
}
var _bf2=_bf0.parentNode;
if(!_bf2){
return;
}
_bf0.style.visibility="hidden";
var _bf3=document.createElement("i");
_bf3.title=_bf0.title;
_bf3.className=_bf0.className;
if(!XN.browser.IE){
_bf3.style.display="inline-block";
}
_bf3.style.overflow="hidden";
_bf3.style.width=_bf1+"px";
_bf3.style.height=(_bf0.height>_bf1?_bf1:_bf0.height)+"px";
var _bf4=new Image();
_bf3.appendChild(_bf4);
_bf4.onload=function(){
_bf4.width=_bf1;
_bf2.replaceChild(_bf3,_bf0);
if(_bf4.height>_bf1){
_bf4.style.marginTop="-"+parseInt((_bf4.height-_bf1)/2)+"px";
}
};
_bf4.src=_bf0.src;
return;
}
(function(){
var _bf5=/kaixin\.com|renren\.com|xiaonei\.com/g;
XN.widgets.rp_domain=function rp(el){
if(el.tagName&&el.tagName.toLowerCase()=="a"){
if(el._d_rpd){
return true;
}
el._d_rpd=true;
if(/http|@/.test(el.innerHTML)&&XN.browser.IE){
var _bf7=el.innerHTML;
}
el.href=el.href.replace(_bf5,XN.env.domain);
if(!isUndefined(_bf7)){
el.innerHTML=_bf7;
}
return true;
}
return false;
};
var divs=["feedHome","newsfeed-module-box","notifications","messages"];
XN.widgets.domain_in_one={reg:function(el){
XN.event.addEvent(el,"mouseover",function(e){
var rp=XN.widgets.rp_domain;
var el=XN.event.element(e||window.event);
if(rp(el)){
return;
}
if(rp(el.parentNode)){
return;
}
rp(el.parentNode);
});
}};
XN.dom.ready(function(){
XN.array.each(divs,function(i,v){
if($(v)){
XN.widgets.domain_in_one.reg(v);
}
});
});
})();
$.wpi=$.wpi||{};
$.wpi.appNotify={element:null,init:function(){
if(this.element==null){
this.element=document.createElement("div");
this.element.className="notify-app";
this.element.innerHTML=["<div class=\"topbg\"></div>","<div class=\"innerCon\">","<h3></h3>","<a class=\"close\"><img src=\"http://a.xnimg.cn/imgpro/chat/notify-close.gif\" /></a>","<div class=\"desc\"></div>","<div class=\"action\">","<a href=\"javascript:;\" class=\"cancel\">\u53d6\u6d88\u53d1\u9001</a>","</div>","</div>","<div class=\"bottombg\"></div>","<iframe frameBorder=\"0\"></iframe>"].join("");
document.body.appendChild(this.element);
this.hackIe6();
var that=this;
var _c00=this.element.getElementsByTagName("a");
_c00[0].onclick=function(){
that.hide();
};
_c00[_c00.length-1].onclick=function(){
new XN.net.xmlhttp({url:"http://app."+XN.env.domain+"/app/notify/cancel",method:"post",data:"notifyId="+that.data.notifyId});
new XN.net.xmlhttp({url:"http://app."+XN.env.domain+"/app/notify/statistic/",method:"get",data:"op=2&app_id="+that.data.appId});
that.hide();
};
}
var _c01=this.element.getElementsByTagName("h3")[0];
var _c02="";
for(var i=0;i<this.data.receivers.length;i++){
var _c04=this.data.receivers[i];
_c02+="<a href=\"http://www."+XN.env.domain+"/profile.do?id="+_c04.id+"\" target=\"_blank\">"+_c04.name+"</a>";
if(i!=this.data.receivers.length-1){
_c02+="\u3001";
}
}
_c01.innerHTML="\u4f60\u5c06\u7ed9"+_c02+(this.data.receivers.length>1?"\u7b49\u597d\u53cb":"")+"\u53d1\u9001\u4e00\u6761\u901a\u77e5";
var _c05=XN.DOM.getElementsByClassName("desc",this.element)[0];
_c05.innerHTML=this.data.content;
},hackIe6:function(){
if(XN.browser.IE6){
var that=this;
window.attachEvent("onscroll",function(){
that.element.className=that.element.className;
});
}
},show:function(data){
if(typeof data=="string"){
this.data=XN.json.parse(data);
}
this.init();
$(this.element).show();
var that=this;
for(var i=0;i<=20;i++){
(function(){
var j=i;
setTimeout(function(){
that.element.style.bottom=(that.easing(35*j,-107,137,700))+"px";
},35*j);
})();
}
var that=this;
setTimeout(function(){
that.hide();
},5500);
new XN.net.xmlhttp({url:"http://app."+XN.env.domain+"/app/notify/statistic/",method:"get",data:"op=1&app_id="+this.data.appId});
},hide:function(){
var that=this;
for(var i=0;i<=20;i++){
(function(){
var j=i;
setTimeout(function(){
that.element.style.bottom=(that.easing(35*j,30,-137,700))+"px";
j==20?$(that.element).hide():"";
},35*j);
})();
}
},easing:function(t,b,c,d){
return c*t/d+b;
}};
(function(){
var _c12={getPageScroll:function(){
try{
var x,y;
if(window.pageYOffset){
y=window.pageYOffset;
x=window.pageXOffset;
}else{
if(document.documentElement&&document.documentElement.scrollTop){
y=document.documentElement.scrollTop;
x=document.documentElement.scrollLeft;
}else{
if(document.body){
y=document.body.scrollTop;
x=document.body.scrollLeft;
}
}
}
}
catch(e){
}
return {x:x,y:y};
},getWholeHeight:function(){
try{
if(document.documentElement){
return document.documentElement.scrollHeight;
}else{
if(document.body){
return document.body.scrollHeight;
}
}
}
catch(e){
}
},getClientHeight:function(){
if(document.documentElement){
return document.documentElement.clientHeight;
}
}};
var _c15;
var func=function(){
var _c17=_c12.getPageScroll().y+_c12.getClientHeight();
var _c18=_c12.getWholeHeight();
if(!func.loading&&_c17===_c18&&_c15!==_c18){
XN.events.fireEvent("scrollbottom");
}
_c15=_c17;
};
XN.event.addEvent(window,"scroll",func);
})();
XN.app.statsMaster={init:function(){
var j={ID:XN.cookie.get("id"),R:encodeURIComponent(location.href)};
var json=XN.JSON.build(j);
this.listener=function(e){
var e=e||window.event,_X=XN.event.pointerX(e),Y=XN.event.pointerY(e),U,T,el=XN.event.element(e),_c21=$("dropmenuHolder");
xx=XN.element.realLeft(_c21);
if(!(el&&el.tagName)){
return;
}
T=el.tagName.toLowerCase();
if(T=="a"){
U=el.href;
}
var _t=el.getAttribute("stats");
if(_t){
T=_t;
}
j.X=_X-xx;
j.Y=Y;
if(U){
j.U=encodeURIComponent(U);
}
if(T){
j.T=T;
}
json=XN.JSON.build(j);
new Image().src="http://dj."+XN.env.domain+"/click?J="+json+"&t="+Math.random();
};
XN.event.addEvent(document,"mousedown",this.listener);
if(!window.statisFocusEventAdded){
XN.event.addEvent(window,"focus",function(){
new Image().src="http://dj."+XN.env.domain+"/focus?J="+json+"&t="+Math.random();
});
window.statisFocusEventAdded=true;
}
if(!window.statisBlurEventAdded){
XN.event.addEvent(window,"blur",function(){
new Image().src="http://dj."+XN.env.domain+"/unfocus?J="+json+"&t="+Math.random();
});
window.statisBlurEventAdded=true;
}
if(!window.statisBottomEventAdded){
XN.events.addEvent("scrollbottom",function(){
new Image().src="http://dj."+XN.env.domain+"/scrollbottom?J="+json+"&t="+Math.random();
});
window.statisBottomEventAdded=true;
}
},destroy:function(){
XN.event.delEvent(document,"mousedown",this.listener);
}};
XN.dom.ready(function(){
XN.app.statsMaster.init();
});
XN.dom.ready(function(){
var _c23=false;
var _c24=true;
XN.event.addEvent(document,"mousedown",function(){
_c24=false;
});
XN.event.addEvent(window,"blur",function(){
_c24=true;
});
showConfirmDialog=function(){
var d=XN.DO.alert({title:"\u8bf7\u9886\u53d6\u60a8\u7684"+XN.env.siteName+"\u901a\u884c\u8bc1",modal:true,message:"<iframe id=\"frameactive\" width=\"410\" height=\"100%\" frameborder=\"no\" scrolling=\"no\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\" src=\"about:blank\" ></iframe>",width:454,params:{showCloseButton:true},callBack:function(){
_c23=false;
showConfirmDialog.fireEvent("close");
}});
arguments.callee.dialog=d;
d.footer.hide();
$("frameactive").src="http://channel."+XN.env.domain+"/confirm/show";
$("frameactive").contentWindow.location.href="http://channel."+XN.env.domain+"/confirm/show";
$("frameactive").addEvent("load",function(){
d.refresh();
});
};
XN.event.enableCustomEvent(showConfirmDialog);
if(!XN.cookie.get("noconfirm")){
return;
}
var _c26=setInterval(function(){
if(_c24||window.noConfirmWindow||_c23||!XN.cookie.get("noconfirm")){
return;
}
_c23=true;
XN.cookie.del("noconfirm","/",XN.env.domain);
XN.cookie.del("noconfirm","/",window.location.hostname);
showConfirmDialog();
},1000);
XN.log("\u672a\u6fc0\u6d3b\u7528\u6237\u5f15\u5bfc\u521d\u59cb\u5316over");
});
var GuidBar={bar:null,list:[],addBar:function(){
if(window!=top||this.bar!=null){
return;
}
new XN.net.xmlhttp({url:"http://browse."+XN.env.domain+"/peoplebar.do?ran="+Math.random(),method:"get",onSuccess:function(r){
var _c28=XN.json.parse(r.responseText);
if(_c28.list.length>0){
GuidBar.buildStruts(_c28);
}
}});
},buildStruts:function(obj){
this.list=obj.list;
var _c2a=["<div class=\"doing clearfix\">","<div class=\"userinfo clearfix\">","<a href=\"http://www."+XN.env.domain+"/profile.do?id="+obj.user.id+"\" class=\"avatar\">","<img src=\""+obj.user.head+"\" />","</a>","<h3>"+obj.user.name+"\uff0c\u4f60\u597d\uff01</h3>","<p>\u5f00\u59cb\u627e\u4f60\u7684\u597d\u53cb\u5427:</p>","</div>","<div class=\"users\">","<div class=\"arrow\"></div>","<ul></ul>","<div class=\"more\"><a href=\"http://friend."+XN.env.domain+"/myfriendlistx.do?_ua_flag=42&ref=guide_bar_more#item_1\">\u66f4\u591a &raquo;</a></div>","</div>","</div>"].join("");
var _c2b=this.bar=document.createElement("div");
_c2b.className="guide-top";
_c2b.innerHTML=_c2a;
var _c2c=_c2b.getElementsByTagName("ul")[0];
for(var i=0,_c2e=Math.min(this.list.length,5);i<_c2e;i++){
_c2c.appendChild(this.getFriend());
}
var _c2f=$("navBar")||document.body.firstChild;
_c2f.parentNode.insertBefore(_c2b,_c2f);
},getFriend:function(){
var list=this.list;
if(!list[0]){
return null;
}
var _c31=document.createElement("li");
_c31.className="clearfix";
_c31.innerHTML=["<a href=\"#nogo\" class=\"shut\" title=\"\u5173\u95ed\"></a>","<span class=\"headpichold\">","<a href=\"http://www."+XN.env.domain+"/profile.do?ref=peoplebar&id="+list[0].id+"\" title=\"\u67e5\u770b"+list[0].name+"\u7684\u4e2a\u4eba\u4e3b\u9875\" target=\"_blank\">","<img src=\""+list[0].head+"\" onload=\"roundify(this)\"/>","</a>","</span>","<span>","<a href=\"http://www."+XN.env.domain+"/profile.do?ref=peoplebar&id="+list[0].id+"\" class=\"name\" target=\"_blank\">"+list[0].name+"</a>","<p><a href=\"#nogo\" onclick=\"showRequestFriendDialog('"+list[0].id+"','"+list[0].name+"','"+list[0].head+"','','sg_peoplebar');return false;\" class=\"addfriend_action\"> \u52a0\u4e3a\u597d\u53cb</a></p>","</span>"].join("");
_c31.firstChild.onclick=this.replaceFriend;
list.splice(0,1);
return _c31;
},replaceFriend:function(e){
e=e||window.event;
var obj=e.target||e.srcElement;
var node=obj.parentNode;
var _c35=GuidBar.getFriend();
if(_c35){
node.parentNode.replaceChild(_c35,node);
}else{
$(node).remove();
}
return false;
}};
(function(ns){
ns.imgsChecker=function(_c37,_c38){
this.imgArry=_c37;
this.filter=_c38;
if(isUndefined(this.filter.logoWidth)){
this.filter.logoWidth=88;
}
if(isUndefined(this.filter.logoHeight)){
this.filter.logoHeight=31;
}
if(!this.filter.abortSec){
this.filter.abortSec=3;
}
if(!this.filter.maxCheckCount){
this.filter.maxCheckCount=30;
}
this.init();
};
ns.imgsChecker.prototype={init:function(){
var This=this;
this.result=[];
this.count=0;
this.stopFlag=false;
var _c3a=Math.min(This.filter.maxCheckCount,This.imgArry.length);
for(var i=0,j=_c3a;i<j;i++){
(function(_c3d){
var img=new Image();
img.src=This.imgArry[_c3d]+"?t="+Math.random();
img.loadedTag=false;
var _c3f=setTimeout(function(){
if(This.count==This.filter.limitImgs||_c3d==_c3a-1){
if(!This.stopFlag){
This.fireEvent("checkOver");
}
This.stopFlag=true;
return This.result;
}
},This.filter.abortSec*1000);
img.onload=function(){
img.loadedTag=true;
clearTimeout(_c3f);
if(This.stopFlag){
return;
}
if(This.doFilter(this)){
This.fireEvent("checkOne",this);
This.result.push(this);
}
if(This.count==This.filter.limitImgs||_c3d==_c3a-1){
This.fireEvent("checkOver");
This.stopFlag=true;
return This.result;
}
};
img.onerror=function(){
This.imgArry.splice(_c3d,1);
if(This.count==This.filter.limitImgs||_c3d==This.imgArry.length){
if(!This.stopFlag){
This.fireEvent("checkOver");
}
This.stopFlag=true;
return This.result;
}
};
})(i);
}
},doFilter:function(img){
if(img.width==this.logoWidth||img.height==this.logoHeight){
this.count++;
return true;
}
if(img.width<this.filter.minWidth||img.height<this.filter.minHeight){
return false;
}
var _c41=img.width/img.height;
var _c42=img.height/img.width;
if(_c41>this.filter.maxRatioWH||_c42>this.filter.maxRatioHW){
return false;
}
this.count++;
return true;
}};
XN.event.enableCustomEvent(ns.imgsChecker.prototype);
})(XN.widgets);
XN.Bubble=function(conf){
$extend(this,conf);
this.init();
};
XN.Bubble.prototype={bs:[],init:function(){
this.getUIRef();
this.bindEvent();
},getUIRef:function(){
this.timer=null;
this.elem=$(this.IDContainer);
this.nList=$(this.elem).getElementsByTagName("section")[0];
},bindEvent:function(){
var This=this;
this.elem.addEvent("click",function(e){
e=e||window.event;
var obj=e.srcElement||e.target;
if(obj.tagName.toLowerCase()=="a"&&obj.className.indexOf("x-to-hide")>=0){
$(obj.parentNode.parentNode).remove();
if(!XN.string.trim(This.nList.innerHTML)){
This.hide();
}
}
});
this.elem.addEvent("mouseover",function(e){
This.delTimer();
});
this.elem.addEvent("mouseout",function(e){
This.startTimer();
});
this.addEvent("view_after_hide",function(){
This.clearBs();
});
this.addEvent("bubble_bs_unshifted",function(){
This.showNtfs();
This.show();
This.startTimer();
});
},unshiftBs:function(n){
this.bs.unshift(n);
this.fireEvent("bubble_bs_unshifted",n);
},clearBs:function(){
this.bs.length=0;
},showNtfs:function(){
this.nList.innerHTML=this.makeNtfs();
},show:function(){
this.elem.show();
},hide:function(){
this.elem.hide();
this.fireEvent("view_after_hide");
},makeNtfs:function(){
var html=[];
XN.array.each(this.bs,function(i,_c4c){
html.push(_c4c.content);
});
return html.join("");
},startTimer:function(fn){
var This=this;
this.delTimer();
this.timer=setTimeout(function(){
This.hide();
},6000);
},delTimer:function(){
if(this.timer){
clearTimeout(this.timer);
}
},setNotify:function(n){
this.unshiftBs(n);
}};
XN.event.enableCustomEvent(XN.Bubble.prototype);
XN.dom.ready(function(){
var b=$("system-notification-box");
if(!b){
return;
}
window.xn_bubble=new XN.Bubble({IDContainer:"system-notification-box"});
});
XN.pagerChannelIsOk=function(_c51){
try{
if(!XN.disableWebpager){
var _c52=XN.getFileVersionNum("http://s.xnimg.cn/jspro/xn.app.webpager.js");
if(_c52){
_c52=_c52.version;
}else{
_c52="a0";
}
var _c53=_c51.wpVersion;
var _c54=parseInt(_c52.substring(1));
var _c55=parseInt(_c53.substring(1));
if(_c53&&_c55>_c54){
XN.loadFile("http://s.xnimg.cn/"+_c51.wpVersion+"/jspro/xn.app.webpager.js");
}else{
XN.loadFile("http://s.xnimg.cn/jspro/xn.app.webpager.js");
}
}
}
catch(e){
}
};
if(/\((iPhone|iPad|iPod)/i.test(navigator.userAgent)){
XN.disableWebpager=true;
}
XN.dom.ready(function(){
if(!$("navSearchInput")){
return;
}
var fix=null;
function showTip(){
if(XN.form.help("navSearchInput").getRealValue()!==""){
return;
}
if(!fix){
fix=new XN.ui.fixPositionElement({alignWith:"navSearchInput",tagName:"div"});
fix.hide();
fix.setContent("&nbsp;\u591a\u4e2a\u5173\u952e\u5b57\u7528\u7a7a\u683c\u9694\u5f00&nbsp;<br />&nbsp;\uff08\u4f8b\uff1a\u6c6a\u6d0b \u5317\u4eac\u5927\u5b66\uff09&nbsp;");
fix.container.style.cssText="width:"+($("navSearchInput").offsetWidth-2)+"px;padding:3px 0;background:#EEE;border:1px solid #BDC7D8;opacity:0.8;text-align:center;";
}
fix.show();
}
XN.event.addEvent("navSearchInput","focus",showTip);
XN.event.addEvent("navSearchInput","blur",function(){
if(fix){
setTimeout(function(){
fix.hide();
},100);
}
});
XN.event.addEvent("navSearchInput","keydown",function(){
if(fix){
fix.hide();
}
});
});
XN.dom.ready(function(){
if(!$("navSearchInput")){
return;
}
new XN.ui.navSearchBar({input:"navSearchInput",submit:$("navSearchSubmit"),form:$("globalSearchForm"),params:{page:true},tip:"\u627e\u4eba\u3001\u516c\u5171\u4e3b\u9875\u3001\u6e38\u620f"});
return;
if(!$("searchMenuAction")){
return;
}
new XN.ui.menu({bar:"searchMenuAction",menu:"searchdropdownMenu",fireOn:"mouseover",offsetX:1});
});
XN.dom.ready(function(){
window.AppsDropMenu.dropInit();
});
XN.dom.ready(function(){
if(!$("profileDropMenu")){
return;
}
var menu=new XN.ui.menu({bar:"profileDropMenu",menu:"profileMenu",offsetX:$("showProfileMenu").realLeft()-$("profileDropMenu").realLeft(),offsetY:($("showProfileMenu").realTop()+$(Sizzle("#navBar .nav-body")[0]).offsetHeight)-($("profileDropMenu").realTop()+35),fireOn:"mouseover"});
menu.onShow=function(){
$("showProfileMenu").addClass("hover");
$("profileDropMenu").addClass("drop-menu-btn-hover");
};
menu.onHide=function(){
$("showProfileMenu").delClass("hover");
$("profileDropMenu").delClass("drop-menu-btn-hover");
};
});
XN.dom.ready(function(){
if(!$("friendDropMenu")){
return;
}
var menu=new XN.ui.menu({bar:"friendDropMenu",menu:"friendMenu",offsetX:$("showFriendMenu").realLeft()-$("friendDropMenu").realLeft(),offsetY:($("showFriendMenu").realTop()+$(Sizzle("#navBar .nav-body")[0]).offsetHeight)-($("friendDropMenu").realTop()+35),fireOn:"mouseover"});
menu.onShow=function(){
$("showFriendMenu").addClass("hover");
$("friendDropMenu").addClass("drop-menu-btn-hover");
};
menu.onHide=function(){
$("showFriendMenu").delClass("hover");
$("friendDropMenu").delClass("drop-menu-btn-hover");
};
});
XN.dom.ready(function(){
if(!$("showNewNav")){
return;
}
var btns=Sizzle(".drop-menu-btn",$("navBar"));
if(btns.length==0){
return;
}
for(var i=0;i<btns.length;i++){
$(btns[i]).addEvent("click",function(e){
e.preventDefault();
});
}
});
XN.dom.ready(function(){
if(!$("optionMenuActive")){
return;
}
new XN.UI.menu({bar:"optionMenuActive",menu:"optiondropdownMenu",fireOn:"mouseover"});
});
XN.dom.ready(function(){
if(!$("accountMenu")){
return;
}
var _c5c=null;
var _c5d=20;
$("accountMenu").addEvent("mouseover",function(){
if($("otherAccount").innerHTML!=""){
return;
}
new XN.NET.xmlhttp({url:"http://www.renren.com/getOtherAccounts",method:"get",onSuccess:function(_c5e){
var r=XN.JSON.parse(_c5e.responseText),_c60=r.otherAccounts,_c61=(_c60!=null&&_c60.length!=0),_c62=(_c60!=null?_c60.length:0),_c63=getSiteName(r);
var _c64=_c62==1;
$("otherAccount").innerHTML=["<div class=\"account-detail clearfix\">","<a href=\"javascript:;\" class=\"figure\" style=\"cursor:default\">","<img src=\"",r.self_head,"\" />","</a>","<div class=\"detail\">","<p class=\"name\" title=\"",r.self_name,"\">",r.self_name,"</p>","<p class=\"grade\">",r.self_level,"\u7ea7</p>","<p class=\"friends\">",_c63,"</p>","</div>","</div>","<div class=\"action\"",_c61?"":" style=\"display:none;\"",">","<a href=\"javascript:;\" class=\"switch\" ",(_c64?" style=\"padding: 0px 12px\"":""),">",(_c64?"\u5207\u6362\u81f3"+getSiteName(_c60[0]):"\u5207\u6362\u8eab\u4efd"),"</a>","</div>"].join("");
$("otherAccount").style.display="block";
var _c65=$(Sizzle("#accountDropDownMenu a.switch")[0]);
if(window.asyncHTMLManager){
_c65.addEvent=function(type,_c67,_c68){
window.asyncHTMLManager.dom.Element.prototype.addEvent.call(_c65,type,_c67,_c68);
};
}
_c65.addEvent("click",function(){
if(_c62>1){
_c5c=XN.DO.alert({title:"\u5207\u6362\u8eab\u4efd",msg:["<div id=\"switchAccountPopup\" class=\"switch-account-popup clearfix\">","<div id=\"multiSwitchTip\" class=\"switch-tip\">","\u4f60\u53ef\u4ee5\u901a\u8fc7\u201c\u5207\u6362\u8eab\u4efd\u201d\uff0c\u4ee5\u516c\u5171\u4e3b\u9875\u7684\u8eab\u4efd\u52a0\u597d\u53cb\u3001\u56de\u8e29\u7c89\u4e1d\u3001\u4e0e\u5176\u4ed6\u4e3b\u9875\u4e92\u52a8\u3002","</div>","<div class=\"accounts-list-wrapper\">","<div id=\"anotherAccount\">",generateAccountsListHtml(0,_c62>_c5d?_c5d:_c62),"</div>","</div>","<div id=\"pagerWrapper\" class=\"accounts-pager\"><ol id=\"accountsPager\" class=\"pagerpro\"></ol></div>","</div>"].join(""),noPadding:true,button:"\u53d6\u6d88",Y:60,showCloseButton:true});
_c5c.container.className="other-accounts-alert";
window.scrollTo(0,0);
if(_c62>_c5d){
XN.loadFile("http://s.xnimg.cn/jspro/xn.ui.pager.js",function(){
var _c69=new XN.ui.pager({showCount:5,container:$("accountsPager")});
_c69.setPageCount(parseInt((_c62-1)/_c5d+1));
_c69.setCurrentPage(1);
_c69.addEvent("pageChange",function(num){
$("anotherAccount").innerHTML=generateAccountsListHtml((num-1)*_c5d,num*_c5d);
window.scrollTo(0,0);
$("anotherAccount").scrollTop=0;
});
});
}else{
if(_c62<=4){
$("anotherAccount").style.height="auto";
$("anotherAccount").style.overflow="hidden";
}else{
$("pagerWrapper").hide();
}
}
}else{
if(_c62==1){
handleSwitchButtonClick(_c60[0].head,_c60[0].name,_c60[0].id,getSiteName(_c60[0]),true);
}
}
});
function generateAccountsListHtml(_c6b,end){
var _c6d=[];
for(var i=_c6b;i<end;i++){
var _c6f=_c60[i];
if(_c6f==undefined){
break;
}
_c6d=_c6d.concat(["<div class=\"account-detail clearfix accounts-list\" style=\"",(i==_c6b?"":"border-top:1px solid #CCCCCC;"),"\">","<a href=\"","http://www.renren.com/profile.do?id=",_c6f.transId,"\" class=\"figure\">","<img src=\"",_c6f.head,"\" />","</a>","<div class=\"detail\" style=\"float:left;width:auto;height:50px;line-height:50px;\">","<p class=\"name\" title=\"",_c6f.name,"\">",cutShort(_c6f.name),"</p>","<p class=\"grade\"></p>","</div>","<div class=\"operate\">","<input class=\"input-submit\" type=\"button\" value=\"\u53d8\u8eab\" ","onclick=\"handleSwitchButtonClick('",_c6f.head,"','",cutShort(_c6f.name),"','",_c6f.id,"','",getSiteName(_c6f),"')\"/>","</div>","</div>"]);
}
return _c6d.join("");
}
}});
});
function cutShort(name){
if(!name){
return name;
}
return name.length>10?name.substring(0,10)+"...":name;
}
function getSiteName(_c71){
var _c72="\u5e10\u53f7";
if(_c71.self_isPage=="true"||_c71.isPage=="true"){
_c72="\u516c\u5171\u4e3b\u9875";
}else{
if(_c71.self_domain){
if(_c71.self_domain=="kaixin.com"){
_c72="\u5f00\u5fc3\u5e10\u53f7";
}else{
if(_c71.self_domain=="renren.com"){
_c72="\u4eba\u4eba\u5e10\u53f7";
}
}
}else{
if(_c71.domain){
if(_c71.domain=="kaixin.com"){
_c72="\u5f00\u5fc3\u5e10\u53f7";
}else{
if(_c71.domain=="renren.com"){
_c72="\u4eba\u4eba\u5e10\u53f7";
}
}
}
}
}
return _c72;
}
window.handleSwitchButtonClick=function(head,name,_c75,_c76,_c77){
new XN.NET.xmlhttp({url:"http://www.renren.com/switchAccount",data:"origUrl="+encodeURIComponent(window.location.href)+"&destId="+_c75,onSuccess:function(_c78){
if(_c5c){
_c5c.hide();
}
var r=XN.JSON.parse(_c78.responseText);
if(r.isJump){
window.location=r.url;
}else{
showUserInfoInputArea(head,name,_c75,_c76,r,_c77);
}
}});
};
function showUserInfoInputArea(head,name,_c7c,_c7d,res,_c7f){
var _c80=XN.DO.confirm({title:"\u5207\u6362\u8eab\u4efd",msg:["<div id=\"switchAccountPopup\" class=\"switch-account-popup clearfix\">","<div id=\"switchAccountError\" class=\"error-msg\" style=\"display:none\"></div>","<div class=\"account-info\">","<div class=\"account-detail clearfix\">","<a href=\"javascript:;\" class=\"figure\" style=\"cursor:default\">","<img src=\"",head,"\" />","</a>","<div class=\"detail\">","<p class=\"name\" style=\"width:60px;margin-top:16px;\" title=\"",name,"\">",name,"</p>","<p class=\"grade\"></p>","</div>","</div>","</div>","<div class=\"account-login\">","<p style=\"color:#5B5B5B;padding-left:17px;\">\u8bf7\u8f93\u5165",getSiteName(res),"\"",res.name,"\"\u5bf9\u5e94\u7684\u5bc6\u7801</p>","<div class=\"account\">","<span class=\"label\">\u5e10\u53f7:</span><span>",res.account,"</span>","</div>","<div class=\"password\">","<span class=\"label\">\u5bc6\u7801:</span><input type=\"password\" id=\"switchAccountPassword\" class=\"input-text\" />","</div>","<div id=\"verifycode\" class=\"verifycode\"",res.showIC?"":" style=\"display:none\"","><span class=\"label\">\u9a8c\u8bc1\u7801:</span><input id=\"switchVerifyCode\" type=\"text\" class=\"input-text\" name=\"ick\" /></div>","<div id=\"verifycode-image\" class=\"verifycode-image\"",res.showIC?"":" style=\"display:none\"","><img id=\"loginVerifyPic\" src=\"http://icode.renren.com/getcode.do?rk=300&t=LOGIN&rnd=",Math.random(),"\" /> <a href=\"javascript:;\" onclick=\"changeIC();return false;\">\u6362\u4e00\u4e2a</a></div>","</div>","</div>"].join(""),no:_c7f?"\u53d6\u6d88":"\u8fd4\u56de",showCloseButton:true,callback:function(r){
if(!r){
if(_c5c){
_c5c.show();
}
return;
}
this.preventHide();
new XN.NET.xmlhttp({url:"http://www.renren.com/verifypwd/checkPwd",data:"ick="+$("switchVerifyCode").value+"&pwd="+$("switchAccountPassword").value+"&origUrl="+encodeURIComponent(window.location.href)+"&destId="+_c7c+"&showIC="+($("verifycode-image").style.display!="none"),onSuccess:function(_c82){
var r=XN.JSON.parse(_c82.responseText);
if(r.status=="fail"){
$("switchAccountError").innerHTML=r.msg;
$("switchAccountError").style.display="block";
Sizzle(".account-login .verifycode")[0].style.display="block";
Sizzle(".account-login .verifycode-image")[0].style.display="block";
changeIC();
}else{
if(r.status=="ok"){
window.location=r.msg;
}
}
}});
}});
_c80.container.className="account-login-alert";
}
window.changeIC=function(){
$("loginVerifyPic").src="http://icode.renren.com/getcode.do?rk=300&t=LOGIN&rnd="+Math.random();
};
new XN.ui.menu({bar:"accountMenu",menu:"accountDropDownMenu",fireOn:"mouseover",alignType:"3-2"}).onShow=function(){
if($("accountMenuTip")){
$("accountMenuTip").hide();
new XN.NET.xmlhttp({url:"http://www."+XN.env.domain+"/closeShowNewHeaderTip"});
}
};
});
XN.dom.ready(function(){
if(!$("accountMenu")||!$("isShowNewHeaderTip")){
return;
}
var tip=$element("div");
tip.id="accountMenuTip";
tip.innerHTML=["<div class=\"clearfix\" style=\"border:1px solid #FF9900;background:#FFFCC3;color:#5B5B5B;width:170px;height:30px;padding:8px 3px 8px 8px;overflow:hidden;\">","<a href=\"javascript:;\" class=\"x-to-hide\" style=\"float:right;\"></a>","<div style=\"_line-height:normal!important;\"><span style=\"color:#f00;\">\u65b0\u529f\u80fd\uff1a</span>\u70b9\u51fb\u201c\u5207\u6362\u5e10\u53f7\u201d\uff0c\u5728\u4eba\u4eba\u4e0e\u5f00\u5fc3\u5e10\u53f7\u95f4\u5207\u6362</div>","</div>","<div style=\"background:url(http://a.xnimg.cn/imgpro/arrow/tip-arrow-up.png) 0 0 no-repeat;width:11px;height:6px;margin-top:-53px;margin-left:155px;_position:relative;\"></div>"].join("");
$(Sizzle("a.x-to-hide",tip)[0]).addEvent("click",function(){
tip.hide();
new XN.NET.xmlhttp({url:"http://www."+XN.env.domain+"/closeShowNewHeaderTip"});
});
new XN.ui.fixPositionElement({id:tip,alignWith:"accountMenu",alignType:"3-2",offsetY:3});
});
XN.dom.ready(function(){
if(!$("moreWeb")){
return;
}
new XN.UI.menu({bar:"moreWeb",menu:"moredownWeb",fireOn:"click",alignType:"3-2",offsetX:1});
});
object.define("xn.mention","dom",function(_c85,_c86,_c87){
var dom=_c85("dom");
var _c89=function(obj,item,cb){
if(obj.mentionInited){
return;
}
obj.mentionInited=true;
_c85.async("xn/mentionMain",function(_c8d){
_c8d.Mention.init({obj:item.obj,ugcId:item.ugcId||"",ugcType:item.ugcType||"",ownerId:item.ownerId||"",scrollable:item.scrollable||false,popTop:item.popTop||false,whisper:item.whisper||true,button:item.button||null});
if(cb){
cb();
}
});
};
var _c8e=function(obj,e){
if(e){
XN.event.stop(e);
}
dom.wrap(obj);
if(XN.browser.WebKit){
obj.focus();
obj.blur();
}
obj.focusToPosition(obj.get("selectionStart"));
var _c91=function(){
var _c92="@",_c93=XN.form.help(obj).getRealValue();
var cpos=obj.get("selectionStart");
if(_c93.slice(cpos-1,cpos)=="@"){
_c92="";
}
obj.value=_c93.slice(0,cpos)+_c92+_c93.slice(cpos);
obj.focusToPosition(cpos+_c92.length);
obj.mention.check();
};
if(XN.browser.IE){
setTimeout(_c91,0);
}else{
_c91();
}
};
this.Mention={init:function(list){
for(var i=0;i<list.length;i++){
(function(item){
var obj=item.obj;
if(obj.mention){
return;
}
obj=$(obj);
obj.addEvent("focus",function(){
_c89(obj,item);
});
if(item.button){
XN.event.addEvent(item.button,"click",function(e){
if(obj.mention){
_c8e(obj,e);
}else{
_c89(obj,item,function(){
_c8e(obj,e);
});
}
});
}
})(list[i]);
}
}};
});
object.use("xn.mention",function(xn){
window.Mention=xn.mention.Mention;
});
object.add("xn.appsDropMenu","dom, events, ua",function(_c9b,dom,_c9d,ua){
var _c9f=XN.element.hasClassName;
var _ca0=XN.element.addClass;
var _ca1=XN.element.delClass;
var _ca2=XN.element.realLeft;
var _ca3=XN.element.realTop;
var _ca4=6;
var _ca5=32;
var _ca6=12;
var _ca7=1;
var _ca8=0;
var _ca9=null;
var _caa=false;
var _cab=[];
var _cac=0;
var _cad=null;
this.dropInit=function(){
this.oAppDropMenu=$("appDropMenu");
this.oAppsWrap=$("appsMenuPro");
var that=this;
if(!this.oAppDropMenu||!this.oAppsWrap){
return;
}
this.oAppDropMenu.addEvent("mouseover",function(e){
if(window.appsMenuHideTimer){
clearTimeout(window.appsMenuHideTimer);
window.appsMenuHideTimer=null;
}
window.appsMenuShowTimer=setTimeout(function(){
showAppsMenu(e);
},200);
},false);
this.oAppDropMenu.addEvent("mouseleave",function(e){
if(window.appsMenuHideTimer){
clearTimeout(window.appsMenuHideTimer);
window.appsMenuHideTimer=null;
}
if(window.appsMenuShowTimer){
clearTimeout(window.appsMenuShowTimer);
window.appsMenuShowTimer=null;
}
if(XN.browser.IE){
if(this.contains(e.toElement)){
return;
}
}
hideAppsMenu(e);
});
this.oAppsWrap.addEvent("mouseover",function(e){
if(window.appsMenuHideTimer){
clearTimeout(window.appsMenuHideTimer);
window.appsMenuHideTimer=null;
}
},false);
this.oAppsWrap.addEvent("mouseout",function(e){
if(XN.browser.IE){
if(this.contains(e.toElement)){
return;
}
}
hideAppsMenu(e);
},false);
function showAppsMenu(e){
var oNav=Sizzle(".navigation-wrapper",$("navBar"))[0];
if(that.oAppsWrap.children.length==0&&!window.AppsDropMenu._loaded){
window.AppsDropMenu._loaded=true;
new XN.net.xmlhttp({url:"http://apps.renren.com/menu/getNavHtml",method:"get",onSuccess:function(r){
that.oAppsWrap.innerHTML=r.responseText;
that.oAppsWrap.style.left=$("logo2").offsetWidth+"px";
that.oAppsWrap.style.top=oNav.offsetHeight+XN.element.realTop(oNav)+"px";
that.init();
},onError:function(r){
XN.DO.showError("\u8bf7\u6c42\u5e94\u7528\u5217\u8868\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5...");
window.AppsDropMenu._loaded=false;
}});
}else{
that.oAppsWrap.style.left=$("logo2").offsetWidth+"px";
that.oAppsWrap.style.top=oNav.offsetHeight+XN.element.realTop(oNav)+"px";
}
if(window.appsMenuShowTimer){
clearTimeout(window.appsMenuShowTimer);
window.appsMenuShowTimer=null;
}
}
function hideAppsMenu(e){
window.appsMenuHideTimer=setTimeout(function(){
$("appsMenuPro").style.left="-9999px";
$("appsMenuPro").style.top="-9999px";
},200);
}
};
this.init=function(){
this.oMyAppsWrap=Sizzle(".my-fav-apps",this.oAppsWrap)[0];
this.oOtherAppsWrap=Sizzle(".other-apps",this.oAppsWrap)[0];
this.oAppItems=Sizzle("li.app-item",this.oAppsWrap);
if(window.asyncHTMLManager){
var that=this;
this.oAppsWrap.addEvent=function(type,_cba,_cbb){
window.asyncHTMLManager.dom.Element.prototype.addEvent.call(that.oAppsWrap,type,_cba,_cbb);
};
}
this._bindEvents();
this.pageCtrl(1);
};
this._bindEvents=function(){
var that=this;
this.oAppsWrap.addEvent("click",function(e){
var _cbe=XN.event.element(e);
var _cbf=_cbe.nodeName.toLowerCase();
if(_cbf=="em"){
e.preventDefault();
that.manageFavApp(_cbe);
}
if(_cbf=="a"&&that.getParent(_cbe,"div.page-ctrl")){
e.preventDefault();
if(_c9f(_cbe,"page-pre")){
if(_ca7>1&&!_c9f(_cbe,"disable")){
that.pageCtrl(_ca7-1);
}
}else{
if(_c9f(_cbe,"page-next")){
if(_ca7<3&&!_c9f(_cbe,"disable")){
that.pageCtrl(_ca7+1);
}
}else{
if(_c9f(_cbe,"page-1")){
if(_ca7!=1){
that.pageCtrl(1);
}
}else{
if(_c9f(_cbe,"page-2")){
if(_ca7!=2){
that.pageCtrl(2);
}
}else{
if(_c9f(_cbe,"page-3")){
if(_ca7!=3){
that.pageCtrl(3);
}
}
}
}
}
}
}
},false);
this.oAppsWrap.delegate("li.app-item-dragging","mouseout",function(e){
if(!_caa){
return;
}
var _cc1=that.getParent(XN.event.element(e),"li");
if(_caa&&_cc1==_ca9){
that.resetDraggingItemPos(e);
}
},false);
this.oAppsWrap.delegate("li.app-item a","mousedown",function(e){
e.preventDefault();
that.dragStart(e);
},false);
$(document.body).addEvent("mousemove",function(e){
that.dragProcess(e);
},false);
this.oAppsWrap.addEvent("mouseup",function(e){
that.dragEnd(e);
},false);
$(document.body).addEvent("click",function(e){
var _cc6=XN.event.element(e);
var _cc7=that.getParent(_cc6,"li");
_cac==0;
if(_cc7&&_cc7.getAttribute("data-dragging")){
e.preventDefault();
_cc7.removeAttribute("data-dragging");
}
},false);
if(ua.ua.ie==6){
this.oAppsWrap.delegate("li.app-item a","mouseover",function(e){
var _cc9=XN.event.element(e);
Sizzle("em",this)[0].style.display="block";
if(_cc9.nodeName.toLowerCase()=="em"){
if(that.oMyAppsWrap.contains(_cc9)){
_cc9.style.backgroundPosition="-19px -19px";
}else{
_cc9.style.backgroundPosition="0 -19px";
}
}
},false);
this.oAppsWrap.delegate("li.app-item a","mouseout",function(e){
var _ccb=XN.event.element(e);
if(_ccb.nodeName.toLowerCase()=="em"){
if(that.oMyAppsWrap.contains(_ccb)){
_ccb.style.backgroundPosition="-19px 0";
}else{
_ccb.style.backgroundPosition="0 0";
}
}
if(this.contains(e.toElement)){
return;
}else{
Sizzle("em",this)[0].style.display="none";
}
},false);
}
};
this.bindDragDropEvent=function(){
for(var i=0,len=this.oAppItems.length;i<len;i++){
this.oAppItems[i].ondragstart=function(e){
};
}
this.oMyAppsWrap.ondragenter=function(e){
};
this.oMyAppsWrap.ondragover=function(e){
};
$("dropHereTest").ondrop=function(e){
alert("fav drop");
};
};
this.manageFavApp=function(_cd2){
var _cd3=this.getParent(_cd2,"li");
if(_c9f(_cd2,"cancel-fav")){
this.cancelFav(_cd3);
}else{
if(_c9f(_cd2,"to-fav")){
this.fav(_cd3);
}
}
};
this.fav=function(_cd4){
var _cd5=_cd4.cloneNode(true);
var _cd6=this.oMyAppsWrap;
var _cd7=Sizzle("ul.apps-list",_cd6)[0];
var _cd8=Sizzle("li.app-item-empty",_cd6);
var _cd9=Sizzle("li[data-holder]",_cd6)[0];
var oBtn=Sizzle("em",_cd5)[0];
var oTip=Sizzle("h4",_cd6)[0];
var _cdc=Sizzle("li.app-item",_cd6).length;
var _cdd=[];
var _cde=_cd4.getAttribute("data-aid");
if(_cdc>=_ca4){
var _cdf=Sizzle("li.app-item",_cd7)[_cdc-1];
var _ce0=Sizzle("ul.apps-list",this.oOtherAppsWrap)[0];
var _ce1=Sizzle("em",_cdf)[0];
_cdf.style.display="";
_ce0.insertBefore(_cdf,_ce0.firstChild);
_cdf.setAttribute("data-faved","f");
_ce1.className="to-fav";
_ce1.setAttribute("title","\u7f6e\u9876");
}
if(_cdc>=3){
oTip.style.display="none";
}
oBtn.className="cancel-fav";
oBtn.setAttribute("title","\u53d6\u6d88\u7f6e\u9876");
if(this.cancelFavTimer){
this.clearCancelFavTimer();
}
_cd5.setAttribute("data-faved","t");
if(_cd9){
_cd7.replaceChild(_cd5,_cd9);
}else{
_cd7.insertBefore(_cd5,_cd7.firstChild);
if(_cd8[0]){
$(_cd8[0]).remove();
}
}
$(_cd4).remove();
this.pageCtrl(_ca7);
_cdd="["+this.getFavOrder(_cd5).join(",")+"]";
_cde=_cd5.getAttribute("data-aid");
new XN.net.xmlhttp({url:"http://apps.renren.com/menu/reorderBookmark.do",method:"post",data:"app_id="+_cde+"&app_ids="+_cdd,onSuccess:function(r){
},onError:function(r){
}});
if(ua.ua.ie==6){
Sizzle("em",_cd5)[0].style.display="none";
Sizzle("em",_cd5)[0].style.backgroundPosition="-19px 0";
}
};
this.cancelFav=function(_ce4){
var _ce5=this.oMyAppsWrap;
var _ce6=Sizzle("ul.apps-list",_ce5)[0];
var _ce7=this.oOtherAppsWrap;
var _ce8=Sizzle("ul.apps-list",_ce7)[0];
var _ce9=_ce4.cloneNode(true);
var _cea=parseInt(_ce4.getAttribute("data-aid"));
var _ceb=parseInt(_ce4.getAttribute("data-order"));
var oBtn=Sizzle("em",_ce9)[0];
var oTip=Sizzle("h4",_ce5)[0];
var _cee=Sizzle("li.app-item",_ce5).length;
var apps=Sizzle("li.app-item",_ce7);
var _cf0=apps.length;
var _cf1=1;
var _cf2=_cf0;
if(this.cancelFavTimer){
this.clearCancelFavTimer();
}
oBtn.className="to-fav";
oBtn.setAttribute("title","\u7f6e\u9876");
_ce9.setAttribute("data-faved","f");
for(var i=0,len=apps.length;i<len;i++){
if(_ceb<parseInt(apps[i].getAttribute("data-order"))){
_cf2=i;
break;
}
}
_cf1=Math.ceil((_cf2+1)/12);
if(_cf2<_cf0){
_ce8.insertBefore(_ce9,apps[_cf2]);
}else{
_ce8.appendChild(_ce9);
}
this.pageCtrl(_ca7);
_ce4.innerHTML="<span class=\"app-holder place-tip\">\u7b2c"+_cf1+"\u9875\u53ef\u627e\u5230</span>";
_ce4.className="app-item-empty";
_ce4.removeAttribute("data-order");
_ce4.removeAttribute("data-aid");
this.cancelFavTimer=setTimeout(function(){
_ce4.innerHTML="<span class=\"app-holder\">\u62d6\u5165</span>";
_ce6.appendChild(_ce4);
if(_cee<=4){
oTip.style.display="";
}
if(this.cancelFavTimer){
this.cancelFavTimer=null;
}
},2000);
new XN.net.xmlhttp({url:"http://apps.renren.com/menu/removeBookmark.do",method:"post",data:"app_id="+_cea,onSuccess:function(r){
},onError:function(r){
}});
if(ua.ua.ie==6){
Sizzle("em",_ce9)[0].style.display="none";
Sizzle("em",_ce9)[0].style.backgroundPosition="0 0";
}
};
this.dragStart=function(e){
var _cf8=XN.event.element(e);
var _cf9=this.getParent(_cf8,"li");
if(!_cf9){
return;
}
if(_cf8.nodeName.toLowerCase()=="em"&&_cf9){
return;
}
if(_cab.length==0){
this.getFavItemsPos();
}
_caa=true;
_ca9=_cf9;
};
this.dragProcess=function(e){
if(!_caa||!_ca9){
return;
}
var _cfb=XN.event.element(e);
var _cfc=this.getParent(_cfb,"li");
if(!_cfc&&!_ca9){
return;
}
if(_cac==0){
_cac=1;
return;
}
if(!_ca9.getAttribute("data-dragging")){
_ca9=_cfc.cloneNode(true);
var _cfd;
if(_ca9.getAttribute("data-faved")=="t"){
_cfd=document.createElement("li");
_cfd.className="app-item-empty";
_cfd.innerHTML="<span class=\"app-holder\">\u62d6\u5165</span>";
_cfd.setAttribute("data-holder","t");
_cfc.parentNode.replaceChild(_cfd,_cfc);
}else{
_cfd=_cfc.cloneNode(true);
_cfd.setAttribute("data-holder","t");
_ca0(_cfd,"holder-alpha");
_cfc.parentNode.replaceChild(_cfd,_cfc);
}
this.oAppsWrap.appendChild(_ca9);
_ca9.style.position="absolute";
_ca9.style.left=(XN.element.realLeft(_cfd)-XN.element.realLeft(this.oAppsWrap))+"px";
_ca9.style.top=(XN.element.realTop(_cfd)-XN.element.realTop(this.oAppsWrap))+"px";
_ca9.className="app-item-dragging";
_ca9.setAttribute("data-dragging","t");
}else{
this.resetDraggingItemPos(e);
if(this.isInFavBox(e)){
if(this.cancelFavTimer){
this.clearCancelFavTimer();
}
var _cfe=this.getFavToIndex(_ca9);
this.addFavAppHolder(_cfe);
}
}
};
this.dragEnd=function(e){
_caa=false;
if(!_ca9||_ca9.getAttribute("data-dragging")!="t"){
return;
}
var aid=_ca9.getAttribute("data-aid");
var _d01;
var _d02=_ca9.getAttribute("data-faved");
var _d03=Sizzle("ul.apps-list",this.oMyAppsWrap)[0];
var _d04=Sizzle("li.app-item",_d03);
var oTip=Sizzle("h4",this.oMyAppsWrap)[0];
var _d06=Sizzle("li.app-item",_d03).length;
if(this.isInFavBox(e)){
if(_d02=="f"){
_d01=Sizzle("li[data-holder=t]",this.oOtherAppsWrap)[0];
_ca1(_d01,"holder-alpha");
_d01.removeAttribute("data-holder");
this.fav(_d01);
_ca9.remove();
}else{
_d01=Sizzle("li[data-holder=t]",_d03)[0];
_d03.replaceChild(_ca9,_d01);
_ca9.style.cssText="";
_ca9.className="app-item";
_ca9.removeAttribute("data-dragging");
if(_d06<3){
oTip.style.display="";
}else{
oTip.style.display="none";
}
var _d07="["+this.getFavOrder().join(",")+"]";
new XN.net.xmlhttp({url:"http://apps.renren.com/menu/reorderBookmark.do",method:"post",data:"app_ids="+_d07,onSuccess:function(r){
},onError:function(r){
}});
}
}else{
if(_d02=="f"){
_d01=Sizzle("li[data-aid="+aid+"]",this.oAppsWrap)[0];
oFavHolder=Sizzle("li[data-holder]",this.oMyAppsWrap)[0];
if(_d04.length==_ca4){
_d04[5].style.display="";
if(oFavHolder){
oFavHolder.remove();
}
}else{
if(oFavHolder){
_d03.appendChild(oFavHolder);
oFavHolder.removeAttribute("data-holder");
}
}
_ca1(_d01,"holder-alpha");
_d01.removeAttribute("data-holder");
$(_ca9).remove();
}else{
_d01=Sizzle("li[data-holder=t]",_d03)[0];
_d01.parentNode.replaceChild(_ca9,_d01);
_ca9.style.cssText="";
_ca9.className="app-item";
_ca9.removeAttribute("data-dragging");
this.cancelFav(_ca9);
}
}
_ca9=null;
};
this.getFavItemsPos=function(){
};
this.getParent=function(ele,_d0b){
var _d0c=$(ele);
var _d0d=XN.element.matchesSelector;
while(!_d0d(_d0c,_d0b)){
if(_d0c.nodeName.toLowerCase()=="body"){
return null;
}
_d0c=$(_d0c.parentNode);
}
return _d0c;
};
this.isInFavBox=function(e){
var _d0f=this.oMyAppsWrap;
var x=XN.event.pointerX(e)||e.page.x;
var y=XN.event.pointerY(e)||e.page.y;
var _d12={left:XN.element.realLeft(_d0f),top:XN.element.realTop(_d0f),right:XN.element.realLeft(_d0f)+_d0f.offsetWidth,bottom:XN.element.realTop(_d0f)+_d0f.offsetHeight};
if(x>_d12.left&&x<_d12.right&&y>_d12.top&&y<_d12.bottom){
return true;
}else{
return false;
}
};
this.getFavItemsPos=function(){
var _d13=Sizzle("li",this.oMyAppsWrap);
var _d14=_d13[0].offsetWidth;
var _d15=_d13[0].offsetHeight;
for(var i=0,len=_d13.length;i<len;i++){
var _d18={};
_d18.left=_ca2(_d13[i]);
_d18.top=_ca3(_d13[i]);
_d18.right=_ca2(_d13[i])+_d14;
_d18.bottom=_ca3(_d13[i])+_d15;
_cab.push(_d18);
_d18=null;
}
};
this.getItemPos=function(_d19){
var pos={};
var _d1b=_d19.offsetWidth;
var _d1c=_d19.offsetHeight;
pos.left=_ca2(_d19);
pos.top=_ca3(_d19);
pos.right=_ca2(_d19)+_d1b;
pos.bottom=_ca3(_d19)+_d1c;
return pos;
};
this.getFavToIndex=function(_d1d){
var _d1e=this.getItemPos(_d1d);
var _d1f=_d1d.getAttribute("data-faved");
var _d20=Sizzle("li.app-item",this.oMyAppsWrap);
var _d21=Sizzle("li",this.oMyAppsWrap);
var len=_cab.length;
var _d23=len-1;
var _d24=10000;
for(var i=0;i<len;i++){
if(Math.abs(_d1e.left-_cab[i].left)<_d24){
_d24=Math.abs(_d1e.left-_cab[i].left);
_d23=i;
}
}
if(_d23>=_d20.length){
_d23=_d20.length;
}
return _d23;
};
this.addFavAppHolder=function(_d26){
var _d27=Sizzle("ul.apps-list",this.oMyAppsWrap)[0];
var _d28=Sizzle("li.app-item",_d27);
var _d29=Sizzle("li",_d27);
var _d2a=Sizzle("li.app-item-empty[data-holder=t]",_d27)[0];
if(!_d2a){
_d2a=Sizzle("li.app-item-empty",_d27)[0];
}
if(_d2a){
if(_d28[_d26]){
_d27.insertBefore(_d2a,_d28[_d26]);
}else{
if(_d29[_d26+1]){
_d27.insertBefore(_d2a,_d29[_d26+1]);
}else{
_d27.appendChild(_d2a);
}
}
}else{
_d2a=document.createElement("li");
_d2a.innerHTML="<span class=\"app-holder\">\u62d6\u5165</span>";
_ca0(_d2a,"app-item-empty");
_d27.insertBefore(_d2a,_d28[_d26]);
_d28[_ca4-1].style.display="none";
}
_d2a.setAttribute("data-holder","t");
};
this.removeFavAppHolder=function(_d2b){
};
this.pageCtrl=function(num){
var box=Sizzle("ul.apps-list",this.oOtherAppsWrap)[0];
var oLis=Sizzle("li",box);
var _d2f=Sizzle("div.page-ctrl",this.oAppsWrap)[0];
var _d30=Sizzle("a.page-pre",_d2f)[0];
var _d31=Sizzle("a.page-next",_d2f)[0];
var _d32=Math.ceil(oLis.length/_ca6);
var _d33=(_ca7-1)*_ca6;
var _d34=_d33+_ca6-1;
var _d35=(num-1)*_ca6;
var _d36=_d35+_ca6-1;
var _d37=box.cloneNode(true);
var _d38=$("appsRallWrap");
var _d39=null;
var _d3a=3;
if(oLis.length==0){
this.pageSet(0);
return;
}else{
if(oLis.length==6){
this.pageSet(1);
return;
}else{
if(oLis.length==7){
this.pageSet(1);
return;
}
}
}
for(var i=0,len=oLis.length;i<len;i++){
oLis[i].style.display="none";
}
while(_d35<=_d36&&oLis[_d35]){
oLis[_d35].style.display="";
_d35++;
}
if(num<_ca7){
rull("right");
}else{
if(num>_ca7){
rull("left");
}
}
_ca1(Sizzle("a.page-"+_ca7,_d2f)[0],"act");
_ca0(Sizzle("a.page-"+num,_d2f)[0],"act");
if(num==1){
_ca0(_d30,"disable");
}else{
_ca1(_d30,"disable");
}
if(num==_d32){
_ca0(_d31,"disable");
}else{
_ca1(_d31,"disable");
}
_ca7=num;
_d39=Sizzle("li.app-item",box);
_d3a=Math.ceil(_d39.length/12);
if(_d3a!=_ca8){
this.pageSet(_d3a);
}
if(_ca7>_d3a){
this.pageCtrl(_d3a);
}
function rull(_d3d){
if(window.dropAppsRullTmpTimer||window.dropAppsRullTimer){
clearTimeout(window.dropAppsRullTmpTimer);
clearTimeout(window.dropAppsRullTimer);
window.dropAppsRullTmpTimer=null;
window.dropAppsRullTimer=null;
}
var _d3e=_d3d=="left"?-397:397;
var _d3f=_d3d=="left"?-45:45;
var _d40=25;
if(!_d38){
_d38=$element("div");
_d38.setAttribute("id","appsRallWrap");
_d38.style.display="none";
box.parentNode.appendChild(_d38);
}
_d38.innerHTML="";
_d38.appendChild(_d37);
_d38.style.display="";
_d37.style.marginLeft=_d3f+"px";
var _d41=window.dropAppsRullTmpTimer=setInterval(function(){
var left=_d37.style.marginLeft.split("px")[0];
if(Math.abs(parseInt(left)-_d3e)>Math.abs(_d3f)){
_d37.style.marginLeft=parseInt(left)+_d3f+"px";
}else{
clearInterval(_d41);
_d38.style.display="none";
_d38.innerHTML="";
_d37=null;
}
},_d40);
box.style.marginLeft=(0-_d3e)+"px";
var _d43=window.dropAppsRullTimer=setInterval(function(){
var left=box.style.marginLeft.split("px")[0];
if(Math.abs(parseInt(left))>Math.abs(_d3f)){
box.style.marginLeft=parseInt(left)+_d3f+"px";
}else{
box.style.marginLeft="2px";
clearInterval(_d43);
}
},_d40);
}
};
this.pageSet=function(_d45){
var _d46=Sizzle("div.page-ctrl",this.oAppsWrap)[0];
var _d47=Sizzle("a.page-1",_d46)[0];
var _d48=Sizzle("a.page-2",_d46)[0];
var _d49=Sizzle("a.page-3",_d46)[0];
var _d4a=Sizzle("a.page-pre",_d46)[0];
var _d4b=Sizzle("a.page-next",_d46)[0];
var _d4c=Sizzle("p.apps-tips",this.oAppsWrap)[0];
var _d4d=Sizzle("a.apps-center-btn",this.oAppsWrap)[0];
var _d4e=Sizzle("li.app-item",this.oOtherAppsWrap).length;
switch(_d45){
case 0:
_d46.style.display="none";
_d4c.style.display="";
_d4d.style.display="";
break;
case 1:
_d47.style.display="";
_d48.style.display="none";
_d49.style.display="none";
_ca0(_d4b,"disable");
_ca0(_d4a,"disable");
if(_d4e<=6){
_d46.style.display="none";
_d4d.style.display="";
_d4c.style.display="";
}else{
_d46.style.display="";
_d4d.style.display="none";
_d4c.style.display="none";
}
break;
case 2:
_d47.style.display="";
_d48.style.display="";
_d49.style.display="none";
_d46.style.display="";
_d4c.style.display="none";
_d4d.style.display="none";
break;
case 3:
_d47.style.display="";
_d48.style.display="";
_d49.style.display="";
_d46.style.display="";
_d4c.style.display="none";
_d4d.style.display="none";
break;
}
_ca8=_d45;
};
this.getItemPageIndex=function(_d4f){
var apps=Sizzle("li.app-item",this.oOtherAppsWrap);
var _d51=apps.length;
var _d52=1;
var _d53=_d51;
_d52=Math.ceil((_d53+1)/12);
};
this.getFavOrder=function(){
var apps=Sizzle("li.app-item",this.oMyAppsWrap);
var _d55=[];
for(var i=0,len=apps.length;i<len;i++){
_d55.push(apps[i].getAttribute("data-aid"));
}
return _d55;
};
this.resetDraggingItemPos=function(e){
var x=XN.event.pointerX(e)||e.page.x;
var y=XN.event.pointerY(e)||e.page.y;
_ca9.style.left=(x-XN.element.realLeft(this.oAppsWrap)-20)+"px";
_ca9.style.top=(y-XN.element.realTop(this.oAppsWrap)-20)+"px";
};
this.clearCancelFavTimer=function(){
var _d5b=Sizzle("ul.apps-list",this.oMyAppsWrap)[0];
var _d5c=Sizzle("li.app-item-empty",_d5b);
if(this.cancelFavTimer){
_d5c[0].innerHTML="<span class=\"app-holder\">\u62d6\u5165</span>";
_d5c[0].removeAttribute("data-holder");
_d5b.appendChild(_d5c[0]);
clearTimeout(this.cancelFavTimer);
this.cancelFavTimer=null;
}
};
this.setDraggingItem=function(type){
if(!type||!_ca9){
return;
}
var tmpA=Sizzle("a",_ca9)[0];
Sizzle("em",_ca9)[0].style.display="none";
if(type=="add"){
tmpA.style.border="0";
tmpA.style.backgroundColor="inherit";
tmpA.style.boxShadow="none";
_ca9.setAttribute("data-dragging","t");
}
};
this.addHolder=function(_d5f){
};
this.removeHolder=function(_d60){
};
this.debug=function(con){
var o=$("debug");
o.value=con+"\n"+o.value;
};
});
object.use("xn.appsDropMenu",function(_d63,xn){
window.AppsDropMenu=xn.appsDropMenu;
});
object.use("dom, ua, ua.extra, ua.flashdetect, ua.os",function(_d65,dom,ua){
var strs=[];
var core=ua.ua.core;
var _d6a=ua.ua.shell;
var _d6b=ua.ua[core];
if(_d6b){
strs.push(core+"="+_d6b);
}
var _d6c=ua.ua[_d6a];
if(_d6c){
strs.push(_d6a+"="+_d6c);
}
if(_d6a!="ieshell"&&ua.ua.ieshell){
strs.push("ieshell="+ua.ua.ieshell);
}
var _d6d=ua.flashdetect.getFlashVersion();
if(_d6d){
strs.push("flash="+_d6d);
}
var _d6e=ua.os.oscore;
if(_d6e!="unknown"){
strs.push("oscore="+_d6e);
var _d6f=ua.os[_d6e];
if(_d6f!="unknown"){
if(typeof _d6f!="object"){
strs.push("os_ver="+_d6f);
}else{
for(var prop in _d6f){
strs.push("os_dist="+prop);
if(_d6f[prop]!="unknown"){
strs.push("os_dist_ver="+_d6f[prop]);
}
break;
}
}
}
}
if(ua.os.resolution){
strs.push("res_width="+ua.os.resolution.width);
strs.push("res_height="+ua.os.resolution.height);
}
if(ua.os.orientation!="unknown"){
strs.push("is_mobile=true");
strs.push("orientation="+ua.os.orientation);
}else{
strs.push("is_mobile=false");
}
XN.net.sendStats("http://s.renren.com/speedstats/browser/stats.php?"+strs.join("&"));
var desc,url,key=1;
var _d74={"se360":"360\u5b89\u5168\u6d4f\u89c8\u5668","sogou":"\u641c\u72d7\u6d4f\u89c8\u5668","maxthon":"\u50b2\u6e38\u6d4f\u89c8\u5668","theworld":"\u4e16\u754c\u4e4b\u7a97\u6d4f\u89c8\u5668","qqbrowser":"QQ\u6d4f\u89c8\u5668","tt":"\u817e\u8bafTT\u6d4f\u89c8\u5668"};
var _d6a=_d74[ua.ua.shell]||"\u517c\u5bb9\u6d4f\u89c8\u5668";
if(ua.ua.ie>=6&&ua.ua.ie<7){
var now=new Date().getTime();
if(now>=1309503600000&&now<=1309514400000&&XN.cookie.get("fie")!=2){
key=2;
url="http://noie6.renren.com/";
desc="\u4eba\u4eba\u7f51\u6e29\u99a8\u63d0\u793a\uff1a\u4f18\u5316\u4e0a\u7f51\u4f53\u9a8c\uff0c\u4f53\u9a8c\u6781\u901f\u4e4b\u65c5 <a href=\"http://noie6.renren.com/down/360cse-promote\" style=\"text-decoration:none\"><img src=\"http://a.xnimg.cn/sites/noie6/res/browsers/360cse-icon.png\" style=\"vertical-align:text-bottom\" /> 360\u6781\u901f\u6d4f\u89c8\u5668</a>&nbsp;&nbsp;&nbsp;<a href=\"http://noie6.renren.com/down/sogou-promote\" style=\"text-decoration:none\"><img src=\"http://a.xnimg.cn/sites/noie6/res/browsers/sogou-icon.png\" style=\"vertical-align:text-bottom\" /> \u641c\u72d7\u9ad8\u901f\u6d4f\u89c8\u5668</a>";
}else{
if(!XN.cookie.get("fie")){
if(ua.ua.shell=="ieshell"){
url="http://noie6.renren.com/";
desc="\u81f4IE6\u7528\u6237\u7684\u4e00\u5c01\u4fe1";
}else{
url="http://dl.xnimg.cn/down/IE8-WindowsXP-x86-CHS.exe";
desc="\u5c0a\u656c\u7684\u7528\u6237\uff0c\u60a8\u76ee\u524d\u4f7f\u7528\u7684\u662fIE6\u5185\u6838\u7684"+_d6a+"\uff0c\u4e3a\u4e86\u7ed9\u60a8\u5e26\u6765\u66f4\u5feb\u901f\u3001\u66f4\u5b89\u5168\u3001\u66f4\u4f18\u8d28\u7684\u4f53\u9a8c\uff0c\u4eba\u4eba\u7f51\u5c06\u9010\u6b65\u964d\u4f4eIE6\u5185\u6838\u7684\u652f\u6301\uff0c\u6211\u4eec\u5efa\u8bae\u60a8\u5c3d\u5feb<a href=\""+url+"\">\u5347\u7ea7\u60a8\u7684\u7cfb\u7edf\u6d4f\u89c8\u5668\u4e3aIE8</a>\uff0c\u8fd9\u4e0d\u4f1a\u5bf9\u60a8\u4f7f\u7528"+_d6a+"\u4ea7\u751f\u4efb\u4f55\u5f71\u54cd\uff0c\u611f\u8c22\u60a8\u7684\u652f\u6301\u3002";
}
}
}
if(url&&desc){
dom.ready(function(){
var div=document.getElementById("ie6notice");
if(div){
div.innerHTML="<div style=\"position:relative;\"><div onclick=\"window.open('"+url+"');\" style=\"cursor:pointer;background:#FFFBC1;border-bottom:1px solid #F9B967;padding:5px;text-align:center;font-size:14px;\"><div style=\"width:965px;padding-right: 15px;\">"+desc+"</div></div><a href=\"#nogo\" onclick=\"XN.cookie.set('fie',"+key+",30,'/','renren.com');$('ie6notice').hide();return false;\" class=\"x-to-hide\" style=\"height:14px;width:14px;overflow:hidden;position:absolute;top:8px;right:10px;\" title=\"\u5173\u95ed\"></a></div>";
}
});
}
}
});
XN.dom.ready(function(){
XN.event.addEvent(document,"mouseover",function(e){
var _d78=$(XN.event.element(e||window.event));
if(!(_d78&&_d78.hasClassName&&_d78.hasClassName("share_new"))){
return false;
}
if(!window.XNShareObject){
setTimeout(function(){
XN.loadFile("http://s.xnimg.cn/jspro/xn.app.share.js",function(){
XNShareObject._register({autoRegister:false,floatMode:true});
XNShareObject.forceShowFloat(_d78);
});
},0);
}
});
});
XN.dom.ready(function(){
var _d79=window.CUR_DOMAIN_UPLOAD||"http://upload.renren.com",_d7a=false;
function isInstalledActiveXObject(){
try{
upload4=new ActiveXObject("rralbum.Uploader.4");
return true;
}
catch(e){
try{
upload4=new ActiveXObject("xnalbum.Uploader.4");
return true;
}
catch(e){
return false;
}
}
}
function popup(e){
_d7a=true;
var e=e||window.event,el=XN.event.element(e),_d7d,_d7e,_d7f=false;
if(!el){
return false;
}
if(XN.element.hasClassName(el,"flashUploader")){
_d7f=true;
}
if(el.parentNode&&XN.element.hasClassName(el.parentNode,"flashUploader")){
_d7f=true;
el=el.parentNode;
}
if(_d7f){
var img=new Image();
window.logImage=img;
img.onload=function(){
delete window.logImage;
img.onload=null;
};
img.onerror=function(){
delete window.logImage;
img.onerror=null;
};
img.src="http://upload.renren.com/photo/flash/conversion/rate/4";
e.preventDefault();
if(XN.browser.IE&&window.location.pathname!="/addphotox.do"){
if(isInstalledActiveXObject()){
window.location=_d79+"/addphotox.do";
return true;
}else{
var url="http://photo.renren.com/app/jisu/spread/status";
new XN.net.xmlhttp({url:url,method:"get",onSuccess:function(r){
var key=XN.json.parse(r.responseText);
if(key==0){
window.location=_d79+"/addphotox.do";
}else{
if(key==1){
normalFlash(el);
}
}
},onError:function(){
normalFlash(el);
}});
return true;
}
}
normalFlash(el);
}
}
function normalFlash(el){
albumId=0;
fromExistAlbum=0;
if(XN.element.hasClassName(el,"fromAlbum")){
try{
elHref=el.href;
if(elHref.indexOf("id=")>=0){
elHref=elHref.substring(elHref.indexOf("id=")+3);
elHref=elHref.substring(0,elHref.indexOf("&"));
albumId=parseInt(elHref);
if(albumId){
fromExistAlbum=albumId;
}
}
}
catch(e){
}
}
XN.loadFile("http://s.xnimg.cn/n/core/modules/flashUploader/flashUploader.js",function(){
XN.loadFile("http://s.xnimg.cn/n/core/modules/flashUploader/upload-pop-all-min.css",function(){
XN.flashUpload.initFlash(albumId);
});
});
}
function flashUploadPopup(){
if(_d7a){
return false;
}
XN.event.addEvent(document,"click",popup);
}
flashUploadPopup();
});

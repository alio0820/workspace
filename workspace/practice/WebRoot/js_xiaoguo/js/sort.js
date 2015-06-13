// JavaScript Document
function getNames(obj,name,tij)
	{	
		var p = document.getElementById(obj);
		var plist = p.getElementsByTagName(tij);
		var rlist = new Array();
		for(i=0;i<plist.length;i++)
		{if(plist[i].getAttribute("name") == name)
			{rlist[rlist.length] = plist[i];}}
		return rlist;}
function fod(obj,name)
		{
			
			var p = obj.parentNode.getElementsByTagName("li");
			var p1 = getNames(name,"f","div"); // document.getElementById(name).getElementsByTagName("div");
			for(i=0;i<p1.length;i++)
			{if(obj==p[i])
				{p[i].className = "Sort_bg_hover";
                 p1[i].className = "dis";}
				else
				{p[i].className = "Sort_bg";
				p1[i].className = "undis";}}}
				
function loadMap(name)//���ز�ͬ��ϵͳ�ĵ�ͼ
{
	//alert(name);
	var frameID=document.getElementById("checkballIFrame");
	frameID.src="http://www.baidu.com";
}

function iniApp()
{
	var divWidth=document.body.clientWidth-228;
	
	var sortDiv=document.getElementById("Sort_map");
	sortDiv.style.width=divWidth+"px";
	
}
function show(){
	var pointDiv = document.getElementById("pointDiv");
//	var bottom_hide = document.getElementById("bottom_hide");	
//	pointDiv.style.left= bottom_hide.offsetTop;
//	pointDiv.style.top = (document.body.offsetWidth-pointDiv.offsetWidth)/2;
	pointDiv.style.display="block";
}
function hide(){
	var pointDiv = document.getElementById("pointDiv");
	pointDiv.style.display="none";
}
function hideOrShowButtom(obj){
	if(document.getElementById("alert").style.display!="none")
		hideButtom(obj);
	else{
		showButtom(obj);
	}
}
function hideButtom(obj){
	var bottom = document.getElementById("alert");
	bottom.style.display="none";
	var Sort = document.getElementById("Sort");
	var Sort_map = document.getElementById("Sort_map");
	var height = main.offsetHeight+70;
	Sort.style.height=height+"px";
	Sort_map.style.height=height-5+"px";
	var src =obj.src;
	obj.src= src.replace("hide","show");
}
function showButtom(obj){
	var bottom = document.getElementById("alert");
	bottom.style.display="block";
	var Sort = document.getElementById("Sort");
	var Sort_map = document.getElementById("Sort_map");
	var height = main.offsetHeight-70;
	Sort.style.height=height+"px";
	Sort_map.style.height=height-5+"px";
	var src =obj.src;
	obj.src= src.replace("show","hide");
}
window.onresize = function(){
	iniApp();
};

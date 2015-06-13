<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>js继承</title>
    <script type="text/javascript">
    	function ClassA(sColor){
    		this.color=sColor;
    	}
    	ClassA.prototype.sayColor=function(){
    		alert(this.color);
    	};
    	function ClassB(sColor,sName){
	    	ClassA.call(this,sColor);
	    	this.name=sName;
		}
    	ClassB.prototype=new ClassA();
    	ClassB.prototype.sayName=function(){
    		alert(this.name);
    	};
    	function show(){
    		var a=new ClassA("red");
    		var b=new ClassB("blue","lhy");
    		a.sayColor();//输出red        
    		b.sayColor();//输出blue        
    		b.sayName();//输出lhy    
    	}
    	this.show();
    </script>
  </head>
  
  <body>
    
  </body>
</html>

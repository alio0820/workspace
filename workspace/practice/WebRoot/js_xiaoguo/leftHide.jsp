<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>  
    <head>  
    <title>jquery - 左边栏菜单隐藏/显示</title>  
    <script type="text/javascript" src="../jquery-1.7.1.js" ></script>  
    <script>  
      $(document).ready(function(){  
      
        /** 通过点击展开左边栏 **/  
        $("#pull").click(function(){  
          if($("#mydiv").css("left") == "0px")  
          {  
            $("#mydiv").animate({left:"-150px"});  
          }  
          else  
          {  
            $("#mydiv").animate({left:"0px"});  
          }  
        });  
          
        /** 通过鼠标进出来展开与收缩左边栏 **/  
        /**  
        $("#pull").mouseover(function(){  
          $("#mydiv").animate({left:"0px"});  
        });  
        $("#pull").mouseout(function(){  
          $("#mydiv").animate({left:"-150px"});  
        });  
        **/  
      
        /** 首页连接 **/  
        $("#aIndex").click(function(){  
          $("#maindiv").load("http://xieruilin.iteye.com/");  
        });  
      });  
    </script>  
    <style>  
      #mydiv  
      {  
        width:200px;  
        height: 100%;  
        position: absolute;  
        top:0;  
        left:-150px;  
      }  
      #maindiv  
      {  
        width:100%;  
        height: 100%;  
        background:black;  
        position: absolute;  
        top:0;  
        left:0;  
      }  
    </style>  
    </head>  
    <body>  
      
    <div id="maindiv">  
    </div>  
      
    <div id="mydiv">  
      <div style="background:blue;width:150px;height:100%;float: left;color:#FFFFFF;">  
        <a id="aIndex" href="#">首页</a>  
      </div>  
      <div style="width:50px;height:100%;float: left;">  
        <div id="pull" style="background:blue;width:50px;height:40px;color:yellow;cursor:pointer;">  
          拉  
        </div>  
      </div>  
    </div>  
      
    </body>  
    </html>  

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <title>WML</title>
  </head>
  <body>
  extern function check(x,y)
  {
      if(x!="zcd"||y!="111")
          WMLBrowser.go("#errmess");
      else
          WMLBrowser.go("#select");
  }
  extern function count()
  {
      var a=WMLBrowser.getVar("itemx");
      var momey;
      var b=WMLBrowser.getVar("num");
      if(a=='beijing')
         money=100;
      if(a=='shanghai')
         money=50;
      if(a=='shenzhen')
         money=200;
      var i=money*Lang.parseInt(b);
      var j=String.toString(I);
      WMLBrowser.setVar("total",j);
      WMLBrowser.go("#result");
  }
  
  
  
  
<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="welcome" title="welcome">
       <p>&#x5E10;&#x53F7;<input name="account" maxlength="8" /><br/>
          &#x5BC6;&#x7801;<input name="password" type="password"  maxlength="8" /><br/>
          <do type ="accept" label="login">
               <go href="a.wmls#check('$account','$password')"/>
          </do>
       </p>
    </card>
    <card id="errmess" title="error message">
       <p><do type ="accept" label="back">
               <go href="#welcome"/>
          </do>
       </p>
    </card>
    <card id="select" title="select card">
       <p>
            Please select your station:<br/>
            <select name="itemx">
                <option value="beijing" onpick="#select-x">
                beijing(100)
                </option>
                <option value="shanghai" onpick="#select-x">
                shanghai(50)
                </option>
                <option value="shenzhen" onpick="#select-x">
                shenzhen(200)
                </option>
             </select>
       </p>
    </card>
    <card id="select-x" title="$(itemx)">
        <do type ="accept" label="computer">
            <go href="a.wmls#count()"/>
        </do>
        <p>
           Yours select is
           <b><i>$(itemx)</i></b><br/>
           Please input your buy number:
           <input name="num"/>
        </p>
    </card>
    <card id="result" title="computer result">
        <p>
           $account &#x60A8;&#x597D;<br/>
           &#x5171;&#x8BA1;$total
        </p>
    </card>
</wml>          
  </body>
</html>

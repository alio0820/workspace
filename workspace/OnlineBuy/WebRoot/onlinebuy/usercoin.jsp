<!-- 由于本系统只是实现用户信息的查询功能，所以没有登录系统，在这里添加设置用户id的session语句 -->
<%session.setAttribute("USERID","1"); %>

<!-- 在JSP页面中调用JavaBean -->
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import = "com.buy.bean.coin.UsercoinSelectBean" %>
<%@page import = "com.buy.bean.coin.ConsumeSelectBean1" %>
<%@page import = "java.sql.*" %>

<!-- 实例化一个JavaBean，取名为selectUsercoinBean -->
<jsp:useBean id= "selectUsercoinBean" class="com.buy.bean.coin.UsercoinSelectBean" scope="request">
</jsp:useBean>
<jsp:useBean id= "consume" class="com.buy.bean.coin.ConsumeSelectBean1" scope="request">
</jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>导航</title>
  </head>
  
  <body topmargin="0"> 
    <!-- 在JSP中使用JavaBean,先获得session中userid的值。再根据值作为参数调用JavaBean取得用户的各个属性值，以便在JSP页面上显示 -->
    <%String ID = (String)session.getAttribute("USERID"); 
    String Balance = selectUsercoinBean.selectUsercoin(ID,0);
    String Consume = selectUsercoinBean.selectUsercoin(ID,1);
    String All = selectUsercoinBean.selectUsercoin(ID,2);
    String NAME = selectUsercoinBean.selectUsercoin(ID,3);
    String TYPE = selectUsercoinBean.selectUsercoin(ID,4);
    %>
    
    <div align= "center">
    <!-- 在页面中引用其他页面，目的在于将功能相同的部分放在同一个页面中，这样可以减少代码量，而且非常方便后期的维护，left.jsp的页面创建在下一小节介绍 -->
    <%@ include file="/onlinebuy/left.jsp"%>
    <table>
        <tr>
           <td width="10" rowspan="7" align=""center>&nbsp;</td>
           <td height="10" colspan="2" align=""center>&nbsp;</td>
        </tr>
        <tr>
           <td height="25" class="cal_content02">
               <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" class="left_td01">
                  <tr>
                      <td class="left_td1">
                          <!-- 在JSP页面中显示查询结果 -->
                          <%=NAME %>
                              您好，您的用户状态：
                          <!-- 在JSP页面中显示查询结果 -->
                          <%=TYPE %>
                      </td>
                  </tr>
               </table>
           </td>
           <td width="12" rowspan="6" align=""center>&nbsp;</td>
        </tr>
        <tr>
           <td>
              <table width="100%" border="0" cellpadding="0" cellspacing="1" class="left_content">
                  <tr>
                     <td width ="45%" height="20" class="cal_td06">
                          累计充值：
                       <!-- 在JSP页面中显示查询结果 -->
                       <%=All %>
                          电子货币
                     </td>
                  </tr>
                  <tr>
                     <td height ="20" class="cal_td06">
                          累计消费：
                       <!-- 在JSP页面中显示查询结果 -->
                       <%=Consume%>
                          电子货币
                     </td>
                  </tr>
                  <tr>
                     <td height ="20" class="cal_td06">
                          账户余额：
                       <!-- 在JSP页面中显示查询结果 -->
                       <%=Balance%>
                          电子货币
                     </td>
                  </tr>
              </table>
           </td>
       </tr>
       <tr>
           <td>
               <table width="100%" border="0" cellpadding="0" cellspacing="0">
                   <tr>
                       <td height="25" class="left_content">
                            目前您的总消费金额为：
                         <!-- 在JSP页面中显示查询结果 -->
                         <%=Consume %>
                            电子货币 记录如下：
                       </td>
                   </tr>
                   <tr>
                       <td class="left_content">
                          <table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
                             <tr>
                                 <!-- 在JSP页面显示查询结果 -->
                                 <%String id=(String)session.getAttribute("USERID");
                                 StringBuffer result= consume.selectConsume(id);
                                  %>
                                 <%=result %>
                             </tr>
                          </table>
                       </td>
                    </tr>
               </table>                                         
    </td>
    </tr>
    </table>
  </body>
</html>                      

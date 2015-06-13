<!-- 由于本系统没有登录，在这里添加设置用户id的session语句 -->
<%session.setAttribute("USERID","1"); %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- 导入JavaBean -->
<%@page import = "com.buy.bean.coin.AddcoinSelectBean" %>
<%@page import = "java.sql.*" %>
<!-- 为引入的JavaBean声明一个实例，以便以后使用 -->
<jsp:useBean id="AddcoinSelectBean" class="com.buy.bean.coin.AddcoinSelectBean" scope="request">
</jsp:useBean>
<!-- 设置JavaBean的属性值 -->
<jsp:setProperty name="selectBean" property="s_year" param="s_year"/>
<jsp:setProperty name="selectBean" property="s_day" param="s_day"/>
<jsp:setProperty name="selectBean" property="e_year" param="e_year"/>
<jsp:setProperty name="selectBean" property="e_month" param="e_month"/>
<jsp:setProperty name="selectBean" property="e_day" param="e_day"/>
<jsp:setProperty name="selectBean" property="s_month" param="s_month"/>
<jsp:setProperty name="selectBean" property="status" param="status"/>
<jsp:setProperty name="selectBean" property="num" param="num"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>导航</title>
  </head>
  <body topmargin="0">
      <div align="center">
          <!-- 在页面中引用其他页面，目的在于将功能相同的部分放在同一个页面中，这样可以减少代码量，而且非常方便后期的维护，left.jsp的页面创建在之前介绍了 -->
          <%@include file="/onlinebuy/left.jsp"%>
       <table>
          <tr>
             <td width="10" rowspan="2" align="center">
             &nbsp;
             </td>
             <td width="10" colspan="2" align="center">
             &nbsp;
             </td>
          </tr>
          <tr>
            <td height="280" valign="top" bgcolor="#FFFFFF" class="cal_content02">
             <form name="form1" action="" Method="post">
             <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                    <td height="25" class="scal_content04"><span class="scal_content04"></span>
                    <br></td>
                </tr>
                <tr>
                    <td><!-- 在JSP中使用JavaBean，先获得session中userid的值，再根据值作为参数调用JavaBean -->
                    <% String ID=(String) session.getAttribute("USERID");
                       StringBuffer result = selectBean.selectConsume(ID);%>
                    <%=result %>
                    </td>
                </tr>
                <tr>
                    <td height="25" align="left" bgcolor="#FFFFFF">
                       <table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                              <td height="40" align="left" valign="buttom" class="q03"><span class="scal_content04">您的消费情况如下：</span></td>
                          </tr>
                       </table>
                    </td>
                </tr>
                <tr>
                    <td height="48" valign="top" bgcolor="#FFFFFF">
                       <table width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                              <td height="25" class="scal_content04">
                                 <strong class="scal_content04">
                                      充值类型：
                                      <select name="status" class="gen-frame">
                                         <option selected value="0">所有类型</option>
                                         <option value="1">在线充值</option>
                                         <option value="2">个人银行充值</option>
                                         <option value="3">代理充值</option>
                                         <option value="4">汇款充值</option>
                                      </select>
                                 </strong>
                              </td>
                          </tr>
                        </table>
                     </td>
                  <tr>
                       <td height="25" align="left" bgcolor="#FFFFFF" class="scal_content04">
                           <span>充值编号：</span> 
                           <span><input name="num" class="scal_content04" size='20'></span>
                       </td>       
                  </tr>
                  <tr>
                       <td height="48" valign="top" bgcolor="#FFFFFF">
                           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td height="25">
                                  <strong class="scal_content04">充值时间：</strong>
                                </td>
                              </tr>
                              <tr>
                                 <td height="25" bycolor="#FFFFFF" class="left_content">
                                      起始时间：
                                  <select name="s_year" class="gen-frame">
                                     <option selected value="1700">请选择</option>
                                     <option>2004</option>
                                     <option>2005</option>
                                     <option>2006</option>
                                     <option>2007</option>
                                     <option>2008</option>
                                     <option>2009</option>
                                     <option>2010</option>
                                     <option>2011</option>
                                  </select>
                                       年
                                  <select name="s_month" class="gen-frame">
                                     <option selected value="1">请选择</option>
                                     <option>1</option>
                                     <option>2</option>
                                     <option>3</option>
                                     <option>4</option>
                                     <option>5</option>
                                     <option>6</option>
                                     <option>7</option>
                                     <option>8</option>
                                     <option>9</option>
                                     <option>10</option>
                                     <option>11</option>
                                     <option>12</option>
                                  </select>
                                       月
                                  <select name="s_day" class="gen-frame">
                                     <option selected value="1">请选择</option>
                                     <option>1</option>
                                     <option>2</option>
                                     <option>3</option>
                                     <option>4</option>
                                     <option>5</option>
                                     <option>6</option>
                                     <option>7</option>
                                     <option>8</option>
                                     <option>9</option>
                                     <option>10</option>
                                     <option>11</option>
                                     <option>12</option>
                                     <option>13</option>
                                     <option>14</option>
                                     <option>15</option>
                                     <option>16</option>
                                     <option>17</option>
                                     <option>18</option>
                                     <option>19</option>
                                     <option>20</option>
                                     <option>21</option>
                                     <option>22</option>
                                     <option>23</option>
                                     <option>24</option>
                                     <option>25</option>
                                     <option>26</option>
                                     <option>27</option>
                                     <option>28</option>
                                     <option>29</option>
                                     <option>30</option>
                                     <option>31</option>
                                  </select>
                                       日 -截止日期：
                                  <select name="e_year" class="gen-frame">
                                     <option selected value="1700">请选择</option>
                                     <option>2004</option>
                                     <option>2005</option>
                                     <option>2006</option>
                                     <option>2007</option>
                                     <option>2008</option>
                                     <option>2009</option>
                                     <option>2010</option>
                                     <option>2011</option>
                                  </select>
                                       年
                                  <select name="e_month" class="gen-frame">
                                     <option selected value="1">请选择</option>
                                     <option>1</option>
                                     <option>2</option>
                                     <option>3</option>
                                     <option>4</option>
                                     <option>5</option>
                                     <option>6</option>
                                     <option>7</option>
                                     <option>8</option>
                                     <option>9</option>
                                     <option>10</option>
                                     <option>11</option>
                                     <option>12</option>
                                  </select>
                                       月
                                  <select name="e_day" class="gen-frame">
                                     <option selected value="1">请选择</option>
                                     <option>1</option>
                                     <option>2</option>
                                     <option>3</option>
                                     <option>4</option>
                                     <option>5</option>
                                     <option>6</option>
                                     <option>7</option>
                                     <option>8</option>
                                     <option>9</option>
                                     <option>10</option>
                                     <option>11</option>
                                     <option>12</option>
                                     <option>13</option>
                                     <option>14</option>
                                     <option>15</option>
                                     <option>16</option>
                                     <option>17</option>
                                     <option>18</option>
                                     <option>19</option>
                                     <option>20</option>
                                     <option>21</option>
                                     <option>22</option>
                                     <option>23</option>
                                     <option>24</option>
                                     <option>25</option>
                                     <option>26</option>
                                     <option>27</option>
                                     <option>28</option>
                                     <option>29</option>
                                     <option>30</option>
                                     <option>31</option>
                                  </select>
                                       日
                              </td>
                          </tr>
                          <tr>
                              <td><input type="submit"  name="button1" value="查询" /></td>
                          </tr>
                          <tr bgcolor="#DFF1FD">
                              <td height="25" align="center" bgcolor="#FFFFFF" class="left_content"><br></td>
                          </tr>
                     </table>
                   </td>
                 </tr>
              </table>
              </form>
           </td>
           <td width="12" align="center">
               &nbsp;
           </td>
        </tr>
      </table>
    </div>    
</body>
</html>

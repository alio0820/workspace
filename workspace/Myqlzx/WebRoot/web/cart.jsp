<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.DBConn"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
     <title>购物车</title>
<link rel="stylesheet" type="text/css" href="../css/web/common.css">
<style type="text/css">
table{width:100%;border:1px solid #AACDED;border-collapse: collapse;font-size:12px;}
.title_table{border-bottom-width:0px;}
th{background-color:#EBF4FB;font-size:13px;color:#444;font-weight:normal;}
td,th{border:1px solid #AACDED;padding:3px;}
a,img{border:none;vertical-align:middle;}
.btn_div{clear:both;padding:3px;text-align: center;font-size:14px;color:#444;padding-top:30px;}
.quantity{width:30px;border:1px solid #444;}
.goodsImg{width:50px;height:50px;float:left;margin:3px;}
.goodsName{float:left;height:50px;line-height:50px;}
.sumPrice_div{font-size:12px;margin:5px 0px 30px 0px;}
.sumPrice_div span{font-size:24pt;font-family:Georgia,'Times new roman,serif';color:#FF6600;font-weight:bold;}
.sumPrice_div .sum{float:left;}
.sumPrice_div .clear{float:right;font-size:11pt;padding-right:5px;padding-top:5px;}
</style>
<script type="text/javascript">
function changeQuantity(id)
{
	var quantity_input = document.getElementById("quantity_"+id);
	if(quantity_input != null)
	{
		var quantity = quantity_input.value;
		if(isNaN(quantity) || parseInt(quantity)<0){
			alert("商品数量应该是大于等于0的整数！");
			return;
		}
		document.changeForm.gdid.value=id;
		document.changeForm.num.value=quantity;
		document.changeForm.submit();
	}
}
</script>

</head>

<body>
<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
<div id="middle_div">
	<div class="sitemap">
		您现在所在的位置：<a target="_top" href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;购物车
	</div>
	<form name="changeForm" action="CartServlet" method="post">
		<input type="hidden" name="method" value="updateNum" />
		<input type="hidden" name="gdid" value="" />
		<input type="hidden" name="num" value="">
	</form>
	<img src="../image/web/buycart_logo.gif" style="margin:8px 3px 3px 0px;" /><br />
						
	<table>
		<tr>
			<th>商品名称</th>
			<th>商品类型</th>
			<th>价格</th>
			<th>折扣</th>
			<th>数量</th>
			<th>小计</th>
			<th>操作</th>
		</tr>
		 <%
			ArrayList<GoodsInfo> hasBuyList = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
			if(hasBuyList!=null)
			{
				for(int i=0;i<hasBuyList.size();i++)
				{
					GoodsInfo gd = hasBuyList.get(i);
					out.print("<tr>");
					out.print("<td>");
					out.print("<img class='goodsImg' src='../image/products/"+gd.getPhoto()+"'/>");
					out.print("<div class='goodsName'><a href='product.jsp?gdid="+gd.getGoodsId()+"'>"+gd.getGoodsName()+"</a></div></td>");
					out.print("<td>");
					out.print("<a target='_top' href='products.jsp?typeId="+gd.getTypeId()+"'>"+DBConn.getTypeNameByGoods(gd.getTypeId())+"</a></td>");
					out.print("<td>"+gd.getPrice()+"元</td>");
					out.print("<td>"+gd.getDiscount()+"</td>");
					out.print("<td align='center'>");
					out.print("<input class='quantity' id='quantity_"+gd.getGoodsId()+"' name='num' type='text' value='"+gd.getCount()+"' />");
					out.print("</td>");
					out.print("<td>"+PublicUtil.Convert(gd.getPrice()*gd.getDiscount()*gd.getCount()/10)+"元</td>");
					out.print("<td align='center'>");
					out.print("<a href='javascript:changeQuantity("+gd.getGoodsId()+")'>更改数量</a>&nbsp;&nbsp;");
					out.print("<a href='CartServlet?method=delete&gdid="+gd.getGoodsId()+"'>删除商品</a>			</td>");
					out.print("</tr>");	
				}
			} 
			else
			{
				out.print("<tr><td colspan='7' align='center'>购物车中没有任何商品！</td></tr>");
			}
		%>
	</table>
<div class="sumPrice_div">
	<div class="sum">商品金额总计：<span>&yen;
	<%
	if(session.getAttribute("sum")==null)
	{
		session.setAttribute("sum","0.0");
		response.sendRedirect("login_register.jsp");
	}
	else
		out.print(session.getAttribute("sum")); 
	%></span>&nbsp;&nbsp;</div>
	<div class="clear"><a href="CartServlet?method=clear">清空购物车</a></div>
</div>
<div class="btn_div">
	您可以&nbsp;<a target="_top" href="CartServlet?method=pay"><img src="../image/web/jrjs.gif" /></a>
	，也可以&nbsp;<a target="_top" href="../index.jsp"><img src="../image/web/jxgm.gif" /></a>
</div>
</div>
<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
</body>
</html>

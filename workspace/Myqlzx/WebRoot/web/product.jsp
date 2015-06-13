<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.dao.GoodsInfoDAO"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.DBConn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>产品信息-千里之行，在线销售旅游产品</title>
<link rel="stylesheet" href="../css/web/common.css" type="text/css"></link>
<style type="text/css">

#goodsImg{float:left;margin-left:10px;border:1px solid #CDCDCD;width:310px;height:310px;text-align:left;overflow:hidden;}
#goodsImg .discount_div{position:absolute;left:50%;top:175px;margin-left:-490px;width:980px;z-index:1000;}
#goodsImg .discount_div div{position:relative;left:12px;top:3px;width:310px;text-align:left;color:#838181;}

#detail{float:left;text-align:left;padding-left:10px;width:350px;font-size:10pt;}
.discount {font-size:30pt;font-family:Georgia,'Times new roman,serif';color:#FF6600;font-weight:bold;}
.before_price{text-decoration:line-through;color:#878787;font-size:14pt;}
.discount_price{color:#FF5500;margin-left:10px;font-size:24pt;font-family:'宋体';font-weight:'Times new roman';}
#detail p.title{font-weight:bold;font-size:14pt;}
#op_div{border:1px solid #98BFF0;height:70px;padding:5px;background-color:#E5EAF0;color:#404040;}
#op_div .num input{width:30px;height:15px;border:1px solid #404040;}
#op_div .btn{text-align:center;padding:5px;}
#op_div .btn input{cursor:pointer;width:140px;height:37px;border:0px;background:url(../image/web/buy_button.png) no-repeat -280px 0px;margin:0px;padding:0px;}
</style>
<script type="text/javascript">
function changebg_hover(obj){
	obj.style.backgroundColor="#FFF3D9";
	obj.style.border="1px solid #E37A08";
}

function changebg_out(obj){
	obj.style.backgroundColor="#E5EAF0";
	obj.style.border="1px solid #98BFF0";
}

function submit_form(){
	var num = document.goodsForm.num.value;
	if(isNaN(num) || parseInt(num)<0){
		alert("商品数量应该是大于等于0的整数！");
		return false;
	}
	return true;
}

window.onload=function(){
	var goodsPhoto = document.getElementById("goodsPhoto");
	goodsPhoto.style.position="relative";
	goodsPhoto.style.top=(155-parseInt(goodsPhoto.height)/2)+"px";
	goodsPhoto.style.left=(155-parseInt(goodsPhoto.width)/2)+"px";
}
</script>
</head>
<body>
<%
	DecimalFormat df = new DecimalFormat("0.00");
	GoodsInfoDAO gdDAO = new GoodsInfoDAO();
	String str_gdid = request.getParameter("gdid");
	int gdid = Integer.parseInt(str_gdid);
	GoodsInfo gd = gdDAO.getGoodsInfo(gdid);
	boolean flag = false;
	flag = (gd.getDiscount()!=10);
%>
<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
<div id="middle_div">
	<div class="sitemap">
		您现在所在的位置：<a target="_top" href="index.html">网站首页</a>&nbsp;&gt;&nbsp;产品详细信息
	</div>
	<div>
		<div id="goodsImg">
			<img id="goodsPhoto" src="../image/products/<%=gd.getPhoto() %>"></img>
			<% 
				if(flag)
				{
					out.print("<div class=''>");		
					out.print("<div><span class='discount'>"+gd.getDiscount()+"折</span></div>");
					out.print("</div>");
				}
			%>
		</div>
		<div id="detail">
			<p class="title">&nbsp;</p>
			<p>
			<%
				if(flag)
				{
					out.print("原价:<span class='before_price'>&yen;"+gd.getPrice()+"</span>&nbsp;&nbsp;");
				} 
			%>
			现价:<span class="discount_price">&yen;<%= PublicUtil.Convert(gd.getDiscount()*gd.getPrice()/10)%></span></p>
			<p>商品类别：<a target="_top" href="products.jsp?typeId=<%=gd.getTypeId()%>"><%=DBConn.getTypeNameByGoods(gd.getTypeId()) %></a></p>
			<p>描述：<%=gd.getRemark() %></p>
			<form name="goodsForm" action="CartServlet" method="post" onSubmit="return submit_form()">
			<input type="hidden" name="method" value="purchase">
			<input type="hidden" name="gdid" value="<%=gd.getGoodsId()%>"> 
			  <div id="op_div" onMouseOver="changebg_hover(this)" onMouseOut="changebg_out(this)">
					<div class="num">我&nbsp;要&nbsp;买：<input type="text" name="num" value="1" />&nbsp;件</div>
					<div class="btn">
						<input type="submit" value="" />&nbsp;&nbsp;
						<a href="showCart.html">查看购物车</a>
					</div>
			  </div>
			</form>
		</div>
	</div>
</div>
<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
</body>
</html>
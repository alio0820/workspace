<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.dao.GoodsInfoDAO"%>
<%@page import="cn.edu.model.PageModel"%>
<%@page import="cn.edu.util.PageUtil"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>千里之行-在线销售旅游用品 登山攀岩器材、户外服装、户外桌椅、睡袋垫子、野营用品、野营帐篷、运动手表...</title>
<link rel="stylesheet" href="../css/web/common.css" type="text/css"></link>
<style type="text/css">

/*中部-左边产品导航*/
#middle_left_div{float:left;width:250px;margin-top:20px;}

#paihang{border:1px solid #CCE3F1;padding:3px;margin-left:3px;}
#paihang .product_title{text-align:left;color:#2F85EF;margin:0px;padding:3px;font-weight:bold;background:url(../image/web/best.gif) no-repeat left center #fff;text-indent:27px;}
#paihang table{clear:both;border-collapse:collapse;margin-top:3px;width:100%;font-size:11pt;border-spacing:0px;}
#paihang table td{border-top:1px dashed #ccc;height:35px;}
#paihang table a{display:block;color:#2C6DB2;text-decoration:none;text-indent:30px;height:17px;font-size:10pt;}
#paihang table a:hover{color:#E8860F;}
.goods_0 a{background:url(../image/web/paihang.png) no-repeat 0px -5px;}
.goods_1 a{background:url(../image/web/paihang.png) no-repeat 0px -31px;}
.goods_2 a{background:url(../image/web/paihang.png) no-repeat 0px -57px;}
.goods_3 a{background:url(../image/web/paihang.png) no-repeat 0px -83px;}
.goods_4 a{background:url(../image/web/paihang.png) no-repeat 0px -109px;}
.goods_5 a{background:url(../image/web/paihang.png) no-repeat 0px -135px;}
.goods_6 a{background:url(../image/web/paihang.png) no-repeat 0px -161px;}
.goods_7 a{background:url(../image/web/paihang.png) no-repeat 0px -187px;}
.goods_8 a{background:url(../image/web/paihang.png) no-repeat 0px -213px;}
.goods_9 a{background:url(../image/web/paihang.png) no-repeat 0px -239px;}

td.num{font-size:10pt;color:#999;text-align:right;}
td.num span{color:#E8860F;font-weight:bold;font-size:12pt;}

/*中部-右边*/
#middle_right_div{float:right;width:690px;border:0px solid blue;}

.product_table{width:100%;margin:3px;}
.product_table td{border-bottom:1px dashed #ccc;height:80px;padding:10px;}
.product_table a.img{float:left;text-decoration:none;}
.product_table img {width:100px;height:100px;border:0px;}
.product_table ul{float:left;list-style:none;width:120px;margin:3px;padding:3px;font-size:10pt;}
.product_table li .discount {font-size:12pt;font-family:Georgia,Times new roman,serif;color:#FF6600;font-weight:bold;}
.product_table li{padding-top:5px;}
.product_table li a{color:#1A66B3;text-decoration:none;}
.product_table li a:hover{text-decoration:underline;}
.product_table .before_price{text-decoration:line-through;color:#878787;font-size:11pt;}
.product_table .discount_price{color:#CC3300;margin-left:10px;font-size:11pt;}

.pager{text-align:center;height:25px;line-height:25px;border-bottom:0px;font-size:10pt;}
</style>
	</head>
	<body>
	<%
		GoodsInfoDAO gdDAO = new GoodsInfoDAO();
		String str_typeId = request.getParameter("typeId");
		int typeId = Integer.parseInt(str_typeId);
		int sumCount = gdDAO.getTypeSumCount(typeId);
		PageModel pm = PageUtil.getPageInfo(request,sumCount);
		ArrayList<GoodsInfo> gdList = gdDAO.getAllGoodsInfoList("",pm);
		boolean flag = false;
		
	%>
		<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		<div id="middle_div">
			<div class="sitemap">
				您现在所在的位置：<a target="_top" href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;分类商品
			</div>
			<div id="middle_left_div">
				<div id="paihang">
					<div class="product_title">销售排行</div>
					<table>
						
						<tr>
							<td class="">
								<a target="_top" href="product.jsp?id="></a>							</td>
							<td class="num">件</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="middle_right_div">
				<div style="margin-bottom:10px;">
					<table class="product_table">
						<tr>
					<%
						if(gdList!=null)
						{
			
	 						for(int i = 0;i<gdList.size();i++)
	 						{
								GoodsInfo gd = gdList.get(i);
								flag = gd.getDiscount()!=10;
					 			out.print("<td>");
					 			out.print("<a class='img' href='product.jsp?gdid="+gd.getGoodsId()+"'>");
					 			out.print("<img src='../image/products/"+gd.getPhoto()+"' /></a>");
					 			
					 			if(flag)
					 			{
					 				out.print("<ul><li><span class='discount'>"+gd.getDiscount()+"</span>折</li>");
					 			}		
					 			out.print("<li><a href='product.jsp?gdid="+gd.getGoodsId()+"' style='font-size:13px'>"+gd.getGoodsName()+"</a></li>");
					 			out.print("<li>");
					 			if(flag)
					 			{
					 				out.print("<span class='before_price'>&yen;"+gd.getPrice()+"</span>");
					 			}
					 			out.print("<span class='discount_price'>&yen;"+PublicUtil.Convert(gd.getDiscount()*gd.getPrice()/10)+"</span></li>");
					 			out.print("</ul>");
					 			out.print("</td>");
					 			if((i+1)%2==0)
					 			{
					 				out.print("<tr></tr>");
					 			}
 	    					} 
						}
					%>
					</tr>
					</table>
					<div class="pager">
						共有<%=pm.getSumCount()%>件商品&nbsp;&nbsp;
						第<%=pm.getCurrentPage() %>/<%=pm.getSumPage() %>页&nbsp;&nbsp;
						<a href="products.jsp?typeId=<%=typeId %>&currentPage=<%=pm.getHomePage() %>">首页</a>
						<a href="products.jsp?typeId=<%=typeId %>&&currentPage=<%=pm.getPrePage() %>">上一页</a>
						<a href="products.jsp?typeId=<%=typeId %>&&currentPage=<%=pm.getNextPage() %>">下一页</a>
						<a href="products.jsp?typeId=<%=typeId %>&&currentPage=<%=pm.getLastPage() %>">尾页</a>
					</div>
				</div>
			</div>
		</div>
		<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</body>
</html>
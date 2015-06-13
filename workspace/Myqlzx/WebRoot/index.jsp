<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.Bulletin"%>
<%@page import="cn.edu.dao.BulletinDAO"%>
<%@page import="cn.edu.dao.GoodsTypeDAO"%>
<%@page import="cn.edu.model.GoodsType"%>
<%@page import="cn.edu.dao.GoodsInfoDAO"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>千里之行-在线销售旅游用品 登山攀岩器材、户外服装、户外桌椅、睡袋垫子、野营用品、野营帐篷、运动手表...</title>
<style type="text/css">
body{text-align:center;margin:0px;}
#middle_div{width:980px;text-align:left;margin-left:auto;margin-right:auto;}

/*中部-左边产品导航*/
#middle_left_div{float:left;width:280px;}
#gonggao{border:1px solid #CCE3F1;margin-bottom:3px;padding-bottom:3px;height:155px;}
#gonggao div.title{float:left;background:url(images/gonggao.gif) no-repeat 3px 50% #fff;text-indent:30px;padding:10px 3px 3px 3px;color:#2F85EF;font-weight:bold;}
#gonggao div.more{float:right;padding:10px 3px 3px 3px;}
#gonggao div.more a{border:0px;background-image:none;}
#gonggao a{clear:both;display:block;text-decoration:none;text-align:left;color:#4B8ECE;padding:3px;text-indent:14px;font-size:10pt;border-bottom:1px dashed #CCE3F1;background:url(images/dot.png) no-repeat 8px 5px #fff;}
#gonggao a:hover{border-bottom:1px dashed #E5F0F3;color:#FE8802;background:url(images/dot.jpg) no-repeat 8px 5px #fff;}
#gonggao a span{color:#9D9898;padding-left:20px;}

#product_daohang{border:1px solid #CCE3F1;padding:3px;}
#product_daohang .product_title{text-align:left;color:#2F85EF;margin:0px;padding:3px;font-weight:bold;background:url(images/daohang.png) no-repeat left center #fff;text-indent:27px;}
#product_daohang table{clear:both;border-collapse:collapse;margin-top:3px;}
#product_daohang table .title{font-size:11pt;font-weight:bold;padding:10px 3px 10px 3px;font-family:'宋体';line-height:120%;width:20px;}
#product_daohang table a{display:block;text-decoration:none;text-align:left;color:#4B8ECE;padding:3px;text-indent:10px;font-size:10pt;border-bottom:1px dashed #fff;}
#product_daohang table a.more{text-align:right;padding-right:1em;}

#product_daohang .left_box_normal{border:1px solid #CCE3F1;background-color:#fff;}
#product_daohang .left_box_normal td.title{;color:#000;background:url(images/left_box_bg.png) no-repeat left center #E5F0F3;}

#product_daohang .left_box_hover{border:1px solid #FE8802;background-color:#FFFAE7;}
#product_daohang .left_box_hover td.title{background-color:#FFFAE7;color:#FE8802;}
#product_daohang .left_box_hover td a:hover{border-bottom:1px dashed #E5F0F3;color:#FE8802;}

/*中部-右边*/
#middle_right_div{float:right;width:690px;border:0px solid blue;}

.product_table{clear:both;width:100%;margin:3px;}
.product_table a.img{float:left;text-decoration:none;}
.product_table img {width:100px;height:100px;border:0px;}
.product_table ul{float:left;list-style:none;width:110px;margin:3px;padding:3px;font-size:10pt;}
.product_table li .discount {font-size:12pt;font-family:Georgia,Times new roman,serif;color:#FF6600;font-weight:bold;}
.product_table li{padding-top:5px;}
.product_table li a{color:#1A66B3;text-decoration:none;}
.product_table li a:hover{text-decoration:underline;}
.product_table .before_price{text-decoration:line-through;color:#878787;font-size:11pt;}
.product_table .discount_price{color:#CC3300;margin-left:10px;font-size:11pt;}
</style>
<script type="text/javascript">
function table_mouse_over(t){
	t.className="left_box_hover";
}

function table_mouse_out(t){
	t.className="left_box_normal";
}

function loadImage(){
	var images = ["images/dot.png","images/dot.jpg"];
	for(var i=0;i<images.length;i++){
		var image = new Image();
		image.src=images[i];
	}
}
</script>
</head>
	<body onLoad="loadImage()">
		<a href="index.jsp">
		<iframe src="web/top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</a>
		<div id="middle_div">
			<div id="middle_left_div">
				<div id="gonggao">
					<div class="title">网站公告</div>
					<div class="more"><a href="web/showBulletinList.jsp?currentPage=1">更多&gt;&gt;</a></div>
					<%
						DecimalFormat df = new DecimalFormat("0.00");
						BulletinDAO btDAO = new BulletinDAO();
						ArrayList<Bulletin> btList = btDAO.getTopFiveBulletinList();
						if(btList!=null)
						{
							for(int i = 0 ;i<btList.size();i++) 
							{
								Bulletin bt = new Bulletin();
								bt = btList.get(i);
								out.print("<a href='web/Bulletin.jsp?btid="+bt.getId()+"' title = '"+bt.getTitle()+"'>"+bt.getTitle()+"&nbsp;&nbsp;&nbsp;&nbsp;<span>"+bt.getCreateTime()+"</span></a>");
							} 
						}
					%>
				</div>
			  <div id="product_daohang">
				<div class="product_title">产品导航</div>
				<%
					GoodsTypeDAO gdDAO = new GoodsTypeDAO();
					ArrayList<GoodsType> gdList = gdDAO.getAllGoodsType();
					GoodsInfoDAO gdInfoDAO = new GoodsInfoDAO(); 
					
					if(gdList!=null)
					{
						for(int i = 0;i < gdList.size();i++)
						{
							GoodsType gd = gdList.get(i);
							ArrayList<GoodsInfo> gdInfoList = gdInfoDAO.getFiveGoodsInfo(gd.getTypeId());
							if(gdInfoList.size()>0)
							{
								out.print("<table class='left_box_normal' onMouseOver='table_mouse_over(this)' onMouseOut='table_mouse_out(this)'>");
								out.print("<tr>");
								out.print("<td class='title'>"+gd.getTypeName()+"</td>");
								out.print("<td width='250px'>");
											
								if(gdInfoList!=null)
								{
									for(int j=0;j<gdInfoList.size();j++)
									{
										GoodsInfo gdInfo =gdInfoList.get(j);
										out.print("<a href='web/product.jsp?gdid="+gdInfo.getGoodsId()+"'>"+gdInfo.getGoodsName()+"</a>");
									}
								}
								out.print("<a class='more' href='web/products.jsp?typeId="+gd.getTypeId()+"'>更多&gt;&gt;</a></td>");
								out.print("</tr>");
								out.print("</table>");
							}	
						}
					}
				%>						
			</div>
			</div>
			<div id="middle_right_div">
				<div style="margin-bottom:10px;">
					<div style="height:38px;border-bottom:1px solid #888888;">
						<img src="image/web/recommend2.gif" height="33"></img>
					</div>
					<table class="product_table">
					<tr>
					<%
						GoodsInfoDAO ReconmendDAO = new GoodsInfoDAO();
						ArrayList<GoodsInfo> reconmendList = ReconmendDAO.getTopNineGoodsInfo(0);
						boolean flag = false;//判断是否是打折产品
						if(reconmendList!= null)
						{
							for(int i=0;i<reconmendList.size();i++)
							{
								GoodsInfo goods = reconmendList.get(i);
								flag = (goods.getDiscount()!=10.0f);
								out.print("<td>");
								out.print("<a class='img' href='web/product.jsp?gdid="+goods.getGoodsId()+"'><img src='image/products/"+goods.getPhoto()+"' /></a>");
								out.print("<ul>");
								out.print("<li><a href='web/product.jsp?gdid="+goods.getGoodsId()+"'>"+goods.getGoodsName()+"</a></li>");
								out.print("<li>");
								if(flag)
								{
									out.print("<span class='discount'>"+goods.getDiscount()+"</span>折");
									out.print("<span class='before_price'>"+goods.getPrice()+"</span>");
								}
								out.print("<span class='discount_price'>&yen;"+Float.parseFloat(df.format((goods.getDiscount()*goods.getPrice())/10))+"</span>");
								out.print("</li>");
								out.print("</ul>");
								out.print("</td>");
								if((i+1)%3==0)
								{
									out.print("<tr></tr>");
								}
							}
						}
					%>
					</tr>
					</table>
				</div>
				<div style="margin-bottom:15px;">
					<div style="height:27px;border-bottom:1px solid #53BEE6;">
						<img src="image/web/newproduct5.gif" height="22px"></img>
					</div>
					<table class="product_table">
						<tr>
					<%
						GoodsInfoDAO newDAO = new GoodsInfoDAO();
						ArrayList<GoodsInfo> newList = newDAO.getTopNineGoodsInfo(1);
						if(reconmendList!= null)
						{
							for(int i=0;i<newList.size();i++)
							{
								GoodsInfo goods = newList.get(i);
								flag = (goods.getDiscount()!=10.0f);
								out.print("<td>");
								out.print("<a class='img' href='web/product.jsp?gdid="+goods.getGoodsId()+"'><img src='image/products/"+goods.getPhoto()+"' /></a>");
								out.print("<ul>");
								out.print("<li><a href='web/product.jsp?gdid="+goods.getGoodsId()+"'>"+goods.getGoodsName()+"</a></li>");
								out.print("<li>");
								if(flag)
								{
									out.print("<span class='discount'>"+goods.getDiscount()+"</span>折");
									out.print("<span class='before_price'>"+goods.getPrice()+"</span>");
								}
								out.print("<span class='discount_price'>&yen;"+Float.parseFloat(df.format((goods.getDiscount()*goods.getPrice())/10))+"</span>");
								out.print("</li>");
								out.print("</ul>");
								out.print("</td>");
								if((i+1)%3==0)
								{
									out.print("<tr></tr>");
								}
							}
						}
					%>
					</tr>
					</table>
				</div>
			
				<div style="margin-bottom:10px;">
					<div style="height:25px;border-bottom:1px solid #5FCB95;">
						<img src="image/web/specilproduct2.gif" height="20"></img>
					</div>
					<table class="product_table">
					<tr>
					<%
						GoodsInfoDAO upDAO = new GoodsInfoDAO();
						ArrayList<GoodsInfo> upList = upDAO.getTopNineGoodsInfo(2);
						if(reconmendList!= null)
						{
							for(int i=0;i<newList.size();i++)
							{
								GoodsInfo goods = upList.get(i);
								flag = (goods.getDiscount()!=10.0f);
								out.print("<td>");
								out.print("<a class='img' href='web/product.jsp?gdid="+goods.getGoodsId()+"'><img src='image/products/"+goods.getPhoto()+"' /></a>");
								out.print("<ul>");
								out.print("<li><a href='web/product.jsp?gdid="+goods.getGoodsId()+"'>"+goods.getGoodsName()+"</a></li>");
								out.print("<li>");
								if(flag)
								{
									out.print("<span class='discount'>"+goods.getDiscount()+"</span>折");
									out.print("<span class='before_price'>"+goods.getPrice()+"</span>");
								}
								out.print("<span class='discount_price'>&yen;"+Float.parseFloat(df.format((goods.getDiscount()*goods.getPrice())/10))+"</span>");
								out.print("</li>");
								out.print("</ul>");
								out.print("</td>");
								if((i+1)%3==0)
								{
									out.print("<tr></tr>");
								}
							}
						}
					%>
					</tr>
					</table>
				</div>
			</div>
		</div>
		<iframe src="web/bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</body>
</html>
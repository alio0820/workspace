<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="head.jsp"%>
	<style>
		.container{
			font: 12px/1.5 Microsoft YaHei,Arial,Helvetica,sans-serif,'宋体';
		}
		.container ul{
			margin:10px;
			padding:0px;
		}
		.container li{
			list-style:none;
			line-height:25px;
			padding-left:10px;
		}
		.container a:link,.container a:visited{
		    color: #333333;
		    text-decoration: none;
		    transition: all 0.5s linear 0s;
		}
		.container a:hover {
		    color: #008000;
		    text-decoration: none;
		}
		.container #main {
		    margin: 50px auto;
		    min-height: 600px;
		    min-width: 1024px;
		    position: relative;
		    width: 90%;
		}
		.container #sideBar {
		    color: #666666;
		    float: left;
		    padding: 10px;
		    width: 210px;
		}
		.container .catListTitle {
		    border-bottom: 1px dashed #CCCCCC;
		    color: #333333;
		    font-weight: bold;
		    height: 35px;
		    line-height: 35px;
		}
		.container #profile_block {
		    line-height: 1.5;
		    margin-top: 5px;
		    text-align: left;
		}
		.container .search_part{
			margin-top:5px;
			text-align:left;
			line-height:20px;
		}
		.container #mainContent {
		    float: right;
		    margin-left: -230px;
		    width: 100%;
		}
		.container .forFlow {
			background: url("images/border.gif") repeat-y scroll 0 0 rgba(0, 0, 0, 0);
		    margin-left: 230px;
		    min-height: 600px;
		    padding: 20px;
		}
		.container .contentpart{
			width:100%;
			border-radius:3px;
			margin-top:10px;
			border: 1px solid #E0E0E3;
    		box-shadow: 0 1px 1px #DDDDDD;
    		background:#FFFFFF;
		}
		.container .contentpart:hover{
			border:1px solid #C6C6C6;
		}
		.container .contentpart .header{
			height:30px;
			line-height:30px;
			padding-left:10px;
			cursor:pointer;
			-moz-user-select:none;
		}
		.container .contentpart .content{
			border-top:1px solid #E4E4E4;
		}
		.container .contentpart li:hover{
			background:none repeat scroll 0 0 #FAF4FF;
		}
		.container .contentpart .content_info{
			margin:10px;
		}
	</style>
 	<script src="js/clock.js"></script>
 	<script>
 		$(document).ready(function(){
 			$('.contentpart .header').click(function(){
 	 			$(this).next().slideToggle();
 	 		});
 		});
 	</script>
    <div id="main">
    	<div id="mainContent">
    		<div class="forFlow">
    			<div class="contentpart">
    				<div class="header">最近更新</div>
    				<div class="content">
    					<ul>
    						<li><a href="javascript:void(0)">君子“动口”，淑女可留？</a></li>
    						<li><a href="javascript:void(0)">中国首次出版赫哲族鱼皮艺术图本</a></li>
    						<li><a href="javascript:void(0)">济南打掉一利用航空快递跨省贩毒团伙 抓获3嫌犯</a></li>
    						<li><a href="javascript:void(0)">中国石油系反腐调查扩大</a></li>
    						<li><a href="javascript:void(0)">业内人士：今年贺岁档票房负增长或已成定局</a></li>
    						<li><a href="javascript:void(0)">港股17日跌0.2% 收报23069.23点</a></li>
    						<li><a href="javascript:void(0)">上海家化24亿关联交易曝光 管委会退出沪江日化</a></li>
    						<li><a href="javascript:void(0)">英国11月通胀率降至2.1%</a></li>
    						<li><a href="javascript:void(0)">《辛亥革命时期福建华侨报人史》出版</a></li>
    					</ul>
    				</div>
    			</div>
    			<div class="contentpart">
    				<div class="header">需要做的事</div>
    				<div class="content">
    					<ul>
    						<li><a href="javascript:void(0)">阅读书籍</a></li>
    						<li><a href="javascript:void(0)">制定计划</a></li>
    						<li><a href="javascript:void(0)">拿衣服</a></li>
    					</ul>
    				</div>
    			</div>
    			<div class="contentpart">
    				<div class="header">焦点关注</div>
    				<div class="content">
    					<ul>
    						<li><a href="javascript:void(0)">第三次全国经济普查:盘点家底 服务民生</a></li>
    						<li><a href="javascript:void(0)">中国驻摩洛哥大使赞恒大:虽实力悬殊 但虽败犹荣</a></li>
    						<li><a href="javascript:void(0)">苹果iPhone4长沙年末大促销1399元</a></li>
    						<li><a href="javascript:void(0)">中国三江源地区土地沙化得到遏制 沙漠化面积减少</a></li>
    						<li><a href="javascript:void(0)">中国新型城镇化保护传统“乡愁”</a></li>
    					</ul>
    				</div>
    			</div>
    			<div class="contentpart">
    				<div class="header">习惯养成记</div>
    				<div class="content">
    					<div class="content_info">
    						<p>美国心理学巨匠威廉·詹姆斯有一段对习惯的经典注释：“种下一个行动，收获一种行为；种下一种行为，收获一种习惯；种下一种习惯，收获一种性格；种下一种性格，收获一种命运。”</p>
							<p>习惯是一种长期形成的思维方式、处世态度，习惯是由一再重复的思想行为形成的，习惯具有很强的惯性，象转动的车轮一样。人们往往会不由自主地启用自己的习惯，不论是好习惯还是不好的习惯，都是如此。可见习惯的力量——不经意会影响人的一生。</p>
							<p>一般来说，习惯可以在有目的、有计划的训练中形成，也可以在无意识状态中形成。而良好的习惯必然在有意识的训练中形成，不允许也不可能在无意识中自发的形成，这是好习惯与不良习惯的根本区别。相对于其他习惯而言，不良习惯形成以后，要改变它是十分困难的，俗话说：“江山易改，本性难移。”从根本上说，任何一个好习惯的养成都不会是轻而易举的。</p>
							<p>要培养一个好习惯，首先必须要研究它的重要性，因为只有明白了它的重要性，才会有培养这个习惯的强烈愿望。</p>
							<p>二是对所培养的习惯进行必要性，可行性的分析，从某种意义说，克服一个坏习惯，培养一个好习惯是人生最难的，而又是对人生最有价值的。因此，要培养一个习惯，开始前的可行性的分析很重要，这样使你建立在理智和科学的基础上。否则，头脑一热，盲目去做，常常会半途而废。</p>
							<p>三要培养好习惯，就要：“统筹安排，逐一击破。”我们知道，人的习惯实现是一个庞大的体系，它像一棵大树一样，有干、有枝、有叶。它可以是我们工作方面的习惯，也可以是学习方面的，健康方面的，感情方面的。与人相处方面的各种习惯，也可以是思维方式的习惯，也可以是行为方式习惯。因此当我们明白习惯对我们人生和命运的重要性后，要对准备培养的习惯作统筹安排。这样可以分清主次，明确先后，然后有步骤的去培养，就会更有成效。</p>
							<p>从根本上说，任何一个好习惯的培养都不会是轻而易举的，因此，我们一定要循序渐进，由浅入深，由近及远。尤其开始是我们要宁少勿多、宁简勿繁、宁易勿难。先找一个比较容易做到的，做起来有兴趣的，很快就能尝到甜头的，而且能不断受到自己和周围人激励的习惯开始，而且下的功夫要大一些，花的时间要长一些，这样就容易成功。</p>
							<p>第一个习惯养成了，一定会使你品尝到成功的喜悦。既然是好习惯，它就会在你无意识中自动为你管理，为你服务，而且为你效忠终生。</p>
							<p>四是关键前三天，重在一个月。当我们下决心要培养一个好习惯之后，成功的关键在于前三天，特别重要的是前一个月。俗话说：“万事开头难”“好的开端是成功的一半”，培养习惯也是一样。至于说培养习惯重在一个月，这是指度过前几天，真正的是一个习惯的养成，这过程差不多要一个月左右。因为根据美国科学家的研究，一个好习惯的养成成为21天，90天的重复会形成稳定的习惯。所以一个观念，如果被别人或自己验证了21次以上，它一定会形成你的信念。</p>
							<p>习惯培养法之五——习惯仿佛像一根缆绳，美国著名教育家曼恩说：“习惯像一根缆绳，我们每天给它缠上一股新索，要不了多久，它就会变得牢不可破。”因为好习惯每天缠上一股,要不了多久就会牢不可破。</p>
							<p>习惯培养法之六——坚持不懈，直到成功。</p>
    					</div>
    				</div>
    			</div>
    			<div class="contentpart">
    				<div class="header">路在脚下</div>
    				<div class="content">
    					<div class="content_info">
    						重庆——上海——北京——湖北——苏州——福州
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	<div id="sideBar">
    		<div id="sideBarMain">
    			<div class="newsItem">
    				<h3 class="catListTitle">公告</h3>
    				<div id="blog-news">
    					<p>优秀的艺术家靠借，伟大的艺术家靠偷</p>
						<p>假如你想证明什么，就应不让任何人知道，要不着痕迹，很巧妙地去做...</p>
						<p>
							新浪微博：
							<a target="_blank" href="http://weibo.com/xingyez">weibo.com/xingyez</a>
						</p>
    					<canvas id="canvas" width="200" height="200"></canvas>
						<div id="profile_block">
							昵称：
							<a href="http://weibo.com/xingyez">骑猪走夜路</a>
							<br>
							园龄：
							<a title="入园时间：2012-06-19"
								href="http://weibo.com/xingyez">1年5个月</a>
							<br>
							粉丝：
							<a href="http://home.cnblogs.com/u/kingwell/followers/">20</a>
							<br>
							关注：
							<a href="http://home.cnblogs.com/u/kingwell/followees/">6</a>
							<div id="p_b_follow">
								<a
									onclick="cnblogs.UserManager.FollowBlogger('b43d6efe-ddb9-e111-aa3f-842b2b196315')"
									href="javascript:void(0);">+加关注</a>
							</div>
						</div>
						<div id="search_part">
							<input type="text" /> <input type="button" value="百度"/>
							<input type="text" /> <input type="button" value="谷歌"/>
						</div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
<%@ include file="foot.jsp"%>
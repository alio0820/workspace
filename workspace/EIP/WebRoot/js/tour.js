if($('.tour').length==0){
	var tour = new Tour();
	tour.addStep({
		element: ".menu_on:first", /* html element next to which the step popover should be shown */
		placement: "top",
		title: "通用入口", /* title of the popover */
		content: "这里是其它系统的入口，比如这是EIP系统的入口" /* content of the popover */
	});
	tour.addStep({
		element: ".infom",
		placement: "top",
		title: "公告栏",
		content: "在这里滚动显示公告版中的公告内容"
	});
//	tour.addStep({
//		element: "ul.main-menu a:first",
//		title: "Dashboard",
//		content: "This is your dashboard from here you will find highlights."
//	});
//	tour.addStep({
//		element: "#for-is-ajax",
//		title: "Ajax",
//		content: "You can change if pages load with Ajax or not."
//	});
//	tour.addStep({
//		element: ".top-nav a:first",
//		placement: "bottom",
//		title: "Visit Site",
//		content: "Visit your front end from here."
//	});
	
	tour.restart();
}
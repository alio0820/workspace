if($('.tour').length==0){
	var tour = new Tour();
	tour.addStep({
		element: ".menu_on:first", /* html element next to which the step popover should be shown */
		placement: "top",
		title: "ͨ�����", /* title of the popover */
		content: "����������ϵͳ����ڣ���������EIPϵͳ�����" /* content of the popover */
	});
	tour.addStep({
		element: ".infom",
		placement: "top",
		title: "������",
		content: "�����������ʾ������еĹ�������"
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
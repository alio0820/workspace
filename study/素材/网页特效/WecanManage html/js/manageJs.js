/*******************************************���ѡ��˵��ķ��� ��ʼ*****************************************/
function changeItem(typeId){
	switch(typeId){
		case 0://�л�����ҳ��
			$("#rightbar iframe").attr("src", "mainpage.html");
			break;
		case 1://�л�����ȫ�û���Ϣ��ҳ��
			$("#rightbar iframe").attr("src", "addNormalUser.html");
			break;
		case 2://�л��������û���Ϣ��ҳ��
			$("#rightbar iframe").attr("src", "updateNormalUser.html");
			break;
		case 3://�л������������ҳ��
			$("#rightbar iframe").attr("src", "updatePassword.html");
			break;
	}
}
/*******************************************���ѡ��˵��ķ��� ����*****************************************/


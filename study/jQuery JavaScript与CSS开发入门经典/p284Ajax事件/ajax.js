$.ajaxSetup({//��Ajax������ʱ��̬�Ľ�ָʾ����ʾ�����������������ʱ����ָʾ����������
	beforeSend:function(){
		$('div#hFinderActivity').show();
	},
	success:function(){
		$('div#hFinderActivity').hide();
	}
});
/*
 * Ajax����ı�־���¼��磺��һ������ʼʱ����һ���������ʱ����һ�������Ѿ�������ʱ����һ������ʧ��ʱ����һ������
 * �Ѿ���ɻ�����ȫִ�гɹ�ʱ��
 */

package com.ui;

import com.bean.PaperTopicBean;

/**
 * @function רΪ�Ծ�Ԥ������UI
 * @author cdzhai
 * @time 2013-9-30 10:43:24
 */
public class previewUI {
	public final static String[] numTransformation = {"һ","��","��","��","��","��","��","��","��","ʮ"};		
	public final static String charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	public static String showTopic(PaperTopicBean ptb,int i){
		String[] option = ptb.getOption();
		String topicTypeId = ptb.getTopicTypeId();
		StringBuffer topicView = new StringBuffer();
		topicView.append("<div><div id=\""+ptb.getQuestionId()+"\" class=\"question\">");
		topicView.append("<font color=\"red\">��"+i+"�⣺</font>"+ptb.getContent()+"<br/>");
		if(option!=null){		//һ��Ϊ��ѡ����ѡ�����
			if(topicTypeId.equals("SingleChoice")||topicTypeId.equals("MultipleChoice")){	//��ѡ����ѡ
				StringBuffer topicOption = new StringBuffer();
				String inputType = "";
				topicView.append("<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-top:1px dashed rgb(201,201,201);margin:8px 0 0 8px;\">");
				for(int k = 0;k<option.length;k++){
					char optionSign = charSet.charAt(k);
					if(k==0) topicView.append("<tr><td class=\"small\">"+optionSign+".</td><td>"+option[k]+"</td></tr>");
					else topicView.append("<tr><td>"+optionSign+"</td><td>"+option[k]+"</td></tr>");
					if(topicTypeId.equals("SingleChoice")) inputType = "radio";
					else inputType = "checkbox";
					topicOption.append(optionSign+"<INPUT NAME=\""+ptb.getQuestionId()+"\" TYPE=\""+inputType+"\" VALUE=\""+optionSign+"\">&nbsp;&nbsp;&nbsp;");
				}
				topicView.append("</table></div><div class=\"answer noprint\">ѡ��𰸣�");
				topicView.append(topicOption);
				topicView.append("</div></div>");
			}
			else {				//�����
				
			}
		}
		else{					//һ��Ϊ�жϡ�������
			if(topicTypeId.equals("Judge")){
				topicView.append("<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-top:1px dashed rgb(201,201,201);margin:8px 0 0 8px;\">");
				topicView.append("<tr><td class=\"small\">A.</td><td>��ȷ</td></tr><tr><td>B.</td><td>����</td></tr>");
				topicView.append("</table></div><div class=\"answer noprint\">ѡ��𰸣�");
				topicView.append("	��ȷ<input type=\"radio\" value=\"T\" name=\""+ptb.getQuestionId()+"\">    ����<input type=\"radio\" value=\"F\" name=\""+ptb.getQuestionId()+"\">");
				topicView.append("</div></div>");
			}else{
				
			}
		}
		System.out.println(topicView.toString());
		return topicView.toString();
	}
	
}

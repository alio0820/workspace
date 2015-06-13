package com.dengyang.mylistener;

import javax.faces.event.AbortProcessingException;
import javax.faces.event.ActionEvent;
import javax.faces.event.ActionListener;

public class LogActioinListener implements ActionListener {

	public void processAction(ActionEvent arg0) throws AbortProcessingException {
		 //  处理 Log 
	}
}

class VertifyActioinListener implements ActionListener{
    public void processAction(ActionEvent e) { 
    	 //  处理验证 
    }
}

package com.dengyang.mylistener;

import javax.faces.event.ListenerFor;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
/**
 * PhaseListener 有三个必须实作的方法getPhaseId()、beforePhase()与
afterPhase()，其 中 getPhaseId()传回一个PhaseId 对象，代表 Listener 想要被通知的
时机，可以设定的时机有： 
  PhaseId.RESTORE_VIEW  
  PhaseId.APPLY_REQUEST_VALUES  
  PhaseId.PROCESS_VALIDATIONS  
  PhaseId.UPDATE_MODEL_VALUES  
 PhaseId.INVOKE_APPLICATION  
  PhaseId.RENDER_RESPONSE  
   PhaseId.ANY_PHASE  
  其中PhaseId.ANY_PHASE 指的是任何的阶段转换时，就进行通知；您可以在
beforePhase()与afterPhase()中撰写阶段前后撰写分别想要处理的动作，例如下面这个
简单的类别会列出每个阶段的名称：
 * @author dengyangyang
 *
 */
public class ShowPhaseListener implements PhaseListener {

	public void afterPhase(PhaseEvent event) {
		// TODO Auto-generated method stub
		 System.out.println( "Before " + event.getPhaseId()); 
	}

	public void beforePhase(PhaseEvent event) {
		System.out.println( "after " + event.getPhaseId()); 		
	}

	public PhaseId getPhaseId() {
		// TODO Auto-generated method stub
		return PhaseId.ANY_PHASE;
	}

}

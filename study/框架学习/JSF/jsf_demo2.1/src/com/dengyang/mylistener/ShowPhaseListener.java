package com.dengyang.mylistener;

import javax.faces.event.ListenerFor;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
/**
 * PhaseListener ����������ʵ���ķ���getPhaseId()��beforePhase()��
afterPhase()���� �� getPhaseId()����һ��PhaseId ���󣬴��� Listener ��Ҫ��֪ͨ��
ʱ���������趨��ʱ���У� 
  PhaseId.RESTORE_VIEW  
  PhaseId.APPLY_REQUEST_VALUES  
  PhaseId.PROCESS_VALIDATIONS  
  PhaseId.UPDATE_MODEL_VALUES  
 PhaseId.INVOKE_APPLICATION  
  PhaseId.RENDER_RESPONSE  
   PhaseId.ANY_PHASE  
  ����PhaseId.ANY_PHASE ָ�����κεĽ׶�ת��ʱ���ͽ���֪ͨ����������
beforePhase()��afterPhase()��׫д�׶�ǰ��׫д�ֱ���Ҫ����Ķ����������������
�򵥵������г�ÿ���׶ε����ƣ�
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

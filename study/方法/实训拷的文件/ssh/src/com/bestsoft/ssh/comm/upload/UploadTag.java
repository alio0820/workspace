package com.bestsoft.ssh.comm.upload;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.bestsoft.ssh.comm.Util;

public class UploadTag extends TagSupport {
	private static final long serialVersionUID = 606357951551983900L;
	private final Log log = LogFactory.getLog(UploadTag.class);

	public int doEndTag() throws JspException {
			writePage();	
		return EVAL_PAGE;
	}
	private void writePage()
			throws JspException {
		try {
			final JspWriter writer = pageContext.getOut();
			StringBuffer content = new StringBuffer();
			String uuid = Util.getUUID();
			content.append("<Td class='color table-right'><input type='hidden' name='attachId' value='"+uuid+"'/>");
			content.append("附件:</td><td>");
			content.append("<a href='#' onclick='emptyFile();' id='cleanbutton' class='btn-bar'><span>清空附件</span></a>");
			content.append("<a href='#' onclick='cancleFile();' disabled='true' id='canclebutton' class='btn-bar'><span>取消上传</span></a>");
			content.append(" <input type='file' class='input-def' size='40' name='upload' value='上传' id='bester'  onchange='doSubmit(document.all.upload.value)'/>");
			content.append("<div id='uploads'></div> ");
			content.append("<div id='percentText' style='overflow: visible;background-color: #FFFFFF;align:center;' ></div></td> ");
			content.append(" <iframe name='hidden_frame' id='hidden_frame' style='display:none'></iframe>");
			writer.print(content.toString());
		} catch (Exception e) {
			log.trace(e);
			throw new JspTagException("UploadTag: " + e.getMessage());
		}
	}
}
<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="css/base-090628.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/tab.css" rel="stylesheet" type="text/css" />
<s:if test="fileUploads.size>0">
    <s:iterator value="fileUploads">
    <div class="fujian">
    <div class="left ico-1"></div><div class="left"><nobr><s:property value="fileSaveName"/></nobr></div>
    <div class="left ico-2" style="cursor:pointer;"  onclick="delFile('<s:property value="fileId"/>')"></div>
    <div class="left"><nobr>&nbsp;&nbsp;</nobr></div>
    </div>
    </s:iterator>
    <br><br>
</s:if>

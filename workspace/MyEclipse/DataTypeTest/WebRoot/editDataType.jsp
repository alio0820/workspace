<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>编辑界面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<script type="text/javascript" language="javaScript">
        function show()
        {
            alert("修改成功!");
        }
    </script>
	<body>
		<h3>
			数据类型
		</h3>
		<f:view>
			<h:form>
				<h:inputHidden id="id" value="#{dataTypeModel.dataTypeid}"></h:inputHidden>
				<h:outputText value="数据类型编码" />
				<h:inputText id="dataTypecode" value="#{dataTypeModel.dataTypecode}" />
				<h:outputText value="语言用数据库类型" />
				<h:selectOneMenu value="#{dataTypeModel.programuse}">
					<f:selectItem itemLabel="string" itemValue="string" />
					<f:selectItem itemLabel="char" itemValue="char" />
					<f:selectItem itemLabel="long" itemValue="long" />
					<f:selectItem itemLabel="int" itemValue="int" />
					<f:selectItem itemLabel="short" itemValue="short" />
					<f:selectItem itemLabel="byte[]" itemValue="byte[]" />
					<f:selectItem itemLabel="date" itemValue="date" />
					<f:selectItem itemLabel="timestamp" itemValue="timestamp" />
					<f:selectItem itemLabel="bool" itemValue="bool" />
					<f:selectItem itemLabel="double" itemValue="double" />
					<f:selectItem itemLabel="byte" itemValue="byte" />
				</h:selectOneMenu>
				<h:outputText value="数据库用数据库类型" />
				<h:selectOneMenu value="#{dataTypeModel.databaseuse}">
					<f:selectItem itemLabel="int" itemValue="int" />
					<f:selectItem itemLabel="varchar" itemValue="varchar" />
					<f:selectItem itemLabel="long" itemValue="long" />
					<f:selectItem itemLabel="money" itemValue="money" />
					<f:selectItem itemLabel="text" itemValue="text" />
					<f:selectItem itemLabel="DateTime" itemValue="DateTime" />
					<f:selectItem itemLabel="Xml" itemValue="Xml" />
				</h:selectOneMenu>
				<br>
				<h:outputText value="数据类型分类" />
				<h:selectOneRadio id="dtabbreviation"
					value="#{dataTypeModel.dtabbreviation}" border="1" layout="lineDirection" style="width:50%">
					<f:selectItem itemLabel="数字型" itemValue="数字型"/>
					<f:selectItem itemLabel="日期型" itemValue="日期型"/>
					<f:selectItem itemLabel="字符型" itemValue="字符型"/>
					<f:selectItem itemLabel="其他类型" itemValue="其他类型"/>
				</h:selectOneRadio>
				
				<h:panelGrid>
				<h:outputLabel value="启用"></h:outputLabel>
				<h:selectBooleanCheckbox value="#{dataTypeModel.dtstatus}"/>
				</h:panelGrid>
				
				<br>
				<h:panelGrid>
				<h:outputText value="描述"/>
				<h:inputTextarea id="dtdescription"
					value="#{dataTypeModel.dtdescription}" cols="99" rows="8"></h:inputTextarea>			
				</h:panelGrid>				
				<br>
				<br>
				<h:commandButton action="backList"
					actionListener="#{dataTypeModel.updateDataType}" id="Update"
					onclick="show()" value="保存"></h:commandButton>
			</h:form>
		</f:view>
	</body>
</html>

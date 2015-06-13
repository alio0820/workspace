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

		<title>�༭����</title>

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
            alert("�޸ĳɹ�!");
        }
    </script>
	<body>
		<h3>
			��������
		</h3>
		<f:view>
			<h:form>
				<h:inputHidden id="id" value="#{dataTypeModel.dataTypeid}"></h:inputHidden>
				<h:outputText value="�������ͱ���" />
				<h:inputText id="dataTypecode" value="#{dataTypeModel.dataTypecode}" />
				<h:outputText value="���������ݿ�����" />
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
				<h:outputText value="���ݿ������ݿ�����" />
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
				<h:outputText value="�������ͷ���" />
				<h:selectOneRadio id="dtabbreviation"
					value="#{dataTypeModel.dtabbreviation}" border="1" layout="lineDirection" style="width:50%">
					<f:selectItem itemLabel="������" itemValue="������"/>
					<f:selectItem itemLabel="������" itemValue="������"/>
					<f:selectItem itemLabel="�ַ���" itemValue="�ַ���"/>
					<f:selectItem itemLabel="��������" itemValue="��������"/>
				</h:selectOneRadio>
				
				<h:panelGrid>
				<h:outputLabel value="����"></h:outputLabel>
				<h:selectBooleanCheckbox value="#{dataTypeModel.dtstatus}"/>
				</h:panelGrid>
				
				<br>
				<h:panelGrid>
				<h:outputText value="����"/>
				<h:inputTextarea id="dtdescription"
					value="#{dataTypeModel.dtdescription}" cols="99" rows="8"></h:inputTextarea>			
				</h:panelGrid>				
				<br>
				<br>
				<h:commandButton action="backList"
					actionListener="#{dataTypeModel.updateDataType}" id="Update"
					onclick="show()" value="����"></h:commandButton>
			</h:form>
		</f:view>
	</body>
</html>

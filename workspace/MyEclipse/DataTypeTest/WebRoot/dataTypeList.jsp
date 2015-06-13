<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>




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

		<title>数据类型测试</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<f:view>
			<h:form>
				<h:dataTable frame="border" id="datatypes"
					value="#{dataTypeList.dtLst}" var="dataType" border="1"
					bgcolor="#e6ffff" rows="10">
					<h:column>
						<f:facet name="header">
							<h:outputText value="id" />
						</f:facet>
						<h:outputText value="#{dataType.dataTypeid}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="数据类型编码" />
						</f:facet>
						<h:outputText value="#{dataType.dataTypecode}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="语言用数据库类型"/>
						</f:facet>
						<h:outputText value="#{dataType.programuse}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="数据库用数据库类型" />
						</f:facet>
						<h:outputText value="#{dataType.databaseuse}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="描述" />
						</f:facet>
						<h:outputText value="#{dataType.dtdescription}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="数据类型分类" />
						</f:facet>
						<h:outputText value="#{dataType.dtabbreviation}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="启用" />
						</f:facet>
						<h:selectBooleanCheckbox value="#{dataType.dtstatus}"
							disabled="true" />
					</h:column>

					<h:column>
						<f:facet name="header">
							<h:outputText value="编辑" />
						</f:facet>
						<h:commandButton id="Edit" action="editDataType"
							image="mage/edit.gif"
							actionListener="#{dataTypeModel.selectDataType}">
							<h:outputText value="" />
							<f:param id="editId" name="id" value="#{dataType.dataTypeid}" />
						</h:commandButton>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="删除" />
						</f:facet>

						<h:commandButton id="Delete" action="backList"
							image="mage/del.gif"
							actionListener="#{dataTypeModel.deleteDataType}">
							<h:outputText value="" />
							<f:param id="deleteId" name="id" value="#{dataType.dataTypeid}" />
						</h:commandButton>
					</h:column>
				</h:dataTable>


				<h:panelGrid columns="3">
					<t:dataScroller id="scroll_1" for="datatypes" fastStep="10"
						paginator="true" paginatorMaxPages="9" >
						<f:facet name="first">
							<h:outputLabel value="首页"></h:outputLabel>
						</f:facet>
						<f:facet name="last">
							<h:outputLabel value="尾页"></h:outputLabel>
						</f:facet>
						<f:facet name="previous">
							<h:outputLabel value="上一页"></h:outputLabel>
						</f:facet>
						<f:facet name="next">
							<h:outputLabel value="下一页"></h:outputLabel>
						</f:facet>
						<f:facet name="fastforward">
							<h:outputLabel value="下跳一页"></h:outputLabel>
						</f:facet>
						<f:facet name="fastrewind">
							<h:outputLabel value="上跳一页"></h:outputLabel>
						</f:facet>
					</t:dataScroller>
					
					<h:commandLink id="Add" action="addDataType" value="新增一个数据类型"
						actionListener="#{dataTypeModel.initDataType}" >
					</h:commandLink>
					
				</h:panelGrid>

			</h:form>
		</f:view>
	</body>
</html>

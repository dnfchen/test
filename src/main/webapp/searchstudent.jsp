<%@ page language="java"
	import="java.util.*"
	pageEncoding="utf-8"%>
<%@ page import="student.pojo.Student" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>查询学生信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<script type="text/javascript">
function checkValid() {
	var reg = /^\d+$/;
	var sid = document.getElementById("sid");

	if (!reg.test(sid.value)) {
		alert("查询的学号不能为空并且只能是数字！");
		id.focus();
		return false;
	}

	return true;
}
</script>

	</head>

	<body>

		<h2>
			查询学生信息
		</h2>
		<form action="search" method="get">
			请输入学号进行查询：<input type="text" name="sid" id="sid" />
			<input type="submit" name="btnSubmit" value="查询"
				onclick="return checkValid()" />
		</form>

		<%
			String sid=request.getParameter("sid");
			if(sid!=null){

		%>

		<table>
    		<tr>
    			<td>学号：</td>
    			<td>${student.id}</td>
    		</tr>
    		<tr>
    			<td>姓名：</td>
    			<td>${student.name}</td>
    		</tr>
    		<tr>
    			<td>性别：</td>
    			<td>
				<c:if test="${student.sex==1}">男</c:if>
				<c:if test="${student.sex==0}">女</c:if>
    			</td>
    		</tr>
    		<tr>
    			<td>成绩：</td>
    			<td>${student.score}</td>
    		</tr>
    	</table>

    	<%}else{ %>
		<c:if test="${not empty student}">
    	<h3>查无学号为<%=sid %>的记录！</h3>
		</c:if>
    	<% }%>

	</body>
</html>

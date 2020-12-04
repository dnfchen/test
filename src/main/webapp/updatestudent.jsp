<%@ page language="java"
	import="java.util.*"
	pageEncoding="utf-8"%>
<%@ page import="student.pojo.Student" %>
<%@ page import="student.service.impl.StudentServiceImpl" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改学生信息</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">
		function checkValid(){
			var reg=/^\d+$/;
			var id=document.getElementById("id");

			if(!reg.test(id.value)){
				alert("学号不能为空并且只能是数字！");
				id.focus();
				return false;
			}

			var name=document.getElementById("name");
			if(name.value.trim()==""){
				alert("姓名不能为空！");
				name.focus();
				return false;
			}


			reg=/^\d+(\.\d{1,2}){0,1}$/;
			var score=document.getElementById("score");

			if(!reg.test(score.value)){
				alert("成绩不能为空并且只能是数字！");
				score.focus();
				return false;
			}

			return true;
		}
	</script>

  </head>

  <body>

  	<h2>修改学生信息</h2>
    <form action="update" method="post">
    	<table>
    		<tr>
    			<td>学号：</td>
    			<td><input type="text" name="id" id="id" readonly="readonly" value="${s.id}" /></td>
    		</tr>
    		<tr>
    			<td>姓名：</td>
    			<td><input type="text" name="name" id="name" value="${s.name}" /></td>
    		</tr>
    		<tr>
    			<td>性别：</td>
    			<td>
					<c:if test="${s.sex==1}">

    				<input type="radio" name="sex" value="1" checked="checked" />男
    				<input type="radio" name="sex" value="0" />女
					</c:if>
						<c:if test="${s.sex==0}">
    				<input type="radio" name="sex" value="1" />男
    				<input type="radio" name="sex" value="0" checked="checked" />女
						</c:if>
    			</td>
    		</tr>
    		<tr>
    			<td>成绩：</td>
    			<td><input type="text" name="score" id="score" value="${s.score}" /></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center"><input type="submit" name="btnSubmit" value="修改" onclick="return checkValid()" /></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>

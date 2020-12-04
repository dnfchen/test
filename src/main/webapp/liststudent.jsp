<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>学生列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function checkDelete(id){
			var ans=confirm("确认删除此记录吗？");
			if(ans){
				location.href="deletestudent.jsp?id="+id;
				return true;
			}
			return false;
		}
	</script>
	
  </head>
  
  <body>
  
    <h2>学生列表</h2>
    <table border="1" cellspacing="0" cellpadding="0" width="50%">
    	<tr>
    		<td>学号</td>
    		<td>姓名</td>
    		<td>性别</td>
    		<td>成绩</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach var="s" items="${requestScope.students}">
    	<tr> 
    		<td>${s.id}</td>
    		<td>${s.name}</td>
    		<td>${s.sex==1?"男":"女"}</td>
    		<td>${s.score}</td>
    		<td>
    			<a href="updatestudent.jsp?id=${s.id}">修改</a> 
    			<a href="javascript:checkDelete(${s.id})">删除</a>
    		</td>
    	</tr>
    	</c:forEach>
    </table>
  </body>
</html>

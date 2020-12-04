<%@ page language="java"
	import="java.util.*,project3.pojo.*"
	pageEncoding="utf-8"%>
<%@ page import="project3.service.StudentService" %>
<%@ page import="project3.service.impl.StudentServiceImpl" %>

<%
	//获取参数id
	int id=Integer.parseInt(request.getParameter("id"));

	//调用业务逻辑层
	StudentService sb=new StudentServiceImpl();
	int flag=sb.delete(id);

	//判断，进行跳转
	if(flag==1){
		response.sendRedirect("liststudent.jsp");
	}
%>

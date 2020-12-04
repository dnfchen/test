<%@ page language="java"
	import="java.util.*,project3.entity.*,project3.biz.*,project3.biz.impl.*"
	pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	int sex=Integer.parseInt(request.getParameter("sex"));
	double score=Double.parseDouble(request.getParameter("score"));
	
	Student s=new Student(id,name,sex,score);
	
	StudentBiz sb=new StudentBizImpl();
	int flag=sb.update(s);
	
	if(flag==1){
		response.sendRedirect("liststudent.jsp");
	}else if(flag==-1){
		response.sendRedirect("updatestudent.jsp");
	}else{
		response.sendRedirect("updatestudent.jsp");
	}
%>
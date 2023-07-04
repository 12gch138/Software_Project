<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<%@include file="./Const.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<%  String msg="";
	String id=request.getParameter("id");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, dbuser, dbpwd);
		Statement stmt=con.createStatement();
		stmt.executeUpdate("delete from `供应商` where 供应商编号="+id+";");
		msg = "成功删除供应商!";
		stmt.close(); 
		con.close();
	}catch(Exception e){
		msg = e.getMessage();
	}
	out.print(msg);
%>
<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<%@include file="./Const.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<%  String msg="";
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, dbuser, dbpwd);
		Statement stmt=con.createStatement();
		stmt.executeUpdate("insert into `会员`(客户姓名,联系方式)values('"+name+"','"+phone+"');");
		msg = "成功添加会员!";
		stmt.close(); 
		con.close();
	}catch(Exception e){
		msg = e.getMessage();
	}
	out.print(msg);
%>
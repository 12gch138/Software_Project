<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<%@include file="./Const.jsp" %>
<% request.setCharacterEncoding("utf-8");%>
<%  String msg="";
	String name=request.getParameter("name");
	String contact_person=request.getParameter("contact_person");
	String phone=request.getParameter("phone");
	String city=request.getParameter("city");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, dbuser, dbpwd);
		Statement stmt=con.createStatement();
		stmt.executeUpdate(String.format("insert into `供应商`(供应商名称,联系人,联系方式,所在城市)values('%s','%s','%s','%s');"
			,name,contact_person,phone,city));
		msg = "成功添加供应商!";
		stmt.close(); 
		con.close();
	}catch(Exception e){
		msg = e.getMessage();
	}
	out.print(msg);
%>
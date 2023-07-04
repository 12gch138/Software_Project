<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>自动跳转</title>
</head>
<body>

 <%  
		request.setCharacterEncoding("UTF-8");
		response.sendRedirect("search.html");
%>   
</body>
</html>
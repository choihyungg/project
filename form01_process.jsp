<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% 	request.setCharacterEncoding("UTF-8"); 
		
			String name = request.getParameter("name");
			String zipcode = request.getParameter("zipcode");
			String address01 = request.getParameter("address01");
			String address02 = request.getParameter("address02");
			String email = request.getParameter("email");
		%>
		<p> 이름 : <%=name %>
		<p> 주소 : <%=zipcode%><%=address01%><%=address02%>
		<p> 이메일: <%=email%>
</body>
</html>
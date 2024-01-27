<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String role = (String) session.getAttribute("role");
			
			if (role.equals("Student")) {
				response.sendRedirect("student.jsp");
			} else if (role.equals("Teacher")) {
				response.sendRedirect("teacher.jsp");
			} else if (role.equals("Admin")) {
				response.sendRedirect("admin.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	%>
</body>
</html>
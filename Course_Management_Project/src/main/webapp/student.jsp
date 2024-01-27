<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="studentStyle.css" />
<link rel="stylesheet" href = "style3.css">
<title>Document</title>
</head>
<body>

	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}

	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	%>

	<header class="header">
		<a href="#"> <!--  <img class="logo" alt="Omnifood logo" src="img/omnifood-logo.png" /> -->
		</a>
		<nav class="main-nav">
			<div class="logout-form">
				<form action="Logout">
					<input type="submit" value="Logout" class="btnn" />
				</form>
			</div>
			<!-- <ul class="main-nav-list">
          <li><a class="main-nav-link nav-cta" href="#">Try for free</a></li>
        </ul> -->
		</nav>
	</header>
	<section class="section-hero">
		<div class="hero">
			<div class="hero-text-box">
				<h1 class="heading-primary">Welcome, student home!</h1>
				<div class="first-flex">
					<div class="register-section">
						<h2>Register a new course</h2>
						<form action="RegisterCourse" method="post">
							<label for="course_id"></label> <input class="input_box"
								type="text" name="course_id" placeholder="Course ID" required /><br />
							<br /> <input type="submit" value="Register" class="btnn" />
						</form>
					</div>
				</div>
			</div>

			<div class="hero-img-box">
				<img src="img-3.png" class="hero-img" />
			</div>
		</div>
	</section>
	<div class="container">
		<div class="second-flex">
			<h1 class="heading-register">Registered courses</h1>
			<div class="grid">
				<%
				String db_url = "jdbc:mysql://localhost:3306/course";
				String db_user = "root";
				String db_pass = "2019331062cseffcc..";

				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

					String reg_no = (String) session.getAttribute("username");

					// Execute SQL query to fetch names
					String sql = "SELECT course_id FROM Registered_Course WHERE reg_no = " + reg_no;
					PreparedStatement pstmt = conn.prepareStatement(sql);

					ResultSet rs = pstmt.executeQuery();

					while (rs.next()) {
						String c_id = rs.getString("course_id");
						out.println("<div class=\"box\">");
						out.println("<div class=\"upper_section\">");

						out.println("<div class=\"flex_inside_upper_section1\" >"          +c_id +           "</div>");
						out.println("<div class=\"flex_inside_upper_section2\" >course_name_final</div>");
						out.println("</div>");
						out.println("<div class=\"middle_section\">");
						out.println("<img class=\"img\" src=\"book1.png\" alt=\"books\" />");
						out.println("</div>");
						out.println("<div class=\"lower_section\">");
						//out.println("<form action=\"RegisterCourse\" method=\"post\">");
						//out.println("<input type=\"hidden\" name=\"course_id\" value=\"" + c_id + "\" >");
						//out.println("<input type=\"submit\" value=\"Enroll\" class=\"btnn\">");
						//out.println("</form>");
		              
						out.println("</div>");
						out.println("</div>");
						
					}

				} catch (Exception e) {
					System.out.println("Error: " + e.getMessage());
					response.sendRedirect("404.jsp");
				}
				%>
			</div>
		</div>
	</div>





	<div class="container">
		<div class="second-flex">
			<h1 class="heading-register">Available courses</h1>
			<div class="grid">
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

					String reg_no = (String) session.getAttribute("username");

					// Execute SQL query to fetch names
					String sql = "SELECT id FROM course WHERE id NOT IN (SELECT course_id FROM registered_course WHERE reg_no = ?)";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, reg_no);

					ResultSet rs = pstmt.executeQuery();

					while (rs.next()) {
						String c_id = rs.getString("id");

						out.println("<div class=\"box\">");
						out.println("<div class=\"upper_section\">");

						out.println("<div class=\"flex_inside_upper_section1\" >"          +c_id +           "</div>");
						out.println("<div class=\"flex_inside_upper_section2\" >course_name_final</div>");
						out.println("</div>");
						out.println("<div class=\"middle_section\">");
						out.println("<img class=\"img\" src=\"book1.png\" alt=\"books\" />");
						out.println("</div>");
						out.println("<div class=\"lower_section\">");
						out.println("<form action=\"RegisterCourse\" method=\"post\">");
						out.println("<input type=\"hidden\" name=\"course_id\" value=\"" + c_id + "\" >");
						out.println("<input type=\"submit\" value=\"Enroll\" class=\"btnn\">");
						out.println("</form>");
		              
						out.println("</div>");
						out.println("</div>");
						
						
						
						
						//out.println(c_id);
						//out.println("<form action=\"RegisterCourse\" method=\"post\" >");
						//out.println("<input type=\"hidden\" name=\"course_id\" value=\"" + c_id + "\" >");
						//out.println("<input type=\"submit\" value=\"Enroll\" class=\"btnn\">");
						//out.println("</form>");
						
					}

				} catch (Exception e) {
					System.out.println("Error: " + e.getMessage());
					response.sendRedirect("404.jsp");
				}
				%>
			</div>
		</div>
	</div>


</body>
</html>
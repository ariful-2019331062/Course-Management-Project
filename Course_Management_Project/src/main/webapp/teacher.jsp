<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Course Management System</title>
    
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="studentStyle.css" />
    <link rel="stylesheet" href="styleTeacher.css" />
  </head>
  <body>
  <% if (session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp"); }
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache"); response.setDateHeader ("Expires", 0); %> 
    <header class="header">
      <a href="#">
        <!--  <img class="logo" alt="Omnifood logo" src="img/omnifood-logo.png" /> -->
      </a>
      <nav class="main-nav">
        <div class="logout-form">
          <form action="Logout">
            <input type="submit" value="Logout" class="btnn" />
          </form>
        </div>
      </nav>
    </header>

    <section class="section-hero">
      <div class="hero">
        <div class="hero-text-box">
          <h1 class="heading-primary">Welcome, Teacher home</h1>
          
        </div>

        <div class="hero-img-box">
          <img
            src="teacher.png"
            class="hero-img"
            alt="Woman enjoying food, meals in storage container, and food bowls on a table"
          />
        </div>
      </div>
    </section>

    <div class="container">
      <div class="second-flex">
        <h1 class="heading-register">Your Assigned Courses</h1>
        <div class="grid">
          <%
		String db_url = "jdbc:mysql://localhost:3306/course";
		String db_user = "root";
		String db_pass = "2019331062cseffcc..";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	
				String t_uname = (String) session.getAttribute("username");
				
				// Execute SQL query to fetch names
				String sql = "SELECT course_id FROM assigned_course WHERE teacher_uname = '" + t_uname + "'";
		
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				ResultSet rs = pstmt.executeQuery();
	
			
				while (rs.next()) {
					String c_id = rs.getString("course_id");
					
					// counting the total studnet enrolled in a course
					String counting = "SELECT count(distinct subquery.reg_no) as cnt FROM ( SELECT rc.reg_no FROM registered_course AS rc, assigned_course AS ac WHERE rc.course_id = '"+ c_id +"') AS subquery;";
					pstmt = conn.prepareStatement(counting);
					ResultSet cnt = pstmt.executeQuery();
					cnt.next();
					String total_count = cnt.getString(1);
					
					
					// course name finding
					String course_name_string = "select name from course where id = '"+c_id+"';";
					pstmt = conn.prepareStatement(course_name_string);
					cnt = pstmt.executeQuery();
					cnt.next();
					String course_name_final = cnt.getString(1);
					
					
					
					out.println("<div class=\"box\" >");
					out.println("<a class = \"link\" href='registered_students.jsp?course_id=" + c_id + "'>");
					out.println("<div class=\"upper_section\" >");
					out.println("<div class=\"flex_inside_upper_section\" >"+c_id +"</div>");
					out.println("<div class=\"flex_inside_upper_section\" >"+course_name_final +"</div>");
					out.println("</div>");
					out.println("<div class=\"middle_section\" > <img class=\"img\" src=\"book1.png\" /> </div>");
					out.println("<div class=\"lower_section\" >Enrolled: "+total_count+"</div>");
					out.println("</a></div>");
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

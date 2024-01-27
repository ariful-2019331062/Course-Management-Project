<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Students</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.1/css/bootstrap.min.css" integrity="sha512-TznZoCoeZ/eL3AcqQW8XsD+lrUIyLsf/JTjOcW8hfaZ21THB1Gx0CdzNc6SjyvhNp+6Ug4w0J4kJ4bZMfAJQ6Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            padding-top: 3rem;
        }
    </style>
</head>
<body>





    <div class="container">
        <h2 class="mb-4">Registered Students on <%= request.getParameter("course_id") %></h2>

        <div class="row">
            <div class="col-md-10 mx-auto">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Registration No.</th>
                            <th>Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String db_url = "jdbc:mysql://localhost:3306/course";
        				String db_user = "root";
        				String db_pass = "2019331062cseffcc..";
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
                                String c_id = request.getParameter("course_id");
                                String sql = "SELECT registered_course.reg_no, student.name FROM registered_course JOIN student ON registered_course.reg_no = student.reg_no WHERE course_id = ?";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                pstmt.setString(1, c_id);
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                                    String reg_no = rs.getString("reg_no");
                                    String name = rs.getString("name");
                                    out.println("<tr>");
                                    out.println("<td>" + reg_no + "</td>");
                                    out.println("<td>" + name + "</td>");
                                    out.println("</tr>");
                                }
                            } catch (Exception e) {
                                System.out.println("Error: " + e.getMessage());
                                response.sendRedirect("404.jsp");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js" integrity="sha512-RosUmvh7ns/QrJrTodY/tJe6PMXkg6+uU6dZny7Vc8sLZm7V0vvAaGJ/URc8Wzrr3ixvvdHihlLbJGsq8wRclQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
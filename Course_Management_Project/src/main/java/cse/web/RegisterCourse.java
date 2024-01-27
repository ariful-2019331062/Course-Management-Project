package cse.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/RegisterCourse")
public class RegisterCourse extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String db_url = "jdbc:mysql://localhost:3306/course";
		String db_user = "root";
		String db_pass = "2019331062cseffcc..";
	    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
            
            // I will see that if the course already exists or not!!
            //String checkCourse = "select course_id from registered_course where reg VALUES (?, ?)";
            
            // Execute SQL query to fetch names
            String sql = "INSERT INTO Registered_Course (reg_no, course_id) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
			String c_id = request.getParameter("course_id");
			HttpSession session = request.getSession();
			String reg_no = (String) session.getAttribute("username");
			
			pstmt.setString(1, reg_no);
			pstmt.setString(2, c_id);
	        
	        int rowsInserted = pstmt.executeUpdate();
	        
	        if (rowsInserted > 0) {
	        	System.out.println("Data Inserted");
	        	response.sendRedirect("student.jsp");
	        }
            
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            response.sendRedirect("404.jsp");
        }
	}

}
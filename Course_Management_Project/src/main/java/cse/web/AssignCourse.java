package cse.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AssignCourse")
public class AssignCourse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String db_url = "jdbc:mysql://localhost:3306/course";
		String db_user = "root";
		String db_pass = "2019331062cseffcc..";
	    
	    PrintWriter out = response.getWriter();
	    
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	    	
			String c_id = request.getParameter("course_id");
	    	PreparedStatement ps = conn.prepareStatement("SELECT * FROM course WHERE id = ?");
	        ps.setString(1, c_id);
	        ResultSet rs = ps.executeQuery();
	        
	        if(rs.next()) {
	        	String sql = "INSERT INTO Assigned_Course (teacher_uname, course_id) VALUES (?, ?)";
		    	
		    	PreparedStatement pstmt = conn.prepareStatement(sql);
		    	
				String t_name = request.getParameter("username");
				
				pstmt.setString(1, t_name);
				pstmt.setString(2, c_id);
		        
		        int rowsInserted = pstmt.executeUpdate();
		        
		        if (rowsInserted > 0) {
		        	//System.out.println("Data Inserted");
		        	//response.sendRedirect("admin.jsp");
		            out.println("<script>alert('Course assigned successfully!');</script>");
		            request.getRequestDispatcher("admin.jsp").include(request, response);
		        }
	        	
	        }else {
	        	out.println("<script>alert('Course does not exist! Please create the course first.');</script>");
	            request.getRequestDispatcher("admin.jsp").include(request, response);
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
	        response.sendRedirect("404.jsp");
	    }
	}

}
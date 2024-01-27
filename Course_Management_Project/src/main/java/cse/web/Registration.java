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

@WebServlet("/Registration")
public class Registration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		String db_url = "jdbc:mysql://localhost:3306/course";
		String db_user = "root";
		String db_pass = "2019331062cseffcc..";
	    
	    PrintWriter out = response.getWriter();

	    
	
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	
	        String role = request.getParameter("role");
			String uname = request.getParameter("username");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String pass = request.getParameter("password"); 
	        String conf_pass = request.getParameter("confirmPassword");
	        
	        String ch = "select * from " + role + " where ";
	        
	        if (!pass.equals(conf_pass)) {
	        	
	        	response.sendRedirect("registration.jsp");
	        	return;
	        	
	        }
	        
	        String sql = "INSERT INTO " + role + " (";
	        
	        if (role.equals("student")) {
	        	sql += "reg_no";
	        	ch += "reg_no";
	        } else {
	        	sql += "uname";
	        	ch+="uname";
	        }
	        
	        ch+="=?";
	        PreparedStatement ps = conn.prepareStatement(ch);
	        ps.setString(1, uname);
	        //ps.setString(2, email);
	        ResultSet rs = ps.executeQuery();
	        
	        if(rs.next()) {
	        	out.println("<script>alert('User Already Existed!!!');</script>");
	            request.getRequestDispatcher("registration.jsp").include(request, response);
	        }else {
	            sql += ", name, email, pass) VALUES (?, ?, ?, ?)";
		        
		        PreparedStatement pstmt = conn.prepareStatement(sql);
		        
		        pstmt.setString(1, uname);
		        pstmt.setString(2, email);
		        pstmt.setString(3, name);
		        pstmt.setString(4, pass);
		
		        // Execute the SQL statement
		        int rowsInserted = pstmt.executeUpdate();
		        
		        if (rowsInserted > 0) {
		        	out.println("<script>alert('User Created Successfully!');</script>");
		            request.getRequestDispatcher("login.jsp").include(request, response);
		        }
	        }
	        
	    } catch (SQLException | ClassNotFoundException ex) {
	        System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
	        response.sendRedirect("404.jsp");
	    }
	}

}
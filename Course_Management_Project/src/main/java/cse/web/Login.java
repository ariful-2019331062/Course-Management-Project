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
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 	String db_url = "jdbc:mysql://localhost:3306/course";
	    String db_user = "root";
	    String db_pass = "2019331062cseffcc..";
	    
	    PrintWriter out = response.getWriter();
	    
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);
	
			String uname = request.getParameter("username");
			String pass = request.getParameter("password");
			String role = request.getParameter("role");
			
			String sql = "SELECT * FROM " + role + " WHERE ";
			
			if (role.equals("student")) {
				sql += "reg_no";
			} else {
				sql += "uname";
			}
			
			sql += "=? AND pass=?";
			
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, uname);
	        pstmt.setString(2, pass);
	        
	        ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				session.setAttribute("role", role);
				response.sendRedirect(role.toLowerCase() + ".jsp");
				
			} else {
				
	            out.println("<script>alert('Invalid Information!');</script>");
	            request.getRequestDispatcher("login.jsp").include(request, response);

			}
			
	    } catch (SQLException | ClassNotFoundException ex) {
	        System.out.println("An error occurred while inserting a new user: " + ex.getMessage());
	        response.sendRedirect("404.jsp");
	    }
		
	} 

}
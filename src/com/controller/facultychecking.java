package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.RestoreAction;

@WebServlet("/facultychecking")
public class facultychecking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String rollno=request.getParameter("searchstudent");
		
		con=com.utility.DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String sql="select * from FACULTY_DET where FAC_ID='"+rollno+"'";
			rs=st.executeQuery(sql);
			if(rs.next()){
				
				HttpSession session=request.getSession(true);
				session.setAttribute("user", rollno);
				response.sendRedirect("FacultyProfileUpdate.jsp");
				
				
			}
			else{
				response.sendRedirect("FacultyUpdateSearch.html");
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}

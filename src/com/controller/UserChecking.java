package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class UserChecking
 */
@WebServlet("/UserChecking")
public class UserChecking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserChecking() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if("faculty".equals(action)){
			CheckFaculty(request,response);
		}
		
		if("admin".equals(action)){
			CheckAdmin(request,response);
		}
		if("student".equals(action)){
			CheckStudent(request,response);
		}
		if("studentpasswor".equals(action)){
			
			StudentPassword(request,response);
		}
		if("facultypassword".equals(action)){
			
			FacultyPassword(request,response);
		}
		
	}


	private void FacultyPassword(HttpServletRequest request,
			HttpServletResponse response) throws IOException {


		PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select EMAIL, FAC_PASS from FACULTY_DET where FAC_ID='"+user+"'";
			rs=st.executeQuery(query);
			if(rs.next()){
				System.out.println(rs.getString(2)+" "+ rs.getString(1));
				new SendMailSSL().sendMessage(rs.getString(2), rs.getString(1));
				out.println("<response>");
				out.println("<user>true</user>");
				out.println("</response>");	
				
				
			}
			else{
				out.println("<response>");
				out.println("<user>false</user>");
				out.println("</response>");	
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		

		
		
		
		
	
		
	}


	private void StudentPassword(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select EMAIL, PASSWORD from STUD_DETAILS where HALLTKNO='"+user+"'";
			rs=st.executeQuery(query);
			if(rs.next()){
				System.out.println(rs.getString(2)+" "+ rs.getString(1));
				new SendMailSSL().sendMessage(rs.getString(2), rs.getString(1));
				out.println("<response>");
				out.println("<user>true</user>");
				out.println("</response>");	
				
				
			}
			else{
				out.println("<response>");
				out.println("<user>false</user>");
				out.println("</response>");	
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		

		
		
		
		
	}


	private void CheckFaculty(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out=response.getWriter();
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from FACULTY_DET where FAC_ID="+user+" and FAC_PASS='"+pass+"'";
			System.out.println(query);
			rs=st.executeQuery(query);
			if(rs.next()){
				HttpSession session=request.getSession(true);
				session.setAttribute("user", user);
				out.println("<response>");
				out.println("<user>hai</user>");
				out.println("<username>"+user+"</username>");
				out.println("</response>");
				
			}
			else{
				out.println("<response>");
				out.println("<user>false</user>");
				out.println("</response>");	
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
	}






private void CheckAdmin(HttpServletRequest request,
		HttpServletResponse response) throws IOException {
	PrintWriter out=response.getWriter();
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
		if("admin".equals(user)&& "admin".equals(pass)){
			HttpSession session=request.getSession(true);
			session.setAttribute("user", user);
			out.println("<response>");
			out.println("<user>true</user>");
			out.println("<username>"+user+"</username>");
			out.println("</response>");
			
		}
		else{
			out.println("<response>");
			out.println("<user>false</user>");
			out.println("</response>");	
			
		}
	
}


private void CheckStudent(HttpServletRequest request,
		HttpServletResponse response) throws IOException {
	PrintWriter out=response.getWriter();
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	con=com.utility.DBConnection.getMyConnection();
	try {
		st=con.createStatement();
		String query="select * from STUD_DETAILS where HALLTKNO='"+user+"' and PASSWORD='"+pass+"'";
		rs=st.executeQuery(query);
		if(rs.next()){
			HttpSession session=request.getSession(true);
			session.setAttribute("user", user);
			out.println("<response>");
			out.println("<user>true</user>");
			out.println("<username>"+user+"</username>");
			out.println("</response>");
			
		}
		else{
			out.println("<response>");
			out.println("<user>false</user>");
			out.println("</response>");	
			
		}
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(st!=null){
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
}

}
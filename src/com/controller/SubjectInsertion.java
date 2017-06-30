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

/**
 * Servlet implementation class SubjectInsertion
 */
@WebServlet("/SubjectInsertion")
public class SubjectInsertion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subject=request.getParameter("subject");
		String branch=request.getParameter("branch");
		String semester=request.getParameter("semester");
		String year=request.getParameter("year");
		String faculty=request.getParameter("fac");
		PrintWriter out=response.getWriter();
		Connection con=null;
		Statement st = null,st1=null, addst=null;
		ResultSet rs = null,rs1=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			
				st1=con.createStatement();			
				String query="select SUB_ID from SUB_FAC_DET where FAC_ID="+faculty+" and SUB_ID="+subject;
				System.out.println(query);
				rs1=st1.executeQuery(query);
				if(rs1.next()){
					out.println("<response>");
					out.println("<responsetext>This subject is already assigned to this faculty</responsetext>");
					out.println("</response>");
				}
				
				else{
					addst=con.createStatement();
					String insertSubject="insert into SUB_FAC_DET values("+subject+","+faculty+")";
					int i=addst.executeUpdate(insertSubject);
					if(i>0){
					
					
					
						out.println("<response>");
						out.println("<responsetext>Subject added successfully</responsetext>");
						out.println("</response>");
					}
					else{
						out.println("<response>");
						out.println("<responsetext>Subject adding failed</responsetext>");
						out.println("</response>");
						
						
					}
				}
				
				
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			if(addst!=null){
				try {
					addst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs1!=null){
				try {
					rs1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(st1!=null){
				try {
					st1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

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

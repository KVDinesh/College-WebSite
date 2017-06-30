package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Marksinsertion
 */
@WebServlet("/Marksinsertion")
public class Marksinsertion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Marksinsertion() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String hallno=request.getParameter("hallno");
		String mid=request.getParameter("mid");
		String marks=request.getParameter("marks");
		String subject=request.getParameter("subject");
		Connection con=null;
		Statement st=null,st1=null,st2=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st1=con.createStatement();
			String query1="select HALLTKNO from MID_MRKS where HALLTKNO='"+hallno+"' and SUB_ID="+subject+" AND MID='"+mid+"'";
			System.out.println(query1);
			rs=st1.executeQuery(query1);
			if(rs.next())
			{
				st2=con.createStatement();
				String query2="update MID_MRKS set SCRD_MRKS="+marks+" where HALLTKNO='"+hallno+"' and SUB_ID="+subject+" AND MID='"+mid+"'";
				System.out.println(query2);
				int j=st2.executeUpdate(query2);
				
				if(j>0)
				{
					
				}
		
			}
			else{
			st=con.createStatement();
			String query="insert into MID_MRKS values(MID_SEQUENCE.nextval,25,"+marks+",(select SEM_ID from STUD_DETAILS where HALLTKNO='"+hallno+"'),'"+hallno+"',"+subject+",'"+mid+"')";
			System.out.println(query);
			int i=st.executeUpdate(query);
			
			if(i>0)
			{
				
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			if(st!=null)
			{
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(st2!=null)
			{
				try {
					st2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(rs!=null)
			{
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(st1!=null)
			{
				try {
					st1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(con!=null)
			{
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

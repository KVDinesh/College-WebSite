package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnterAttendance
 */
@WebServlet("/EnterAttendance")
public class EnterAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EnterAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String roll=request.getParameter("students");
		String period=request.getParameter("session");
		String date=request.getParameter("date");
		String status=request.getParameter("status");
		String dob1=null;
		Date dt=new Date();
		SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd1= new SimpleDateFormat("dd-MMM-yy");
		try {
			dt=sfd.parse(date);
			dob1=sfd1.format(dt);
			System.out.println(dob1+"date");
			
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		Connection con=null;
		Statement st=null;
		Statement st1=null,st2=null,st3=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st2=con.createStatement();
			String query2="select A.DAT,A.PERIOD from ATTDNCE A,STUD_DET_ATT B where A.ATTED_ID=B.ATTED_ID and B.HALLTKNO='"+roll+"' and A.DAT='"+dob1+"' and A.PERIOD="+period+"";
			System.out.println(query2);
			rs=st2.executeQuery(query2);
			if(rs.next()){
				st3=con.createStatement();
				String query3="update ATTDNCE set STATUS="+status+" where DAT='"+dob1+"' and PERIOD="+period+" and ATTED_ID in (select ATTED_ID from STUD_DET_ATT where HALLTKNO='"+roll+"')";
				int k=st3.executeUpdate(query3);
				if(k>0){
					
				}
				else{
					
				}
			}
			else{
				
			
			
			st=con.createStatement();
			String query="insert into ATTDNCE values(ATTDSEQUENCE.nextval,'"+dob1+"',"+period+",'"+status+"')";
			System.out.println(query);
			int i=st.executeUpdate(query);
			if(i>0){
				st1=con.createStatement();
				String query1="insert into STUD_DET_ATT values('"+roll+"',ATTDSEQUENCE.currval)";
				int j=st1.executeUpdate(query1);
				if(j>0){
					
				}
				
			}
			
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
				
			
			if(st3!=null){
				
				try {
					st3.close();
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
				if(st2!=null){
					
					try {
						st2.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
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

package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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


@WebServlet("/FacultyUpdating")
public class FacultyUpdating extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FacultyUpdating() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hallno=request.getParameter("hallno");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String dob1=null;
		Date dt=new Date();
		SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd1= new SimpleDateFormat("dd-MMM-yy");
		
		
		try {
			dt=sfd.parse(dob);
			dob1=sfd1.format(dt);
			System.out.println(dob1+"date");
			
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PrintWriter out= response.getWriter();
		Connection con=null;
		Statement regSt=null;
		//ResultSet regRs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			regSt=con.createStatement();
			String registration="update FACULTY_DET set FAC_NAME='"+name+"', FAC_PASS ='"+password+"', FAC_DOB='"+dob1+"', FAC_CONT='"+contact+"', FAC_GENDER='"+gender+"', FAC_ADDRESS='"+address+"', CITY_ID="+city+", email='"+email+"' where FAC_ID='"+hallno+"'";
			//update STUD_DETAILS set NAME='hvkhjv', PASSWORD='jhvjh', DOB='25-MAY-14', CONTACT=12345679, GENDER='male', FATHERNAME='k.snd', FATHER_OCC='jhbj', MOTHERNAME='h', MOTHER_OCC='h', PARENT_CONT='6564', YEAR=1, HOUSENO='kn', COLONY='kjn', ADDRESS='kjn', CITY_ID=1, SEM_ID=1, BRNCH_ID=1, SEC_ID=2 where HALLTKNO='123'
			
			System.out.println("Registration"+registration);
			int i=regSt.executeUpdate(registration);
			//PrintWriter out=response.getWriter();
			
			
			
			if(i>0){
				
				out.println("<response>");
				out.println("<user>"+hallno+"</user>");
				out.println("<message>Student Profile updated successfully</message>");
				out.println("</response>");
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(regSt!=null){
				
				try {
					regSt.close();
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

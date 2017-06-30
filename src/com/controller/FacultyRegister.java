package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class FacultyRegister
 */
@WebServlet("/FacultyRegister")
public class FacultyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String employeeid=request.getParameter("employeeid");
		Connection con=null;
		Statement regSt=null,St=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			St=con.createStatement();
			rs=St.executeQuery("select FAC_ID from FACULTY_DET where FAC_ID="+employeeid+"");
			if(rs.next())
			{
				response.sendRedirect("Facultyexisted.jsp");
				
				
				
			
			
	}
			else{
				
			
			
			
		
		
		
		
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String year=request.getParameter("year");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String semester=request.getParameter("semester");
		String branch=request.getParameter("branch");
		String subject=request.getParameter("subject");
		
		System.out.println("employeeid  "+employeeid+"  password  "+password+"  name  "+name+"  dob  "+dob+"  contact  "+contact+" email '"+email+"' year "+year+" gender  "+gender+" address  "+address+" state  "+state+"  city  "+city+"  semester  "+semester+"  branch  "+branch+"   subject "+subject+"");
		String dob1=null;
		Date dt=new Date();
		SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfd1= new SimpleDateFormat("dd-MMM-yy");
		
			dt=sfd.parse(dob);
			dob1=sfd1.format(dt);
			System.out.println(dob1+"date");
			
		
		
		
		
		//ResultSet regRs=null;
		
		
			regSt=con.createStatement();
			String registration="insert into FACULTY_DET values("+employeeid+",'"+name+"','"+password+"','"+gender+"',"+contact+",'"+address+"','"+dob1+"',"+city+",'"+email+"')";
			System.out.println("Registration"+registration);
			int i=regSt.executeUpdate(registration);
			PrintWriter out=response.getWriter();
			
			if(i>0){
				new SendMailSSL().sendMessage(employeeid+" (username)   "+password+" (Password)", email);
				
				
				response.sendRedirect("facultyaRegistration.jsp");
				
				
				
			}
			else{
				response.sendRedirect("facultyRegistration1.jsp");
			}
					
		} }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
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

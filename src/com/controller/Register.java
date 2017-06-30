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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Register() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(":::::::::::::::DoPost::::::::::::");
		String hallno=request.getParameter("hallno");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		String fathername=request.getParameter("fathername");
		String fatheroccu=request.getParameter("fatheroccu");
		String mothername=request.getParameter("mothername");
		String motheroccu=request.getParameter("motheroccu");
		String parcont=request.getParameter("parcont");
		String email=request.getParameter("email");
		String year=request.getParameter("year");
		String gender=request.getParameter("gender");
		String houseNumber=request.getParameter("houseNumber");
		String colony=request.getParameter("colony");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String semester=request.getParameter("semester");
		String branch=request.getParameter("branch");
		String section=request.getParameter("section");
		
		System.out.println("hall  "+hallno+"  pass  "+password+"  name  "+name+"  dob  "+dob+"  contact  "+contact+"  father  "+fathername+"  fatocc  "+fatheroccu+"  mothername  "+mothername+"  motheroccu  "+motheroccu+"  parcont  "+parcont+" gender  "+gender+"  houseNumber  "+houseNumber+"  colony  "+colony+"  address  "+address+" state  "+state+"  city  "+city+"  semester  "+semester+"  branch  "+branch+"  section  "+section+"  email='"+email+"'");
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
		
		
		Connection con=null;
		Statement regSt=null;
		//ResultSet regRs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			regSt=con.createStatement();
			String registration="insert into STUD_DETAILS values('"+hallno+"','"+name+"','"+password+"','"+dob1+"',"+contact+",'"+gender+"','"+fathername+"','"+fatheroccu+"','"+mothername+"','"+motheroccu+"',"+parcont+","+year+",'"+houseNumber+"','"+colony+"','"+address+"',"+city+","+semester+","+branch+","+section+",'"+email+"')";
			System.out.println("Registration"+registration);
			int i=regSt.executeUpdate(registration);
			PrintWriter out=response.getWriter();
			
			if(i>0){
				
				System.out.println(password+""+email);
				new SendMailSSL().sendMessage(hallno+" (username)   "+password+" (Password)", email);
				out.println("<html>");
				out.println("<script>");
				out.println("function i(){");
				out.println("alert('student registered successfully and user name and password are sent to mail')");
				out.println("document.location.href='Registration.html'}");
				
				out.println("</script>");
				out.println("<body onload=i()>");
				out.println("</body>");
				out.println("</html>");
				
				
				
			}
			else{
				out.println("<html>");
				out.println("<script>");
				out.println("function i(){");
				out.println("alert('student registered failed, you might not selected all the dropdowns, please try again')");
				out.println("document.location.href='Registration.html'}");
				
				out.println("</script>");
				out.println("<body onload=i()>");
				out.println("</body>");
				out.println("</html>");
				
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

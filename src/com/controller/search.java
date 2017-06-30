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
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String hall=request.getParameter("hall");
			String name=request.getParameter("name");
			String dob=request.getParameter("dob");
			String contact=request.getParameter("contact");
		
			String fatheroccu=request.getParameter("fatheroccu");
			
			String motherocc=request.getParameter("motherocc");
			
			String branch=request.getParameter("branch");
			String year=request.getParameter("year");
			String city=request.getParameter("city");
			String sec=request.getParameter("sec");
			String house=request.getParameter("house");
			String colony=request.getParameter("colony");
			String state=request.getParameter("state");
			if("".equals(contact)){
				contact="0";
			}
			if("".equals(year)||"select".equals(year)){
				year="0";
			}if("".equals(city)||city=="select"||city.equals("null")){
				city="0";
			}if("select".equals(sec)||"".equals(sec)){
				sec="0";
			}
			if("select".equals(branch)){
				branch="0";
			}
			if("".equals(branch)){
				branch="0";
			}
			
			String sem=request.getParameter("sem");
			if("select".equals(sem)||"".equals(sem)){
				sem="0";
			}
			
			if("".equals(name)){
				name=null;
			}
			
			String dob1=null;
			if(dob!="null"&&!dob.equals("")){
			
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
			}
			else{
				dob1="01-JAN-80";
			}
			Connection con=null;
			Statement st=null,st1=null;
			ResultSet rs=null, rs1=null;
			
		
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			con=com.utility.DBConnection.getMyConnection();
			try {
				st=con.createStatement();
				String query="select * from STUD_DETAILS where HALLTKNO = '"+hall+"' or NAME like '%"+name+"%' or DOB = '"+dob1+"' or CONTACT = "+contact+" or FATHER_OCC = '"+fatheroccu+"' or MOTHER_OCC = '"+motherocc+"' or BRNCH_ID = "+branch+" or YEAR = "+year+" or CITY_ID = "+city+" or SEC_ID = "+sec+" or HOUSENO = '"+house+"' or COLONY = '"+colony+"' or SEM_ID = "+sem+"";
				System.out.println(query);
				rs=st.executeQuery(query);
				Boolean b=false;
				out.println("<xml>");
				
				while(rs.next()){
					out.println("<details>");
					st1=con.createStatement();
					String q="select A.YR_NAME, B.CITY_NAME, C.SEM_NAME, D.BRNCH_NAME, E.SEC_NAME from YEAR A, CITY B, SEMESTER C, BRANCH D, SECTION E, STUD_DETAILS F where F.HALLTKNO='"+rs.getString(1)+"' and F.YEAR=A.YR_ID and   F.CITY_ID=B.CITY_ID and C.SEM_ID=F.SEM_ID AND F.BRNCH_ID=D.BRNCH_ID AND F.SEC_ID=E.SEC_ID";
					System.out.println(q);
					rs1=st1.executeQuery(q);
					if(rs1.next()){
					
					b=true;
						
					String date=rs.getString(4).substring(0,10);
					
					out.println("<hallno>"+rs.getString(1)+"</hallno>");
					out.println("<name>"+rs.getString(2)+"</name>");
					out.println("<DOB>"+date+"</DOB>");
					out.println("<CONTACT>"+rs.getString(5)+"</CONTACT>");
					out.println("<GENDER>"+rs.getString(6)+"</GENDER>");
					out.println("<FATHERNAME>"+rs.getString(7)+"</FATHERNAME>");
					out.println("<FATHER_OCC>"+rs.getString(8)+"</FATHER_OCC>");
					out.println("<MOTHERNAME>"+rs.getString(9)+"</MOTHERNAME>");
					out.println("<MOTHER_OCC>"+rs.getString(10)+"</MOTHER_OCC>");
					out.println("<PARENT_CONT>"+rs.getString(11)+"</PARENT_CONT>");
					out.println("<YEAR>"+rs1.getString(1)+"</YEAR>");
					out.println("<HOUSENO>"+rs.getString(13)+"</HOUSENO>");
					out.println("<COLONY>"+rs.getString(14)+"</COLONY>");
					out.println("<ADDRESS>"+rs.getString(15)+"</ADDRESS>");
					out.println("<city>"+rs1.getString(2)+"</city>");
					out.println("<sem>"+rs1.getString(3)+"</sem>");
					out.println("<branch>"+rs1.getString(4)+"</branch>");
					out.println("<sec>"+rs1.getString(5)+"</sec>");
					out.println("<email>"+rs.getString(20)+"</email>");
					
					
				}
					
					
					out.println("</details>");	
				}
				out.println("<details1>");
				out.println("<result>"+b+"</result>");
				out.println("</details1>");
				out.println("</xml>");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(rs1!=null){
				
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(st1!=null){
				
				try {
					st.close();
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



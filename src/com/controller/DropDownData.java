package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.utility.DBConnection;

/**
 * Servlet implementation class DropDownData
 */
@WebServlet("/DropDownData")
public class DropDownData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DropDownData() {
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
		
		String action=request.getParameter("action");
		if("year".equals(action)){
			getYear(request,response);
			
		}
		if("state".equals(action)){
			getState(request,response);
			
		}
		if("city".equals(action)){
			getCity(request,response);
			
		}
		if("semester".equals(action)){
			getSemester(request,response);
		}
		if("branch".equals(action)){
			getBranch(request,response);
		}
		if("section".equals(action)){
			getSection(request,response);
		}
		if("subject".equals(action)){
			getSubject(request,response);
		}
		if("faculty".equals(action)){
			getfaculty(request,response);
		}
		if("facattendance".equals(action)){
			getFacultySubjects(request,response);
		}
		if("semesters".equals(action)){
			getSemesters(request,response);
		}
		
	}

	private void getFacultySubjects(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter object=response.getWriter();
		String Facultyid=request.getParameter("facultyid");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=DBConnection.getMyConnection();
		try {
			st =con.createStatement();
			String query="select * from SUBJECT where SUB_ID in (select SUB_ID from SUB_FAC_DET where FAC_ID="+Facultyid+")order by SUB_NAME";
			rs=st.executeQuery(query);
			object.println("<subject>");
			
			
			while(rs.next()){
				
				object.println("<subjects>");
				object.println("<subjectid>"+rs.getString("SUB_ID")+"</subjectid>");
				object.println("<subjectname>"+rs.getString("SUB_NAME")+"</subjectname>");
				object.println("</subjects>");
				}
			object.println("</subject>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void getfaculty(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from FACULTY_DET order by FAC_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<state>");
			while(rs.next()){
				out.println("<faculty>");
				out.println("<faculty-id>"+rs.getString(1)+"</faculty-id>");
				out.println("<faculty-name>"+rs.getString(2)+"</faculty-name>");
				out.println("</faculty>");
			}
			out.println("</state>");
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

	private void getSubject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String sem=request.getParameter("semid");
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from SUBJECT where SEM_ID="+sem+" order by SUB_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<state>");
			while(rs.next()){
				out.println("<years>");
				out.println("<subject-id>"+rs.getString(1)+"</subject-id>");
				out.println("<subject-name>"+rs.getString(2)+"</subject-name>");
				out.println("</years>");
			}
			out.println("</state>");
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

	private void getCity(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String state=request.getParameter("state");
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from CITY where STATE_ID="+state+" order by CITY_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<state>");
			while(rs.next()){
				out.println("<years>");
				out.println("<state-id>"+rs.getString(1)+"</state-id>");
				out.println("<state-name>"+rs.getString(2)+"</state-name>");
				out.println("</years>");
			}
			out.println("</state>");
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

	private void getState(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from state order by STATE_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<state>");
			while(rs.next()){
				out.println("<years>");
				out.println("<state-id>"+rs.getString(1)+"</state-id>");
				out.println("<state-name>"+rs.getString(2)+"</state-name>");
				out.println("</years>");
			}
			out.println("</state>");
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

	private void getYear(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from YEAR order by YR_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<year>");
			while(rs.next()){
				out.println("<years>");
				out.println("<year-id>"+rs.getString(1)+"</year-id>");
				out.println("<year-name>"+rs.getString(2)+"</year-name>");
				out.println("</years>");
			}
			out.println("</year>");
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
	
	private void getSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from SECTION order by SEC_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<section>");
			while(rs.next()){
				out.println("<years>");
				out.println("<section-id>"+rs.getString(1)+"</section-id>");
				out.println("<section-name>"+rs.getString(2)+"</section-name>");
				out.println("</years>");
			}
			out.println("</section>");
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
	
	private void getBranch(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select * from BRANCH order by BRNCH_NAME";
			rs=st.executeQuery(query);
			PrintWriter out=response.getWriter();
			response.setContentType("text/xml");
			out.println("<branch>");
			while(rs.next()){
				out.println("<years>");
				out.println("<branch-id>"+rs.getString(1)+"</branch-id>");
				out.println("<branch-name>"+rs.getString(2)+"</branch-name>");
				out.println("</years>");
			}
			out.println("</branch>");
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
		
	
		private void getSemester(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			// TODO Auto-generated method stub
			String branch=request.getParameter("branchid");
			String year=request.getParameter("year");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			con=DBConnection.getMyConnection();
			try {
				st=con.createStatement();
				String query="select * from SEMESTER where BRNCH_ID="+branch+" and YR_ID="+year+" order by SEM_NAME";
				rs=st.executeQuery(query);
				PrintWriter out=response.getWriter();
				response.setContentType("text/xml");
				out.println("<semester>");
				while(rs.next()){
					out.println("<years>");
					out.println("<sem-id>"+rs.getString(1)+"</sem-id>");
					out.println("<sem-name>"+rs.getString(2)+"</sem-name>");
					
					out.println("</years>");
				}
				out.println("</semester>");
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
		
		
		private void getSemesters(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			// TODO Auto-generated method stub
			String hal=request.getParameter("hallno");
			String year=request.getParameter("year");
			Connection con=null;
			Statement st=null,st1=null;
			ResultSet rs=null,rs1=null;
			con=DBConnection.getMyConnection();
			try {
				st1=con.createStatement();
				String query1="select BRNCH_ID from STUD_DETAILS where HALLTKNO='"+hal+"'";
				rs1=st1.executeQuery(query1);
				if(rs1.next()){
					st=con.createStatement();
					String query="select * from SEMESTER where BRNCH_ID="+rs1.getString(1)+" and YR_ID="+year+" order by SEM_NAME";
					System.out.println(query);
					rs=st.executeQuery(query);
					PrintWriter out=response.getWriter();
					response.setContentType("text/xml");
					out.println("<semester>");
					while(rs.next()){
						out.println("<years>");
						out.println("<sem-id>"+rs.getString(1)+"</sem-id>");
						out.println("<sem-name>"+rs.getString(2)+"</sem-name>");
						
						out.println("</years>");
					}
					out.println("</semester>");	
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

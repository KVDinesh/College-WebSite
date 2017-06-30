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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("user");
		String password=request.getParameter("password");
		
		Connection con=null;
		Statement regSt=null;
		ResultSet regRs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			regSt=con.createStatement();
			String login="select * from STUD_DETAILS where HALLTKNO='"+username+"' and PASSWORD='"+password+"'";
			System.out.println("Registration"+login);
			regRs=regSt.executeQuery(login);
			PrintWriter out=response.getWriter();
			if(regRs.next()){
				
				response.sendRedirect("StudentHomePage.jsp");
				
				
			}	
	
		}catch (Exception e) {
			// TODO: handle exception
		}
		finally{
			
			if(regRs!=null){
				try {
					regRs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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

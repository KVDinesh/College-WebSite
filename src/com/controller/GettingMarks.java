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
@WebServlet("/GettingMarks")
public class GettingMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GettingMarks() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hallno=request.getParameter("attribute3");
		String year=request.getParameter("attribute2");
		String sem=request.getParameter("attribute1");
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con=com.utility.DBConnection.getMyConnection();
		try {
			st=con.createStatement();
			String query="select distinct B.SUB_NAME,(select A.SCRD_MRKS from MID_MRKS A,SUBJECT B where A.HALLTKNO='"+hallno+"' and A.SEM_ID="+sem+" and A.SUB_ID =B.SUB_ID and MID='Mid1'),(select A.SCRD_MRKS from MID_MRKS A,SUBJECT B where A.HALLTKNO='"+hallno+"' and A.SEM_ID="+sem+"  and A.SUB_ID =B.SUB_ID and MID='Mid2'),(select A.SCRD_MRKS from MID_MRKS A,SUBJECT B where A.HALLTKNO='"+hallno+"' and A.SEM_ID="+sem+"  and A.SUB_ID =B.SUB_ID and MID='Mid3'),(select A.SCRD_MRKS from MID_MRKS A,SUBJECT B where A.HALLTKNO='"+hallno+"' and A.SEM_ID="+sem+"  and A.SUB_ID =B.SUB_ID and MID='external') from MID_MRKS A,SUBJECT B where A.HALLTKNO='"+hallno+"' and A.SEM_ID="+sem+"  and A.SUB_ID =B.SUB_ID ";
			
			System.out.println(query);
			rs=st.executeQuery(query);
			response.setContentType("text/xml");
			PrintWriter out= response.getWriter();
			
			out.println("<marks>");
		
			while(rs.next()){
			out.println("<hai>");
				out.println("<s>"+rs.getString(1)+"</s>");
				out.println("<mid>25</mid>");
				out.println("<mid1>"+rs.getString(2)+"</mid1>");
				out.println("<mid2>"+rs.getString(3)+"</mid2>");
				out.println("<mid3>"+rs.getString(4)+"</mid3>");
				out.println("<external>75</external>");
				out.println("<externalmarks>"+rs.getString(5)+"</externalmarks>");
				out.println("</hai>");
			}
			out.println("</marks>");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

}

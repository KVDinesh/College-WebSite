package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SessionSelection
 */
@WebServlet("/SessionSelection")
public class SessionSelection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SessionSelection() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	           String count=request.getParameter("text");
	           String date=request.getParameter("date");
	           String subject=request.getParameter("subject");
	           String[] sessions=request.getParameterValues("checkbox");
	           

	           
		
		
	}

}

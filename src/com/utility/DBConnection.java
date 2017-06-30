package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBConnection {

	public static Connection con=null;
	public static Connection getMyConnection(){
		
		ResourceBundle rs=ResourceBundle.getBundle("Properties");
		try {
			Class.forName(rs.getString("driver"));
			con=DriverManager.getConnection(rs.getString("url"),rs.getString("user"), rs.getString("password"));
			System.out.println("connection established");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return con;
	}
	
	
	
	
	
}

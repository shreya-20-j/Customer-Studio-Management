package studioManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseCreate {
	
	public static void main(String[] args) throws SQLException{
		// TODO Auto-generated method stub
		try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		
		 Connection con = DriverManager.
				getConnection("jdbc:mysql://localhost:3306/?","root",""); 
		Statement statement =con.createStatement();
		
		statement.executeUpdate("create database studio_db");
		System.out.println("database created");
	
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			
		}
	
}

}

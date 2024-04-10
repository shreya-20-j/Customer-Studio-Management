package studioManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TabCreate {
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studio_db","root","");
			
			Statement stm = con.createStatement();
			
			String sql1 = "CREATE TABLE customer ("
		            + "Customer_id INT , "
		            + "Name VARCHAR(255) NOT NULL PRIMARY KEY,"
		            + "Place VARCHAR(255) , "
		            + "Phone_number VARCHAR(15) UNIQUE) ";
			
			String sql2 = "CREATE TABLE product ("
            + "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, "
            + "product_name VARCHAR(20) , "
            + "Price INT(20), "
            + "category VARCHAR(20), "
            + "description VARCHAR(50), "
            + "image BLOB, "
            + "stock VARCHAR(10))";
			
			
			
			String sql3 = "CREATE TABLE orders ("
		            + "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, "
		            + "quantity INT , "
		            + "price INT , "
		            + "total INT , "
		            + "name VARCHAR(20), "
		            + "orderDate VARCHAR(100), "
		            + "deliveryDate VARCHAR(100) , "
		            + "paymentMethod VARCHAR(100), "
		            + "transactionid VARCHAR(30), "
		            + "status VARCHAR(10) ,"
		            + "phone_number VARCHAR(20) , "
		            + "place VARCHAR(100))";
			

			String sql4 = "CREATE TABLE message ("
		            + "id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, "
		            + "name VARCHAR(20) NOT NULL, "
		            + "subject VARCHAR(200) NOT NULL, "
		            + "body VARCHAR(1000) NOT NULL)";

			stm.executeUpdate(sql1);
			stm.executeUpdate(sql2);
			stm.executeUpdate(sql3);
			stm.executeUpdate(sql4);
			System.out.println("table created");
			
			}
			catch(SQLException | ClassNotFoundException e){
				e.printStackTrace();
			}
		
		
	}


}

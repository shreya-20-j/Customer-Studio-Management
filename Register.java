package studioManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")

public class Register extends HttpServlet {
		
		public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
		{
			
			PrintWriter out=res.getWriter();
			String name=req.getParameter("name");
			String place=req.getParameter("place");
			String phone_number=req.getParameter("phone_number");
//
//			
//			if (!password.equals(confirmPassword)) {
//	            // Passwords don't match, show an error message
//	            res.setContentType("text/html");
//	            out.println("<html><head>");
//				 out.println("<link rel='stylesheet' href='CSS/welcomestyle.css'>");
//		            out.println("</head><body>");
//		            out.println("<div class='popup'>");
//		            out.println("<div class='imgbox'>");
//		            out.println("<img src='Images/sorry.jpg' alt='Error Image' class='img'>");
//		            out.println("</div>");
//		            out.println("<div class='title'>");
//		            out.println("<h3>Sorry</h3>");
//		            out.println("</div>");
//		            out.println("<p class='para'>Passwords do not match</p>");
//		            out.println("<button class='button-ok' onclick='closePopup()'>OK</button>");
//		            out.println("</div>");
//		            out.println("<script>");
//		            out.println("function closePopup() {");
//		            out.println("    var popup = document.querySelector('.popup');");
//		            out.println("    popup.style.display = 'none';");
//		            out.println("}");
//		            out.println("</script>");
//		            out.println("</body></html>");
//		            RequestDispatcher rd=req.getRequestDispatcher("/customerReg.jsp");
//					rd.include(req, res);
//	        }
//			
			   PreparedStatement stmt = null;
		        ResultSet rs = null;

			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studio_db","root","");
				
				
				String query = "SELECT * FROM customer WHERE Name = ? OR Phone_number = ?";
	            stmt = con.prepareStatement(query);
	            stmt.setString(1, name);
	            stmt.setString(2, phone_number);
	            rs = stmt.executeQuery();
	            
	            if (rs.next()) {
	                // User already exists, display error message
	                res.setContentType("text/html");
	                out.println("<html><head>");
					 out.println("<link rel='stylesheet' href='CSS/welcomestyle.css'>");
			            out.println("</head><body>");
			            out.println("<div class='popup'>");
			            out.println("<div class='title'>");
			            out.println("<h3>Sorry</h3>");
			            out.println("</div>");
			            out.println("<p class='para'>User already exists.</p>");
			            out.println("<p class='para'>Please log in instead</p>");
			            out.println("<button class='button-ok' onclick='closePopup()'>OK</button>");
			            out.println("</div>");
			            out.println("<script>");
			            out.println("function closePopup() {");
			            out.println("    var popup = document.querySelector('.popup');");
			            out.println("    popup.style.display = 'none';");
			            out.println("}");
			            out.println("</script>");
			            out.println("</body></html>");
			            RequestDispatcher rd = req.getRequestDispatcher("/customerLogin.jsp");
					    rd.include(req, res);
	                
	            }
	            else  {
	            	PreparedStatement ps = con.prepareStatement("INSERT INTO customer (Name, Place,Phone_number) VALUES (?, ?, ?)");
					ps.setString(1, name);
					ps.setString(2, place);
					ps.setString(3, phone_number);
					int count = ps.executeUpdate();
	            	
	            
				if (count > 0) {
				    res.setContentType("text/html");
					 out.println("<html><head>");
					 out.println("<link rel='stylesheet' href='CSS/welcomestyle.css'>");
			            out.println("</head><body>");
			            out.println("<div class='popup'>");
			            out.println("<div class='imgbox'>");
			            out.println("<img src='Images/success.png' alt='Error Image' class='img'>");
			            out.println("</div>");
			            out.println("<div class='title'>");
			            out.println("<h3>Registration Success</h3>");
			            out.println("</div>");
			            out.println("<p class='para'>user register successfully</p>");
			            out.println("<button class='button-ok' onclick='closePopup()'>OK</button>");
			            out.println("</div>");
			            out.println("<script>");
			            out.println("function closePopup() {");
			            out.println("    var popup = document.querySelector('.popup');");
			            out.println("    popup.style.display = 'none';");
			            out.println("}");
			            out.println("</script>");
			            out.println("</body></html>");
				    RequestDispatcher rd = req.getRequestDispatcher("/customerLogin.jsp");
				    rd.include(req, res);
				}
	            
			else
			{
				
				out.print("<h3 style='color:red'>User not register suceesfully</h3>");
				RequestDispatcher rd=req.getRequestDispatcher("/customerReg.jsp");
				rd.include(req, res);
			}
	            }
			
			}
			catch(Exception e)
			{e.printStackTrace();
				out.print("<h3 style='color:green'>Exception occured:"+e.getMessage()+"</h3>");
				RequestDispatcher rd=req.getRequestDispatcher("/customerReg.jsp");
				rd.include(req, res);
			}
			
			
			
	}


}

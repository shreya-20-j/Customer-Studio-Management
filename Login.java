package studioManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checking")
public class Login extends HttpServlet {
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{  
		PrintWriter out=res.getWriter();

	   res.setContentType("text.html");
		String myname=req.getParameter("your_name");
		String mypass=req.getParameter("your_pass");
		
		if("admin".equals(myname) && "1234567890".equals(mypass)) {
			HttpSession session = req.getSession();
			session.setAttribute("your_name",myname);
			res.sendRedirect("adminHome.jsp");
		}
		else {
			
		 int z=0;
		
		try {
           Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studio_db","root","");
			Statement st = con.createStatement();
			ResultSet rs =st.executeQuery("select * from customer where Name='"+myname+"' and Phone_number='"+mypass+"'");
			while(rs.next()) {
				z=1;
				HttpSession session = req.getSession();
				session.setAttribute("your_name",myname);
				RequestDispatcher rd=req.getRequestDispatcher("/home.jsp");
				rd.include(req, res);
			}
			if(z==0) {
				out.println("<html><head>");
				 out.println("<link rel='stylesheet' href='CSS/welcomestyle.css'>");
		            out.println("</head><body>");
		            out.println("<div class='popup'>");
		            out.println("<div class='imgbox'>");
		            out.println("<img src='Images/sorry.jpg' alt='Error Image' class='img'>");
		            out.println("</div>");
		            out.println("<div class='title'>");
		            out.println("<h3>sorry</h3>");
		            out.println("</div>");
		            out.println("<p class='para'>wrong username or password</p>");
		            out.println("<button class='button-ok' onclick='closePopup()'>OK</button>");
		            out.println("</div>");
		            out.println("<script>");
		            out.println("function closePopup() {");
		            out.println("    var popup = document.querySelector('.popup');");
		            out.println("    popup.style.display = 'none';");
		            out.println("}");
		            out.println("</script>");
		            out.println("</body></html>");
		        	RequestDispatcher rd=req.getRequestDispatcher("/customerLogin.jsp");
					rd.include(req, res);
			}
		}
			
		catch(Exception e)
		{
			e.printStackTrace();
			out.print("<h3 style='color:green'>Exception occured:"+e.getMessage()+"</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("/customerLogin.jsp");
			rd.include(req, res);
			
			
		}
		
	}
	}
}


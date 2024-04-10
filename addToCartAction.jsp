<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%

String name = session.getAttribute("your_name").toString();
int product_id=Integer.parseInt(request.getParameter("id"));


int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from product where id="+product_id+"");
	while(rs.next()){
		product_price=rs.getInt(3);
		product_total=product_price;
	}
	ResultSet rs1 = st.executeQuery("select * from orders where id="+product_id+"  and  name='"+name+"' ");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=rs.getInt(3);
		quantity=quantity+1;
		z=1;
	}

	 if(z==1){
		 PreparedStatement updateStatement = con.prepareStatement("update orders set total=?, quantity=? where id=? and name=? ");
	        updateStatement.setInt(1, cart_total);
	        updateStatement.setInt(2, quantity);
	        updateStatement.setInt(3, product_id);
	        updateStatement.setString(4, name);
	        updateStatement.executeUpdate();
	        
		response.sendRedirect("home.jsp?msg=exist");
		
	}
	
	 if(z==0){
		PreparedStatement ps = con.prepareStatement("insert into orders(id,quantity, price, total, name) values(?, ?, ?, ?, ?)");
		ps.setInt(1, product_id);
	
		ps.setInt(2, quantity);
		ps.setInt(3, product_price);
		ps.setInt(4, product_total);
		ps.setString(5, name);
		ps.executeUpdate();
	
		response.sendRedirect("home.jsp?msg=added");
		
	}

}
catch(Exception e){
	  e.printStackTrace(); // Print the stack trace of the exception
	  response.sendRedirect("home.jsp?msg=invalid");
	
}
%>

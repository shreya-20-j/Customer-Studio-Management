<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String description=request.getParameter("description");
String image=request.getParameter("image");
String stock=request.getParameter("active");

try{
	Connection con= ConnectionProvider.getCon();
	PreparedStatement ps =con.prepareStatement("INSERT INTO product (product_name, price,category,description,image,stock) VALUES (?, ?, ?,?,?,?)");

	ps.setString(1, name);
	ps.setString(2, price);
	ps.setString(3, category);
	ps.setString(4, description);
	ps.setString(5, image);
	ps.setString(6, stock);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>
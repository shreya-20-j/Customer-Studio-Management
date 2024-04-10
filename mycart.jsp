<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>
<%@page import="java.util.*"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@include file="Header.jsp" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet" href="CSS/productshow.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<br>
<br>
<div style="color:blue; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<br>


<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;


try{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from orders where name='"+name+"' ");
	while(rs1.next()){
		total=rs1.getInt(1);
%>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        
      <%
      ResultSet rs=st.executeQuery("SELECT * FROM product INNER JOIN orders ON product.id = orders.id AND orders.name='"+name+"' ");
      while(rs.next()){
      %>
          <tr>
           <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3) %> </td>
            
            <td>
                  <a href="updateQuantity.jsp?productId=<%= rs.getInt(8) %>&operation=minus">-</a>
                  <%= rs.getInt(9) %>
                  <a href="updateQuantity.jsp?productId=<%= rs.getInt(8) %>&operation=plus">+</a>
             </td>
                
                
           <td><i class="fa fa-inr"></i> <%=rs.getInt(11)%></td>
            <td><a href="removeOrder.jsp?id=<%= rs.getInt(8)%>">Remove <i class='fas fa-trash-alt'></i></a></td>

          </tr>
         
          <%
          }
          }
}
          catch(Exception e)
          {
        	  System.out.println(e);
          }
          %>

        </tbody>
      </table>
      <table>
      <thead>
       <tr>
           <th scope="col" style="background-color: yellow;">Total:  <%out.println(total); %><i class="fa fa-inr"></i> </th>
           <%if(total>0){%><th scope="col"><a href="addressPaymentOfOrder.jsp">Proceed to order</a></th><%} %>
        </tr>
        </thead>
        </table>
      <br>
      <br>
      <br>
      

</body>
</html>
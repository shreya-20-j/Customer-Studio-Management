<%@ page import="java.sql.*" %>
<%@ page import="studioManagement.ConnectionProvider" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@include file="Header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="CSS/productshow.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<br>
<br>
<div style="color: blue; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<br>
<%
String msg= request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%} %>

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
        
        <%
        try{
        	Connection con = ConnectionProvider.getCon();
        	Statement st = con.createStatement();
        	ResultSet rs =st.executeQuery("Select * from product where stock='Yes'");
        	while(rs.next())
        	{
        	%>


          <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(4)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getInt(3) %></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getInt(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
          <%
        	}
        }
        catch(Exception e){
        	System.out.println(e);
        }
          %>

        </tbody>
      </table>
      <br>
      <br>

</body>
</html>
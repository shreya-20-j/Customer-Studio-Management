<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>
<%@page import="java.util.*"%>
<%@include file="Header.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searching</title>
<link rel="stylesheet" href="CSS/productshow.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
        int z=0;
        try{
        	
            String search = request.getParameter("search");
        	Connection con = ConnectionProvider.getCon();
        	Statement st = con.createStatement();
        	ResultSet rs =st.executeQuery("Select * from product where product_name like '%"+search+"%' or category like '%"+search+"%' and stock='yes'");
        	while(rs.next())
        	{
        		z=1;
        	
        	%>
        

          <tr>
             <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(4)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3) %></td>
             <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
               <%
        	}
        }
        catch(Exception e){
        	System.out.println(e);
        }
          %>

          </tr>
         
        </tbody>
      </table>
      	<%if(z==0){ %>
	<h1 style="color:blue; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
   

</body>
</html>
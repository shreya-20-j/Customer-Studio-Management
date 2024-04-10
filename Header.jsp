<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link rel="stylesheet" href="CSS/homestyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style >
    
    .topnav a:hover:not(.active) {
      background-color:white;
      color: black;
     
        transform: translateY(3px);
           
      
    }
    .topnav a.active {
            background-color: white;
            color: black;
            transform: translateY(3px);
        }
    </style>
</head>
<body>
<br>
<br>

    <div class="topnav sticky">
       <%String name = session.getAttribute("your_name").toString();%>
         <h2><a href=""><%out.println(name);%> <i class='fas fa-user-alt'></i></a></h2>
        <a href="home.jsp">Home <i class="fa fa-institution"></i></a>
        <a href="mycart.jsp">My Cart <i class='fas fa-shopping-cart'></i></a>
        <a href="myOrders.jsp">My Orders <i class='fab fa-elementor'></i></a>
      
        <a href="messageUs.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
  
        <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
        <div class="search-container">
        <form action="searchHome.jsp" method="post">
        <input type="text" placeholder="Search" name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
        </form>
            
        </div>
    </div>
</body>
</html>  
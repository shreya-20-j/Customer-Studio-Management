<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>
<%@page import="java.util.*"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@include file="Header.jsp" %>
    
<html>
<head>
<link rel="stylesheet" href="CSS/messageUs.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<br>
<br>
<div style="color: blue; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 style="text-align:center; color:chocolate;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="subject" required>
<br>
<br>
<textarea class="input-style" name="body"  placeholder="Enter Your Message " required></textarea>
<br>
<button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i> </button>
</form>
<br><br><br>
</body>
</html>
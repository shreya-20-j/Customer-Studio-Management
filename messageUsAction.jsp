<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
String name = session.getAttribute("your_name").toString();
String subject=request.getParameter("subject");
String body = request.getParameter("body");
try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps =con.prepareStatement("insert into message (name,subject,body) values(?,?,?)");
	ps.setString(1, name);
	ps.setString(2, subject);
	ps.setString(3, body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>
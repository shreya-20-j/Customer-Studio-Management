<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>

<%


try {
    // Establish a connection to the database
    Connection con = ConnectionProvider.getCon();

    // Get the order ID that you want to delete from the request parameter
    int orderId = Integer.parseInt(request.getParameter("id"));

    // Prepare the SQL statement
    String sql = "DELETE FROM orders WHERE id = ?";
    PreparedStatement stmt = con.prepareStatement(sql);
    
    // Set the parameter value for the order ID
    stmt.setInt(1, orderId);
    
    // Execute the delete operation
    int rowsAffected = stmt.executeUpdate();
    
    if (rowsAffected > 0) {
    	response.sendRedirect("mycart.jsp");
        out.println("Order removed successfully!");
    } else {
        out.println("Failed to remove order.");
    }
    
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} 
%>

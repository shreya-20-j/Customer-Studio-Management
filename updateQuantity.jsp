<%@ page import="java.sql.*" %>
<%@page import="studioManagement.ConnectionProvider"%>

<%
// Retrieve parameters from the AJAX request
String productId = request.getParameter("productId");
String operation = request.getParameter("operation");


try {
    // Load the database driver
  Connection con = ConnectionProvider.getCon();
    
    // Prepare the SQL statement based on the operation
    String sql;
    if ("plus".equals(operation)) {
        sql = "UPDATE orders SET quantity = quantity + 1 WHERE id = ?";
    } else if ("minus".equals(operation)) {
        sql = "UPDATE orders SET quantity = quantity - 1 WHERE id = ?";
    } else {
        // Invalid operation
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        out.println("Invalid operation");
        return;
    }

    // Prepare and execute the SQL statement
    PreparedStatement statement = con.prepareStatement(sql);
    statement.setString(1, productId);
    int rowsAffected = statement.executeUpdate();

    // Check if any rows were affected
    if (rowsAffected > 0) {
        // Fetch the updated quantity from the database
        Statement fetchStatement = con.createStatement();
        ResultSet resultSet = fetchStatement.executeQuery("SELECT quantity , price FROM orders WHERE id = '" + productId + "'");
        if (resultSet.next()) {
            
        	int quantity = resultSet.getInt("quantity");
            int price = resultSet.getInt("price");
            int total = quantity * price;
            
            // Update total in the orders table
            PreparedStatement updateTotalStatement = con.prepareStatement("UPDATE orders SET total = ? WHERE id = ?");
            updateTotalStatement.setInt(1, total);
            updateTotalStatement.setString(2, productId);
            updateTotalStatement.executeUpdate();
            
            // Send the updated total as the response
            out.println(total);
            
            response.sendRedirect("mycart.jsp");
        }
        resultSet.close();
        fetchStatement.close();
    } else {
        // No rows were affected
        response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
        out.println("Quantity not updated");
    }

    // Clean up resources
    statement.close();
    con.close();

}
catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("mycart.jsp");
}
%>

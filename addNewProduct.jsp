<%@page import="java.sql.*"%>
<%@page import="studioManagement.ConnectionProvider"%>


<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>

<h3 class="alert">Product Added Successfully!</h3>

<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%
int id=1;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select max(id) from product");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	
}
%>

<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<input type="hidden" name="id" value=<%out.println(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input type="text" name="name" placeholder="Enter name" required>
 
<hr>
</div>



<div class="left-div">
<h3>Enter Price</h3>
  <input type="number" name="price" placeholder="Enter price" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input type="text" name="category" placeholder="Enter category" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input type="text" name="description" placeholder="Enter category" >
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input type="text" name="image" placeholder="Enter category" >
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select name="active">
<option value="yes">Yes</option>
<option value="no">No</option>
</select>
   
<hr>
</div>
<button>Save <i class='far fa-arrow-alt-circle-right'></i></button> 
</form>
</body>
<br><br><br>
</body>
</html>
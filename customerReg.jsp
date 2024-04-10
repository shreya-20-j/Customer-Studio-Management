<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
   <div class="main">
  <!-- Sign up form -->
   <section class="signup">
       <div class="container">
           <div class="signup-content">
               <div class="signup-form">
                   <h2 class="form-title">Sign up</h2>
                   <form action="register" method="POST" class="register-form" id="register-form">
                       <div class="form-group">
                           <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                           <input type="text" name="name"  placeholder="Your Name" required/>
                       </div>
                      
                   
                        <div class="form-group">
                           <label for="place"><i class="zmdi zmdi-email"></i></label>
                           <input type="text" name="place"  placeholder="Your Place" required/>
                       </div>
                        <div class="form-group">
                           <label for="phone_number"><i class="zmdi zmdi-email"></i></label>
                           <input type="text" name="phone_number"  placeholder="Your Phone Number" required/>
                       </div>
                       
                           
                            
                       <div class="form-group form-button">
                           <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                       </div>
                   </form>
               </div>
               <div class="signup-image">
                   <figure><img src="Images/image1.png" alt="sing up image"></figure>
                   <a href="customerLogin.jsp" class="signup-image-link">I am already member</a>
               </div>
           </div>
       </div>
   </section>
   </div>
   


</body>
</html>
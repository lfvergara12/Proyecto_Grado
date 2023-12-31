<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <!-- basic -->
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- mobile metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- site metas -->
   <title>AWID</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- site icon -->
   <link rel="icon" href="images/fevicon.png" type="image/png" />
   <!-- bootstrap css -->
   <link rel="stylesheet" href="css/bootstrap.min.css" />
   <!-- site css -->
   <link rel="stylesheet" href="style.css" />
   <!-- responsive css -->
   <link rel="stylesheet" href="css/responsive.css" />
   <!-- color css -->
   <link rel="stylesheet" href="css/colors.css" />
   <!-- select bootstrap -->
   <link rel="stylesheet" href="css/bootstrap-select.css" />
   <!-- scrollbar css -->
   <link rel="stylesheet" href="css/perfect-scrollbar.css" />
   <!-- custom css -->
   <link rel="stylesheet" href="css/custom.css" />
   <!-- calendar file css -->
   <link rel="stylesheet" href="js/semantic.min.css" />
   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
   <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
</head>
<body class="inner_page login">
   <div class="full_container">
      <div class="container">
         <div class="center verticle_center full_height">
            <div class="login_section">
               <div class="logo_login">
                  <div class="center">
                     <img width="210" src="images/logo/logo.png" alt="#" />
                  </div>
               </div>
               <div class="login_form">
                  <form action="UserController" method="post">
                     <input type="hidden" name="action" value="loginAdmin">
                     <fieldset>
                        <div class="field">
                           <label class="label_field">Email Address</label>
                           <input type="email" name="email" placeholder="E-mail" required />
                        </div>
                        <div class="field">
                           <label class="label_field">Password</label>
                           <input type="password" name="password" placeholder="Password" required />
                        </div>
                        <br>
                        <br>
                        <div class="field margin_0">
						    <label class="label_field hidden">hidden label</label>
						    <button class="main_bt" style="background-color: #007BFF; margin-left: 10%;">Iniciar Sesión</button>
						</div>

    <div style="text-align: center;">
		<a href="login.jsp" style="color: #007BFF; text-decoration: none; margin-top: 10px; display: block;">
		    <i class="fas fa-arrow-left"></i> Volver a la página de inicio de sesión
</a>    
    </div>
                        <div class="field margin_0">
                           <label class="label_field hidden">hidden label</label>
                        </div>
                     </fieldset> 
                  </form>
               </div>
               <% if (request.getAttribute("error") != null) { %>
                   <p>Error: <%= request.getAttribute("error") %></p>
               <% } %>
            </div>
         </div>
      </div>
   </div>
   <!-- jQuery -->
   <script src="js/jquery.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <!-- wow animation -->
   <script src="js/animate.js"></script>
   <!-- select country -->
   <script src="js/bootstrap-select.js"></script>
   <!-- nice scrollbar -->
   <script src="js/perfect-scrollbar.min.js"></script>
   <script>
      var ps = new PerfectScrollbar('#sidebar');
   </script>
   <!-- custom js -->
   <script src="js/custom.js"></script>
</body>
</html>

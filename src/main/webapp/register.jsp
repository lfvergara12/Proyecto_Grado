<%@ page import="conexionA.DBUtil, conexionA.User, conexionA.UserController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
   
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
<h3 style="text-align: center; font-size: 24px; color: #333; margin-top: 10px;">Registro de Usuario</h3>
                  
    <form action="UserController" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="register">

    <fieldset>
        <div class="field">
            <label class="label_field">Nombre</label>
            <input type="text" name="nombre" placeholder="Nombre" required />
        </div>
        <div class="field">
            <label class="label_field">Apellido</label>
            <input type="text" name="apellido" placeholder="Apellido" required />
        </div>
        <div class="field">
            <label class="label_field">Email</label>
            <input type="email" name="email" placeholder="Email" required />
        </div>
        <div class="field">
            <label class="label_field">Usuario</label>
            <input type="text" name="usuario" placeholder="Usuario" required />
        </div>
        <div class="field" style="position: relative;">
    <label class="label_field">Contraseña</label>
    <input type="password" id="password" name="password" placeholder="Contraseña" required />
      </div>
    </fieldset>

    <div style="text-align: center;">
        <input type="submit" value="Registrarse" style="background-color: #007BFF; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-top: 10px;">
		<a href="login.jsp" style="color: #007BFF; text-decoration: none; margin-top: 10px; display: block;">
		    <i class="fas fa-arrow-left"></i> Volver a la página de inicio de sesión
</a>    
    </div>
</form>
<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var passwordRegex = /^(?=.*[!@#$%^&*()-_=+\[\]{}|;:'",.<>?])(?=.*[0-9])(?=.*[A-Z]).{8,}$/;

        if (!passwordRegex.test(password)) {
            alert("La contraseña debe contener caracteres especiales, números y letras mayúsculas.");
            return false;
        }

        return true;
    }
</script>

    
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

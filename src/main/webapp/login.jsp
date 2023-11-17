
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <!-- basic -->
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
    <style>
        .btn-link {
            color: #007BFF;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        .btn-link:hover {
            text-decoration: underline;
        }
    </style>
    <style>
    .main_bt {
        background-color: #007BFF; /* Color de fondo azul */
        color: #fff; /* Color del texto blanco */
        border: none; /* Quitar el borde del botón si es necesario */
        padding: 10px 20px; /* Ajusta el relleno según tu preferencia */
        border-radius: 5px; /* Añade esquinas redondeadas si deseas */
    }

    .main_bt:hover {
        background-color: #0056b3; /* Cambiar el color de fondo al pasar el cursor sobre el botón */
    }
</style>
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
               
<%-- Otras partes de tu código JSP --%>

<%
    String mensajeRegistroExitoso = (String) request.getAttribute("registroExitoso");
    if (mensajeRegistroExitoso != null && !mensajeRegistroExitoso.trim().isEmpty()) {
%>
    <div class="alert alert-success" role="alert">
        <%= mensajeRegistroExitoso %>
    </div>
<%
    }
%>

<%-- Otras partes de tu código JSP --%>


               
               <div class="login_form">
			        <form action="UserController" method="post">
			        <input type="hidden" name="action" value="login">
			        <fieldset>
			            <div class="field">
			                <label class="label_field">Usuario</label>
			                <input type="text" name="usuario" placeholder="Usuario" required />
			            </div>
			            <div class="field">
			                <label class="label_field">Password</label>
			                <input type="password" name="password" placeholder="Password" required />
			            </div>
			            <br>
			            <div class="field margin_0">
			                <label class="label_field hidden">hidden label</label>
			                <button class="main_bt" style="margin-left: 10%;">Iniciar Sesión</button>
			            </div>
			        </fieldset>
			    </form>
			</div>
			<div style="margin-left: 75%;">
			    <a href="register.jsp" class="btn-link">Registrarse    </a>
			    <br>
			    <a href="loginAdmin.jsp" class="btn-link">Login Admin</a>
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

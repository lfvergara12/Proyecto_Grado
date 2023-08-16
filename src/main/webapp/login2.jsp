<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
   <head>
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
                  <form action="login.jsp" method="post">
                       <!-- Rest of the form fields -->
                       <div class="field">
                          <label class="label_field">Email Address</label>
                          <input type="email" name="email" placeholder="E-mail" />
                       </div>
                       <div class="field">
                          <label class="label_field">Password</label>
                          <input type="password" name="password" placeholder="Password" />
                       </div>
                       <!-- Rest of the form elements -->
                       <div class="field margin_0">
                          <label class="label_field hidden">hidden label</label>
                          <button class="main_bt" style="margin-left:10%;" type="submit">Iniciar Sesión</button>
                       </div>
                    </form>
                  <div class="login_form">
                    <%
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    String url = "jdbc:postgresql://localhost:5432/AWID_proyecto";
                    String usuario = "postgres";
                    String contrasena = "Luis2002";

                    try {
                        Connection connection = DriverManager.getConnection(url, usuario, contrasena);
                        String sql = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, email);
                        statement.setString(2, password);
                        ResultSet resultSet = statement.executeQuery();

                        if (resultSet.next()) {
                            // Authentication successful, redirect to another page
                            response.sendRedirect("index.html");
                        } else {
                            // Show error message
                            out.println("Credenciales incorrectas. Por favor, inténtalo nuevamente.");
                        }

                        resultSet.close();
                        statement.close();
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error de conexión con la base de datos");
                    }
                    %>
                    
                  </div>
                  <a href="loginAdmin.html"  style="margin-left:75%;">Login Admin</a>
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

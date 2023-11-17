<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="conexionA.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.PreparedStatement" %>
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
      <link rel="stylesheet" href="stylePop.css">
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- site icon -->
      <link rel="icon" href="images/fevicon.png" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <link rel="stylesheet" href="styles2.css" />
      <link rel="stylesheet" href="stylePop.css" />
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
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   
     
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="#"><img class="logo_icon img-responsive" src="images/logo/logo_icon.png" alt="#" /></a>
                     </div>
                  </div>

                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="images/user3.png" alt="#" /></div>
                        <div class="user_info">
                         <% String nombre = (String) request.getSession().getAttribute("nombre");
                         out.print(nombre);
							%>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                   
<!--                   <ul class="list-unstyled components"> -->
                     
<!--                      <li><a button id="toggle-paragraph"><i class="fa fa-table purple_color2"></i> <span>Tabla de Usuarios</span></li></a></button> -->
                    
<!--                      <li><a button id="toggle-paragraph2"><i class="fa fa-briefcase blue1_color"></i><span>Registros por prueba</span></li></a></button>    -->
                    
<!--                      <li><a button id="toggle-paragraph3""><i class="fa fa-bar-chart-o green_color"></i> <span>Listado de pruebas</span></li></a></button> -->
                     
<!--                   </ul> -->
					<ul class="list-unstyled components">
					  <li class="active"><a href="indexAdmin.jsp"><i class="fa fa-table purple_color2"></i><span>CRUD usuarios</span></a></li>
					  <li ><a href="listadoPrueba.jsp" ><i class="fa fa-briefcase blue1_color"></i><span>Listado de pruebas </span></a></li>
					  <li><a href="limpiezaDatos.jsp" ><i class="fa fa-bar-chart-o green_color"></i> <span>Limpieza de datos</span></a></li>
					  <li><a href="cargaAdm.jsp" ><i class="fa fa-briefcase blue1_color"></i><span>Subir reportes</span></a></li>
					</ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                           <a href="indexAdmin.jsp"><img class="img-responsive" src="images/logo/logo.png" alt="#" /></a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              
                              <ul class="user_profile_dd">
                                 <li>
	                                 		<a class="dropdown-toggle" data-toggle="dropdown">
											   <img class="img-responsive rounded-circle" src="images/user3.png" alt="#" />
											   <span class="name_user">
											      <% 
											         out.print(nombre); %>
											   </span>
											</a> 
                                    <div class="dropdown-menu">
                                       <a class="dropdown-item" href="login.jsp"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Bienvenido al area administrativa.</h2>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
<%-- Otras partes de tu código JSP --%>

<%-- Verificar si hay un mensaje de eliminación exitosa y mostrarlo --%>
<%
    String eliminacionExitosaMessage = (String) request.getSession().getAttribute("eliminacionExitosa");
    if (eliminacionExitosaMessage != null && !eliminacionExitosaMessage.trim().isEmpty()) {
%>
    <div class="alert alert-success" role="alert">
        <%= eliminacionExitosaMessage %>
    </div>
<%
    // Eliminar el atributo de la sesión para que no se muestre en futuras visitas
    request.getSession().removeAttribute("eliminacionExitosa");
    }
%>
  <div class="counter_no" >
  <div class="container">




        <div class="pagination">
            <ul></ul>
        </div>
        <div class="container-popup-messages">
<head>
    <meta charset="UTF-8">
    <title>Lista de Consultas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
<head>
    <!-- Agrega las etiquetas meta, enlaces CSS y otros encabezados aquí -->
</head>
<body>
    <h1>Lista de Consultas</h1>

    <table>
        <thead>
            <tr>
                <th>Tipo de Análisis</th>
                <th>Año</th>
                <th>Región</th>
                <th>Resultado Texto</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
            try (Connection connection = DBUtil.getConnection()) {
                String sql = "SELECT * FROM consultas";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String tipoAnalisis = resultSet.getString("tipo_analisis");
                    String anio = resultSet.getString("anio");
                    String region = resultSet.getString("region");
                    String resultadoTexto = resultSet.getString("resultado_texto");

            %>
            <tr>
                <td><%= tipoAnalisis %></td>
                <td><%= anio %></td>
                <td><%= region %></td>
                <td><%= resultadoTexto %></td>
                <td>
                    <form action="eliminarConsulta.jsp" method="post">
                        <input type="hidden" name="id" value="<%= id %>">
<button type="submit" class="btn btn-danger" style="background-color: #808080; color: #fff;">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%
                }
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</body>
        </div>
  </div>
</div>

                    <script src="dinamico.js"></script>
                    <script src="script.js"></script>
                   


         
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
       <script src="app.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
      <!-- select country -->
      <script src="js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="js/Chart.min.js"></script>
      <script src="js/Chart.bundle.min.js"></script>
      <script src="js/utils.js"></script>
      <script src="js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
      <script src="js/chart_custom_style1.js"></script>
   </body>
</html>
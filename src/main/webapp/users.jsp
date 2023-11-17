<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="conexionA.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

 


<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
</head>
<body>
    <div style="max-width: 700px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ccc; border-radius: 5px;">
        <h1 style="text-align: center;">Lista de Usuarios</h1>
        
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Nombre</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Apellido</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Email</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Usuario</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try (Connection connection = DBUtil.getConnection()) {
                    String sql = "SELECT * FROM usuarios";
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(sql);

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        nombre = resultSet.getString("nombre");
                        String apellido = resultSet.getString("apellido");
                        String usuario = resultSet.getString("usuario");
                        String email = resultSet.getString("email");
                %>
                <tr>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: left;"><%= nombre %></td>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: left;"><%= apellido %></td>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: left;"><%= email %></td>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: left;"><%= usuario %></td>
                    <td style="border: 1px solid #ddd; padding: 8px; text-align: left;">
                        <a href="UserController?action=editUser&id=<%= id %>" style="text-decoration: none; color: #007bff;">Editar</a>
                        <form action="UserController" method="post" style="display: inline;">
                            <input type="hidden" name="action" value="deleteUser">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit" style="background-color: #dc3545; color: #fff; border: none; border-radius: 5px; padding: 5px 10px; cursor: pointer;">Eliminar</button>
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
        
        <a href="crearUsuario.jsp" style="display: block; margin-top: 10px; text-align: center; color: #007bff;">Crear Usuario</a>
    </div>
</body>


            </thead>
            <tbody class="table-content">
            </tbody>
        </table>
        <div class="pagination">
            <ul></ul>
        </div>
        <div class="container-popup-messages">
            
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
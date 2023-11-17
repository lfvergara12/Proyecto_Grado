<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="conexionA.DBUtil" %>
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

<%
    String cargaExitosa = (String) request.getAttribute("cargaExitosa");
    if (cargaExitosa != null && !cargaExitosa.trim().isEmpty()) {
%>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= cargaExitosa %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<%
    }
%>

<%-- Otras partes de tu código JSP --%>

<div class="counter_no">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <h2 style="text-align: center; font-family: Arial, sans-serif; font-size: 24px; color: #007bff;">Adjunte los archivos</h2>
                <br>
                <form action="CargaAdmin" method="POST" enctype="multipart/form-data" style="background-color: #f5f5f5; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
                    <div class="menu-section" style="margin-bottom: 10px;">
                        <h2 style="text-align: center; font-family: Arial, sans-serif; font-size: 24px;">Tipo de Análisis</h2>
                        <br>
                        <select id="selectTipoAnalisis" name="selectTipoAnalisis" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 20px;">
                            <option value="">Seleccionar Análisis</option>
                            <option value="descriptivo">Análisis Descriptivo</option>
                            <option value="predictivo">Análisis Predictivo</option>
                        </select>
                    </div>

                    <div class="menu-section" style="margin-bottom: 10px;">
                        <h2 style="text-align: center; font-family: Arial, sans-serif; font-size: 24px;">Año</h2>
                        <br>
                        <select id="selectAnio" name="selectAnio" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 20px;">
                            <option value="">Seleccionar Año</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            
                            <!-- Agrega más opciones de año si es necesario -->
                        </select>
                    </div>

                    <div class="menu-section" style="margin-bottom: 10px;">
                        <h2 style="text-align: center; font-family: Arial, sans-serif; font-size: 24px;">Región</h2>
                        <br>
                        <select id="selectRegion" name="selectRegion" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 20px;">
                            <option value="">Seleccionar Región</option>
                            <option value="amazonica">Amazónica</option>
                            <option value="orinoquia">Orinoquía</option>
                            <option value="caribe">Caribe</option>
                            <option value="pacifica">Pacífica</option>
                            <option value="andina">Andina</option>
                            <!-- Agrega más opciones de región si es necesario -->
                        </select>
                    </div>

                    <div class="menu-section" style="margin-bottom: 10px;">
                        <h2 style="text-align: center; font-family: Arial, sans-serif; font-size: 24px;">Archivo PDF</h2>
                        <br>
                        <input type="file" id="inputFile" name="inputFile" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 20px;">
                    </div>

                    <!-- Estilo para centrar y hacer el botón azul -->
                    <div style="text-align: center;">
                        <button id="btnAgregar" style="font-family: Arial, sans-serif; background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


                   


         
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
       <script src="app.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
   
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
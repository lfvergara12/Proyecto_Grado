<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:p="http://primefaces.org/ui"
      lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <link rel="stylesheet" href="stylePop.css">
      
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
     
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="stylesheet" href="css/menu.css">
      <!-- site icon -->
      <link rel="icon" href="images/fevicon.png" type="image/png" />
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
            <link rel="stylesheet" href="style.css" />
      <link rel="stylesheet" href="styles2.css" />
      <link rel="stylesheet" href="stylePop.css" />
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
          <style>
        /* Estilos para centrar el mapa en la mitad de la página */
        .map-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh; /* Ajusta la altura del mapa según tu preferencia */
        }
    </style>

     
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
         <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <!-- ... -->
                  <!-- Aquí va el bloque de código que quieres agregar -->
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="images/layout_img/user_img.jpg" alt="#" /></div>
                        <div class="user_info">
                           <% String nombre = (String) request.getSession().getAttribute("nombre");
                              out.print(nombre);
                           %>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
                  <!-- ... -->
               </div>
               <div class="sidebar_blog_2">
                  <h4>Escoge el tipo de prueba    
                  <ul class="list-unstyled components">
                     <li class="active"><a href="users.jsp"><i class="fa fa-table purple_color2"></i><span>Tercero</span></a></li>
                     <li><a href="indexAdmin2.html"><i class="fa fa-briefcase blue1_color"></i><span>Quinto</span></a></li>
                     <li><a href="indexAdmin3.html"><i class="fa fa-bar-chart-o green_color"></i><span>Noveno</span></a></li>
                     <li><a href="indexAdmin4.html"><i class="fa fa-briefcase blue1_color"></i><span>Once</span></a></li>
                  </ul>
               </div>
            </nav>
            <!-- Sidebar  -->
 
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <div class="logo_section">
                           <a href="index.html"><img class="img-responsive" src="images/logo/logo.png" alt="#" /></a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul>
                                 <li><a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                 <li><a href="#"><i class="fa fa-question-circle"></i></a></li>
                                 <li><a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                              </ul>
                              <ul class="user_profile_dd">
                                 <li>
										<a class="dropdown-toggle" data-toggle="dropdown">
										   <img class="img-responsive rounded-circle" src="images/layout_img/user_img.jpg" alt="#" />
										   <span class="name_user">
										      <% nombre = (String) request.getSession().getAttribute("nombre");
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
                           
                              <h2>Bienvenido, por favor seleccione las caracteristicas para el analisis</h2>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                     <div class="row column1">
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-user yellow_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p class="head_couter">
<div class="menu-section">
    <h3>Tipo de Análisis</h3>
    <select id="selectTipoAnalisis">
        <option value="">Seleccionar Análisis</option>
        <option value="descriptivo">Análisis Descriptivo</option>
        <option value="predictivo">Análisis Predictivo</option>
    </select>
</div>

<div class="menu-section">
    <h3>Año</h3>
    <select id="selectAnio">
        <option value="">Seleccionar Año</option>
        <option value="2016">2016</option>
        <option value="2017">2017</option>
        <option value="2018">2018</option>
        <option value="2019">2019</option>
        <option value="2020">2020</option>
        <option value="2021">2021</option>
    </select>
</div>

<div class="menu-section">
    <h3>Región</h3>
    <select id="selectRegion">
        <option value="">Seleccionar Región</option>
        <option value="amazonica">Amazonica</option>
        <option value="orinoquia">Orinoquia</option>
        <option value="caribe">Caribe</option>
        <option value="pacifica">Pacifica</option>
        <option value="andina">Andina</option>
    </select>
</div>

<!-- Botón Consultar -->
<button id="btnConsultar">Consultar</button>

      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
       <script src="app.js"></script>
        <script src="script2.js"></script>
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
      <script src="js/menu.js"></script>
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
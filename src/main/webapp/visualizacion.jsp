
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:p="http://primefaces.org/ui"
      lang="en">
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
      <link rel="stylesheet" href="styles.css">
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
                        <div class="user_img"><img class="img-responsive" src="images/user3.png" alt="#" /></div>
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
                    <li class="active"><a href="index.jsp"><i class="fa fa-table purple_color2"></i><span>Prueba 11</span></a></li>
                     <li><a href="pruebas.jsp"><i class="fa fa-briefcase blue1_color"></i><span>Prueba 3 5 9</span></a></li>
                     <li><a href="tableroDinamico.jsp"><i class="fa fa-briefcase green_color"></i><span>Tablero dinamico</span></a></li>

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
                           <a href="index.jsp"><img class="img-responsive" src="images/logo/logo.png" alt="#" /></a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul>

                              </ul>
                              <ul class="user_profile_dd">
                                 <li>
										<a class="dropdown-toggle" data-toggle="dropdown">
										   <img class="img-responsive rounded-circle" src="images/user3.png" alt="#" />
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
                           <div class="center">
                              <h2>Descargue PDF</h2>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
 
    <body class="dashboard dashboard_1">
    <!-- Contenido del formulario -->
    <div class="container-fluid">
<div style="max-width: 700px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ccc; border-radius: 5px;">
<h1 style="font-size: 24px; text-align: center; color: #007bff; margin-bottom: 20px;">Resultado de la Consulta</h1>

		<p style="font-size: 18px; text-align: center;"><%= request.getAttribute("resultadoTexto") %></p>
		<br>
		<!-- Estilo para el enlace de descarga de PDF -->
		<p style="text-align: center;">
        <a href="<%= request.getAttribute("rutaPDF") %>" style="background-color: #007bff; color: #fff; padding: 10px 20px; text-decoration: none; border-radius: 5px;" target="_blank">Descargar PDF</a>
		</p>
</div>

      <!-- jQuery -->
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="js/script.js"></script>
      <script src="js/modal.js"></script>
<script type="js/custom.js"></script>
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
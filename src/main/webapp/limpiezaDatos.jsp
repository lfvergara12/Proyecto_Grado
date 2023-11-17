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
					  <li ><a href="indexAdmin2.html" ><i class="fa fa-briefcase blue1_color"></i><span>Listado de pruebas </span></a></li>
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
                           <a href="limpiezaDatos.jsp"><img class="img-responsive" src="images/logo/logo.png" alt="#" /></a>
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

  <div class="counter_no" >
  <div class="container">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Limpieza de Datos</title>
    <style>
        

        h1 {
            color: #3498db;
        }

        /* Estilos para el botón */
        #cleanButton {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Estilos para el indicador visual */
        #loader-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        #loader {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 2s linear infinite;
            display: none;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
    <h1>Limpieza de Datos</h1>
    <input type="file" id="fileInput" accept=".txt">
    <button id="cleanButton">Limpiar Datos</button>
    <a id="downloadLink" style="display: none" download="resultado.csv">Descargar CSV</a>

    <!-- Contenedor del indicador visual -->
    <div id="loader-container">
        <div id="loader"></div> <!-- Indicador visual -->
    </div>

    <script>
        function limpiarTexto(texto) {
            // Reemplazar "¬" por punto y coma (;)
            texto = texto.replace(/¬/g, ';');
        
            // Eliminar caracteres no ASCII
            texto = texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
        
            // Reemplazar ;; por ;?; y ,, por ,?, y eliminar comillas dobles
            texto = texto.replace(/;;/g, ';?;').replace(/"/g, '');
        
            // Eliminar caracteres '´'
            texto = texto.replace(/['´]/g, '');
        
            return texto;
        }

        async function limpieza(numVeces) {
            const fileInput = document.getElementById('fileInput');
            const inputFile = fileInput.files[0];
            
            if (!inputFile) {
                alert('Por favor, selecciona un archivo de texto.');
                return;
            }

            // Mostrar el indicador visual mientras se procesa
            const loader = document.getElementById('loader');
            loader.style.display = 'block';

            const reader = new FileReader();

            reader.onload = async function (event) {
                let archivoEntrada = event.target.result;

                for (let i = 0; i < numVeces; i++) {
                    const lineasEntrada = archivoEntrada.split('\n');
                    const lineasSalida = [];

                    for (const linea of lineasEntrada) {
                        const lineaLimpia = limpiarTexto(linea);
                        lineasSalida.push(lineaLimpia);
                    }

                    archivoEntrada = lineasSalida.join('\n');

                    // Introduce una pausa para liberar memoria
                    await new Promise(resolve => setTimeout(resolve, 0));
                }

                // Convertir el último archivo de texto en CSV
                const lineasCSV = archivoEntrada.split('\n');
                const csvData = lineasCSV.join('\n');

                // Crear archivo CSV para descarga
                const blob = new Blob([csvData], { type: 'text/csv' });
                const url = URL.createObjectURL(blob);
                const downloadLink = document.getElementById('downloadLink');
                downloadLink.href = url;
                downloadLink.style.display = 'block';

                // Ocultar el indicador visual
                loader.style.display = 'none';
            };

            reader.readAsText(inputFile);
        }

        document.getElementById('cleanButton').addEventListener('click', function () {
            limpieza(4); // Puedes cambiar el número de veces aquí
        });
    </script>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%  
   String rutaPDF = request.getParameter("rutaPDF");
   String nombrePDF = request.getParameter("nombrePDF");
   
   // Configura las cabeceras de respuesta para forzar la descarga
   response.setContentType("application/pdf");
   response.setHeader("Content-Disposition", "attachment; filename=\"" + nombrePDF + "\"");

   // Abre el archivo desde AWS S3 y copia el contenido a la respuesta
   try {
       InputStream inputStream = new FileInputStream(rutaPDF);
       int bytesRead;
       byte[] buffer = new byte[8192];
       while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
           response.getOutputStream().write(buffer, 0, bytesRead);
       }
       inputStream.close();
   } catch (Exception e) {
       e.printStackTrace();
       response.getWriter().write("Error al descargar el archivo");
   }
%>

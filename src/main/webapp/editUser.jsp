<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="conexionA.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userId = request.getParameter("id");
    boolean isEditing = (userId != null && !userId.isEmpty());
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
</head>
<body>
    <h1>Editar Usuario</h1>
     <form action="UserController?action=createUser" method="post">
        <input type="hidden" name="action" value="editUser">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<%= request.getParameter("nombre") %>"><br>
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" value="<%= request.getParameter("apellido") %>"><br>
        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= request.getParameter("email") %>"><br>
        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario" value="<%= request.getParameter("usuario") %>"><br>
        <label for="password">Contraseña:</label>
        <input type="password" name="password"><br>
        <button type="submit">Guardar</button>
    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Usuario</title>
</head>
<body>
    <h1>Crear Usuario</h1>
    <form action="UserController" method="post">
        <input type="hidden" name="action" value="createUser">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre"><br>
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido"><br>
        <label for="email">Email:</label>
        <input type="email" name="email"><br>
        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario"><br>
        <label for="password">Contraseña:</label>
        <input type="password" name="password"><br>
        <button type="submit">Guardar</button>
    </form>
</body>
</html>

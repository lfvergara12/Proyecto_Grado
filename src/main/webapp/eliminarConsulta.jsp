<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="conexionA.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);

        // Realiza la eliminación del registro en la base de datos
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM consultas WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 // Después de eliminar la consulta con éxito
    request.getSession().setAttribute("eliminacionExitosa", "Se ha eliminado exitosamente");

    // Redirige de nuevo a la página de lista de consultas
    response.sendRedirect("listadoPrueba.jsp");%>

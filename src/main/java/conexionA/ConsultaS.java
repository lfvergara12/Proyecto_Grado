package conexionA;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/ConsultaS")
public class ConsultaS extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtén los parámetros del formulario
        String grado = request.getParameter("selectGrado");
        String anio = request.getParameter("selectAnio");

        // Configura la respuesta HTTP
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Establecer la conexión a la base de datos utilizando DBUtil
            Connection connection = DBUtil.getConnection();

            // Consulta SQL para obtener el resultado_texto en función de grado y año
            String sql = "SELECT resultado_texto, rutapdf, nombrepdf FROM informe_icfes WHERE grado = ? AND anio = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, grado);
            statement.setString(2, anio);
            ResultSet result = statement.executeQuery();

            // Verificar si se encontraron resultados
            if (result.next()) {
                String resultadoTexto = result.getString("resultado_texto");
                String rutaPDF = result.getString("rutapdf");
                String nombrePDF = result.getString("nombrepdf");

                // Redirigir a visualizacion.jsp con el resultado
                request.setAttribute("resultadoTexto", resultadoTexto);
                request.setAttribute("rutaPDF", rutaPDF);
                request.setAttribute("nombrePDF", nombrePDF);

                RequestDispatcher dispatcher = request.getRequestDispatcher("visualizacionD.jsp");
                dispatcher.forward(request, response);

            } else {
                // Mostrar un mensaje de alerta en lugar de redirigir a una página
                response.setContentType("text/html");
                out.println("<html>");
                out.println("<head><title>Resultado de la Consulta</title></head>");
                out.println("<body>");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No se encontraron resultados.');");
                out.println("window.location.href = 'pruebas.jsp';"); // Redirige a la página anterior
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores en caso de problemas con la base de datos
            out.println("<html>");
            out.println("<head><title>Error</title></head>");
            out.println("<body>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error de base de datos.');");
            out.println("window.location.href = 'pruebas.jsp';"); // Redirige a la página anterior
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}


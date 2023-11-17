package conexionA;
import java.io.IOException;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/DownloadPdf")
public class DownloadPdf extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtiene la ruta del PDF desde los parámetros de la URL
        String rutaPDF = request.getParameter("rutaPDF");
        String nombrePDF = request.getParameter("nombrePDF");

        // Configura el tipo de contenido para la respuesta
        response.setContentType("application/pdf");

        // Abre el archivo PDF desde la ruta proporcionada
        try (InputStream inputStream = new FileInputStream(rutaPDF)) {
            OutputStream outputStream = response.getOutputStream();

            // Configura el encabezado para sugerir un nombre de archivo
            String headerValue = String.format("attachment; filename=\"%s\"", nombrePDF);
            response.setHeader("Content-Disposition", headerValue);

            // Copia el contenido del PDF al flujo de salida de la respuesta
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Maneja los errores, por ejemplo, redirigiendo a una página de error
        }
    }
}


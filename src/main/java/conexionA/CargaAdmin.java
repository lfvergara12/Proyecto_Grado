package conexionA;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;

@MultipartConfig
@WebServlet("/CargaAdmin")
public class CargaAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipoAnalisis = request.getParameter("selectTipoAnalisis");
        String anio = request.getParameter("selectAnio");
        String region = request.getParameter("selectRegion");
        // Ruta donde guardarás el archivo localmente en el servidor
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        Part filePart = request.getPart("inputFile");
        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;

        try {
            filePart.write(filePath);
            // El archivo se ha cargado localmente

            // Establece la conexión a la base de datos utilizando DBUtil
            Connection connection = DBUtil.getConnection();

            // Inserta los datos en la base de datos
            String sql = "INSERT INTO consultas (tipo_analisis, anio, region, resultado_texto, ruta_pdf, nombrepdf) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, tipoAnalisis);
            statement.setString(2, anio);
            statement.setString(3, region);
            

            // Genera un nombre único para el archivo en S3
            String nombreUnico = UUID.randomUUID().toString();
            // Establece la clave en S3 con el nombre único
            String key = nombreUnico + ".pdf";

            // Supongamos que el nombre del archivo en S3 será el mismo que el nombre original
            String nombrePDF = fileName;
            String resultadoTexto = generateResultadoTexto(tipoAnalisis, anio, region);

            statement.setString(4, resultadoTexto);
            statement.setString(5, key);
            statement.setString(6, nombrePDF);

            int filasAfectadas = statement.executeUpdate();

            if (filasAfectadas > 0) {
                System.out.println("Inserción exitosa en la base de datos.");
                System.out.println(filePath);

                // Carga el archivo en AWS S3
                cargarArchivoEnS3(filePath, key);

                // Redirige a una página de éxito o a donde desees
                RequestDispatcher dispatcher = request.getRequestDispatcher("cargaAdm.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("No se pudo insertar en la base de datos.");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores en caso de problemas con la base de datos
        }
    }
    private String generateResultadoTexto(String tipoAnalisis, String anio, String region) {
        // Lógica para generar "resultadoTexto" a partir de los parámetros
        String resultadoTexto = "Información para " + tipoAnalisis + " de la región " + region + " en el año " + anio;
        return resultadoTexto;
    }

    private void cargarArchivoEnS3(String filePath, String key) {
    	String accessKey = "AKIAW7OVWJHRQDLL76LN";
        String secretKey = "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";
        String bucketName = "bucket-reportes-icfes";

       
        BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKey, secretKey);
        AmazonS3 s3client = new AmazonS3Client(awsCreds);

        try {
            File file = new File(filePath);
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(file.length());
            s3client.putObject(new PutObjectRequest(bucketName, key, file).withMetadata(metadata));

            System.out.println("Archivo cargado exitosamente en S3.");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error al cargar el archivo en S3: " + e.getMessage());
        } finally {
            s3client.shutdown();
        }
    }
}

package conexionA;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("register")) {
            registerUser(request, response);
        } else if (action.equals("login")) {
            loginUser(request, response);
        } else if (action.equals("loginAdmin")) {
            loginAdmin(request, response);
        } else if (action.equals("deleteUser")) {
            deleteUser(request, response);
        } else if (action.equals("editUser")) {
            editUser(request, response);
        } else if (action.equals("createUser")) {
            createUser(request, response);
        }

       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String action = request.getParameter("action");

    if (action.equals("editUser")) {
        showEditForm(request, response);
    } else {
        // Manejar otros casos si es necesario
    }
}

private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int userId = Integer.parseInt(request.getParameter("id"));

    try (Connection connection = DBUtil.getConnection()) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String nombre = resultSet.getString("nombre");
            String apellido = resultSet.getString("apellido");
            String email = resultSet.getString("email");
            String usuario = resultSet.getString("usuario");

            request.setAttribute("id", userId);
            request.setAttribute("nombre", nombre);
            request.setAttribute("apellido", apellido);
            request.setAttribute("email", email);
            request.setAttribute("usuario", usuario);

            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } else {
            // No se encontró el usuario, manejar el caso si es necesario
        }

        resultSet.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Manejar el error de la base de datos si es necesario
    }
}
    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        // Validaciones adicionales, como verificar campos vacíos, formato de correo electrónico, etc.

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO usuarios (nombre, apellido, email, usuario, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, email);
            statement.setString(4, usuario);
            statement.setString(5, password);
            statement.executeUpdate();

            // Enviar correo electrónico al usuario
            String from = "serrto1596@gmail.com"; // Cambiar el remitente a tu dirección de correo electrónico
            String to = email; // Usar la dirección de correo electrónico proporcionada por el usuario durante el registro
            String subject = "Registro exitoso";
            String body = "Hola " + nombre + ",\n\n"
                    + "¡Te has registrado exitosamente!\n"
                    + "Aquí están tus datos de inicio de sesión:\n"
                    + "Correo: " + email + "\n"
                    + "Contraseña: " + password + "\n\n"
                    + "Gracias por registrarte.";

            // Configurar la sesión de JavaMail
            java.util.Properties props = new java.util.Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            javax.mail.Session mailSession = javax.mail.Session.getInstance(props, null);

            try {
                // Crear el mensaje de correo electrónico
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);
                message.setText(body);

                // Enviar el mensaje de correo electrónico
                Transport transport = mailSession.getTransport("smtp");
                transport.connect("serrto1596@gmail.com", "ornbszjvqqknchda"); // Cambiar las credenciales de autenticación a tu cuenta de Gmail
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            } catch (javax.mail.MessagingException e) {
                e.printStackTrace();
                // Error al enviar el correo electrónico
                request.setAttribute("error", "Error al enviar el correo electrónico");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return; // Se agrega el return aquí para evitar la llamada a response.sendRedirect() en el bloque catch
            }

            // Registro exitoso, redirigir a la página de inicio de sesión
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Error en la conexión con la base de datos
            request.setAttribute("error", "Error de conexión con la base de datos");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Inicio de sesión exitoso, guardar el nombre de usuario en la sesión
                String nombre = resultSet.getString("nombre");
                request.getSession().setAttribute("nombre", nombre);
                response.sendRedirect("index.jsp");
            } else {
                // Credenciales inválidas, mostrar mensaje de error
                request.setAttribute("error", "Credenciales inválidas");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Error en la conexión con la base de datos
            request.setAttribute("error", "Error de conexión con la base");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM administradores WHERE email = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Inicio de sesión exitoso, guardar el nombre de usuario en la sesión
                String nombre = resultSet.getString("nombre");
                request.getSession().setAttribute("nombre", nombre);
                response.sendRedirect("indexAdmin.jsp");
            } else {
                // Credenciales inválidas, mostrar mensaje de error
                request.setAttribute("error", "Credenciales inválidas");
                request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
            }

            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Error en la conexión con la base de datos
            request.setAttribute("error", "Error de conexión con la base");
            request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
        }
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del usuario a eliminar
        int userId = Integer.parseInt(request.getParameter("id"));

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM usuarios WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.executeUpdate();

            // Redirigir a la página de lista de usuarios
            response.sendRedirect("users.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Mostrar mensaje de error
            request.setAttribute("error", "Error de conexión con la base de datos");
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }
    }
    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos del formulario de edición de usuario
        int userId = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "UPDATE usuarios SET nombre = ?, apellido = ?, email = ?, usuario = ?, password = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, email);
            statement.setString(4, usuario);
            statement.setString(5, password);
            statement.setInt(6, userId);
            statement.executeUpdate();

            // Redirigir a la página de lista de usuarios
            response.sendRedirect("users.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Mostrar mensaje de error
            request.setAttribute("error", "Error de conexión con la base de datos");
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }
    }
    private void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        // Validaciones y verificaciones adicionales si es necesario

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO usuarios (nombre, apellido, email, usuario, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, email);
            statement.setString(4, usuario);
            statement.setString(5, password);
            statement.executeUpdate();

            // Redirigir a la página de lista de usuarios
            response.sendRedirect("users.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar el error de la base de datos si es necesario
            request.setAttribute("error", "Error de conexión con la base de datos");
            request.getRequestDispatcher("users.jsp").forward(request, response);
        }
    }

}


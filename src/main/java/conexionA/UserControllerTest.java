package conexionA;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserControllerTest {
    @InjectMocks
    private UserController controller;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testRegisterUser() throws ServletException {
        // Establecer parámetros en la solicitud
        Mockito.when(request.getParameter("action")).thenReturn("register");
        Mockito.when(request.getParameter("nombre")).thenReturn("John");
        Mockito.when(request.getParameter("apellido")).thenReturn("Doe");
        Mockito.when(request.getParameter("email")).thenReturn("johndoe@example.com");
        Mockito.when(request.getParameter("usuario")).thenReturn("johndoeR");
        Mockito.when(request.getParameter("password")).thenReturn("password");

        // Configurar un despachador para la respuesta
        RequestDispatcher dispatcher = Mockito.mock(RequestDispatcher.class);
        Mockito.when(request.getRequestDispatcher(Mockito.anyString())).thenReturn(dispatcher);

        try {
            // Llamar al método registerUser
            controller.registerUser(request, response);

            // Verificar que el usuario haya sido redirigido a la página de inicio de sesión
            Mockito.verify(response).sendRedirect("login.jsp");

            // También puedes verificar otras cosas, como si se envió un correo electrónico
            // o si se realizó una inserción en la base de datos, dependiendo de la lógica de tu aplicación.
        } catch (Exception e) {
            fail("Excepción inesperada: " + e.getMessage());
        }
    }
}

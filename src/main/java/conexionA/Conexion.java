package conexionA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conexion {

		public static void main(String[] args) {
			// TODO Auto-generated method stub
	        String url = "jdbc:postgresql://localhost:5432/AWID_proyecto";
	        String usuario = "postgres";
	        String contrasena = "Luis2002";
	        try {
	            Connection connection = DriverManager.getConnection(url, usuario, contrasena);
	            System.out.println("conexion");
	            String sql = "INSERT INTO usuarios (nombre, apellido, email, usuario, password ) VALUES ('Felipe2', 'Serrato', 'LOLO@gmail.com', 'serrato11', '12345')";
	            java.sql.Statement statement = connection.createStatement();
	            int rows = statement.executeUpdate(sql);
	            if (rows > 0) {
	            	System.out.println("Usuario creado");
	            }

	            connection.close();
	        } catch (SQLException e) {
	        	System.out.println("Error");
	        	e.printStackTrace();
	        }
	 

		}

}
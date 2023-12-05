<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.mindrot.jbcrypt.BCrypt" %>

<%
    String usuario = request.getParameter("user");
    String contrasenia = request.getParameter("password");
    String correo = request.getParameter("email");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Cargar el driver de MySQL
        Class.forName("com.mysql.jdbc.Driver");
        // Conectar a la base de datos MySQL "mydatabase"
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kokua?autoReconnect=true&useSSL=false", "root", "n0m3l0");

        // Hashear la contraseña con BCrypt
        String hashedPassword = BCrypt.hashpw(contrasenia, BCrypt.gensalt());

        // Crear la sentencia preparada SQL
        String query = "INSERT INTO publicoG (nombrePG, contraseña, correoPG) VALUES (?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setString(1, usuario);
        ps.setString(2, hashedPassword);
        ps.setString(3, correo);

        // Ejecutar la sentencia preparada y obtener el número de filas afectadas
        int numRows = ps.executeUpdate();

        // Comprobar si se ha insertado al menos una fila
        if (numRows > 0) {
            // Mostrar un mensaje de éxito
            out.println("<p>Bienvenido " + usuario + "!</p>");
            response.sendRedirect("login.jsp");
        } else {
            // Mostrar un mensaje de error
            out.println("<p>Error al dar de alta el registro.</p>");
        }
    } catch (SQLException e) {
        // Mostrar el mensaje de error SQL
        out.println("<p>Error SQL: " + e.getMessage() + "</p>");
    } catch (ClassNotFoundException e) {
        // Mostrar el mensaje de error de clase no encontrada
        out.println("<p>Clase no encontrada: " + e.getMessage() + "</p>");
    } finally {
        // Cerrar la conexión y la sentencia preparada
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            // Mostrar el mensaje de error SQL al cerrar la conexión
            out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
        }
    }
%>

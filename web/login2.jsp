<%@page import="conexion.conectadita"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.mindrot.jbcrypt.BCrypt" %>

<%
    String nombrePG = request.getParameter("user");
    String contrasena = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Conectar a la base de datos MySQL "kokua"
        conectadita conecta = new conectadita();
        con = conecta.getConnection(request.getServerName());

        // Crear la sentencia preparada SQL para buscar un usuario con el nombre especificado
        String query = "SELECT * FROM publicoG WHERE nombrePG = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, nombrePG);

        // Ejecutar la sentencia preparada y obtener el resultado
        rs = ps.executeQuery();

        // Comprobar si se ha encontrado un usuario con el nombre especificado
        if (rs.next()) {
            // Verificar la contraseña utilizando BCrypt
            String hashedPasswordDB = rs.getString("contraseña");

            if (BCrypt.checkpw(contrasena, hashedPasswordDB)) {
                // Guardar el nombre del usuario en la sesión
                session.setAttribute("nombrePG", nombrePG);

                // Mostrar un mensaje de éxito y redirigir a la página de inicio
                out.println("<p>Bienvenido " + nombrePG + "!</p>");
                response.sendRedirect("carruselOpc.jsp");
            } else {
                // Mostrar un mensaje de error y volver a la página de inicio de sesión
                out.println("<p>Contraseña incorrecta.</p>");
                response.sendRedirect("login.jsp");
            }
        } else {
            // Mostrar un mensaje de error y volver a la página de inicio de sesión
            out.println("<p>Usuario no encontrado.</p>");
            response.sendRedirect("login.jsp");
        }
    } catch (SQLException e) {
        // Mostrar el mensaje de error SQL
        out.println("<p>Error SQL: " + e.getMessage() + "</p>");
    } finally {
        // Cerrar la conexión, la sentencia preparada y el resultado
        try {
            if (rs != null) {
                rs.close();
            }
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

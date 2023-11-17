<%@page import="conexion.conectadita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String nombrePG = request.getParameter("user");
    String contraseña = request.getParameter("password");
    String correoPG = request.getParameter("email");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Cargar el driver de MySQL
        
        // Conectar a la base de datos MySQL "mydatabase"
            ResultSet results = null;
            PreparedStatement pst = null;
            conectadita conecta = new conectadita();
            con = conecta.getConnection( request.getServerName( ) );
        // Crear la sentencia preparada SQL
        String query = "INSERT INTO publicoG (nombrePG, contraseña, correoPG) VALUES (?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setString(1, nombrePG);
        ps.setString(2, contraseña);
        ps.setString(3, correoPG);

        // Ejecutar la sentencia preparada y obtener el número de filas afectadas
        int numRows = ps.executeUpdate();

        // Comprobar si se ha insertado al menos una fila
        if (numRows > 0) {
            // Mostrar un mensaje de éxito
            out.println("<p>Bienvenido" + nombrePG + "!</p>");
            response.sendRedirect("login.jsp");
        } else {
            // Mostrar un mensaje de error
            out.println("<p>Error al dar de alta el registro.</p>");
        }
    } catch (SQLException e) {
    // Mostrar el mensaje de error SQL
        out.println("<p>Error SQL: " + e.getMessage() + "</p>");
    }
    finally {
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
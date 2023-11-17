<%@page import="conexion.conectadita"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String nombrePG = request.getParameter("user");
    String contrasena = request.getParameter("password");
    //String usuarioAdmin = request.getParameter("user");
    Connection con = null;
    //String contraseniaAdmin = request.getParameter("password");
    PreparedStatement ps = null;
    //PreparedStatement ps2 = null;
    ResultSet rs = null;
    //ResultSet rs2 = null;

    try {
        
        // Conectar a la base de datos MySQL "kokua"
        conectadita conecta = new conectadita();
        con = conecta.getConnection( request.getServerName( ) );
        // Crear la sentencia preparada SQL para buscar un usuario con el nombre y contraseña especificados
        String query = "SELECT * FROM publicoG WHERE nombrePG = ? AND contraseña = ?";
        //String query2 = "SELECT * FROM adminstrador WHERE nomAdmin = ? AND contraAdmin = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, nombrePG);
        ps.setString(2, contrasena);
        //ps = con.prepareStatement(query2);
        //ps.setString(1, usuarioAdmin);
        //ps.setString(2, contraseniaAdmin);

        // Ejecutar la sentencia preparada y obtener el resultado
        rs = ps.executeQuery();
        //rs2 = ps2.executeQuery();
        // Comprobar si se ha encontrado un usuario con el nombre y contraseña especificados
        if (rs.next()) {
            // Guardar el id del usuario en la sesión
            String nombree = rs.getString("nombrePG");
            session.setAttribute("nombrePG", nombree);

            // Mostrar un mensaje de éxito y redirigir a la página de inicio
            out.println("<p>Bienvenido " + nombrePG + "!</p>");
            response.sendRedirect("principal.jsp");
        } else {
            /*if (rs2.next()) {
            // Guardar el id del usuario en la sesión
            String nombree2 = rs2.getString("nomAdmin");
            session.setAttribute("nomAdmin", nombree2);

            // Mostrar un mensaje de éxito y redirigir a la página de inicio
            out.println("<p>Bienvenido " + usuario + "!</p>");
            response.sendRedirect("administrador.jsp");*/
            //} else {
            // Mostrar un mensaje de error y volver a la página de inicio de sesión
            out.println("<p>Usuario o contraseña incorrectos.</p>");
            response.sendRedirect("login.jsp");
        }
    } catch (SQLException e) {
        // Mostrar el mensaje de error SQL
        out.println("<p>Error SQL: " + e.getMessage() + "</p>");
    } 
    finally {
        // Cerrar la conexión, la sentencia preparada y el resultado
        try {

            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            /*if (rs2 != null) rs2.close();
            if (ps2 != null) ps2.close();*/
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            // Mostrar el mensaje de error SQL al cerrar la conexión
            out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
        }
    }
%>


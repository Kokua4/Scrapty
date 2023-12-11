<%-- 
    Document   : eliminar
    Created on : 4 may 2023, 12:33:10
    Author     : alumno
--%>
<%@page import="java.sql.*, conexion.conectadita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cod = request.getParameter("cod");
            Connection cnx = null;
            PreparedStatement psta = null;
            conectadita conecta = new conectadita();
            cnx = conecta.getConnection();
            psta = cnx.prepareStatement("delete from publicoG where idPG = ?;");
            psta.setString(1, cod);
            psta.executeUpdate();
            request.getRequestDispatcher("listado.jsp").forward(request, response);
            psta.close();
            cnx.close();
        %>
    </body>
</html>
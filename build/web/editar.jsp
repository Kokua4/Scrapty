<%-- 
    Document   : editar
    Created on : 4 may 2023, 12:19:39
    Author     : alumno
--%>
<%@page import="java.sql.*, conexion.conectadita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ESTILOS/admin.css">
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <%
                        String cod = request.getParameter("cod");
                        Connection cnx = null;
                        PreparedStatement psta = null;
                        ResultSet res = null;
                        conectadita conecta = new conectadita();
                        cnx = conecta.getConnection();
                        psta = cnx.prepareStatement("select * from publicoG where idPG = ?;");
                        psta.setString(1, cod);
                        res = psta.executeQuery();

                        while (res.next()) {
                    %>
                    <form action="">
                        <h2 align="center">Editar</h2>
                        <div class="inputbox">
                            <input type="text" name="txtcod" required value="<%=res.getString(1)%>" readonly="readonly">
                            <label>Codigo</label>
                        </div>
                        <div class="inputbox">
                            <input type="text" name="txtnom" required value="<%=res.getString(2)%>">
                            <label>Nombre</label>
                        </div>
                        <div class="inputbox">
                            <input type="text" name="txtcon" required value="<%=res.getString(3)%>">
                            <label>Contraseña</label>
                        </div>
                        <div class="inputbox">
                            <input type="text"  name="txtcor" required value="<%=res.getString(4)%>">
                            <label>Correo</label>
                        </div>
                        <button name="btngrabar" onclick="location.href = 'listado.jsp'">Editar Lugar</button>
                        <br><br>
                    </form>
                    <%
                        }
                        if (request.getParameter("btngrabar") != null) {
                            int codu = Integer.parseInt(request.getParameter("txtcod"));
                            String nomu = request.getParameter("txtnom");
                            String ubic = request.getParameter("txtcon");
                            String desc = request.getParameter("txtcor");
                            psta = cnx.prepareStatement("update publicoG set nombrePG = ?, contraseña = ?, correoPG = ?  where idPG = ?;");
                            psta.setString(1, nomu);
                            psta.setString(2, ubic);
                            psta.setString(3, desc);
                            psta.setInt(4, codu);
                            psta.execute();
                            request.getRequestDispatcher("listado.jsp").forward(request, response);
                        }
                    %>
                </div>
            </div>
        </section>
    </body>
</html>

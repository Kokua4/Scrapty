<%@page import="java.sql.*,conexion.conectadita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="ESTILOS/listado.css">
        <title>JSP Page</title>
    </head>
    <body>
            <div class="container">
                <a href="login.jsp" class="logo"><span>Salir</span></a>
                <a href="chatuser.jsp" class="logo" id="soporteAdmin">SoporteAdmin</a>
            </div>
        <section>
            <div class="form-box">
                <table class="bordered-table" width="600" align="center">
                    <h2 align="center">Alta de Administradores</h2>
                    <tr>
                        <td colspan="3"></td>
                        <td><a href="administrador.jsp"><img src="ESTILOS/editar.png" width="50" height="50"/></a></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td>Contraseña</td>
                        <td>Correo</td>
                        <td>Accion</td>
                    </tr>
                    <%
                        Connection cnx = null;
                        PreparedStatement psta = null;
                        ResultSet res = null;
                        conectadita conecta = new conectadita();
                        cnx = conecta.getConnection();
                        psta = cnx.prepareStatement("select * from publicoG;");
                        res = psta.executeQuery();

                        while (res.next()) {
                    %>
                    <tr>
                        <td><%=res.getString(2)%></td>
                        <td><%=res.getString(3).replace("\n", "<br>")%></td>
                        <td><%=res.getString(4)%></td>
                        <td>
                            <a href="editar.jsp?cod=<%=res.getString(1)%>">
                                <img src="ESTILOS/palomita.png" width="30" height="30"/>
                            </a>
                            <a href="eliminar.jsp?cod=<%=res.getString(1)%>">
                                <img src="ESTILOS/tache.png" width="30" height="30"/>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                        psta.close();
                        cnx.close();
                        res.close();
                    %>
                </table>
            </div>
        </section>
    </body>
</html>

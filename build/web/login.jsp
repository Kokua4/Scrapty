<%-- 
    Document   : login
    Created on : 16 oct. 2023, 12:17:26
    Author     : Alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.conectadita"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page import="modelo.operaciones.Usuario"%>
<%@page import="modelo.operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ESTILOS/estiloLog.css">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <section>
            <div class="container">
                <div class="logo">
                    <a href="index.html">
                        <img src="IMAGENES/Logo.png" width="200"/>
                    </a>
                </div>
            </div>
            <div class="form-box">
                <div class="form-value">
                    <form action="login.jsp" method="post">    
                        <h2>Login</h2>

                        <div class="inputbox">
                            <input type="text" name="user" required onkeypress="return valnomusu(event)">
                            <label>Nombre de usuario</label>
                        </div>
                        <div class="inputbox">
                            <button  type="button" class="mostrar-contrasenia" id="mostrar-contrasenia1" onclick="mostrarContraseña(1)">👁️</button><ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" name="password" id="password" required onkeyup="ojo(1)">
                            <label>Contraseña</label>
                        </div>
                        <button type="submit" class="btn" name="iniciar" id="logear" value="Iniciar sesión">Iniciar</button>
                        <div class="register">
                            <p>¿No tienes cuenta? <a href="registro.jsp ">Registrate</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script type="text/javascript" src="infoMetodos.js"></script>
        <script type="text/javascript" src="validaciones.js"></script>

        <!DOCTYPE html>


    <%
        String registroExitosoParam = request.getParameter("registroExitoso");
        if ("true".equals(registroExitosoParam) || "true".equals(request.getAttribute("registroExitoso"))) {
    %>
    <div id="aviso" class="aviso-container">
        <i class="cerrar-icono bx bx-x" onclick="cerrarAviso()" style="color:red; cursor: pointer; font-size: 24px; margin-right: 100%"></i>
        <p style="margin: 0; padding-bottom: 2px; color: black;">Registro exitoso. Ahora puede iniciar sesión.</p>
    </div>
    <%
        }
    %>
    <%
        operaciones op = new operaciones();
        Connection conn = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs1 = null;

        if (request.getParameter("iniciar") != null) {
            String correo = request.getParameter("user");
            String contra = request.getParameter("password");
            HttpSession sesion = request.getSession();

            Usuario usuario = op.loguear(correo, contra);

            if (usuario != null) {
                int idTipoUsuario = usuario.getIdTipoUsuario();
                String hashAlmacenado = usuario.getHashAlmacenado();

                if ((idTipoUsuario == 1 && contra.equals(hashAlmacenado)) || (idTipoUsuario == 2 && BCrypt.checkpw(contra, hashAlmacenado))) {
                    sesion.setAttribute("user", correo);
                    sesion.setAttribute("idTipo", idTipoUsuario);

                    switch (idTipoUsuario) {
                        case 1: 
                            try {

                            int row = 0;
                            int si = 0;
                            conectadita conecta = new conectadita();
                            conn = conecta.getConnection();

                            String consulta1 = "select * from publicoG where idTipoUsuario = 1";

                            pstmt1 = conn.prepareStatement(consulta1);

                            rs1 = pstmt1.executeQuery();

                            if (rs1.next()) {

                                int idPG = rs1.getInt("idPG");
                                String nombrePg = rs1.getString("nombrePG");
                                String contraseña = rs1.getString("contraseña");
                                String correoPG = rs1.getString("correoPG");
                                int idTipo = rs1.getInt("idTipoUsuario");

                                String tipoUser = "hogar";
                                session.setAttribute("idPG", idPG);
                                session.setAttribute("nombrePg", nombrePg);
                                session.setAttribute("contraseña", contraseña);
                                session.setAttribute("correoPG", correoPG);
                                session.setAttribute("idTipo", idTipo);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs1 != null) {
                                rs1.close();
                            }
                            if (pstmt1 != null) {
                                pstmt1.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }

                        }
                        response.sendRedirect("listado.jsp");
                        break;
                        case 2:
                           try {

                            int row = 0;
                            int si = 0;
                            conectadita conecta = new conectadita();
                            conn = conecta.getConnection();

                            String consulta1 = "select * from publicoG where idTipoUsuario = 2";

                            pstmt1 = conn.prepareStatement(consulta1);

                            rs1 = pstmt1.executeQuery();

                            if (rs1.next()) {

                                int idPG = rs1.getInt("idPG");
                                String nombrePg = rs1.getString("nombrePG");
                                String contraseña = rs1.getString("contraseña");
                                String correoPG = rs1.getString("correoPG");
                                int idTipo = rs1.getInt("idTipoUsuario");

                                String tipoUser = "hogar";
                                session.setAttribute("idPG", idPG);
                                session.setAttribute("nombrePG", nombrePg);
                                session.setAttribute("contraseña", contraseña);
                                session.setAttribute("correoPG", correoPG);
                                session.setAttribute("idTipo", idTipo);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs1 != null) {
                                rs1.close();
                            }
                            if (pstmt1 != null) {
                                pstmt1.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }

                        }
                        response.sendRedirect("carruselOpc.jsp");
                        break;
                        default:
                            out.write("Usuario no existe o contraseña inválida");
                            break;
                    }
                } else {
                    out.write("Usuario no existe o contraseña inválida");
                }
            } else {
                out.write("Ocurrió un error durante la autenticación");
            }
        }

        if (request.getParameter("cerrar") != null) {
            session.invalidate();
        }
    %>
</body>

</html>
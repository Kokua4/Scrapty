<%@page import="java.sql.*, conexion.conectadita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ESTILOS/admin.css">
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
                    <form action="">
                        
                        <h2 align="center">Administrador</h2>
                        
                        <div class="inputbox">
                            <input type="text" name="txtnom" required>
                            <label>Nombre</label>
                        </div>
                        
                        <div class="inputbox">
                            <input type="text" name="txtubi" required>
                            <label>Contraseña</label>
                        </div>
                        
                        <div class="inputbox">
                            <input type="text"  name="txtdes" required>
                                <label>Correo</label>
                        </div>
                        
                        <div>
                        <button name="btngrabar"onclick="location.href = 'listado.jsp'">Agregar</button> 
                        </div>
                        
                        <div class="register">
                            <p>Ver Registros <a href="listado.jsp ">Ingresar</a></p>
                        </div>
                        
                        
                    </form>
                    <%
                        if (request.getParameter("btngrabar") != null) {
                            String nom = request.getParameter("txtnom");
                            String ubi = request.getParameter("txtubi");
                            String des = request.getParameter("txtdes");
                            Connection cnx = null;
                            PreparedStatement psta = null;
                            conectadita conecta = new conectadita();
                            cnx = conecta.getConnection();
                            psta = cnx.prepareStatement("insert into publicoG (nombrePG, contraseña, correoPG, idTipoUsuario)values(?,?,?,?)");
                            psta.setString(1, nom);
                            psta.setString(2, ubi);
                            psta.setString(3, des);
                            psta.setInt(4, 1);
                            psta.execute();
                            request.getRequestDispatcher("listado.jsp").forward(request, response);
                        }
                    %>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
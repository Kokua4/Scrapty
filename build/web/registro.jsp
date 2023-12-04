<%-- 
    Document   : registro
    Created on : 16 oct. 2023, 12:59:13
    Author     : Alumno
--%>

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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ESTILOS/estiloReg.css">
        <title>Registro</title>
    </head>
    <body>
        <section>
            <div class="container">
                <a href="index.html">
                    <img src="IMAGENES/Logo.png" width="200"/>
                </a>
            </div>
            <div class="form-box">
                <div class="form-value">
                    <form action="registro2.jsp" method="post" name="inicio">
                        <h2>Registro</h2>
                        <div class="inputbox">
                            <input type="text" name="user" required onkeypress="return valnomusu(event)">
                            <label>Nombre de usuario</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="email" name="email" required onkeypress="return valemail(event)">
                            <label>Correo electrónico</label>
                        </div>
                        <div class="inputbox">
                            <button  type="button" class="mostrar-contrasenia" id="mostrar-contrasenia1" onclick="mostrarContraseña(1)">👁️</button><ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" name="password" id="password" required onkeyup="ojo(1)">
                            <label>Contraseña</label>
                        </div>
                        <button onclick="location.href = 'registro2.jsp'">Registrarse</button>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="infoMetodos.js"></script>
        <script type="text/javascript" src="validaciones.js"></script>
    </body>
</html>

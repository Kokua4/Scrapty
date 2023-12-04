<%-- 
    Document   : login
    Created on : 16 oct. 2023, 12:17:26
    Author     : Alumno
--%>

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
                <form action="login2.jsp">
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
                    <button onclick="location.href = 'login2.jsp'">Inicio</button>
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
</body>
</html>
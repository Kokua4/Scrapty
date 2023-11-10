<%-- 
    Document   : principal
    Created on : 7 nov. 2023, 12:31:22
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILOS/estiloPrincipal.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <div class="logo">
                <img src="IMAGENES/Logo.png" width="200" alt="Logo de Scrapty">
            </div>
            <div class="nav-items">
                <a href="login.jsp">Perfil</a>
                <a href="registro.jsp">Cerrar Sesión</a>
            </div>
        </nav>
        <div class="column-left">
            <h1 class="center-title">¡Elige que estudiarás hoy!</h1>
        </div>
        <div class="img-ort">
            <img src="IMAGENES/ortografía.png" alt="">
        </div>
        <div class="img-braille">
            <img src="IMAGENES/braille.png" alt="">
        </div>
    </body>
</html>

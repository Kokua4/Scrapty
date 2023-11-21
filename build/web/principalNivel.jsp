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
        <link rel="stylesheet" href="ESTILOS/prinNivel.css">
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
            <h1 class="center-title">¡Elige una opción!</h1>
        </div>
        
        <div class="sec-1">
            <div class="img-ort">
                <a href="nivelOrt.jsp">
                    <img src="IMAGENES/NivelInt.png" alt="" width="70%">
                </a>
            </div>
            <div class="img-letritas">
                <img src="IMAGENES/letritas.png" alt="" width="45%">
            </div>
        </div>
        
        <div class="sec-2">
            <div class="img-braille">
                <a href="registro.jsp">
                    <img src="IMAGENES/NivelNue.png" alt="" width="70%">
                </a>
            </div>
            <div class="img-brai">
                <img src="IMAGENES/braillesito.png" alt="" width="40%">
            </div>
        </div>
        
        <div class="img-nota">
            <img src="IMAGENES/nota.png" alt="" width="100%">
        </div>
    </body>
</html>

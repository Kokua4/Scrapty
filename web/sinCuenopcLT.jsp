<%-- 
    Document   : opcionesLT
    Created on : 3 dic 2023, 01:09:32
    Author     : cupid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lecciones</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ESTILOS/estiloOpcLT.css"/>
    </head>
    <body>

        <header class="header">
            <div class="menu container">
                <a href="index.html" class="logo">SCRAPTY</a>
                <input type="checkbox" id="menu"/>
                <label for="menu">
                    <img src="#" class="menu-icono" alt="menu">
                </label>
            </div>

            <div class="header-content container">
                <div class="header-txt">
                    <br><br><br>
                    <h1>Lecciones y Prácticas </h1>
                    <p>
                        En esta sección podrás consultar la parte teorica y 
                        práctica del tema que desees aprender.
                        Este es un espacio interactivo donde el conocimiento
                        se convierte en acción.
                    </p>
                </div>
                <div class="header-img">
                    <img src="IMAGENES/ortografíaa.png" alt="">
                </div>
            </div>
        </header>


        <section class="information container">
            <div class="information-content">
                <div class="information-1">
                    <img src="#" alt="">
                    <h3>Scrapty</h3>
                    <p>
                        ¿Estás listo para desafiar tus
                        límites y expandir tus habilidades? 
                        ¡Adelante, la aventura del aprendizaje te espera!
                    </p>
                </div>
            </div>
        </section>

        <main class="product container" id="lista-1">
            <h2>Lecciones</h2>
            <div class="product-content">

                <div class="product">
                    <img src="#" alt="">
                    <div class="product-txt">
                        <h3>Teoría</h3>
                        <p class="precio">Reglas de acentuación</p>
                        <a href="sinCuenRA.jsp" class="agregar-carrito btn-2" >Leer</a>
                    </div>
                </div>

                <div class="product">
                    <img src="#" alt="">
                    <div class="product-txt">
                        <h3>Quiz</h3>
                        <p class="precio">Reglas de acentuación</p>
                        <a href="sinCuenQuiz.jsp" class="agregar-carrito btn-2" data-id="3">Empezar</a>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>

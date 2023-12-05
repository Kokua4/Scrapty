<%-- 
    Document   : carruselOpc
    Created on : 21 nov 2023, 20:53:36
    Author     : cupid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILOS/estiloCarrusel.css">
        <title>Carrusel</title>
    </head>
    <body>
        <nav>
            <div class="logo">
                <a href="index.html">
                    <img src="IMAGENES/Logo.png" width="200"/>
                </a>
            </div>
        </nav>
        <div class="container">
            <div class="slider">
                <input type="radio" name="slider" id="slideOne" checked="">
                <input type="radio" name="slider" id="slideTwo">

                <div class="buttons">
                    <label for="slideOne"></label>
                    <label for="slideTwo"></label>
                </div>
                <div class="content">
                    <div class="firstslide">
                        <div class="column-left">
                            <h1>Ortografía</h1>
                            <p>Conjunto de normas que regulan</p> 
                            <p>la escritura de una lengua. </p>
                            <h4>Da click en el libro para empezar.</h4>
                        </div>
                        <div class="column-right">
                            <a href="sinCuenopcLT.jsp">
                            <img src="IMAGENES/ortografia.png" width="100%">
                            </a>
                        </div>
                    </div>
                    <div class="secondslide">
                        <div class="column-left">
                            <h1>Braille</h1>
                            <p>Sistema de escritura para ciegos que</p> 
                            <p>consiste en signos dibujados en relieve</p>
                            <p>para poder leer con los dedos.</p>
                            <h4>Da click en el libro para empezar.</h4>
                        </div>
                        <div class="column-right">
                            <a href="brailleProx.jsp">
                                <img src="IMAGENES/braillee.png" width="100%">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

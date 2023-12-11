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
            <div class="nav-items">
                <a href="login.html" id="perfilLink">Perfil</a>
                <a href="chatuser.jsp" id="soporteUser">SoporteUser</a>
                <a href="#" id="cerrarSesion">Cerrar Sesión</a>
            </div>
        </nav>
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
                        <a href="opcionesLT.jsp">
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
    <script>
        // Evento al hacer clic en "Cerrar Sesión"
        document.getElementById('cerrarSesion').addEventListener('click', function () {
            // Puedes agregar una confirmación antes de cerrar la sesión
            var confirmacion = confirm("¿Estás seguro de que deseas cerrar sesión?");
            if (confirmacion) {
                // Limpiar el "localStorage"
                localStorage.removeItem('usuario');

                // Redirigir al usuario a la página de inicio (index.html)
                window.location.href = 'index.html';
            }
        });

        // Verificar si el usuario está autenticado (por ejemplo, en el "localStorage")
        var perfilLink = document.getElementById('perfilLink');
        if (localStorage.getItem('usuario')) {
            // Si hay un usuario en el "localStorage", mostrar enlace al perfil
            perfilLink.style.display = 'inline-block';
        } else {
            // Si no hay usuario, ocultar enlace al perfil
            perfilLink.style.display = 'none';
        }
    </script>
</body>
</html>

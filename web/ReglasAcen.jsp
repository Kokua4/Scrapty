<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ESTILOS/estiloPrincipal.css">
        <title>Teoría</title>
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
                <a href="#" id="cerrarSesion">Cerrar Sesión</a>
            </div>
        </nav>
        <header>
            <h1>Reglas de acentuación</h1>
            <p>Ortografía</p>
        </header>
        <div class="container">
            <p> El acento es la mayor intensidad con que se pronuncia una de las sílabas de una palabra.
                La  tilde  o  acento  ortográfico  es  la  marca  escrita  que  se  coloca  sobre  una 
                letra   para   indicar   que   esa   sílaba   se   pronuncia   con mayor   intensidad.
                Las mayúsculas también se escriben con tilde. 
            </p>
            <p>Hay  que  tener  en  cuenta  que  el  sentido  de  una  palabra  puede  ser  modificado
                según  la  sílaba  que  se  acentúe.  Asimismo,  la  colocación  correcta  de  la  tilde
                permite distinguir funciones y significados en casos de duda o ambigüedad. Por   eso, es
                conveniente   recordar   lasreglas   generales   de   acentuación ortográfica: 
            </p>
            <p>-Palabras agudas (se acentúan en la última sílaba): llevan tilde cuando terminan 
                en n, s o vocal. Ejemplos: además, canción, café, pared.
            </p>
            <p>-Palabras  graves (se  acentúan  en  la  penúltima  sílaba):  llevan  tilde cuando
                no terminan en n, s o vocal. Ejemplos: árbol, lápiz, mártir, rodaja. 
            </p>
            <p>-Palabras  esdrújulas  (se  acentúan  en  la  antepenúltima  sílaba):  llevan  
                tilde siempre. Ejemplos: esdrújula, música, sílaba. 
            </p>
            <p>-Palabras    sobreesdrújulas (se acentúan en la sílaba anterior a la antepenúltima):
                llevan tilde siempre. Ejemplos: repítamelo, díganselo.
            </p>
            <img src="IMAGENES/reglasAcentuacion.jpg" width="50%" style="padding-left: 300px">
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

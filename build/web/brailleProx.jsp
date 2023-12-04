

<%-- 
    Document   : brailleProx
    Created on : 3 dic 2023, 19:43:04
    Author     : cupid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Próximamente...</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            font-size: 4em;
            color: rgb(0, 0, 255); /* Azul */
            text-align: center;
            position: relative;
            font-family: 'Arial', sans-serif;
            font-style: italic; /* Cursiva */
            animation: wave 2s infinite linear alternate-reverse;
        }

        h1::before {
            content: "Proximamente. . .";
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            color: rgb(75, 0, 130); /* Índigo */
            opacity: 0.7;
            clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
            animation: holographic 2s infinite linear alternate-reverse;
        }

        @keyframes holographic {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(1em);
            }
        }

        @keyframes wave {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <h1>Proximamente. . .</h1>
</body>
</html>
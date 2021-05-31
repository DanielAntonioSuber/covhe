<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (session.getAttribute("usuario") != null) {
        response.sendRedirect("app/inicio.jsp");
    }
    //usuario=Daniel5&nombre=Daniel&apellido=Antonio+Eugenio&correo=daniel%40gmail.com&password=1234#
%>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CovHe</title>
        <link rel="shortcut icon" href="assets/images/logo-covhe.svg" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/styles.css" />
    </head>

    <body>
        <header>
            <nav class="menu">
                <div class="menu-div">
                    <a href="shh/game1.html">
                        <img class="logo" src="assets/images/logo-covhe.svg" alt="logo">
                        <span>CovHe</span>
                    </a>
                </div>
                <ul class="menu-ul">
                    <li><a href="inicio-sesion.jsp">Iniciar Sesión</a></li>
                    <li><a href="registro.jsp">Registrarse</a></li>
                    <li><a href="devsoft.html">Sobre nosotros</a></li>
                </ul>
                <button class="ham" type="button">
                    <span class="br-1"></span>
                    <span class="br-2"></span>
                    <span class="br-3"></span>
                </button>
            </nav>
        </header>
        <main>
            <div class="container1">
                <h1>CovHe</h1>
                <img class="img-logo" src="assets/images/logo-covhe.svg" alt="logo">
                <h2>¿Qué es CovHe?</h2>
                <p>
                    CovHe es un aplicación web que tiene como objetivo ayudar a las personas afectadas de Covid-19, brinandole herramientas como: información confiable, un foro y un calendario que le ayudará en la situación en la que se encuentra.
                </p>
                <h2>¿Quiénes somos?</h2>
                <p>
                    Somos un grupo de programadores (DevSoft) dispuestos a ayudar con problemáticas de gran impacto en la sociedad, creando herramientas de sofware o aplicaciones como soluciones a dichas problemáticas.
                </p>
                <h2>¿Cuál es el objetivo?</h2>
                <p class="p3">
                    Crear una aplicación que de información confiable al usuario sobre el COVID-19 y trata tanto las medidas que puede tomar para prevención como las medidas que se deben tomar en el caso de tener la enfermedad.

                </p>
            </div>
        </main>
        <script src="assets/js/index.js"></script>
    </body>

</html>

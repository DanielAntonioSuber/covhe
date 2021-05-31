<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuario = new Usuario();
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        usuario = (Usuario) session.getAttribute("usuario");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script src="../assets/js/script.js"></script>
        <script src="../assets/js/jquery.crossword.js"></script>

        <title>CovHe - Crucigrama</title>
    </head>
    <style type="text/css" media="screen">
        body {
            font: 62.5%/1.3em Helvetica, sans-serif;
            width: 90.3%;
            margin: 10px auto;
        }
        table { 
            border-collapse: collapse; 
            border-spacing: 0; 
            max-width: 100%;
        }
        table tr{
            width: 100%;
        }
        table td {
            width: 5em;
            height: 5em;
            border: 1px solid #cdcdcd;
            padding: 0;
            margin: 0;
            background-color: #333;
            position: relative;
        }

        td input {
            width: 100%;
            height: 100%;
            padding: 0em;
            border: none;
            text-align: center;
            font-size: 3em;
            color: #666;
            background-color: #f4f4f4;
        }

        td input:focus {
            background-color: #fff;
        }

        td span {
            color: #444;
            font-size: 0.8em;
            position: absolute;
            top: -1px;
            left: 1px;
        }

        input.done {
            font-weight: bold;
            color: green;
        }

        .active,
        .clues-active {
            background-color: #ddd;
        }
        .clue-done {
            color: #999;
            text-decoration: line-through;
        }

        #puzzle-wrapper {
            float: left;
            width: 54%;
            margin-right: 3%;
        }
        #puzzle-clues {
            float: left;
            width: 40%;
        }

        #puzzle-clues li{
            font-size: 1.2em;
            margin: .3em;
            line-height: 1.6em;
        }

    </style>

</head>
<body id="body-pd">

    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="inicio.jsp" class="nav__logo">CovHe</a>
                </div>
                <div class="nav__list">

                    <a href="inicio.jsp" class="nav__link">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Inicio</span>
                    </a>

                    <div class="nav__link collapse ">
                        <ion-icon name="information-circle-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Informacion</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <a href="informacion.jsp" class="collapse__sublink">Información</a>
                            <a href="vacuna.jsp" class="collapse__sublink">Vacunas</a>
                            <a href="https://www.who.int/es" class="collapse__sublink">OMS</a>
                        </ul>
                    </div>


                    <div class="nav__link collapse ">
                        <ion-icon name="game-controller-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Juego</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <a href="cuestionario.jsp" class="collapse__sublink">Cuestionario</a>
                            <a href="crucigrama.jsp" class="collapse__sublink">Crucigrama</a>
                        </ul>
                    </div>

                    <a href="foro.jsp" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Foro</span>
                    </a>

                    <a href="aplicaciones-inicio.jsp" class="nav__link">
                        <ion-icon name="apps-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Aplicaciones</span>
                    </a>

                    <% if (usuario.getNivel() == 1) {%>
                    <div class="nav__link collapse ">
                        <ion-icon name="construct-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Administrar</span>
                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                        <ul class="collapse__menu">
                            <a href="Usuarios.jsp" class="collapse__sublink">Usuarios</a>
                            <a href="Publicaciones.jsp" class="collapse__sublink">Foro</a>
                            <a href="Comentarios.jsp" class="collapse__sublink">Comentarios</a>
                        </ul>
                    </div>
                    <% } else { %>
                    <a href="ajustes.jsp" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav__name">Ajustes</span>
                    </a>
                    <% }%>
                </div>
            </div>


            <a href="salir.jsp" class="nav__link">
                <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                <span class="nav__name">Salir</span>
            </a>
        </nav>
    </div>
    <header class="header">
        <h1>Crucigrama</h1>
    </header>

    <!-- En este coso ponen todo lo que va a hacer -->
    <main class="main">
        <div id="puzzle-wrapper"><!-- crossword puzzle appended here --></div>
    </main>
    <!-- ===== IONICONS ===== -->
    <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

    <!-- ===== MAIN JS ===== -->
    <script src="../assets/js/main.js"></script>
</body>
</html>

<% }%>
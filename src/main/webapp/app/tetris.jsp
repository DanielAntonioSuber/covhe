<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = new Usuario();
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        usuario = (Usuario) session.getAttribute("usuario");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../Tetris/css/bootstrap.min.css">
        <link rel="stylesheet" href="../Tetris/css/all.min.css">
        <style>
            body {
                padding-bottom: 70px;
            }
        </style>
        <title>Eh ¿Que haces aqui?, bueno te dejo jugar Tetris nwn</title>

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
            <h1>Eh ¿Que haces aqui?, bueno te dejo jugar Tetris nwn</h1>
        </header>

        <!-- En este coso ponen todo lo que va a hacer -->
        <main class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1>Shh es un secreto🤫</h1>
                        <h2 id="puntaje">Presiona <kbd>P</kbd> o pulsa el botón para comenzar</h2>
                    </div>
                    <div class="col-12 text-center">
                        <canvas id="canvas"></canvas>
                        <div class="mt-2">
                            <button id="btnIniciar" class="btn btn-success"><i class="fas fa-play"></i></button>
                            <button hidden id="btnPausar" class="btn btn-success"><i class="fas fa-pause"></i></button>
                            <button id="btnIzquierda" class="btn btn-success"><i class="fas fa-arrow-left"></i></button>
                            <button id="btnAbajo" class="btn btn-success"><i class="fas fa-arrow-down"></i></button>
                            <button id="btnDerecha" class="btn btn-success"><i class="fas fa-arrow-right"></i></button>
                            <button id="btnRotar" class="btn btn-success"><i class="fas fa-undo"></i></button>
                            <button class="btn btn-danger" id="reset">Reset</button>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
        <script src="../Tetris/js/sweetalert2.min.js"></script>
        <script src="../Tetris/js/tetris.js"></script>
        <script>
            const bgMusic = new Audio("../Tetris/assets/New Donk City_ Daytime 8 Bit.wav");
            bgMusic.loop = true;
            bgMusic.play();
        </script>
    </body>
</html>

<% } %>
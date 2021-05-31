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
<html lang="en" dir="ltr">

    <head>
        <title>Calendario</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <title>Aplicaciones</title>
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body id="body-pd" class="light">

        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="tetris.jsp" class="nav__logo">CovHe</a>
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
            <h1>Aplicaciones</h1>
        </header>

        <main class="main-menu">

            <div class="wrapper">
                <div class="icon ">
                    <div class="tooltip">
                        Calendario</div>
                    <div class="button">
                        <a href="aplicaciones-calendario.jsp" class="button">
                            <span><i class="bx bx-calendar"></i></span>
                        </a>
                    </div>
                    <p>Calendario interactivo </p>
                </div>
                <div class="icon ">
                    <div class="tooltip">
                        Sintomas</div>
                    <div class="button">
                        <a href="aplicaciones-formulario.jsp" class="button">
                            <span><i class="bx bx-donate-heart"></i></span>
                        </a>
                    </div>
                    <p>Formulario de síntomas</p>
                </div>
                <div class="icon ">
                    <div class="tooltip">
                        Inicio</div>
                    <div class="button">
                        <a href="#" class="button">
                            <span><i class="bx bx-home"></i></span>
                        </a>
                    </div>
                    <p>Inicio de covhe</p>
                </div>
                <div class="icon ">
                    <div class="tooltip">
                        Grafica</div>
                    <div class="button">
                        <a href="aplicaciones-grafico.jsp" class="button">
                            <span><i class="bx bx-bar-chart-alt-2"></i></span>
                        </a>
                    </div>
                    <p>Estadísticas de usuarios de covhe</p>
                </div>
                <div class="icon ">
                    <div class="tooltip">
                        Tracker</div>
                    <div class="button">
                        <a href="aplicaciones-tracker.jsp" class="button">
                            <span><i class='bx bx-home-heart'></i></span>
                        </a>
                    </div>
                    <p>
                        Tracker de covid
                    </p>
                </div>
                <div class="icon ">
                    <div class="tooltip">
                        Ayuda</div>
                    <div class="button">
                        <a href="aplicaciones-ayuda.jsp" class="button">
                            <span><i class="bx bx-help-circle"></i></span>
                        </a>
                    </div>
                    <p>Ayuda</p>
                </div>
            </div>
        </main>


        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>

</html>

<% }%>
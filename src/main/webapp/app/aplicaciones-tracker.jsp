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
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            Aplicaciones
        </title>
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;700;900&display=swap"
              rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/grid.css">
        <link rel="stylesheet" href="../assets/css/app.css">
    </head>

    <body class="loading" id="body-pd">

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
                                <a href="vacuna.jps" class="collapse__sublink">Vacunas</a>
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
            <h1>Hola</h1>
        </header>

        <main class="main">

            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-3 col-md-6 col-sm-12">
                            <div class="box">
                                <div class="country-select" id="country-select">
                                    <div class="country-select-toggle" id="country-select-toggle">
                                        <span>
                                            Global
                                        </span>
                                        <i class="bx bx-chevron-down"></i>
                                    </div>
                                    <div class="country-select-list" id="country-select-list">
                                        <input type="text" placeholder="Busca el nombre del país">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-8 col-md-12 col-sm-12">
                            <div class="row">
                                <div class="col-4 col-md-4 col-sm-12">
                                    <div class="box box-hover">
                                        <div class="count count-confirmed">
                                            <div class="count-icon">
                                                <i class="bx bxs-virus"></i>
                                            </div>
                                            <div class="count-info">
                                                <h5 id="confirmed-total">123,456,789</h5>
                                                <span>Confirmados</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-4 col-md-4 col-sm-12">
                                    <div class="box box-hover">
                                        <div class="count count-recovered">
                                            <div class="count-icon">
                                                <i class="bx bxs-smile"></i>
                                            </div>
                                            <div class="count-info">
                                                <h5 id="recovered-total">123,456,789</h5>
                                                <span>Recuperados</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-4 col-md-4 col-sm-12">
                                    <div class="box box-hover">
                                        <div class="count count-death">
                                            <div class="count-icon">
                                                <i class="bx bxs-sad"></i>
                                            </div>
                                            <div class="count-info">
                                                <h5 id="death-total">123,456,789</h5>
                                                <span>Bajas</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="box">
                                        <div class="box-header">
                                            Todo el tiempo
                                        </div>
                                        <div class="box-body">
                                            <div id="all-time-chart"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-6 col-md-6 col-sm-12">
                                    <div class="box">
                                        <div class="box-header">
                                            Qué es covid-19
                                        </div>
                                        <div class="box-body">
                                            <iframe width="100%" height="315"
                                                    src="https://www.youtube.com/embed/OZcRD9fV7jo" title="YouTube video player"
                                                    frameborder="0"
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                    allowfullscreen></iframe>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-6 col-md-6 col-sm-12">
                                    <div class="box">
                                        <div class="box-header">
                                            Como cuidarte
                                        </div>
                                        <div class="box-body">
                                            <iframe width="100%" height="315"
                                                    src="https://www.youtube.com/embed/1APwq1df6Mw" title="YouTube video player"
                                                    frameborder="0"
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                    allowfullscreen></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-4 col-md-12 col-sm-12">
                            <div class="box">
                                <div class="box-header">
                                    Ultimos 30 días
                                </div>
                                <div class="box-body">
                                    <div id="days-chart"></div>
                                </div>
                            </div>

                            <div class="box">
                                <div class="box-header">
                                    Indice de recuperación
                                </div>
                                <div class="box-body">
                                    <div id="recover-rate-chart"></div>
                                </div>
                            </div>

                            <div class="box">
                                <div class="box-header">
                                    Top paises más afectados
                                </div>
                                <div class="box-body">
                                    <table class="table-countries" id="table-countries">
                                        <thead>
                                            <tr>
                                                <th>
                                                    País
                                                </th>
                                                <th>Confirmados</th>
                                                <th>Recuperados</th>
                                                <th>Bajas</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>test</td>
                                                <td>test</td>
                                                <td>test</td>
                                                <td>test</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer">
                <div class="icon refresh">
                    <div class="tooltip">
                        Regresar</div>
                    <div class="button">
                        <a href="aplicaciones-inicio.jsp" class="button">
                            <span><i class='bx bx-refresh'></i></i></span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="loader">
                <i class="bx bxs-virus bx-spin"></i>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="../assets/js/fetchApi.js"></script>
        <script src="../assets/js/covidApi.js"></script>
        <script src="../assets/js/app.js"></script>
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>

</html>
<% }%>
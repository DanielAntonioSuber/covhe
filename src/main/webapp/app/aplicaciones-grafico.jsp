
<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aplicaciones</title>
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/chart.js "></script>

    </head>

    <body id="body-pd">
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
        %>
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
            <h1>Calendario</h1>
        </header>
        <main class="main main-calendar">
            <div class="wrapper">
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
            <canvas id="myChart" ></canvas>

        </main>

        <!-- Inconos -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>



    </body>
    <script>
        let myChart = document.getElementById('myChart').getContext('2d');

        var int;
        int = 200;

        let massPopChart = new Chart(myChart, {
            type: 'doughnut',
            data: {
                labels: ['Fiebre o escalofríos', 'Tos', 'Dificultad para respirar',
                    'Fatiga', 'Dolores musculares y corporales', 'Dolor de cabeza',
                    'Pérdida reciente del olfato o el gusto', 'Dolor de garganta',
                    'Congestión o moqueo', 'Náuseas o vómitos', 'Diarrea', 'Asintomatico'],
                datasets: [{
                        label: 'population',
                        data: [
                            int, int, int, int, int, int, int, int, int, int, int, int
                        ],
                        backgroundColor: [
                            'rgba(255,97,134)',
                            'rgba(251,19,124)',
                            'rgba(250,183,183)',
                            'rgba(255,238,255)',
                            'rgba(255,170,204)',
                            'rgba(240, 98, 146)'
                        ],
                        borderWidth: 1,
                        borderColor: '#777',
                        hoverBorderWidth: 3,
                        hoverBorderColor: '#000'
                    }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: 'Sintomas comunes de usuarios CovHelper',
                        padding: {
                            top: 10,
                            bottom: 30
                        },
                        family: 'Arial'
                    }
                },
                legend: {
                    position: 'right',
                    labels: {
                        fontColor: '#000'
                    }
                },
                layout: {
                    padding: {
                        left: 300,
                        right: 300,
                        bottom: 300,
                        top: 20
                    }
                }
            }
        });
    </script>

</html>

<% } %>
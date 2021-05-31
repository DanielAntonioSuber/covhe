
<%@page import="Controlador.Usuario"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <title>Aplicaciones</title>
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/covhe.css" />
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    </head>
    <%
        Usuario usuario = new Usuario();
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("../index.jsp");
        } else {
            usuario = (Usuario) session.getAttribute("usuario");
    %>
    <body class="light" id="body-pd">
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
            <h1>Inicio</h1>
        </header>

        <main class="main-calendar main">  
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
            <form action="aplicaciones-formulario.jsp">
                <div class="wrapper-form wrapper">
                    <div class="title">Selecione sus Sintomas</div>
                    <div class="box">
                        <input type="checkbox" name="select" id="option-1"  value="1"/>
                        <input type="checkbox" name="select" id="option-2" value="2"/>
                        <input type="checkbox" name="select" id="option-3" value="3"/>
                        <input type="checkbox" name="select" id="option-4" value="4"/>
                        <input type="checkbox" name="select" id="option-5" value="5"/>
                        <input type="checkbox" name="select" id="option-6" value="6"/>
                        <input type="checkbox" name="select" id="option-7" value="7"/>
                        <input type="checkbox" name="select" id="option-8" value="8"/>
                        <input type="checkbox" name="select" id="option-9" value="9"/>
                        <input type="checkbox" name="select" id="option-10" value="10"/>
                        <input type="checkbox" name="select" id="option-11" value="11"/>
                        <input type="checkbox" name="select" id="option-12" value="12"/>

                        <label for="option-1" class="option-1">
                            <div class="dot"></div>
                            <div class="text">Fiebre o escalofríos</div>
                        </label>
                        <label for="option-2" class="option-2">
                            <div class="dot"></div>
                            <div class="text">Tos</div>
                        </label>
                        <label for="option-3" class="option-3">
                            <div class="dot"></div>
                            <div class="text">Dificultad para respirar</div>
                        </label>
                        <label for="option-4" class="option-4">
                            <div class="dot"></div>
                            <div class="text">Fatiga</div>
                        </label>
                        <label for="option-5" class="option-5">
                            <div class="dot"></div>
                            <div class="text">Dolores musculares y corporales</div>
                        </label>
                        <label for="option-6" class="option-6">
                            <div class="dot"></div>
                            <div class="text">Dolor de cabeza</div>
                        </label>
                        <label for="option-7" class="option-7">
                            <div class="dot"></div>
                            <div class="text">Pérdida reciente del olfato o el gusto</div>
                        </label>
                        <label for="option-8" class="option-8">
                            <div class="dot"></div>
                            <div class="text">Dolor de garganta</div>
                        </label>
                        <label for="option-9" class="option-9">
                            <div class="dot"></div>
                            <div class="text">Congestión o moqueo</div>
                        </label>
                        <label for="option-10" class="option-10">
                            <div class="dot"></div>
                            <div class="text">Náuseas o vómitos</div>
                        </label>
                        <label for="option-11" class="option-11">
                            <div class="dot"></div>
                            <div class="text">Diarrea</div>
                        </label>
                        <label for="option-12" class="option-12">
                            <div class="dot"></div>
                            <div class="text">Asintomatico</div>
                        </label>
                    </div>
                    <div class="box1">
                        <label for="option" class="option">
                            <div class="text">Enviar respuesta</div>
                        </label>
                        <input type="submit" name="btngrabar" id="option" />
                    </div>
                    <div class="calendar-footer">
                        <div class="toggle">
                            <span>Modo Oscuro</span>
                            <div class="dark-mode-switch">
                                <div class="dark-mode-switch-ident"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>
            
        <!-- Iconos -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
        <script src="../assets/js/form.js"></script>

    </body>

</html>

<% } %>
<%@page import="Controlador.Usuario"%>
<%@page import="Controlador.Comentario"%>
<%@page import="Controlador.Publicacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.Consultas"%>
<%
    Usuario usuario = new Usuario();
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        usuario = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>

<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon" />
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css" />
        <link rel="stylesheet" href="../assets/css/covhe.css" />

        <title>CovHe - Foro</title>
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

                        <div class="nav__link collapse">
                            <ion-icon name="information-circle-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Informacion</span>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            <ul class="collapse__menu">
                                <a href="informacion.jsp" class="collapse__sublink">Información</a>
                                <a href="vacuna.jsp" class="collapse__sublink">Vacunas</a>
                                <a href="https://www.who.int/es" class="collapse__sublink">OMS</a>
                            </ul>
                        </div>

                        <div class="nav__link collapse">
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
            <h1>Foro</h1>
        </header>

        <!-- En este coso ponen todo lo que va a hacer -->
        <main class="main-foro">
            <div class="foro">
                <div class="publications">
                    <%
                        Consultas consulta = new Consultas();
                        ArrayList<Publicacion> publicaciones = consulta.publicaciones();

                        for (Publicacion publicacion : publicaciones) {
                            int idPublicacion = publicacion.getId();
                            ArrayList<Comentario> comentarios = consulta.comentarios(publicacion.getId());
                    %>
                    <div class="publication">

                        <div class="publication__header">
                            <h2 class="publication__header-title"><%= publicacion.getTitulo()%></h2>
                            <div class="publication__header-user">Por: <%= publicacion.getUsuario()%></div>
                            <div class="publication__header-date">Fecha: <%= publicacion.getFecha()%>   </div>
                        </div>
                        <div class="publication__contents" dir="auto"><%= publicacion.getContenido()%>
                        </div>
                        <div class="publication__actions">
                            <input type="text" name="idPublication" hidden value="<%= idPublicacion%>" />
                            <button class="publication__actions-comment">Comentar</button>
                            <button class="publication__actions-comments">Comentarios <%= comentarios.size()%></button>
                            <hr />
                        </div>

                        <div class="publication__comments" hidden>

                            <%
                                for (Comentario comentario : comentarios) {
                            %>
                            <div class="commentary">
                                <div class="comemmentary__header">
                                    <h3 class="commentary__header-title"><%= comentario.getUsuario()%></h3>
                                    <div class="commentary__header-date"><%= comentario.getFecha()%></div>
                                </div>
                                <div class="commentary__content"><%= comentario.getContenido()%>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                </div>

                <div id="commentBox" class="comment" hidden>
                    <form action="comentar.jsp">
                        <input name="idPublication" type="text" required hidden />
                        <textarea name="comment" id="commentText" cols="30" rows="10" required></textarea>
                        <input type="submit" value="Comentar" />
                        <input type="button" value="Cancelar" id="cancelar" />
                    </form>
                </div>

                <div class="post">
                    <form class="post-form" action="publicar.jsp" method="get">
                        <input class="post-form__title" type="text" placeholder="Título" name="title" required />
                        <textarea class="post-form__content" name="content" id="content" required></textarea>
                        <input class="post-form__submit" type="submit" value="Publicar" />
                    </form>
                </div>
            </div>
        </main>
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
        <script src="../assets/js/foro.js"></script>
    </body>

</html>

<% 
    } 
%>
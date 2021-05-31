<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controlador.Usuario"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/ajustes.css">

        <title>CovHe - Opciones</title>
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
            <h1>Ajustes</h1>
        </header>

        <!-- En este coso ponen todo lo que va a hacer -->
        <main class="main" style="display: block">
            <form method="post" action="guardarCambios.jsp" class="form" id="formulario" style="width: 500px; margin: auto">

                <div class="formulario">
                    <!-- Grupo: Usuario -->
                    <div class="formulario__grupo" id="grupo__usuario">
                        <label for="usuario" class="formulario__label">Usuario</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="usuario" id="usuario" disabled value="<%= usuario.getNomUsuario()%>">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            <input type="button" class="formulario__btn" value="Cambiar">
                        </div>
                        <p class="formulario__input-error">
                            El usuario tiene que ser de 4 a 16 dígitos y solo puede contener
                            numeros, letras y guion bajo.
                        </p>
                    </div>

                    <!-- Grupo nombre -->
                    <div class="formulario__grupo" id="grupo__nombre">
                        <label for="nombre" class="formulario__label">Nombre</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre" id="nombre" disabled value="<%= usuario.getNombre()%>">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            <input type="button" class="formulario__btn" value="Cambiar">
                        </div>
                        <p class="formulario__input-error">
                            El nombre tiene que ser de 4 a 16 dígitos y solo puede contener
                            numeros, letras y guion bajo.
                        </p>
                    </div>

                    <!-- Grupo Apellidos -->
                    <div class="formulario__grupo" id="grupo__apellido">
                        <label for="apellido" class="formulario__label">Apellido</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="apellido" id="apellido" disabled value="<%= usuario.getApellidos()%>">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            <input type="button" class="formulario__btn" value="Cambiar">
                        </div>
                        <p class="formulario__input-error">
                            El apellido tiene que ser de 4 a 16 dígitos y solo puede contener
                            numeros, letras y guion bajo.
                        </p>
                    </div>


                    <!-- Grupo: Correo Electronico -->
                    <div class="formulario__grupo" id="grupo__correo">
                        <label for="correo" class="formulario__label">Correo Electrónico</label>
                        <div class="formulario__grupo-input">
                            <input type="email" class="formulario__input" name="correo" id="correo "
                                   placeholder="correo@correo.com" disabled value="<%= usuario.getCorreo()%>">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            <input type="button" class="formulario__btn" value="Cambiar">
                        </div>
                        <p class="formulario__input-error">El correo solo puede contener letras, numeros, puntos, guiones y
                            guion bajo.</p>
                    </div>

                    <!-- Grupo: Contraseña -->
                    <div class="formulario__grupo" id="grupo__password">
                        <label for="password" class="formulario__label">Contraseña</label>
                        <div class="formulario__grupo-input">
                            <input type="password" class="formulario__input" name="password" id="password" disabled value="<%= usuario.getContrasennia()%>">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            <input type="button" class="formulario__btn" value="Cambiar">
                        </div>
                        <p class="formulario__input-error">La contraseña tiene que ser de 4 a 12 dígitos.</p>
                    </div>

                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario
                            correctamente. </p>
                    </div>

                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__smt" hidden>Guardar cambios</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!
                        </p>
                    </div>
                </div>

            </form>

            <form action="eliminar.jsp" method="POST">
                <div class="formulario">
                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__smt" style="background-color: #bb2929">Eliminar cuenta</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!
                        </p>
                    </div>
                </div>
            </form>


        </main>
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/validarAjuste.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>

</html>
<% } %>
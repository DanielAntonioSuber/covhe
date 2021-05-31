<%@page import="Controlador.Consultas"%>
<%@page import="Controlador.Usuario"%>
<%@page import="Controlador.Altas"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%
    if (session.getAttribute("usuario") != null) {
        response.sendRedirect("app/inicio.jsp");
    }
%>
<html lang="es">

    <head>
        <title>CovHe - Inicio Sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/images/logo-covhe.svg" type="image/x-icon" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>

    <body style="height: 100%;">
        <%
            Usuario usuario = new Usuario();
            Altas alta = new Altas();
            Consultas c = new Consultas();

            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellidos(request.getParameter("apellido"));
            usuario.setNomUsuario(request.getParameter("usuario"));
            usuario.setCorreo(request.getParameter("correo"));
            usuario.setContrasennia(request.getParameter("password"));
            String nomUsuario = usuario.getNomUsuario();
            String contrasennia = usuario.getContrasennia();

            if (usuario.esCorrecto()) {
                if (alta.registrarUsuario(usuario)) {
                    session = request.getSession(true);
                    usuario = c.consultarUsuario(nomUsuario, contrasennia);

                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("app/inicio.jsp");

                } else {
                    response.sendRedirect("registro.jsp");
                }
            }
        %>

        <div class="container-register">
            <form method="post" action="registro.jsp" class="form" id="formulario">
                <h1>Registro</h1>
                <a href="index.jsp"><img src="assets/images/logo-covhe.svg" alt="logo" class="img-logo"></a>
                <div class="formulario">
                    <!-- Grupo: Nombre -->
                    <div class="formulario__grupo" id="grupo__nombre">
                        <label for="nombre" class="formulario__label">Nombre</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre" id="nombre">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El nombre tiene que ser de 4 a 16 dígitos y solo puede contener numeros, letras y guion bajo.</p>
                    </div>


                    <!-- Grupo: apellido -->
                    <div class="formulario__grupo" id="grupo__apellido">
                        <label for="apellido" class="formulario__label">Apellidos</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="apellido" id="apellido">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El apellido tiene que ser de 4 a 16 dígitos y solo puede contener
                            numeros, letras y guion bajo.</p>
                    </div>

                    <!-- Grupo: Usuario -->
                    <div class="formulario__grupo" id="grupo__usuario">
                        <label for="usuario" class="formulario__label">Usuario</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="usuario" id="usuario">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener
                            numeros, letras y guion bajo.</p>
                    </div>

                    <!-- Grupo: Correo Electronico -->
                    <div class="formulario__grupo" id="grupo__correo">
                        <label for="correo" class="formulario__label">Correo Electrónico</label>
                        <div class="formulario__grupo-input">
                            <input type="email" class="formulario__input" name="correo" id="correo"
                                   placeholder="correo@correo.com">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El correo solo puede contener letras, numeros, puntos, guiones y
                            guion bajo.</p>
                    </div>

                    <!-- Grupo: Contraseña -->
                    <div class="formulario__grupo" id="grupo__password">
                        <label for="password" class="formulario__label">Contraseña</label>
                        <div class="formulario__grupo-input">
                            <input type="password" class="formulario__input" name="password" id="password">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La contraseña tiene que ser de 4 a 12 dígitos.</p>
                    </div>

                    <!-- Grupo: Contraseña 2 -->
                    <div class="formulario__grupo" id="grupo__password2">
                        <label for="password2" class="formulario__label">Repetir Contraseña</label>
                        <div class="formulario__grupo-input">
                            <input type="password" class="formulario__input" name="password2" id="password2">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ambas contraseñas deben ser iguales.</p>
                    </div>



                    <!-- Grupo: Terminos y Condiciones -->
                    <div class="formulario__grupo" id="grupo__terminos">
                        <label class="formulario__label">
                            <input class="formulario__checkbox" type="checkbox"  id="terminos">
                            Acepto los Terminos y Condiciones
                        </label>
                    </div>

                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario
                            correctamente. </p>
                    </div>

                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn">Enviar</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!
                        </p>
                    </div>
                </div>
                <p class="rd">¿Ya tienes cuenta? <a href="inicio-sesion.jsp">Iniciar Sesion aquí</a></p>
            </form>
        </div>
        <script src="assets/js/validarRegistro.js"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    </body>

</html>

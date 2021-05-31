<%@page import="Controlador.Conexion"%>
<%@page import="Controlador.Usuario"%>
<%@page import="Controlador.Consultas"%>
<%@page import="Controlador.Altas"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conexion con = new Conexion();
    if (request.getParameter("formulario__btn") != null) {

    }
    if (session.getAttribute("usuario") != null) {
        response.sendRedirect("app/inicio.jsp");
    }

    String nomUsuario = request.getParameter("usuario");
    String contrasennia = request.getParameter("contrasennia");
    Usuario usuario = new Usuario();

    if (nomUsuario != null && contrasennia != null) {
        usuario.setNomUsuario(nomUsuario);
        usuario.setContrasennia(contrasennia);

        Consultas cons = new Consultas();
        if (cons.auntenticarUsuario(usuario)) {
            Consultas c = new Consultas();
            usuario = c.consultarUsuario(nomUsuario, contrasennia);
            session.setAttribute("usuario", usuario);
            response.sendRedirect("app/inicio.jsp");
        } else {
            response.sendRedirect("inicio-sesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>CovHe - Inicio Sesión</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="assets/images/logo-covhe.svg" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>

    <body style="width: 100%; height: 100%;">



        <div class="container-login">
            <form class="form" action="inicio-sesion.jsp" method="post">
                <h1>Inicio Sesión</h1>
                <a href="index.jsp"><img src="assets/images/logo-covhe.svg" alt="logo" class="img-logo"></a>
                <div class="formulario__grupo">
                    <label for="usuario" class="formulario__label">Usuario</label>
                    <input type="text" class="formulario__input" name="usuario" id="usuario">
                </div>

                <div class="formulario__grupo">
                    <label for="password" class="formulario__label">Contraseña</label>
                    <input type="text" class="formulario__input" name="contrasennia" id="password">
                </div>
                <br>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn">Enviar</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
                <p class="rd">¿No tienes cuenta? <a href="registro.jsp">Registrate aquí</a></p>
            </form>
        </div>
    </body>

</html>
<%@page import="Controlador.Consultas"%>
<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Cambios"%>
<%@page import="Controlador.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");

                usuario.setNombre(request.getParameter("nombre"));
                usuario.setApellidos(request.getParameter("apellido"));
                usuario.setCorreo(request.getParameter("correo"));
                usuario.setContrasennia(request.getParameter("password"));
                usuario.setNomUsuario(request.getParameter("usuario"));

                
                
                System.out.println("Antes de los cambios");
                Cambios cambios = new Cambios();
                cambios.cambiarUsuario(usuario);
                
                Consultas consulta = new Consultas();
                usuario = consulta.consultarUsuario(usuario.getNomUsuario(), usuario.getContrasennia());

                session.removeAttribute("usuario");
                session.setAttribute("usuario", usuario);
                response.sendRedirect("ajustes.jsp");
            }
        %>
    </body>
</html>

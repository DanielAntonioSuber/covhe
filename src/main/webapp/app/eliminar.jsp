<%-- 
    Document   : eliminar
    Created on : 3 may 2021, 4:00:52
    Author     : danie
--%>

<%@page import="Controlador.Bajas"%>
<%@page import="Controlador.Consultas"%>
<%@page import="Controlador.Cambios"%>
<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                
                Bajas bajas = new Bajas();
                bajas.elminarUsuario(usuario.getId());
                session.removeAttribute("usuario");
                response.sendRedirect("ajustes.jsp");
            }
        %>
    </body>
</html>

<%-- 
    Document   : publicar
    Created on : May 16, 2021, 10:00:54 PM
    Author     : suber
--%>

<%@page import="Controlador.Altas"%>
<%@page import="Controlador.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
                String content = "", title = "";
                title = request.getParameter("title");
                content = request.getParameter("content");
                
                Altas alta = new Altas();
                alta.publicar(usuario.getId(), title, content);
                response.sendRedirect("foro.jsp");
            }
        
        %>
    </body>
</html>

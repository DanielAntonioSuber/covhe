<%-- 
    Document   : salir
    Created on : 29 abr 2021, 17:03:12
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("usuario");
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>

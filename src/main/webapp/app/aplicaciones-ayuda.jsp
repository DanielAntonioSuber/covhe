
<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../assets/css/help.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            Usuario usuario = new Usuario();
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("../index.jsp");
            } else {
                usuario = (Usuario) session.getAttribute("usuario");
        %>
        <div class="wrappe">
            <div class="icon refresh">
                <div class="tooltip">
                    Regresar</div>
                <div class="button">
                    <a href="aplicaciones-inicio.jsp" class="button">
                        <span><i class='bx bx-refresh' ></i></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <input type="radio" name="slide" id="one" checked>
            <input type="radio" name="slide" id="two">
            <input type="radio" name="slide" id="three">
            <input type="radio" name="slide" id="four">
            <input type="radio" name="slide" id="five">
            <div class="img img-1">
                <img src="../assets/images/Cal.JPG" alt="">
            </div>
            <div class="img img-2">
                <img src="../assets/images/Form.JPG" alt="">
            </div>
            <div class="img img-3">
                <img src="../assets/images/Inicio.JPG" alt="">
            </div>
            <div class="img img-4">
                <img src="../assets/images/Graf.JPG" alt="">
            </div>
            <div class="img img-5">
                <img src="../assets/images/Track.JPG" alt="">
            </div>
            <div class="sliders">
                <label for="one" class="one"></label>
                <label for="two" class="two"></label>
                <label for="three" class="three"></label>
                <label for="four" class="four"></label>
                <label for="five" class="five"></label>
            </div>
        </div>

    </body>
</html>

<% } %>
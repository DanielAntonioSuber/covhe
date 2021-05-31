<%-- 
    Document   : cuestionario
    Created on : 2 may 2021, 23:09:12
    Author     : danie
--%>

<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuario = new Usuario();
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        usuario = (Usuario) session.getAttribute("usuario");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../assets/images/logo-covhe.svg" type="image/x-icon">
        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">

        <title>CovHe - Quiz COVID-19</title>
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
            <h1>CovHe - Quiz COVID-19</h1>
        </header>

        <!-- En este coso ponen todo lo que va a hacer -->
        <main class="main">
            <script>
                function añadirC(rola) {
                    var rolas = document.getElementById("rola");
                    var cuantos = rolas.length;
                    for (contador = 1; contador < cuantos; contador++)
                        rolas.options[1] = null;

                    var myselect = document.getElementById("albums");
                    var dato = myselect.options[myselect.selectedIndex].index;
                    if (dato >= 1 && dato <= 3) {
                        if (dato === 1)
                            arregloC = ["Solo yo", "1-2", "2-3", "3-4", "4-5", "+5"];
                        else
                        if (dato === 2)
                            arregloC = ["Por lo regular en hospitalizado por COVID-19 no se permiten visitas"];
                        else
                        if (dato === 3)
                            arregloC = ["Solo yo", "1-2", "2-3", "3-4", "4-5", "+5"];
                        var cuantos = arregloC.length;
                        for (contador = 0; contador < arregloC.length; contador++)
                            rola.options[contador + 1] = new Option(arregloC[contador]);
                    }
                }
                function verifica(mostrar) {
                    var nacion = document.getElementById("nacionalidad");
                    var creacion = document.getElementById("año");
                    //Radios
                    var radio2 = document.getElementById("2disc");
                    var radio3 = document.getElementById("3disc");
                    //Checkbox
                    var gen1 = document.getElementById("botonC");
                    var gen2 = document.getElementById("botonI");
                    var gen3 = document.getElementById("botonI2");
                    //Combos
                    var selalb = document.getElementById("albums");
                    var selcan = document.getElementById("rola");
                    //Validación
                    var resultado = "";
                    //Lugar de origen
                    if (nacion.value === "China") {
                        resultado += "Excelente, su origen si fue en China!" + "\n";
                    } else
                        resultado += "Incorrecto, su origen fue en China" + "\n";
                    //Año del primer caso
                    if (creacion.value === "2019") {
                        resultado += "Acertaste, el primer casi si fue en el 2019!" + "\n";
                    } else
                        resultado += "Incorrecto, el primer caso fue en el 2019" + "\n";
                    //Tiempo de pandemia
                    if (radio2.checked) {
                        resultado += "Incorrecto, llevamos 1 año en pandemia" + "\n";
                    } else
                    if (radio3.checked) {
                        resultado += "Correcto, llevamos 1 año en pandemia" + "\n";
                    }
                    //Sintomas
                    if (gen1.checked) {
                        resultado += "Así es, uno de los sintomas del COVID-19 es la tos seca" + "\n";
                    } else
                    if (gen2.checked) {
                        resultado += "No, el COVID-19 no provoca hemorragias" + "\n";
                    } else
                    if (gen3.checked) {
                        resultado += "No, el COVID-19 no genera perdida de la vista" + "\n";
                    }
                    var dato = selalb.options[selalb.selectedIndex].value;
                    var dato2 = selcan.options[selcan.selectedIndex].value;
                    resultado += (dato + " y " + dato2)
                    mostrar.value = resultado;

                }
            </script>
            <div style="display: table;">
                <form>
                    <center><h2>COVID-19</h2></center> 
                    ¿En donde se origino el COVID-19?<input type="text" id="nacionalidad">
                    <br><br>
                    ¿En que año se dio el primer caso del COVID-19?<input type="number" id ="año">
                    <br><br>
                    2 años de pandemia <input type="radio" id="2disc">
                    1 año de pandemia <input type="radio" id="3disc">
                    <br><br>
                    Selecciona uno de sus sintomas:
                    <br><br>
                    <input type="checkbox" name="ope" id="botonC">
                    Tos Seca
                    <input type="checkbox" name="ope" id="botonI">
                    Hemorragias
                    <input type="checkbox" name="ope" id="botonI2">
                    Perdida de la vista
                    <br><br>

                    <select name="discos" id="albums" onchange="añadirC(rola)">
                        <option value="x">¿Cual a sido el lugar en el que mas ha estado durante la pandemia?</option>
                        <option value="Casa">Casa</option>
                        <option value="Hospital">Hospital</option>
                        <option value="Lugares turisticos">Lugares turisticos</option>
                    </select>

                    <select name="canciones" id="rola">
                        <option value ="y">¿Con cuantas personas?</option> 
                    </select>

                    <br><br>
                    <input type="button" onclick="verifica(mostrar)" value="Enviar" id="elegidos">
                    <br><br>
                    <textarea name="mostrar" rows="8" cols="70">
                    </textarea>
                </form>
            </div>

        </main>
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
    </body>
</html>
<%
    }
%>


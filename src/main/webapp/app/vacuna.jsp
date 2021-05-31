<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = new Usuario();
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        usuario = (Usuario) session.getAttribute("usuario");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> Vacuna </title>
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/vacuna.css">
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
            <h1> Vacuna del COVID-19 </h1>
        </header>
        <main class="main">
            <br>
            <h2 align="center"> Aquí encontraras información actualizada sobre la vacuna del COVID-19</h2>
            <h2 align="center"> Sabemos que necesitas información confiable y nosotros te la brindamos, puedes encontrar
                las
                referencias en las parte inferior de la página</h2>
            <br>
            <hr>
            <aside>
                <h2> ¿Existe la vacuna del COVID-19? <h2>
                        <h4> Sí, ya se están utilizando varias vacunas. El primer programa de vacunación colectiva se
                            puso
                            en marcha a principios de 2020 y,
                            al 15 de febrero de 2021, ya se han administrado 175,3 millones de dosis. Por el momento, se
                            están utilizando siete vacunas distintas a través de tres plataformas.
                            El 31 de diciembre de 2020, la OMS dio luz verde a la inclusión en la Lista para uso en
                            emergencias de la vacuna de Pfizer contra la COVID-19. El 15 de febrero de 2021, incluyó
                            también
                            dos versiones de la vacuna AstraZeneca/Oxford contra la COVID-19,
                            fabricadas por el Serum Institute de la India y SKBio. El 12 de marzo de 2021, aceptó la
                            inclusión de la vacuna contra la COVID-19, desarrollada por Janssen (Johnson & Johnson).
                            Asimismo, la OMS ha previsto incluir en la lista otras vacunas durante el mes de junio.
                        </h4>
                        </aside>
                        <br><br><br>
                        <img class="foto1" src="../assets/images/vacuna.jpg" >
                        <br><br>
                        <br><br>
                        <br><br>
                        <br><br>
                        <br><br>
                        <br><br>
                        <br><br>
                        <h2> ¿Cuáles son los beneficios de darse una vacuna contra la COVID-19? </h2>
                        <h4> La vacuna contra la COVID-19 puede ayudar a: </h4>
                        <ul>
                            <h4>
                                • Prevenir que te contagies con la COVID-19 o que te enfermes de gravedad. <br>
                                • Prevenir que trasmitas el virus que causa la COVID-19 a demas personas. <br>
                                • Aumentar el número de personas en la comunidad que están protegidas de contagiarse con la COVID-19
                                —
                                lo que hace que sea más difícil que la enfermedad se propague. <br>
                                • Prevenir que el virus que causa la COVID-19 se propague y se replique, lo que le permite mutar y
                                posiblemente volverse más resistente a las vacunas. <br>
                            </h4>
                        </ul>
                        <br>
                        <img class="foto2" src="../assets/images/stop.jpg">
                        <h2> ¿Existe algun peligro al inyectarse la vacuna del COVID-19?</h2>
                        <h4> Los efectos secundarios son minimos y no hay ningun peligro en aplicarse la vacuna para el COVID-19.
                            Hemos
                            de recordar que el miedo que se genera en torno a esta
                            vacuna viene primordialmente de fakenews y de teorias de conspiración sin sustento alguno, por lo que
                            aquí
                            desmentiremos algunas de las leyenedas más populares en torno
                            a esta vacuna.</h4>
                        <ul>
                            <h4>
                                • La vacuna contra el COVID-19 NO puede modificar nuestro ADN de modo alguno. <br>
                                • La vacuna contra el COVID-19 NO contiene microchips. <br>
                                • La vacuna contra el COVID-19 NO se producen con fetos. <br>
                                • La vacuna contra el COVID-19 NO es obligatoria. <br>
                            </h4>
                        </ul>
                        <h4> Nuestra empresa trata de ponerle un alto a la desinformación, por lo que contribuimos a la difusión de
                            información clara y confiable. </h4>
                        <br>
                        <h2> Noticias recientes sobre la vacuna del COVID-19 </h2>
                        <h4>
                            <ul>
                                <a href="https://mexico.as.com/mexico/2021/04/28/actualidad/1619629065_722018.html"> • Según la
                                    secretaria
                                    de salud, estas son las cifras de hoy 28 de Abril del 2021: </a> <br>
                                <br>

                                -1,856,543 personas recuperadas. <br>
                                <br>
                                -215,547 defunciones confirmadas. <br>
                                <br>
                                -16,985,391 dosis aplicadas de la vacuna antiCOVID. <br>
                                <br>
                                <br>
                                <a
                                    href="https://www.elfinanciero.com.mx/nacional/2021/04/27/tienes-entre-50-a-59-anos-registro-para-vacunacion-covid-inicia-el-miercoles-28-de-abril">•
                                    La Secretaría de Salud suspendió momentáneamente la vacunación a adultos mayores contra la
                                    Covid-19
                                    en las alcaldías de Iztapalapa y Tlalpan debido a un retraso en las dosis. </a>
                                <br>
                                <br>
                                <a
                                    href="https://www.eleconomista.com.mx/internacionales/Mexico-acuerda-producir-la-vacuna-rusa-Sputnik-V-anuncia-Ebrard-tras-visita-a-Moscu-20210428-0034.html">•
                                    El Gobierno de México informó este martes sobre el arranque de la nueva etapa de vacunación
                                    contra
                                    el COVID-19 para personas de entre 50 a 59 años de edad en el país.</a>
                                <br>
                                <br>
                                <a
                                    href="https://www.xataka.com.mx/medicina-y-salud/se-necesitara-tercera-dosis-vacuna-covid-se-aplicara-a-9-meses-segunda-biontech">•
                                    México producirá la vacuna rusa Sputnik V, anuncia Ebrard tras visita a Moscú </a>
                            </ul>
                        </h4>
                        <br>

                        <br>
                        <hr>
                        <h2> Referencias: </h2>
                        <h4>
                            <a
                                href="https://www.who.int/es/news-room/q-a-detail/coronavirus-disease-(covid-19)-vaccines?adgroupsurvey={adgroupsurvey}&gclid=Cj0KCQjwvYSEBhDjARIsAJMn0lgOojAObkMm3pFFRKb6xGg5ojvPUsEZF-n5pFvNe_wYiEoA9n1B8kEaAh19EALw_wcB">
                                Enfermedad por el coronavirus (COVID-19): Vacunas </a>
                        </h4>
                        <h4>
                            <a
                                href="https://www.mayoclinic.org/es-es/diseases-conditions/coronavirus/in-depth/coronavirus-vaccine/art-20484859">
                                Vacuna contra la COVID-19: obtén la información verdadera </a>
                        </h4>
                        <h4>
                            <a
                                href="https://www.fundacionfemeba.org.ar/blog/farmacologia-7/post/mitos-y-verdades-sobre-la-vacunas-contra-el-coronavirus-48624">
                                Mitos y Verdades sobre el CORONAVIRUS </a>
                        </h4>

                        </main>

                        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

                        <!-- ===== MAIN JS ===== -->
                        <script src="../assets/js/main.js"></script>
                        </body>

                        </html>
<% } %>
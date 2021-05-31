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
        <title> Información COVID-19 </title>
        <link rel="stylesheet" href="../assets/css/normalize.css">
        <link rel="stylesheet" href="../assets/css/covhe.css">
        <link rel="stylesheet" href="../assets/css/covi.css">
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

                        <div class="nav__link collapse">
                            <ion-icon name="information-circle-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Informacion</span>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            <ul class="collapse__menu">
                                <a href="informacion.jsp" class="collapse__sublink">Información</a>
                                <a href="vacuna.jsp" class="collapse__sublink">Vacunas</a>
                                <a href="https://www.who.int/es" class="collapse__sublink">OMS</a>
                            </ul>
                        </div>

                        <div class="nav__link collapse">
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
            <h1>Informacion</h1>
        </header>
        <main class="main">
            <br>
            <h2 align="center"> En esta sección se encuentra la información que se tiene sobre el COVID-19, se ira
                actualizando en el caso de que se necesario, le mantendremos informado </h2>
            <br>
            <hr>
            <aside>
                <h2> ¿Qué es el COVID-19? </h2>
                <h3> La COVID-19 es la enfermedad causada por el nuevo coronavirus conocido como SARS-CoV-2. La OMS tuvo
                    noticia por primera vez de la existencia de este nuevo virus el 31 de diciembre de 2019,
                    al ser informada de un grupo de casos de «neumonía vírica» que se habían declarado en Wuhan
                    (República
                    Popular China). </h3>
                <br>
                <br>
                <h2> ¿Cómo se originó? </h2>
                <h3> El 31 de diciembre de 2019, la Organización Mundial de la Salud (OMS) recibió reportes de presencia
                    de
                    neumonía, de origen desconocido, en la ciudad de Wuhan, en China.
                    Rápidamente, a principios de enero, las autoridades de este país identificaron la causa como una
                    nueva
                    cepa de coronavirus.
                    La enfermedad ha ido expandiéndose hacia otros continentes como Asia, Europa y América.
                    En cuanto a su comienzo, todavía no se ha confirmado el posible origen animal de la COVID-19. </h3>
                <br>
                <img class="foto1" src="../assets/images/Wuhan.jpeg">
            </aside>
            <br>
            <h2> ¿Qué síntomas tiene el coronavirus? </h2>
            <h3> Los principales síntomas del virus coronavirus incluyen: </h3>
            <ul>
                <h3>
                    • Síntomas respiratorios (similares a los de un resfriado) <br>
                    • Fiebre (alta temperatura) <br>
                    • Tos seca <br>
                    • Falta de aliento o cansancio <br>
                    • Dificultades respiratorias <br>

                    <h3> En casos más graves, el virus puede causar neumonía o síndrome respiratorio agudo grave (SRAS)
                        que
                        es una forma grave de neumonía, insuficiencia renal y hasta la muerte.
                        En otros casos, algunas personas infectadas no desarrollan ningún síntoma, pero pueden contagiar
                        igualmente al resto de población. </h3>
                </h3>
            </ul>
            <img class="foto4" src="../assets/images/Fiebre.jpeg">
            <br>
            <br>
            <br>
            <br><br><br><br><br><br>
            <h2> ¿Quién corre mayor riesgo de presentar un cuadro grave de COVID 19? </h2>
            <h3> Las personas de más de 60 años y las que padecen afecciones médicas subyacentes,
                como hipertensión arterial, problemas cardíacos o pulmonares, diabetes, obesidad o cáncer, corren un
                mayor
                riesgo de presentar cuadros graves. </h3>
            <h3> Sin embargo, cualquier persona, a cualquier edad, puede enfermar de COVID-19 y presentar un cuadro
                grave o
                morir. </h3>
            <br>
            <img class="foto2" src="../assets/images/Viejete.jpeg">
            <br>
            <h2> ¿Cómo se transmite el coronavirus? </h2>
            <h3> Según información de la OMS, el coronavirus se transmite por contacto de persona a persona con algún
                infectado (incluso si no presenta síntomas).
                Por ello, la mejor manera de evitar contraer este virus es siguiendo las buenas prácticas de higiene que
                incluyen: </h3>
            <img class="foto4" src="../assets/images/Contagio.jpeg">
            <ul>
                <h3>
                    • Mantenerse alejado de las personas enfermas. <br>
                    • No tocarse la cara (boca, nariz u ojos).<br>
                    • Mantener una distancia mínima de un metro con el resto de las personas. (Distanciamiento Social).
                    <br>
                    • Lavarse las manos frecuentemente y a fondo por, al menos 20 segundos, con un desinfectante para
                    manos
                    a base de alcohol o lávalas con agua y jabón. Es importante hacerlo incluso si no hay suciedad
                    visible
                    en las manos. <br>
                    • Practique la higiene respiratoria. Esto significa cubrirte la boca y la nariz con el codo o
                    pañuelo
                    doblado cuando toses o estornudas. Desecha inmediatamente el tejido usado. <br>
                    • Lávese las manos siempre después de toser o estornudar; si está cuidando a alguien; cuando está
                    preparando alimentos, cocinando carnes y/o huevos. También después de comer;
                    después de usar el inodoro; si sus manos están sucias, y/o ha estado cerca de una granja o animales
                    salvajes. <br>
                    • Quédese en casa y practique el aislamiento social o cuarentena. <br>
                    • Quédese en casa si no se encuentra bien. <br>
                    • Siga las indicaciones actualizadas de las autoridades sanitarias de su país. <br>
                </h3>
            </ul>
            <h2> ¿Tiene el COVID 19 efectos a largo plazo? </h2>
            <h3> Algunas personas que han padecido la COVID-19, tanto si han necesitado atención hospitalaria como si
                no,
                siguen experimentando síntomas, entre ellos fatiga y diversos síntomas respiratorios y neurológicos.
            </h3>
            <br>
            <img class="foto3" src="../assets/images/Cuidado.jpeg">
        </main>
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>

        <!-- ===== MAIN JS ===== -->
        <script src="../assets/js/main.js"></script>
    </body>
</html>

<% 
    }
%>
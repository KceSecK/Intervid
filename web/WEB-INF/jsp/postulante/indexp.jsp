<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String username = auth.getName();
    boolean a = auth.isAuthenticated();
    System.out.println("ssss");
    System.out.println(auth.getDetails());
    System.out.println(username);
    System.out.println(a);
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Intervid - Curriculum de usuario</title> 
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->
    </head>
    <body>
        <!-- Navbar-->
        <div id="nav-fixed" class="container-fluid nav-intervid static">
            <div class="navbar navbar-expand-sm black">
                <div class="container-fluid">
                    <!-- Logo -->
                    <div class="col-lg-2">
                        <a class="navbar-brand img-fluid" href="index.htm">
                            <img id="logo" src="img/letra 5mm.png" alt="InterVid">
                        </a>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-8 d-none d-sm-block d-md-block">
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="search" placeholder="Buscar">
                            <select class="form-control mr-sm-2">
                                <option>Seccione</option>
                            </select>
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                        </form>
                    </div>

                    <!--                    Toggle icon 
                                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                            <img src="img/Menu_32.png">
                                        </button>-->

                    <div class="container">
                        <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <div class="dropdown">
                                        <a class="btn dropdown-toggle " href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${usuario} 
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="cvPostulante.htm">Mi Perfil</a>
                                            <a class="dropdown-item" href="#">Notificaciones</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Cerrar Sesión</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Container principal-->
        <div class="container-fluid div-principal">
            <div class="row">
                <!--Nav lateral-->
                <div class="col-lg-2 bg-intervid intervid-fixed-nav">
                    <div class="container">
                        <ul class="list-unstyled static ">
                            <h3 class="text-white mt-3">Mi cuenta</h3>
                            <hr class="hr-custom-white"/>
                            <li>
                                <a class="alink nav-link border-link" href="#datospersonales">CV</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#datoscontacto">Datos de Contacto</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#educacion">Educación</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#expectativaslaborales">Expectativas Laborales</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#experienciaprofesional">Experiencia Profesional</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#idiomas">Idiomas</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#otrosconocimientos">Otros Conocimientos</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-10 mb-5">
                    <div class="container">



                    </div>
                </div>





                <!--                 FOOTER                  --> 
                <div id="footer" class="container-fluid bg-black">
                    <div class="container-fluid">
                        <div class="row pt-4 ">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 mt-1">
                                        <h5 class="text-white">Postulantes</h5>
                                        <hr class="hr-custom-white" />
                                        <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                    </div>
                                    <div class="col-lg-3 mt-1">
                                        <h5 class="text-white">Reclutadores</h5>
                                        <hr class="hr-custom-white" />

                                        <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                    </div>
                                    <div class="col-lg-3 mt-1">
                                        <h5 class="text-white">Empresas</h5>
                                        <hr class="hr-custom-white" />
                                        <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                    </div>
                                    <div class="col-lg-3 mt-3 text-right">
                                        <img class="mb-3" src="img/letra 5mm_render.png" alt=""/>
                                        <div class="text-white p-12">INVID Ltda</div>
                                        <div class="text-white p-12">Santiago, Chile</div>
                                        <div class="text-white p-12"><a href="mailto:contacto@inter-vid.com">contacto@inter-vid.com</a></div>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col-lg-12">
                                        <hr class="hr-custom-white"/>
                                    </div>
                                    <div class="col-lg-12">
                                        <p class="text-white p-12">
                                            &copy; 2019 InterVid . Todos los derechos reservados.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

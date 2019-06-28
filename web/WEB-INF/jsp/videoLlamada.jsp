<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String rol = auth.getAuthorities().toString();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>InterVid</title>
        <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>

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
                                <option>Seleccione</option>
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
                                        <a class="btn" href="#"> 
                                            <img src="img/calendar_32px.png" alt=""/>
                                        </a>
                                        <a class="btn dropdown-toggle text-intervid " href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item" href="cvPostulante.htm">CV</a>
                                            <a class="dropdown-item" href="cvPostulante.htm">Mis postulaciones</a>
                                            <a class="dropdown-item" href="cvPostulante.htm">Mis entrevistas </a>
                                            <a class="dropdown-item" href="#">Notificaciones</a>
                                            <a class="dropdown-item" href="indexp.htm">Cuenta</a>
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

        <input type="text" name="room" id="room" />

    <video id="localVideo" autoplay playsinline></video>
    <video id="remoteVideo" autoplay playsinline></video>


    <script src="js/videoLlamada.js" type="text/javascript"></script>

    <script src="js/adapter.js"></script>
</body>
</html>

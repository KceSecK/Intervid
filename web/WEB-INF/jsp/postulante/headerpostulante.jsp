 
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String username = auth.getName();
    System.out.println(auth.getName());
%>

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
                <form method="POST" class="form-inline">
                    <input type="hidden" name="form" value="1"/>
                    <input id="buscar" name="buscar" class="form-control mr-sm-2 d-none d-md-block" type="search" placeholder="Buscar" required>
                    <select id="region" name="region" class="d-none d-md-block custom-select mr-1">
                        <option value="" selected disabled hidden>Región</option>
                        <c:forEach var="re" items="${reg}">
                            <option value="${re.RegionID}">${re.RegionNombre}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-outline-success my-2 my-sm-0 d-none d-md-block" type="submit">Buscar</button>
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
                                    <%= username%>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item " href="cvPostulante.htm">
                                        <button class="btn btn-toolbar">
                                            <img src="img/icons8_user_male_circle_filled_32.png" alt=""/>
                                            &emsp14;Mi perfil
                                        </button>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="cvPostulante.htm">Mis postulaciones</a>
                                    <a class="dropdown-item" href="cvPostulante.htm">Mis entrevistas </a>
                                    <a class="dropdown-item" href="#">Notificaciones</a>
                                    <a class="dropdown-item" href="indexp.htm">Cuenta</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout">Cerrar Sesión</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

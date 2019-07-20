<%-- 
    Document   : trabajos
    Created on : 19-06-2019, 13:09:12
    Author     : sdasd
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String rol = auth.getAuthorities().toString();
    String username = auth.getName();

    System.out.println("rol: " + rol);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Intervid - trabajos</title>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <script>
        window.onunload = function () {
            $.get("${request.contextPath}/logout");
        }
    </script>
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
                    <%
                        if (rol.equals("[Postulante]")) {
                    %>
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
                            </ul>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="container">
                        <div class="ml-5 justify-content-center collapse navbar-collapse" id="collapsibleNavbar">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="alink nav-link border-link" href="loginEmpresa.htm">Empresas</a>
                                </li>
                                <li class="nav-item">
                                    <p class="nav-link text-white font-weight-bold">|</p>
                                </li>
                                <li class="nav-item">
                                    <a class="btn btn-primary" href="loginPostulante.htm" role="button">Ingresar</a>                            
                                </li>
                            </ul>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
        <div class="container div-principal div-filtro">
            <div class="row">
                <div class="card col-lg-12 mt-5 ">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4 class="text-intervid mt-2">${oferta[0].NombreOferta}</h4>
                        </div>
                        <div class="col-lg-12">
                            <img src="${oferta[0].LogoEmpresa}" class="figure-img img-fluid rounded max-img " alt="...">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-lg-9">
                    <div class="row pr-1">
                        <div class="container-fluid card">
                            <div class="row">

                                <div class="col-lg-12">
                                    <h4 class="text-intervid mt-2">Descripcion del cargo</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    ${oferta[0].DescripcionCargo}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <h4 class="text-intervid mt-2">Requisitos</h4>

                                </div>
                                <div class="col-lg-6">
                                    <h4 class="text-intervid mt-2">Beneficios</h4>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 card">
                    <h4 class="text-intervid mt-2">Detalle Oferta</h4>
                    <div class="row">
                        <div class="col-lg-12 font-weight-bold">
                            Horario de entrevistas
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].inicio} - ${oferta[0].fin}
                        </div>
                        <div class="col-lg-12 font-weight-bold">
                            Tipo Cargo
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].TipoCargo}
                        </div>
                        <div class="col-lg-12 font-weight-bold">
                            Lugar de trabajo
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].RegionNombre}, ${oferta[0].ComunaNombre}
                        </div>
                        <div class="col-lg-12 font-weight-bold">
                            Tipo Contrato
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].TipoContrato}
                        </div>
                        <div class="col-lg-12 font-weight-bold">
                            Jornada
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].JornadaTrabajo}
                        </div>
                        <div class="col-lg-12 font-weight-bold">
                            Sueldo
                        </div>
                        <div class="col-lg-12 text-right">
                            ${oferta[0].SueldoOfrecido}
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
    <jsp:include page="footer.jsp" ></jsp:include>
</html>

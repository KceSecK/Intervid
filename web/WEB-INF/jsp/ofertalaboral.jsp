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
                                            <a class="dropdown-item" href="postulaciones.htm">Mis postulaciones</a>
                                            <a class="dropdown-item disabled" href="cvPostulante.htm">Mis entrevistas </a>
                                            <a class="dropdown-item disabled" href="#">Notificaciones</a>
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
                                    <a class="btn btn-primary" href="login.htm" role="button">Ingresar</a>                            
                                </li>
                            </ul>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
        <div class="container div-principal div-filtro">
            <c:choose>
                <c:when test="${empty oferta}">
                    <div class="row">
                        <div class="col-lg-12 mt-5">
                            <h3 class="">La oferta no existe o no se encuentra disponible.</h3>
                            <a class="text" href="trabajos.htm">Volver</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="card col-lg-12 mt-5 ">
                            <div class="row">
                                <div class="col-lg-10">
                                    <h4 class="text-intervid mt-2">${oferta[0].NombreOferta}</h4>
                                </div>
                                <div class="col-lg-2 text-right mt-2">
                                    <p>${oferta[0].FechaOferta}</p>
                                </div>
                                <div class="col-lg-12">
                                    <div class="row float-left pl-3">
                                        <figure class="float-left d-none d-md-block figure img-thumbnail mx-auto">
                                            <img src="${oferta[0].LogoEmpresa}" class="figure-img img-fluid rounded max-img " alt="...">
                                        </figure>
                                        <h5 class="ml-2" >${oferta[0].NombreEmpresa}</h5>
                                    </div>
                                    <%
                                        if (rol.equals("[Postulante]")) {
                                    %>
                                    <form method="POST">
                                        <input type="hidden" value="1" name="entrevista">
                                        <input type="hidden" value="${oferta[0].OfertaLaboralID}" name="oferta">
                                        <button class="btn btn-primary btn-right mb-2 ml-2">
                                            Postular a entrevista
                                        </button>
                                    </form>
                                    <form method="POST">
                                        <input type="hidden" value="2" name="entrevista">
                                        <input type="hidden" value="${oferta[0].OfertaLaboralID}" name="oferta">
                                        <button  class="btn btn-success btn-right mb-2" >
                                            Realizar entrevista diferida
                                        </button>
                                    </form>
                                    <% }%>
                                </div>
                                <div class="col-lg-12">
                                    Finaliza: ${oferta[0].FechaFin}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-lg-9 mb-2">
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
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <pre class="">${oferta[0].RequisitosOferta}</pre>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="text-intervid mt-2">Beneficios</h4>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <pre>${oferta[0].BeneficiosOferta}</pre>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 card mb-5">
                            <h4 class="text-intervid mt-2">Detalle Oferta</h4>
                            <div class="row">
                                <div class="col-lg-12 font-weight-bold">
                                    Horario de entrevistas
                                </div>
                                <div class="col-lg-12 text-right">
                                    ${oferta[0].inicio} - ${oferta[0].fin}
                                </div>
                                <div class="col-lg-12 font-weight-bold">
                                    Lugar de trabajo
                                </div>
                                <div class="col-lg-12 text-right">
                                    ${oferta[0].ComunaNombre},
                                </div>
                                <div class="col-lg-12 text-right">
                                    ${oferta[0].RegionNombre}
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
                                    $ ${oferta[0].sueldo}
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>

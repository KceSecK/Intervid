<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%@page import="org.springframework.security.crypto.password.PasswordEncoder"%>
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

%>
<html>
    <head>
        <title>Intervid - Curriculum de usuario</title> 
        <jsp:include page="../head.jsp" flush="true" />
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
    </head>
    <body>
        <jsp:include page="headerpostulante.jsp" flush="true" />

        <!--Container principal-->
        <div class="container-fluid div-principal">
            <div class="row div-filtro">
                <!--Nav lateral-->
                <div class="col-lg-2 col-md-3 bg-intervid intervid-fixed-nav d-none d-lg-block">
                    <div class="container">
                        <ul class="list-unstyled static mt-4 ">
                            <li>
                                <a class="alink nav-link border-link" href="#datospersonales">En Proceso</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#datoscontacto">Pendientes</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#datoscontacto">Cerradas</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#datoscontacto">Archivadas</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#educacion">Cauducadas</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10 mb-5 mt-4">
                    <div class="container">

                        <div id="proceso" class="mb-5">
                            <h3 class="text-intervid">Mis Postulaciones</h3>
                            <hr/>
                            <table class="table table-responsive-sm table-hover border border-info">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Empresa</th>
                                        <th scope="col">Oferta</th>
                                        <th scope="col">Cargo</th>
                                        <th scope="col">Fecha Postulación</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Enlace</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="post" items="${post}">
                                        <tr>
                                            <td>${post.NombreEmpresa}</td>
                                            <td>${post.NombreOferta}</td>
                                            <td>${post.TipoCargo}</td>
                                            <td>${post.FechaPostulacion}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${post.EstadoPostulacion == false}">
                                                        <p class="text-danger">
                                                            Finalizada
                                                        </p>
                                                    </c:when>
                                                    <c:when test="${post.EstadoPostulacion == true}">
                                                        <p class="text-success">
                                                            Activa
                                                        </p>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td><a href="ofertalaboral.htm?oferta=${post.OfertaID}">Ir a la oferta</a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table> 
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <jsp:include page="../footer.jsp" />
            </div>
        </div>
    </body>
</html>

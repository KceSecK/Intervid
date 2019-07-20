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

    session.setAttribute("rol", rol);
%>
<html>
    <head>
        <title>InterVid</title>
        <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="postulante/headerpostulante.jsp"/>
        <input type="text" name="room" id="room" />



        <c:choose>
            <c:when test="${sessionScope.rol == '[Postulante]'}">

                <div class="container">
                    <div class="container-fluid">
                        <div class="row mb-2 pt-2">
                            <div class="card col-lg-12 mt-5">
                                <div class="row mt-3">
                                    <div class="col-lg-6">
                                        <h3 class="text-intervid">${oferta[0].NombreOferta}</h3>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="text-right text-intervid">
                                            Finaliza: ${oferta[0].FechaFinalizacionOferta}
                                        </div>
                                    </div>
                                </div>
                                <div class="font-weight-bold text-dark p-22">
                                    ${oferta[0].NombreEmpresa}
                                </div>
                                <div class="p-14 text-secondary">
                                    ${oferta[0].ComunaNombre}, ${oferta[0].regionNombre}
                                </div>

                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-3">
                                <div class="row">
                                    <div class="card col-lg-12 mb-2 pt-2">
                                        <h5 class="text-intervid">Duración</h5>
                                        <h5 class="text-intervid">Tiempo</h5>
                                        <button class="btn btn-primary mb-2">Iniciar Entrevista</button>
                                    </div>
                                    <div class="card col-lg-12 pt-2 d-block">
                                        <video id="localVideo" autoplay playsinline></video>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 d-block">
                                <div class="card pt-2">
                                    <video id="remoteVideo" autoplay playsinline></video>
                                </div>
                            </div>
                            <div class="card col-lg-3 pt-2">
                                <h5 class="text-intervid">Instrucciones</h5>
                                asdfasdfasdfasdfasdf
                            </div>
                        </div>
                    </div>

                </div>













            </c:when>
            <c:when test="${sessionScope.rol == '[Empresa]'}">
                <h1>empresa</h1>
                ${sessionScope.rol}
            </c:when>
            <c:otherwise>
                <h1>otro</h1>
            </c:otherwise>
        </c:choose>

        <jsp:include page="footer.jsp"/>
        <script src="js/videoLlamada.js" type="text/javascript"></script>
        <script src="js/adapter.js"></script>
    </body>
</html>

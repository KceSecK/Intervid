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
        <jsp:include page="head.jsp" flush="true"></jsp:include>
        <link href="css/toastr.css" rel="stylesheet" type="text/css"/>
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

        <div class="container div-principal static div-filtro">


            <div class="row">
                <div class="col-lg-12 mt-5">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-white">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Library</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Data</li>
                        </ol>
                    </nav>
                </div>

                <div id="filtro" class="col-lg-3 bg-light mt-2 mb-5">
                    <div class="justify-content-center mb-5">
                        <h3 class="text-intervid">Filtros</h3>
                        <div class="col-lg-12">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend2">
                                        <img src="icon/icons8_search_filled_20px.png" alt=""/>
                                    </span>
                                </div>
                                <input class="form-control" placeholder="Buscar por cargo, empresa, palabra clave"/>
                            </div>
                        </div>
                        <div class="col-lg-12 mt-2">
                            <a class="decoration-none justify-content-between text-intervid p-22" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                Región
                                <span class="p-16 badge badge-primary badge-pill float-right ">${reg[0].Total}</span>
                            </a>
                            <hr class="hr-custom-black"/>
                            <div class="collapse" id="collapseExample">
                                <div class="bg-white border d-block">
                                    <ul class="list-unstyled justify-content-end text-right p-2">
                                        <c:forEach var="li" items="${reg}">
                                            <a href="" class="d-block decoration-none mb-1"> 
                                                <li class=" d-flex justify-content-between align-items-center">
                                                    <span class="badge badge-primary badge-pill ">${li.Ofertas}</span>
                                                    ${li.RegionNombre}
                                                </li>
                                            </a>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!--ofertas laborales-->
                <div class="col-lg-9 mt-2">

                    <c:if test="${empty ofertas}">
                        <div class="col-lg-12 align-self-center">
                            <img class="justify-content-center mx-auto d-block" src="img/letra 10mm.png" alt=""/>
                            <h5 class="text-intervid mt-2 text-center">
                                Lo sentimos, no existen coincidencias para tu busqueda.
                            </h5>
                        </div>
                    </c:if>
                    <c:forEach var="ol" items="${ofertas}">
                        <div class="row mb-4">
                            <div class="col-lg-12">
                                <a class="d-block a-lab" href="">
                                    <div class="container border rounded border-primary">
                                        <div class="row bg-">
                                            <div class="col-lg-10 mt-2 rounded">
                                                <h3 class="text-intervid">${ol.NombreOferta}</h3>
                                                <hr class="hr-custom-black" />
                                            </div>
                                            <div class="col-lg-2 mt-2 text-dark">
                                                ${ol.FechaPublicacionOferta}
                                            </div>
                                        </div>
                                        <div class="row pb-3 pl-3 pr-3">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-9">
                                                        <div class="row font-weight-bold text-dark p-22">
                                                            ${ol.NombreEmpresa}
                                                        </div>
                                                        <div class="row p-14 text-secondary">
                                                            ${ol.ComunaNombre}, ${ol.regionNombre}
                                                        </div>
                                                        <div id="dcargo" class="row mt-3 text-truncate text-dark">
                                                            ${ol.DescripcionCargo}
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="row">
                                                            <figure class="d-none d-md-block figure img-thumbnail mx-auto">
                                                                <img src="${ol.LogoEmpresa}" class="figure-img img-fluid rounded max-img " alt="...">
                                                            </figure>
                                                        </div>
                                                        <div class="row">
                                                            <p class="text-right text-dark p-16">
                                                                <img src="img/checkmark_32px.png" alt=""/>
                                                                Entrevista en Diferido
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                </div>

            </div>

        </div>

    </body>
    <jsp:include page="footer.jsp" ></jsp:include>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script src="js/toastr.min.js" type="text/javascript"></script>

<script>
    $.ajax({        
                method: "POST",
                dataType: "json",
                url: "obtenerNotificacionPostulante.htm",
                success: function (data) {
              
        console.log(data);
                        if (!data[0].NotificacionLink===null) {
     toastr.success('<a style="display:d-inline" href="'+data[0].NotificacionLink+'">Tienes una video llamada</a>','Notificación',{
  "progressBar": true,
  "positionClass": "toast-bottom-right",
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut" 
   });
}

 
                    
                }
            });
    
 
 
</script>
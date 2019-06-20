<%-- 
    Document   : trabajos
    Created on : 19-06-2019, 13:09:12
    Author     : sdasd
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intervid - trabajos</title>
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/validaremail.js" type="text/javascript"></script>
        <script src="js/validarletra.js" type="text/javascript"></script>
        <script src="js/validarnumeros.js" type="text/javascript"></script>
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
                                <li class="nav-item">

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container div-principal static div-filtro">
            <div class="row">
                <div id="filtro" class="col-lg-3 bg-light mt-5 justify-content-center position-static">
                    <div class="col-lg-12 bg-intervid">
                        <h3 class="text-white">Filtros</h3>
                    </div>
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
                    <div class="col-lg-12">
                        <ul class="list-unstyled">
                            <li>asdf</li>
                            <li>asdf</li>
                        </ul>
                    </div>
                    <div class="justify-content-center mb-5">
                        <h3 class="text-intervid">Filtros</h3>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Casdf
                                <span class="badge badge-primary badge-pill ">14</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Dapibus ac facilisis in
                                <span class="badge badge-primary badge-pill">2</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Morbi leo risus
                                <span class="badge badge-primary badge-pill">1</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--ofertas laborales-->
                <div class="col-lg-9 mt-5">
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
                                            <div class="col-lg-2 mt-2">
                                                ${ol.FechaPublicacionOferta}
                                            </div>
                                        </div>
                                        <div class="row pb-3 pl-3 pr-3">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-9">
                                                        <div class="row font-weight-bold p-22">
                                                            ${ol.NombreEmpresa}
                                                        </div>
                                                        <div class="row p-14">
                                                            ${ol.ComunaNombre}, ${ol.regionNombre}
                                                        </div>
                                                        <div id="dcargo" class="row mt-3 text-truncate">
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

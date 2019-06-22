<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>InterVid</title>
    </head>
    <%
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        String rol = auth.getAuthorities().toString();
        System.out.println("rol: " + rol);


    %>

    <body>

        <div class="container-fluid home">
            <!-- Navbar-->
            <div class="navbar navbar-expand-sm black">
                <div class="container-fluid">
                    <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link alink border-link" href="#">Precios</a>
                            </li>
                        </ul>
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
            </div>

            <div class="container">
                <div class="row mt-3"></div>
                <div class="row">
                    <div class="col-lg-12 mt-5" >
                        <img class="inner img-fluid" src="img/letra 20mm_render.png" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-white font-weight-bold text-center p-22">El único portal de entrevistas por video</p>
                    </div>
                </div>
                <form method="POST">
                    <div class="row justify-content-md-center mt-5">
                        <div class="col-lg-6">
                            <div class="input-group m-2">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend2">
                                        <img src="icon/icons8_search_filled_20px.png" alt=""/>
                                    </span>
                                </div>
                                <input id="buscar" name="buscar" type="text" class="form-control" placeholder="Buscar por cargo, empresa, palabra clave" required/>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="input-group m-2">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend2">
                                        <img src="icon/icons8_marker_22px.png" alt=""/>
                                    </span>
                                </div>
                                <select id="region" name="region" class="custom-select">
                                    <option value="" selected disabled hidden>Región</option>
                                    <c:forEach var="re" items="${reg}">
                                        <option value="${re.RegionID}">${re.RegionNombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2 m-2 text-right">
                            <button class="btn btn-success font-weight-bold">Buscar Empleos</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="container mt-5">
            <div class="row text-center">
                <div class="col-lg-12 mb-5">
                    <h1 class="text-dark">¿Cómo funciona?</h1>
                </div>
            </div>
            <div class="row justify-content-md-center pb-5">
                <div class="col-lg-4 text-justify">
                    <img class="inner mb-4 scale" src="img/morning-news-scrolling.jpg" alt=""/>
                    <p>
                        Encuentra tu empleo ideal, postula, espera la notificación para poder realizar
                        tu entrevista vía online y exprésate lo mejor que puedas para poder conseguir el empleo seleccionado.
                    </p>
                </div>
                <div class="col-lg-4 text-justify">
                    <img class="inner mb-4 scale" src="img/checking-information.jpg" alt=""/>
                    <p>
                        Ahorra tiempo y dinero gracias a las miles de ofertas laborales que ofrecen entrevistas vía online en INTERVID,
                        podrás encontrar ofertas de las mejores empresas, se el primero en postularte!.
                    </p>
                </div>
                <div class="col-lg-4 text-justify">
                    <img class="inner mb-4 scale" src="img/ive-made-a-small-fortune.jpg" alt=""/>
                    <p>
                        Complementa tu curriculum con un video de presentación, donde podrás expresar tus habilidades 
                        de una manera rápida y sencilla, así promocionarte al mercado laboral que estás buscando.
                    </p>
                </div>
            </div>
        </div>
        <hr class="hr-custom-black"/>

        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-6 container-fluid">
                    <div class="row">
                        <div class="col-lg-12 mb-5 text-left">
                            <h1 class="text-dark">Fácil uso</h1>
                        </div>
                    </div>
                    <div class="col-lg-12 mb-3">
                        Regístrate, busca el empleo que más se adapte a tus necesidades y capacidades,
                        revisa el estado de tu postulación, en el caso de que la empresa te seleccione para pasar a la siguiente etapa
                        se agendará una entrevista la cual será realizada según el medio seleccionado por la empresa, en el lamentable caso de que
                        no seas seleccionado se cambiará el estado de tu postulación a rechazada de este modo podrás continuar con la búsqueda del empleo que 
                        espera por ti.

                    </div>
                </div>
                <div class="col-lg-6 mb-5">


                    <img class="inner img-thumbnail" src="img/ideas-keep-coming.jpg" alt=""/>


                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

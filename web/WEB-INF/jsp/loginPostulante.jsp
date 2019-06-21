<%-- 
    Document   : loginPostulante
    Created on : abr 22, 2019, 5:26:46 p.m.
    Author     : Saitam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intervid - Login Postulantes</title>
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/validaremail.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="container-fluid loginEM">
            <div class="container"> 
                <div class="row">
                    <div class="col-lg-12 mt-5" >
                        <a href="index.htm">
                            <img class="inner img-fluid" src="img/letra 10mm_render.png" alt=""/>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid loginBody mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="container">
                            <div class="row mt-3">  </div>
                            <div class="row mt-3">  </div>



                            <div class="card mx-auto col-lg-6">
                                <p class="letraGrande text-intervid text-center">
                                    Ingresar como postulante a INTERVID
                                </p>

                                <div class="card-body ">
                                    <jsp:include page="login.jsp" ></jsp:include>
                                        <div class="form-group">
                                            <div class="container">
                                                <div class="row align-items-start">
                                                    <div class="col-lg-12">
                                                        <a href="">¿Olvidó su contraseña?</a> 
                                                    </div>         
                                                </div>
                                                <div class="row mt-4">  </div>
                                                <div class="row text-center">
                                                    <div class="col-lg-12 ">
                                                        <a href="registro.htm">¿No tienes cuenta? Registrate ahora</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

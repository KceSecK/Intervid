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
        <title>Intervid - Login Postulantes</title>
        <jsp:include page="head.jsp" flush="true"></jsp:include>
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
                        <div class="container mt-5">
                            <div class="row mt-3">  </div>
                            <div class="row mt-3">  </div>



                            <div class="card mx-auto col-lg-6">
                                <p class="letraGrande text-intervid text-center">
                                    Ingresar como postulante a INTERVID
                                </p>

                                <div class="card-body ">
                                    <jsp:include page="loginem.jsp" ></jsp:include>
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

<%-- 
    Document   : registro
    Created on : abr 20, 2019, 6:54:08 p.m.
    Author     : Saitam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Intervid - Registro de postulantes</title>
        <jsp:include page="head.jsp" flush="true"></jsp:include>
            <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        </head>
        <body>
            <!-- Navbar-->
            <div class="container-fluid nav-intervid">
                <div class="navbar navbar-expand-sm black">
                    <div class="container-fluid">
                        <!-- Logo -->
                        <a class="navbar-brand img-fluid" href="index.htm">
                            <img id="logo" src="img/letra 5mm.png" alt="InterVid">
                        </a>
                        <!--                    Toggle icon 
                                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                                <img src="img/Menu_32.png">
                                            </button>-->

                        <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="btn btn-primary" href="loginPostulante.htm" role="button">Ingresar</a>                            
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--Container central-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 bg-intervid">
                        <div class="container mt-5 pt-5 pb-5 mb-5">
                            <div class="row">
                                <div class="col-lg-12 mt-3 mb-3">
                                    <P class="text-white letraMedia"> Encuentra tu trabajo ideal desde tu hogar</p>
                                </div>
                                <div class="col-lg-12 mb-3">
                                    <img src="img/working_with_a_laptop_80px.png" class="inner">
                                </div>
                                <div class="col-lg-12 mt-3 mb-3">
                                    <p class="text-white letraMedia"> Realiza TODAS tus entrevistas de forma ONLINE</p>
                                </div>
                                <div class="col-lg-12 mt-3 mb-3">
                                    <p class="text-white letraMedia"> Más de 100.000 ofertas laborales te están esperando</p>
                                </div>
                                <div class="col-lg-12 mt-3">
                                    <img src="img/icons8-laptop-webcam-64.png" class="inner">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 mt-5 mb-5 p-5">
                    <c:choose>
                        <c:when test="${param.error == '1'}">        
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Esta cuenta ya existe, porfavor intente usar otra.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <p class="letraGrande text-intervid">
                        Crea tu cuenta y súmate al mundo de las video 
                        entrevistas  
                    </p>
                    <div class="container">
                        <form method="POST"> 
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Nombres</label>
                                    <input type="text" class="form-control" name="nombre"  onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Apellidos</label>
                                    <input type="text" class="form-control" name="apellido" onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <label class="text-intervid">Correo Electrónico</label>
                                    <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label class="text-intervid">Contraseña</label>                                    
                                    <span id="msg"></span>
                                    <input id="npass1" type="password" name="clave" minlength="6" maxlength="25" class="form-control" onkeyup="validatePassword(this.value);" onchange="validarPass();" required>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label class="text-intervid">Repetir Contraseña</label>
                                    <input id="npass2" type="password" name="npass2" minlength="6" maxlength="25" class="form-control" onkeyup="validarPass();" required>
                                </div>
                            </div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck" required>
                                <p>He leído y acepto los <a href="">Los términos y condiciones de Servicio</a> y la <a href="">
                                        Política de privacidad</a> de INTERVID</p>
                            </div>
                            <input id="ingresar" type="submit" value="Crear Cuenta" class="btn btn-success">
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

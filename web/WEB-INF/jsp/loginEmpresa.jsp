<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intervid - Login Empresas</title>
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
                    <div class="col-lg-12" >
                        <a href="index.htm">
                            <img class="inner img-fluid mt-5" src="img/letra 10mm_render.png" alt=""/>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p class="font-weight-bold text-center p-28 verdeEmpresaLogo" > Empresas</p>
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
                                    Ingreso Empresas
                                </p>

                                <div class="card-body ">
                                    <jsp:include page="login.jsp"></jsp:include>
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
                                                        <a href="registroEmpresa.htm">¿No tienes cuenta? Registrate ahora</a>
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

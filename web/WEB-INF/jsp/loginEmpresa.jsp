<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                                    <form action="<c:url value="/loginempresa" />" method="POST">
                                        <c:choose>
                                            <c:when test="${param.success == '1'}">        
                                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                    Cuenta creada con éxito!!!
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <c:if test="${param.error != null}">        
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                Correo o clave invalidos.
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </c:if>
                                        <div class="form-group">
                                            <div class="col-12">
                                                <label class="text-intervid">Correo</label>                                 
                                                <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-12">
                                                <label class="text-intervid">Contraseña</label>
                                                <input type="password" class="form-control" name="clave">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                                    <p>Mantenerme conectado</p>
                                                </div>


                                                <input type="submit" value="Ingresar" class="btn btn-success" style="width:100%">
                                            </div>
                                        </div>
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

                                    </form>  
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

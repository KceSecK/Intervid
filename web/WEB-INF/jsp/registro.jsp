<%-- 
    Document   : registro
    Created on : abr 20, 2019, 6:54:08 p.m.
    Author     : Saitam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <p class="letraGrande text-intervid">
                        Crea tu cuenta y súmate al mundo de las video 
                        entrevistas  
                    </p>
                    <div class="container">
                        <form method="POST"> 
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Nombres</label>
                                    <input type="text" class="form-control" name="nombre" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Apellidos</label>
                                    <input type="text" class="form-control" name="apellido" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="text-intervid">Correo Electronico: <e id="errorco"></e></label>
                                <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                            </div>
                            <div class="form-group">
                                <label class="text-intervid"> Contraseña:</label><input type="password" name="clave" class="form-control" required>
                            </div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                <p>He leído y acepto los <a href="">Los términos y condiciones de Servicio</a> y la <a href="">
                                        Política de privacidad</a> de INTERVID</p>
                            </div>
                            <input id="ingresar" type="submit" value="Crear Cuenta" class="btn btn-success">
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!--                 FOOTER                  --> 
        <div id="footer" class="container-fluid bg-black">
            <div class="container-fluid">
                <div class="row pt-4 ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Postulantes</h5>
                                <hr class="hr-custom-white" />
                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Reclutadores</h5>
                                <hr class="hr-custom-white" />

                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-1">
                                <h5 class="text-white">Empresas</h5>
                                <hr class="hr-custom-white" />
                                <a class="alink nav-link border-link pb-0" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-3 text-right">
                                <img class="mb-3" src="img/letra 5mm_render.png" alt=""/>
                                <div class="text-white p-12">INVID Ltda</div>
                                <div class="text-white p-12">Santiago, Chile</div>
                                <div class="text-white p-12"><a href="mailto:contacto@inter-vid.com">contacto@inter-vid.com</a></div>
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-lg-12">
                                <hr class="hr-custom-white"/>
                            </div>
                            <div class="col-lg-12">
                                <p class="text-white p-12">
                                    &copy; 2019 InterVid . Todos los derechos reservados.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

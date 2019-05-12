<%-- 
    Document   : registroEmpresa
    Created on : abr 21, 2019, 4:14:52 p.m.
    Author     : Saitam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <!--navbar-->
        <div class="container-fluid nav-intervid">
            <!-- Navbar-->
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
                    <div class="container pt-3 pb-5 mb-5">
                        <div class="row">
                            <div class="col-lg-12 mt-3 mb-3">
                                <P class="text-white letraMedia">Encuentra el canditato ideal para tu empresa</p>
                            </div>
                            <div class="col-lg-12 mb-3">
                                <img src="img/permanent_job_80px.png" class="inner img-fluid">
                            </div>
                            <div class="col-lg-12 mt-3 mb-3">
                                <p class="text-white letraMedia">Ahorra al realizar las entrevistas de forma ONLINE</p>
                            </div>
                            <div class="col-lg-12 mb-3">
                                <img src="img/money_box_80px.png" class="inner img-fluid">
                            </div>
                            <div class="col-lg-12 mt-3 mb-3">
                                <p class="text-white letraMedia">Más de 1.000.000 de CV's en nuestra base de datos</p>
                            </div>
                            <div class="col-lg-12 mt-3">
                                <img src="img/parse_resume_80px.png" class="inner img-fluid" style="width: 80px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 mt-5 mb-5 p-5">
                    <p class="letraGrande text-intervid">
                        Registro de Empresas 
                    </p>
                    <div class="container">
                        <form method="POST"> 
                            <div class="form-group">
                                <label class="text-intervid">Correo Electronico:</label>
                                <input type="mail"  name="correo" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="text-intervid"> Contraseña:</label><input type="password" name="clave" class="form-control">
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">RUT de la empresa</label>
                                    <input type="text" class="form-control" name="nomUsPos">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Razón Social</label>
                                    <input type="text" class="form-control" name="apeUsPos">
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Nombre de la empresa</label>
                                    <input type="text" class="form-control" name="nomUsPos">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Teléfono</label>
                                    <input type="text" class="form-control" name="apeUsPos">
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Nombre de contacto empresa</label>
                                    <input type="text" class="form-control" name="nomUsPos">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-intervid">Apellido contacto empresa</label>
                                    <input type="text" class="form-control" name="apeUsPos">
                                </div>
                            </div>

                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                <p>He leído y acepto los <a href="">Los términos y condiciones de Servicio</a> y la <a href="">
                                        Política de privacidad</a> de INTERVID</p>
                            </div>
                            <input type="submit" value="Crear Cuenta" class="btn btn-success">
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

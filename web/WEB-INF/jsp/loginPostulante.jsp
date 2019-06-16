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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container-fluid loginEM">
            <div class="navbar navbar-expand-sm black">
                <div class="container">
                    <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="alink nav-link border-link" href="productos.html">Empresas</a>
                            </li>
                            <li class="nav-item">
                                <p class="nav-link text-white font-weight-bold">|</p>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="btn btn-primary">Ingresar</button>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="container"> 

                <div class="row">
                    <div class="col-lg-12" >
                        <img class="inner img-fluid" src="img/letra 10mm_render.png" alt=""/>
                    </div>
                </div>
            </div>
        
        </div>
        
        <div class="container-fluid loginBody">
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
                                    <form action="" method="POST"> 
                                        
                                 <div class="form-group">
                                         <div class="col-12">
                                        <label class="text-intervid">Correo</label>
                                        <input type="text" class="form-control " name="correo">
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
                                                <div class="col">
                                            <a href="">¿Olvidó su contraseña?</a> 
                                  </div>         
                                      
                                                    </div>
                                            <div class="row mt-3"> </div>
                                            <div class="row align-items-end">
                                                <div class="col "></div>
                                                <div class="col ">
                                            <a href="registro.htm">¿No tienes cuenta? Registrate ahora</a>
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





        <!--                 FOOTER                  --> 
        <div id="footer" class="container-fluid bg-black">
            <div class="container-fluid">
                <div class="row pt-4 ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 mt-3">
                                <h5 class="text-white">Postulantes</h5>
                                <a class="alink nav-link border-link" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-3">
                                <h5 class="text-white">Reclutadores</h5>
                                <a class="alink nav-link border-link" href="contacto.php">Contáctanos</a>
                                <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                                <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                            </div>
                            <div class="col-lg-3 mt-3">
                                <h5 class="text-white">Empresas</h5>
                                <div class="nav-link"><a class="alink border-link text-decoration-none" href="">Contáctanos</a></div>
                                <div class="nav-link"><a class="alink border-link text-decoration-none" href="">Contáctanos</a></div>
                                <div class="nav-link"><a class="alink border-link text-decoration-none" href="">Contáctanos</a></div>
                            </div>
                            <div class="col-lg-3 mt-3 text-right">
                                <img class="mb-3" src="img/letra 5mm_render.png" alt=""/>
                                <div class="text-white p-12">INVID Ltda</div>
                                <div class="text-white p-12">Santiago, Chile</div>
                                <div class="text-white p-12"><a href="mailto:contacto@inter-vid.com">contacto@inter-vid.com</a></div>
                            </div>
                        </div>
                        <div class="row mt-5">
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

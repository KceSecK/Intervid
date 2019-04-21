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
    </head>
    <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
    <link href="css/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">


    <body>
        <!-- Navbar-->
        <nav class="navbar navbar-expand-sm colorbg sticky-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand img-fluid" href="index.htm">
                    <img id="logo" src="img/letra 5mm.png" alt="InterVid">
                </a>
                <!--             Toggle icon 
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                <img src="img/Menu_32.png">
                            </button>-->

                <div class="ml-5 collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="index.html">Inicio</a>
                        </li>

                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="productos.html">Productos e é</a>
                        </li>
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="nosotros.html">Sobre Nosotros</a>
                        </li>
                        <li class="nav-item">
                            <a class="alink nav-link border-link" href="contacto.php">Contáctanos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
       
        <div class="left">  
            
            <div class="container">
                <div class="row">
                    <div class="col">

                    </div>
                    <div class="col-5">
                        <p class="text-white letraMedia">Encuentra tu trabajo ideal desde tu hogar</p>
                    </div>
                    <div class="col">

                    </div>
                </div>

                <div class="row">
                    <div class="col">

                    </div>
                    <div class="col-5">
                        <img src="img/icons8-working-with-a-laptop-64.png" class="inner">
                    </div>
                    <div class="col">

                    </div>
                </div>

                <div class="row">
                    <div class="col">

                    </div>
                    <div class="col-5">
                        <p class="text-white letraMedia"> Realiza TODAS tus entrevistas de forma ONLINE</p>

                    </div>
                    <div class="col">

                    </div>
                </div>

                <div class="row">
                    <div class="col">

                    </div>
                    <div class="col-5">
                        <p class="text-white letraMedia"> Más de 100.000 ofertas laborales te están esperando</p>
                    </div>
                    <div class="col">

                    </div>
                </div>

                <div class="row">
                    <div class="col">

                    </div>
                    <div class="col-5">
                        <img src="img/icons8-laptop-webcam-64.png" class="inner">
                    </div>
                    <div class="col">

                    </div>
                </div>
            </div>
            
        </div>


        <!--              Registro Usuario postulante-->
        <div class="right">
            <div class="">
                <div>
                    <p class="letraGrande text-intervid">
                        Crea tu cuenta y súmate al mundo de las video 
                        entrevistas  
                    </p>

                    <form method="POST"> 
                        <div class="form-row">
                         <div class="form-group col-md-6">
      <label class="text-intervid">Nombres</label>
      <input type="text" class="form-control" name="nomUsPos">
    </div>
    <div class="form-group col-md-6">
      <label class="text-intervid">Apellidos</label>
      <input type="text" class="form-control" name="apeUsPos">
    </div>
                            </div>
                        <div class="form-group">
                            <label class="text-intervid">Correo Electronico:</label><input type="mail"  name="correo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="text-intervid"> Contraseña:</label><input type="password" name="clave" class="form-control">
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
</body>
</html>

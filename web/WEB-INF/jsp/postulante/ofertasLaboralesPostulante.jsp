<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
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
                    <h3>Filtrar</h3>
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

        <div class="container-fluid" >
            <div class="row">
                <div class="col-lg-1  "></div>
                <!--FILTROS-->
                <div class="col-lg-3">
                    <div class="row mt-2"></div>
                    <!--CUERPO FILTROS--> 
                    <div class="card rounded-top">
                        <div class="card-title headerCardTitle rounded-top" style="padding-left: 8px" ><h4 style="color: white"><img src="img/icons8-filter-96.png" height="20px"> Filtros</h1></div>
                                <div class="card-body">
                                    <div class="container-fluid" >

                                        <!--TEXTO BUSCADOR-->
                                        <div class="row input-icons"> <i class="fas fa-search"></i> <input type="text" class="form-control input-field " name="bsq"></div>
                                        <div class="row mt-3"></div>
                                        <!--FECHA PUBLICACIÓN-->
                                        <div class="row" >Fecha Publicación</div>
                                        <hr>
                                        <div class="container">
                                            <div class="row">
                                                <a href="">Hoy (12032)</a>
                                            </div>
                                            <div class="row">
                                                <a href="">Ayer (42032)</a>
                                            </div>
                                        </div>
                                        <div class="row mt-3"></div>

                                        <!--REGIÓN-->
                                        <div class="row" >Región</div>
                                        <hr>
                                        <div class="container">
                                            <div class="row">
                                                <a href="">Región Metropolitana</a>
                                            </div>
                                            <div class="row">
                                                <a href="">Región I</a>
                                            </div>
                                            <div class="row">
                                                <a href="">...</a>
                                            </div>
                                        </div>
                                        <div class="row mt-3"></div>

                                        <!--TIPO EMPLEO-->
                                        <div class="row">Tipo Empleo</div>
                                        <hr>
                                        <div class="container">
                                            <div class="row">
                                                <a href="">Full-Time</a>
                                            </div>
                                            <div class="row">
                                                <a href="">Part-Time</a>
                                            </div>
                                        </div>
                                        <div class="row mt-3"></div>

                                        <!--CARGAR MÁS FILTROS-->
                                        <div class="row" >Cargar más Filtros</div>

                                    </div>
                                </div>
                        </div>

                    </div>
                    <!--OFERTAS-->   
                    <div class="col-lg-7"> 
                        <div class="row mt-2"></div>

                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <!--LADO IZQUIERDO-->
                                        <div class="col-lg-6">
                                            <div class="row"><h4>Programador Analista</h4></div>
                                            <div class="row"><p>Chanchitos S.A</p> <img src="img/icons8-star-filled-48.png" class="iconStar"><img src="img/icons8-star-filled-48.png" class="iconStar">
                                                <img src="img/icons8-star-filled-48.png" class="iconStar"><img src="img/icons8-star-half-48.png" class="iconStar"></div>
                                            <div class="row"><p class="greyTxt">Las Condes, Región Metropolitana</p></div>
                                            <div class="row"><p>$ 1.000.000 - $ 1.500.000 al mes</p></div>

                                        </div>
                                        <!--LADO DERECHO-->
                                        <div class="col-lg-6" >
                                            <div class="float-right">
                                                <div class="row" ><p class="greyTxt ">Hace 2 Horas</p></div>
                                                <div class="row mt-3" ></div>
                                                <div class="row" ><img src="img/invid.png" class="rounded-circle border border-primary"></div>
                                                <div class="row" ><img src="img/icons8-ok-48.png" class="iconStar"><h5>Entrevista en diferido</h5></div>

                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-1 height100"></div>              
            </div> 
        </div>

        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>

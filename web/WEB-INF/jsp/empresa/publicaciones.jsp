<%-- 
    Document   : publicaciones
    Created on : 21-06-2019, 0:28:04
    Author     : sdasd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Intervid - Publicaciones</title> 
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
            <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
        </head>
        <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>

            <!--Container principal-->
            <div class="container-fluid div-principal">
                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 col-md-3 bg-intervid intervid-fixed-nav d-none d-lg-block">
                        <div class="container">
                            <ul class="list-unstyled static mt-4 ">
                                <li>
                                    <a class="alink nav-link border-link" href="#datospersonales">En Proceso</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#datoscontacto">Pendientes</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#datoscontacto">Cerradas</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#datoscontacto">Archivadas</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#educacion">Candidatos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-10 mb-5 mt-4">
                        <div class="container">

                            <div id="publicaciones">
                                <h3 class="text-intervid">Mis Publicaciones</h3>
                                <hr/>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <table class="table rounded border border-info">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">Ofertas Publicadas</th>
                                                    <th class="text-right" scope="col">4</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="text-center p-5">
                                                    <td class="text-intervid p-22">
                                                        <p>1</p>
                                                        <p>En Proceso</p>
                                                    </td>
                                                    <td class="text-intervid p-22">
                                                        <p>2</p>
                                                        <p>Cerradas</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </div>
                                    <div class="col-lg-6">
                                        <table class="table table-responsive-sm rounded border border-info">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">Candidatos</th>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                    <th class="text-right" scope="col">150</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="text-center p-5"> 
                                                    <td class="text-intervid p-20">
                                                        <p>30</p>
                                                        <p>Pendientes</p>
                                                    </td>
                                                    <td class="text-intervid p-20">
                                                        <p>30</p>
                                                        <p>Pre-seleccionados</p>
                                                    </td>
                                                    <td class="text-intervid p-20">
                                                        <p>30</p>
                                                        <p>Descartados</p>
                                                    </td>
                                                    <td class="text-intervid p-20">
                                                        <p>30</p>
                                                        <p>Archivados</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </div>
                                </div>
                            </div>

                            <div id="proceso" class="mb-5">
                                <h3 class="text-intervid">En Proceso</h3>
                                <hr/>
                                <table class="table table-responsive-sm table-hover border border-info">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                    <label class="custom-control-label" for="customCheck1"></label>
                                                </div>
                                            </th>
                                            <th scope="col">Oferta</th>
                                            <th scope="col">Cargo</th>
                                            <th scope="col">Fecha Publicación</th>
                                            <th scope="col">Fecha Término</th>
                                            <th scope="col">Enlace</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="custom2">
                                                    <label class="custom-control-label" for="custom2"></label>
                                                </div>
                                            </td>
                                            <td>Oferta</td>
                                            <td>Jefe de Planta</td>
                                            <td>30-03-2018</td>
                                            <td>09-07-2018</td>
                                            <td><a href="">Ir a la oferta</a></td>
                                            <td>
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn">
                                                        <img src="img/play_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/pause_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/edit_24px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/delete_sign_24px.png" alt=""/>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="custom3">
                                                    <label class="custom-control-label" for="custom3"></label>
                                                </div>
                                            </td>
                                            <td>Oferta</td>
                                            <td>Jefe de Planta</td>
                                            <td>30-03-2018</td>
                                            <td>09-07-2018</td>
                                            <td><a href="">Ir a la oferta</a></td>
                                            <td>
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn">
                                                        <img src="img/play_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/pause_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/edit_24px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/delete_sign_24px.png" alt=""/>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="custom1">
                                                    <label class="custom-control-label" for="custom1"></label>
                                                </div>
                                            </td>
                                            <td>Oferta</td>
                                            <td>Jefe de Planta</td>
                                            <td>30-03-2018</td>
                                            <td>09-07-2018</td>
                                            <td><a href="">Ir a la oferta</a></td>
                                            <td>
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn">
                                                        <img src="img/play_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/pause_40px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/edit_24px.png" alt=""/>
                                                    </button>
                                                    <button type="button" class="btn">
                                                        <img src="img/delete_sign_24px.png" alt=""/>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table> 
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                <jsp:include page="../footer.jsp" ></jsp:include>
            </div>
        </div>   
    </body>
</html>

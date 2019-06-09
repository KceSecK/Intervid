 
<%-- 
    Document   : cvPostulante
    Created on : abr 22, 2019, 6:19:48 p.m.
    Author     : Saitam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script src="jquery.ui.datepicker-es.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
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



        <div class="container-fluid">
            <div class="row flex-xl-nowrap">
                <!--Lado Derecho-->
                <div class="col-12 col-md-3 col-xl-2 height100 perfil">
                    <div class="container ">
                        
                        <a class="alink nav-link border-link pb-0" href="#datosPersonales">Datos Personales</a>
                        <a class="alink nav-link border-link pb-0" href="#datosContacto">Datos de Contacto</a>
                        <a class="alink nav-link border-link pb-0" href="#educacion">Educación</a>
                        <a class="alink nav-link border-link pb-0" href="#expectativasLaborales">Expectativas Laborales</a>
                        <a class="alink nav-link border-link pb-0" href="#experienciaProfesional">Experiencia Profesional</a>
                        <a class="alink nav-link border-link pb-0" href="#idiomas">Idiomas</a>
                        <a class="alink nav-link border-link pb-0" href="#otrosConocimientos">Otros Conocimientos</a>
                        
                    </div>
                </div>
                
                
                <!--Lado Izquierdo-->

                <div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 ">

                    <div class="container ">

                        <!--Primer cuadro-->
                        <div class="row mt-2"><p class="letraMediaPerfil">Mi CV</p></div>
                        <div class="row">
                        <div class="card col-md-12">
                            <div class="card-body ">
                                 <div class="container ">
                                    <div class="row">
                                <div class="col-md-4">
                                Estado cv <img src="img/100.png" class="rounded-circle" height="70px" width="70px"> 
                                </div>
                                <div class="col-md-4">
                                  Foto perfil  <img src="img/icons8-person-64.png" class="rounded-circle" height="70px" width="70px"> 
                                </div>
                                <div class="col-md-4">
                                  Video pitch  <img src="img/icons8-circled-play-64.png" class="rounded-circle" height="70px" width="70px"> 
                                </div>
                                
                            </div>
                            </div>
                            </div>
                            </div>
                        </div>
                            
                       <div class="row mt-2" id="datosPersonales"><p class="letraMediaPerfil">Datos de Personales</p></div>
                        <div id="DPersonales" class="row">
                            <div class="col-lg-9 div-border">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="EditarPersonales" type="button" class="btn btn-link btn-right">Editar</button>
                                        <table id="s">
                                            <tr>
                                                <td class="pr-5 text-intervid">Nombre(s):</td>
                                                <td>${lista[0].NombreUsuario}</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Apellido(s)</td>
                                                <td>${lista[0].ApellidoUsuario}</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Género:</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Nacionalidad</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Tipo de identificación</td>
                                                <td>data</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Fecha de nacimiento:</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Estado civil</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Licencia de conducir</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Vehículo propio</td>
                                                <td>data</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-5 text-intervid">Discapacidad</td>
                                                <td>data</td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                       


                        <!--Segundo cuadro-->
                        <div class="row mt-2" id="datosPersonales"><p class="letraMediaPerfil">Datos Personales</p></div>
                    <div class="row">

                        <div class="card col-md-9">
                            <div class="card-body ">

                                <div class="col-lg-9">
                                    <div class="container">


                                        <form method="POST" id="form"> 
                                            <input type="hidden" value="${lista[0].UsuarioID}" name="UsuarioID">
                                            
                                            <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                            
                                            <div class="form-group ">
                                                <label class="col-form-label text-intervid">Nombre(s):</label>
                                                <input type="text" value="${lista[0].NombreUsuario}"  name="nombre" class="form-control">

                                            </div>
                                            <div class="form-group">
                                                <label class="text-intervid">Apellido(s):</label>
                                                <input type="text" value="${lista[0].ApellidoUsuario}" name="apellido" class="form-control">
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label class="text-intervid">Género:</label>
                                                    
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="genero" id="Genero" value="Masculino"
                                                               ${lista[0].Genero == 'Masculino' ? 'checked' : '' }>
                                                        <label class="form-check-label" >Masculino</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="genero" id="Genero" value="Femenino"
                                                               ${lista[0].Genero == 'Femenino' ? 'checked' : '' }>
                                                        <label class="form-check-label">Femenino</label>
                                                    </div>
                                                  
                                                </div>
                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Nacionalidad</label>
                                                <select name="nacionalidad" class="form-control">
                                                    <c:forEach var="p" items="${pais}">                                                        
                                                        <option ${lista[0].Nacionalidad == p.PaisNombre ? 'selected' : '' } value="${p.PaisNombre}">${p.PaisNombre}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Tipo de Identificación</label>
                                                <div class="col-md-3"></div>
                                                <div class="form-group col-md-6">

                                                    <select name="documento" class="form-control">
                                                        <option  ${lista[0].Documento == 'CI' ? 'selected' : '' } value="CI">Cédula de identidad</option>
                                                        <option  ${lista[0].Documento == 'CE' ? 'selected' : '' } value="CE">Cédula de extranjeria</option>
                                                        <option  ${lista[0].Documento == 'PA' ? 'selected' : '' } value="PA">Pasaporte</option>
                                                        <option  ${lista[0].Documento == 'IFE' ? 'selected' : '' } value="IFE">Credencial para votar</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <input type="text" name="numDocumento" value="${lista[0].NumDocumento}" class="form-control">
                                                </div>

                                            </div>

                                            <div class="form-row">

                                                <label class="text-intervid">Fecha de nacimiento</label>
                                                <div class="col-md-6"></div>

                                                <input  type="date" value="${lista[0].FechaNacimiento}" class="form-control"
                                                       name="fechaNacimiento" >
                                            </div>

                                            <div class="form-row ">
                                                <label class="col-form-label text-intervid">Estado Civil:</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-md-8">
                                                    <select name="estadoCivil" class="form-control ">
                                                        <option ${lista[0].EstadoCivil == 'so' ? 'selected' : '' } value="so">Soltero/a</option>
                                                        <option ${lista[0].EstadoCivil == 'ca' ? 'selected' : '' } value="ca">Casado/a</option>
                                                        <option ${lista[0].EstadoCivil == 'vi' ? 'selected' : '' } value="vi">Viudo/a</option>
                                                        <option ${lista[0].EstadoCivil == 'di' ? 'selected' : '' } value="di">Divorciado/a</option>
                                                        <option ${lista[0].EstadoCivil == 'co' ? 'selected' : '' } value="co">Conviviente civil</option>
                                                    </select>
                                                </div>
                                                <div class="form-check col-md-4">

                                                    <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                        Mostrar en CV
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-row">
                                                <!--licencias a--> 
                                                <label class="col-form-label text-intervid">Licencia de Conducir:</label>
                                                <div class="col-md-6"></div>
                                                <div class="form-group col-lg-12">


                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="LicenciaTipoA1" value="1" 
                                                                ${lista[0].LicenciaTipoA1 == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox1">A1</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="LicenciaTipoA2"  value="1" 
                                                                ${lista[0].LicenciaTipoA2  == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">A2</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="LicenciaTipoA3"   value="1"  
                                                                ${lista[0].LicenciaTipoA3  == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">A3</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" name="LicenciaTipoA4" value="1"   
                                                                ${lista[0].LicenciaTipoA4  == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">A4</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"   name="LicenciaTipoA5" value="1"  
                                                                ${lista[0].LicenciaTipoA5  == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">A5</label>
                                                    </div>
                                                </div>
                                                <!--licencias b-->
                                                <div class="form-group col-lg-12">



                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"  name="LicenciaTipoB" value="1" 
                                                               ${lista[0].LicenciaTipoB == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox1">B</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"   name="LicenciaTipoC" value="1" 
                                                                ${lista[0].LicenciaTipoC == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">C</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"  name="LicenciaTipoD" value="1" 
                                                                ${lista[0].LicenciaTipoD == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">D</label>
                                                    </div>
 
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"  name="LicenciaTipoE"  value="1" 
                                                                ${lista[0].LicenciaTipoE == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">E</label>
                                                    </div>

                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox"   name="LicenciaTipoF" value="1"  
                                                                ${lista[0].LicenciaTipoF == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">F</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        
                                                        <input class="form-check-input" type="checkbox" name="NoLicencia" value="1" 
                                                                ${lista[0].NoLicencia == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" for="inlineCheckbox2">No tengo</label>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-row">
                                                <div class="form-group">
                                                    <label class="text-intervid">Vehículo propio:</label>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="vehiculoUsuario" id="vehiculo" value="1"  
                                                               ${lista[0].VehiculoUsuario == 'true' ? 'checked' : '' }>
                                                        <label class="form-check-label" >Si</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="vehiculoUsuario" id="vehiculo" value="0" 
                                                               ${lista[0].VehiculoUsuario == 'false' ? 'checked' : '' }>
                                                        <label class="form-check-label" >No</label>
                                                    </div>
                                                </div>
                                            </div>


                                                        <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck" value="1" name="discapacidadUsuario"
                                                                            ${lista[0].DiscapacidadUsuario == 'true' ? 'checked' : '' }>
                                                <label class="form-check-label" >Poseeo algún tipo de discapacidad</label>
                                            </div>
                                                <input type="submit" value="Editar" class="btn btn-success"> 
                                            <button type="button"  class="btn btn-primary">Cancelar</button>
                                        </form>
                                                
                                    </div>
                                </div>


                            </div>
                            </div>
                        </div> 

                        <!--Tercer cuadro-->
                        <div class="row mt-2" id="datosContacto"><p class="letraMediaPerfil">Datos de Contacto</p></div>
    <div class="row">
                        <div class="card col-md-9 ">
                            <div class="card-body ">
                                
                                <form method="POST"> 
                                    <div class="form-row">

                                        <label class="text-intervid">País de residencia</label>
                                        <select name="" class="form-control">
                                            <c:forEach var="p" items="${pais}">                                                        
                                               <option ${region[0].RegionPaisFK == p.PaisID ? 'selected' : '' } value="${p.PaisID}">${p.PaisNombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Región/Estado</label>
                                        <select name="" class="form-control">
                                            <c:forEach var="r" items="${region}">                                                        
                                               <option ${comuna[0].ComunaRegionFK == r.RegionID ? 'selected' : '' } value="${r.RegionID}">${r.RegionNombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Comuna/Municipio</label>
                                        <select name="" class="form-control">
                                               <c:forEach var="c" items="${comuna}">                                                        
                                               <option ${lista[0].ComunaResidencia == c.ComunaID ? 'selected' : '' } value="${c.ComunaID}">${c.ComunaNombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-row ">
                                        <label class="col-form-label text-intervid">Dirección:</label>

                                        <input type="text"  name="direccion" class="form-control"
                                                value="${lista[0].DireccionResidencia}">
                                    </div>

                                    <div class="form-row ">
                                        <label class="col-form-label text-intervid">Correo electrónico:</label>

                                        <input type="email"  name="correo" class="form-control"
                                               value="${lista[0].CorreoUsuario}">
                                    </div>


                                    <div class="form-row">
                                        <label class="text-intervid">Télefono</label>
                                        <div class="col-md-6"></div>
                                        <div class="form-row col-md-6">

                                            <select name="tipoTel" class="form-control">
                                                <option value="fijo">Fijo</option>
                                                <option value="movil">Movil</option>
                                            </select>
                                        </div>
                                        <div class="form-row col-md-6">
                                            <input type="text" name="telefono" class="form-control"
                                                   value="${lista[0].NumeroTelefonico}">
                                        </div>

                                    </div>
                                    <a href="">+Añadir otro télefono</a>
                                    <div class="col-md-6"></div>
                                    <input type="submit" value="Ingresar" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
                                </form>
                            </div>

                        </div> 
                        </div> 


                        <!--Cuerto cuadro-->
                        <div class="row mt-2" id="educacion"><p class="letraMediaPerfil">Educación</p></div>
    <div class="row">
                        <div class="card col-md-9 ">
                            <div class="card-body ">
                                <div class="form-group ">
                                    <label class="col-form-label text-intervid">Institución:</label>
                                    <input type="text"  name="text" class="form-control"
                                           value="${lista[0].Institucion}">
                                </div>

                                <div class="form-row">

                                    <label class="text-intervid">Nivel de estudios:</label>
                                    <select name="estudios" class="form-control">
                                        <option ${lista[0].NivelEstudio == 'basico' ? 'selected' : '' } value="basico">Básico</option>
                                        <option ${lista[0].NivelEstudio == 'medio' ? 'selected' : '' } value="medio">Medio</option>
                                        <option ${lista[0].NivelEstudio == 'superior' ? 'selected' : '' } value="superior">Superior</option>
                                    </select>
                                </div>
                                <div class="form-row">

                                    <label class="text-intervid">Estado:</label>
                                    <select name="" class="form-control">
                                        <option ${lista[0].EstadoEstudio == 'en curso' ? 'selected' : '' } value="en curso">En Curso</option>
                                        <option ${lista[0].EstadoEstudio == 'graduado' ? 'selected' : '' } value="graduado">Graduado</option>
                                        <option ${lista[0].EstadoEstudio == 'abandonado' ? 'selected' : '' } value="abandonado">Abandonado</option>
                                    </select>
                                </div>

                                <div class="form-row">
                                    <label class="text-intervid">Período:</label>
                                    <div class="col-md-11"></div>
                                    <div class="form-group col-md-8">

                                        <input  class="form-control" type="text" name="daterange" value="${d.PeriodoInicio} ${d.PeriodoFin}" />
                                    </div>

                                    <div class="form-check col-md-4">

                                        <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck"
                                                                ${lista[0].PeriodoActual == 'true' ? 'checked' : '' }>
                                            A la actualidad
                                        </div>
                                    </div>


                                </div><input type="submit" value="Añadir" class="btn btn-success">  
                                <button type="button" class="btn btn-primary">Cancelar</button>
                            </div>

                        </div> 
                        </div> 

                        <!--Quinto cuadro-->
                        <div class="row mt-2" id="expectativasLaborales"><p class="letraMediaPerfil">Expectativas Laborales</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">

                                    <div class="form-group ">
                                        <label class="col-form-label text-intervid">Expectativas de renta:</label>
                                        <input type="text"  name="text" class="form-control"
                                               value="${lista[0].ExpectativaRenta}">
                                    </div>
                                    <div class="form-row">

                                        <label class="text-intervid">Moneda:</label>
                                        <select name="moneda" class="form-control">
                                            <option ${lista[0].TipoMoneda == 'clp' ? 'selected' : '' } value="clp">Chilena</option>
                                            <option ${lista[0].TipoMoneda == 'mxp' ? 'selected' : '' } value="mxp">Mexicana</option>
                                            <option ${lista[0].TipoMoneda == 'usd' ? 'selected' : '' } value="usd">Dolar</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Region/Estado preferente para trabajar:</label>
                                        <select name="" class="form-control">
                                            <option selected>Cosa</option>
                                        </select>
                                    </div>

                                    <div class="form-row">

                                        <label class="text-intervid">Jornada:</label>
                                        <select name="" class="form-control">
                                            <option ${lista[0].JornadaPreferente == 'ft' ? 'selected' : '' } value="ft">Full-Time</option>
                                            <option ${lista[0].JornadaPreferente == 'pt' ? 'selected' : '' } value="pt">Part-Time</option>
                                        </select>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="text-intervid">Disponibilidad para viajar:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="disponibilidadViajar"value="true"
                                                       ${lista[0].DisponibilidadViaje == 'true' ? 'checked' : '' }>
                                                <label class="form-check-label" >Si</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="disponibilidadViajar" value="false"
                                                       ${lista[0].DisponibilidadViaje == 'false' ? 'checked' : '' }>
                                                <label class="form-check-label" >No</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <label class="text-intervid">Disponibilidad para cambiar de residencia:</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cambioResicencia"  value="true">
                                                <label class="form-check-label" 
                                                       ${lista[0].CambioResidencia == 'true' ? 'checked' : '' }>Si</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cambioResicencia" value="false"
                                                       ${lista[0].CambioResidencia == 'false' ? 'checked' : '' }>
                                                <label class="form-check-label" >No</label>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
                                </div>

                            </div>
                        </div> 

                        <!--Sexto cuadro-->
                        <div class="row mt-2" id="experienciaProfesional"><p class="letraMediaPerfil">Experiencia Profesional</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">

                                    <div class="form-group ">
                                        <label class="col-form-label text-intervid">Empresa:</label>
                                        <input type="text"  name="empresa" class="form-control"
                                               ${d.EmpresaExperiencia}>
                                    </div>
                                    <div class="form-group">

                                        <label class="text-intervid">Área:</label>
                                        <select name="" class="form-control">
                                            <option selected>Categorias</option>
                                        </select>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-form-label text-intervid">Cargo:</label>
                                        <input type="text"  name="cargo" class="form-control"
                                               ${lista[0].CargoDesempeñado}>
                                    </div>

                                    <div class="form-group">
                                        <label class="text-intervid">Período: </label>
                                        <div class="col-md-11"></div>

                                        <input  class="form-control" type="text" name="daterange2" 
                                                value="${lista[0].InicioPeriodo} ${d.FinPeriodo}" />
                                    </div>

                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
                                </div>  

                            </div>
                        </div> 

                        <!--Septimo cuadro-->
                        <div class="row mt-2" id="idiomas"><p class="letraMediaPerfil">Idiomas</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">
                                    <div class="form-row ">
                                        <label class="col-form-label text-intervid">Idioma:</label>
                                        <div class="col-md-6"></div>
                                        <div class="form-group col-md-8">
                                            <select name="idioma" class="form-control ">
                                                <option selected>Español</option>
                                            </select>
                                        </div>
                                        <div class="form-check col-md-4">

                                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                Nativo
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <label class="text-intervid">Escrito:</label>
                                        <select name="escrito" class="form-control">
                                            <option ${lista[0].NivelEscrito == 'bajo' ? 'selected' : '' } value="bajo">Bajo</option>
                                            <option ${lista[0].NivelEscrito == 'medio' ? 'selected' : '' } value="medio">Medio</option>
                                            <option ${lista[0].NivelEscrito == 'alto' ? 'selected' : '' }  value="alto">Alto</option>
                                            <option ${lista[0].NivelEscrito == 'nativo' ? 'selected' : '' } value="nativo">Nativo</option>
                                        </select>
                                    </div>

                                    <div class="form-group">

                                        <label class="text-intervid">Hablado:</label>
                                        <select name="hablado" class="form-control">
                                            <option ${lista[0].NivelHablado == 'bajo' ? 'selected' : '' } value="bajo">Bajo</option>
                                            <option ${lista[0].NivelHablado == 'medio' ? 'selected' : '' } value="medio">Medio</option>
                                            <option ${lista[0].NivelHablado == 'alto' ? 'selected' : '' } value="alto">Alto</option>
                                            <option ${lista[0].NivelHablado == 'nativo' ? 'selected' : '' } value="nativo">Nativo</option>
                                        </select>
                                    </div>

                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>

                                </div>
                            </div>
                        </div> 

                        <!--Segundo cuadro-->
                        <div class="row mt-2" id="otrosConocimientos"><p class="letraMediaPerfil">Otros Conocimientos</p></div>
                        <div class="row">
                            <div class="card col-md-9 ">
                                <div class="card-body ">
                                    <div class="form-group ">

                                        <label class="col-form-label text-intervid">Conocimientos o habilidades:</label>
                                        <input type="text"  name="correo" class="form-control"
                                               value="${lista[0].Conocimiento}">
                                    </div>
                                    <input type="submit" value="Añadir" class="btn btn-success">  
                                    <button type="button" class="btn btn-primary">Cancelar</button>
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


<script>
 
    
     
        $("#form").on('submit', function() {
       
            if($('input[type="checkbox"]').val() !== null) {
                $('input[type="checkbox"]').val(1);
                console.log("WAAA");
            } else {
                $('input[type="checkbox"]').val(0)
                console.log("weee");;
            }
        })
    
    
//    $(function () {
//        $('input[name="daterange"]').daterangepicker({
//            opens: 'left'
//        }, function (start, end, label) {
//            console.log("A new date selection was made: " + start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));
//        });
//    });
//     $(function () {
//        $('input[name="daterange2"]').daterangepicker({
//            opens: 'left'
//        }, function (start, end, label) {
//            console.log("A new date selection was made: " + start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));
//        });
//    });  
    
//$.datepicker.setDefaults($.datepicker.regional["es"]);
//$("#datepicker").datepicker({
//firstDay: 1
//});
//$("#datepicker").click(function () {
//$("#datepicker").datepicker("setDate", "-117y");
//});
</script>


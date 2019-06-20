 
<%-- 
    Document   : cvPostulante
    Created on : abr 22, 2019, 6:19:48 p.m.
    Author     : Saitam
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/htm, charset=utf-8_spanish_ci" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Intervid - Curriculum de usuario</title> 
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validarRUT.js"></script>
        <script src="js/datosPostulante.js"></script>
    </head>


    <body>

        <!-- Navbar-->
        <div id="nav-fixed" class="container-fluid nav-intervid static">
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
                                <a class="btn btn-primary nav-link" href="loginPostulante.htm" role="button">Ingresar</a>                            
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>



        <!--Container principal-->
        <div class="container-fluid div-principal">
            <div class="row">
                <!--Nav lateral-->
                <div class="col-lg-2 col-md-3 bg-intervid intervid-fixed-nav">
                    <div class="container">
                        <ul class="list-unstyled static ">
                            <li>
                                <a class="alink nav-link border-link" href="#datospersonales">Datos Personales</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#datoscontacto">Datos de Contacto</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#educacion">Educaci�n</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#expectativaslaborales">Expectativas Laborales</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#experienciaprofesional">Experiencia Profesional</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#idiomas">Idiomas</a>
                            </li>
                            <li>
                                <a class="alink nav-link border-link" href="#otrosconocimientos">Otros Conocimientos</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-10 col-md-9 mb-5">
                    <div class="container">
                        <!--Primer cuadro-->
                        <div class="row mt-4"><p class="letraMediaPerfil">Mi CV</p></div>
                        <div class="row">
                            <div class="card col-md-12">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <p class="text-intervid">Estado CV</p>
                                        </div>
                                        <div class="col-lg-2">
                                            <img class="rounded-circle perfil-usuario" src="img/letra 100mm.png" alt=""/>
                                        </div>
                                        <div class="col-lg-2">
                                            <p class="text-intervid">Foto Perfil</p>
                                        </div>
                                        <div class="col-lg-2">
                                            <img class="rounded-circle perfil-usuario" src="img/letra 100mm.png" alt=""/>
                                        </div>
                                        <div class="col-lg-2">
                                            <p class="text-intervid">Video Pitch</p>
                                        </div>
                                        <div class="col-lg-2">
                                            <img class="rounded-circle perfil-usuario" src="img/letra 100mm.png" alt=""/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Vista datos personales-->
                        <div id="datospersonales">
                            <div class="row mt-4"><p class="letraMediaPerfil">Datos Personales</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <button id="EditarPersonales" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dpersonales">
                                                Editar
                                            </button>
                                            <table class="table table-sm table-hover">
                                                <tr>
                                                    <td class="pr-5 text-intervid">Nombre(s):</td>
                                                    <td>${lista[0].NombreUsuario}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Apellido(s)</td>
                                                    <td>${lista[0].ApellidoUsuario}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">G�nero:</td>
                                                    <td>${lista[0].Genero}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Nacionalidad</td>
                                                    <td>${lista[0].Nacionalidad}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Documento</td>
                                                    <td><c:if test="${lista[0].Documento == 'CI'}">Cedula Identidad</c:if>
                                                        <c:if test="${lista[0].Documento == 'CE'}">Cedula Identidad</c:if>
                                                        <c:if test="${lista[0].Documento == 'PA'}">Cedula Identidad</c:if>
                                                        - ${lista[0].NumDocumento} </td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Fecha de nacimiento:</td>
                                                    <td>${lista[0].FechaNacimiento}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Estado civil</td>
                                                    <td>
                                                        <c:if test="${lista[0].EstadoCivil == 'so'}">Soltero/a</c:if>
                                                        <c:if test="${lista[0].EstadoCivil == 'ca'}">Casado/a</c:if>
                                                        <c:if test="${lista[0].EstadoCivil == 'vi'}">Viudo/a</c:if>
                                                        <c:if test="${lista[0].EstadoCivil == 'di'}">Divorciado/a</c:if>
                                                        <c:if test="${lista[0].EstadoCivil == 'co'}">Conviviente civil</c:if>      
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="dpersonales" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title text-intervid" id="">Datos Personales</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="container">
                                                    <form method="POST" id="form"> 
                                                        <input type="hidden" value="${lista[0].UsuarioID}" name="UsuarioID">
                                                    <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                    <input type="hidden" value="1" name="Cuadro">

                                                    <div class="form-group ">
                                                        <label class="text-intervid">Nombre(s):</label>
                                                        <input type="text" value="${lista[0].NombreUsuario}"  name="nombre" class="form-control">
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="text-intervid">Apellido(s):</label>
                                                        <input type="text" value="${lista[0].ApellidoUsuario}" name="apellido" class="form-control">
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group">
                                                            <label class="text-intervid">G�nero:</label>
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
                                                        <div class="form-group">
                                                            <label class="text-intervid">Nacionalidad</label>
                                                            <select name="nacionalidad" class="form-control">
                                                                <c:forEach var="p" items="${pais}">                                                        
                                                                    <option ${lista[0].Nacionalidad == p.PaisNombre ? 'selected' : '' } value="${p.PaisNombre}">${p.PaisNombre}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="col-lg-12">
                                                            <label class="text-intervid">Tipo de Identificaci�n</label>
                                                        </div>
                                                        <div class="form-group col-lg-4">
                                                            <select name="documento" class="form-control col">
                                                                <option  ${lista[0].Documento == 'CI' ? 'selected' : '' } value="CI">C�dula de identidad</option>
                                                                <option  ${lista[0].Documento == 'CE' ? 'selected' : '' } value="CE">C�dula de extranjeria</option>
                                                                <option  ${lista[0].Documento == 'PA' ? 'selected' : '' } value="PA">Pasaporte</option>

                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-8">
                                                            <input type="text" name="numDocumento" oninput="checkRut(this)" maxlength="10" value="${lista[0].NumDocumento}" class="form-control col">
                                                        </div>
                                                    </div>

                                                    <div class="form-row">
                                                        <label class="text-intervid">Fecha de nacimiento</label>
                                                        <input id="datefield" min="01-01-1990" max="01-01-2005" type="date" value="${lista[0].FechaNacimiento}" class="form-control"
                                                               name="fechaNacimiento" >
                                                    </div>

                                                    <div class="form-row ">
                                                        <label class="col-form-label text-intervid">Estado Civil:</label>
                                                        <div class="form-group col-md-8">
                                                            <select name="estadoCivil" class="form-control ">
                                                                <option ${lista[0].EstadoCivil == 'so' ? 'selected' : '' } value="so">Soltero/a</option>
                                                                <option ${lista[0].EstadoCivil == 'ca' ? 'selected' : '' } value="ca">Casado/a</option>
                                                                <option ${lista[0].EstadoCivil == 'vi' ? 'selected' : '' } value="vi">Viudo/a</option>
                                                                <option ${lista[0].EstadoCivil == 'di' ? 'selected' : '' } value="di">Divorciado/a</option>
                                                                <option ${lista[0].EstadoCivil == 'co' ? 'selected' : '' } value="co">Conviviente civil</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-check">
                                                            <div class="form-check"><input class="form-check-input" type="checkbox" id="gridCheck">
                                                                Mostrar en CV
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-row" >
                                                        <!--licencias a--> 
                                                        <label class="col-form-label text-intervid">Licencia de Conducir:</label>
                                                        <div class="col-md-6"></div>
                                                        <div class="form-group col-lg-12">


                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="a1" name="LicenciaTipoA1" value="1" 
                                                                       ${lista[0].LicenciaTipoA1 == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox1">A1</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="a2" name="LicenciaTipoA2"  value="1" 
                                                                       ${lista[0].LicenciaTipoA2  == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">A2</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="a3" name="LicenciaTipoA3"   value="1"  
                                                                       ${lista[0].LicenciaTipoA3  == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">A3</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="a4" name="LicenciaTipoA4" value="1"   
                                                                       ${lista[0].LicenciaTipoA4  == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">A4</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="a5"  name="LicenciaTipoA5" value="1"  
                                                                       ${lista[0].LicenciaTipoA5  == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">A5</label>
                                                            </div>
                                                        </div>
                                                        <!--licencias b-->
                                                        <div class="form-group col-lg-12">



                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="b" name="LicenciaTipoB" value="1" 
                                                                       ${lista[0].LicenciaTipoB == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox1">B</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="c"  name="LicenciaTipoC" value="1" 
                                                                       ${lista[0].LicenciaTipoC == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">C</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="d" name="LicenciaTipoD" value="1" 
                                                                       ${lista[0].LicenciaTipoD == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">D</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="e" name="LicenciaTipoE"  value="1" 
                                                                       ${lista[0].LicenciaTipoE == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">E</label>
                                                            </div>

                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input lic" type="checkbox" id="f"  name="LicenciaTipoF" value="1"  
                                                                       ${lista[0].LicenciaTipoF == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">F</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">

                                                                <input class="form-check-input" type="checkbox" id="NoLicencia" name="NoLicencia" value="1"
                                                                       ${lista[0].NoLicencia == 'true' ? 'checked' : '' }>
                                                                <label class="form-check-label" for="inlineCheckbox2">No tengo</label>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group">
                                                            <label class="text-intervid">Veh�culo propio:</label>
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
                                                        <label class="form-check-label" >Poseeo alg�n tipo de discapacidad</label>
                                                    </div>
                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Datos de contacto-->
                        <div id="datoscontacto">
                            <div class="row mt-4"><p class="letraMediaPerfil">Datos de Contacto</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dcontacto">
                                                Editar
                                            </button>
                                            <table class="table table-sm">
                                                <tr>
                                                    <td class="pr-5 text-intervid">Direcci�n</td>
                                                    <td>${lista[0].DireccionResidencia}, ${lista[0].ComunaNombre}, ${lista[0].RegionNombre}, ${lista[0].PaisNombre}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Correo Electr�nico</td>
                                                    <td>${lista[0].CorreoContacto}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">T�lefonos</td>
                                                    <td>
                                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dtelefono">
                                                            Agregar
                                                        </button>
                                                    </td>
                                                </tr>
                                                <c:forEach var="contacto" items="${num}">                                                    
                                                    <tr>
                                                        <td>
                                                            <div class="form-row">
                                                                <select name="ContactoTipo" id="contactoTipo"  class="form-control">
                                                                    <option ${contacto.ContactoTipo == "fijo" ? 'selected' : '' } value="fijo">Fijo</option>
                                                                    <option ${contacto.ContactoTipo == "movil" ? 'selected' : '' } value="movil">Movil</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-row col-lg-12">
                                                                <input type="hidden" id="idTel" value="${contacto.NumeroContactoID}">
                                                                <input type="text" id="NumeroTelefonico" name="NumeroTelefonico" class="form-control"
                                                                       value="${contacto.NumeroTelefonico}"/>
                                                            </div>
                                                        </td>
                                                        <td>

                                                            <a class="btn" id="editarTelefono">
                                                                <img src="img/edit_24px.png" alt=""/>
                                                            </a>
                                                            <a class="btn" href="borrarTelefono.htm?id=${contacto.NumeroContactoID}">
                                                                <img src="img/delete_sign_24px.png" alt=""/>
                                                            </a>
                                                        </td>
                                                    </tr> 

                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--modal editar datos de contacto-->
                            <div class="modal fade" id="dcontacto" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Datos de Contacto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <div class="form-row">
                                                        <input type="hidden" value="${lista[0].UsuarioID}" name="UsuarioID">
                                                        <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                        <input type="hidden" value="2" name="Cuadro">

                                                        <label class="text-intervid">Pa�s de residencia</label>
                                                        <select name="pais" id="pais" class="form-control">
                                                            <c:forEach var="p" items="${pais}">                                                        
                                                                <option ${lista[0].PaisID == p.PaisID ? 'selected' : '' } value="${p.PaisID}">${p.PaisNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Regi�n/Estado</label>
                                                        <select  class="form-control" id="region" name="region">
                                                            <c:forEach var="r" items="${region}">                                                        
                                                                <option ${lista[0].RegionID == r.RegionID ? 'selected' : '' } value="${r.RegionID}">${r.RegionNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Comuna/Municipio</label>
                                                        <select name="ComunaResidencia" id="comuna" class="form-control">
                                                            <c:forEach var="c" items="${comuna}">                                                        
                                                                <option ${lista[0].ComunaResidencia == c.ComunaID ? 'selected' : '' } value="${c.ComunaID}">${c.ComunaNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row ">
                                                        <label class="col-form-label text-intervid">Direcci�n:</label>

                                                        <input type="text"  name="DireccionResidencia" class="form-control"
                                                               value="${lista[0].DireccionResidencia}">
                                                    </div>

                                                    <div class="form-row mb-5 ">
                                                        <label class="col-form-label text-intervid">Correo electr�nico:</label>

                                                        <input type="email"  name="CorreoContacto" class="form-control"
                                                               value="${lista[0].CorreoContacto}">
                                                    </div>

                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Modal para Agregar telefonos-->

                        <div class="modal fade" id="dtelefono" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Agregar Telefono</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST">
                                                <div class="form-row">
                                                    <input type="hidden" value="${lista[0].UsuarioID}" name="UsuarioID">
                                                    <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                    <input type="hidden" value="3" name="Cuadro">

                                                    <label class="text-intervid">Tipo de Tel�fono</label>
                                                    <select name="contactoTipo" class="form-control">
                                                        <option value="fijo">Fijo</option>
                                                        <option value="movil">M�vil</option>
                                                    </select>
                                                </div>

                                                <div class="form-row ">
                                                    <label class="col-form-label text-intervid">Direcci�n:</label>

                                                    <input type="text" placeholder="9 4242 5644" name="NumeroTelefonico" class="form-control">
                                                </div>


                                                <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Datos de educacion-->
                    <div id="educacion">
                        <div class="row mt-4"><p class="letraMediaPerfil">Educaci�n</p></div>
                        <div class="row">
                            <div class="card col-md-12">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#deducacion">
                                            Agregar nueva instituci�n
                                        </button>
                                        <div class="table-responsive">

                                            <table class="table table-sm table-hover">
                                                <c:forEach var="nid" items="${edu}">
                                                    <tr>
                                                        <td class="text-intervid">Instituci�n</td>
                                                        <td>${nid.Institucion}</td>
                                                        <td class="text-intervid">Nivel de Estudio</td>
                                                        <td>${nid.NivelEstudio}</td>
                                                        <td class="text-intervid">Estado</td>
                                                        <td>${nid.EstadoEstudio == 'Abandonado' ? 'Abandonado': nid.EstadoEstudio == 'En curso' ? 'En curso': nid.EstadoEstudio == 'Graduado' ? 'Graduado':'No informado' }</td>
                                                        <td class="text-intervid">Perido</td>
                                                        <td>${nid.PeriodoInicio} - ${nid.PeriodoActual == '0' ? nid.PeriodoFin:'Actualidad'}</td>
                                                        <td>
                                                            <button class="btn btn-link edit_data" id="${nid.EducacionPostulanteID}">
                                                                <img src="img/edit_24px.png"/>
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <a class="btn" href="borrarEducacion.htm?id=${nid.EducacionPostulanteID}">
                                                                <img src="img/delete_sign_24px.png"/>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--modal agregar datos educacion-->
                        <div class="modal fade" id="deducacion" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Datos de Educaci�n</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST">
                                                <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                <input type="hidden" value="4" name="Cuadro">
                                                <div class="form-group ">
                                                    <label class="col-form-label text-intervid">Instituci�n:</label>
                                                    <input type="text"   name="Institucion" class="form-control"/>
                                                </div>

                                                <div class="form-row">

                                                    <label class="text-intervid">Nivel de estudios:</label>
                                                    <select name="NivelEstudio"  class="form-control">
                                                        <option  value="B�sico">B�sico</option>
                                                        <option  value="Medio" >Medio</option>
                                                        <option value="Superior">Superior</option>
                                                    </select>
                                                </div>
                                                <div class="form-row">

                                                    <label class="text-intervid">Estado:</label>
                                                    <select name="EstadoEstudio"  class="form-control">
                                                        <option  value="En curso">En Curso</option>
                                                        <option value="Graduado">Graduado</option>
                                                        <option value="Abandonado">Abandonado</option>
                                                    </select>
                                                </div>

                                                <div class="form-row">
                                                    <label class="text-intervid">Per�odo:</label>
                                                    <div class="col-md-11"></div>
                                                    <div class="form-group col-md-8">

                                                        <input  class="form-control" type="date"  name="PeriodoInicio"  />
                                                        <input  class="form-control" id="perFin" type="date"  name="PeriodoFin"  />
                                                    </div>

                                                    <div class="form-check col-md-4">

                                                        <div class="form-check">
                                                            <input class="form-check-input" id="actualidadEstudio" type="checkbox" name="PeriodoActual" value="1" >
                                                            A la actualidad
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--modal editar datos educacion-->
                        <div class="modal fade" id="dediteducacion" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Datos de Educaci�n</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST">
                                                <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                <input type="hidden" id="id_educacion" name="id_educacion">
                                                <input type="hidden" value="5" name="Cuadro">
                                                <div class="form-group ">
                                                    <label class="col-form-label text-intervid">Instituci�n:</label>
                                                    <input type="text" id="institucion"  name="Institucion" class="form-control"/>
                                                </div>

                                                <div class="form-row">

                                                    <label class="text-intervid">Nivel de estudios:</label>
                                                    <select name="NivelEstudio" id="estudios" class="form-control">
                                                        <option  value="B�sico">B�sico</option>
                                                        <option  value="Medio" >Medio</option>
                                                        <option value="Superior">Superior</option>
                                                    </select>
                                                </div>
                                                <div class="form-row">

                                                    <label class="text-intervid">Estado:</label>
                                                    <select id="estadoEstudio" name="EstadoEstudio"  class="form-control">
                                                        <option  value="En curso">En Curso</option>
                                                        <option value="Graduado">Graduado</option>
                                                        <option value="Abandonado">Abandonado</option>
                                                    </select>
                                                </div>

                                                <div class="form-row">
                                                    <label class="text-intervid">Per�odo:</label>
                                                    <div class="col-md-11"></div>
                                                    <div class="form-group col-md-8">

                                                        <input id="periodoInicio" class="form-control" type="date"  name="PeriodoInicio"  />
                                                        <input  class="form-control"id="perFinEdit" type="date"  name="PeriodoFin"  />
                                                    </div>

                                                    <div class="form-check col-md-4">

                                                        <div class="form-check">
                                                            <input class="form-check-input" id="actualidadEstudioEdit" type="checkbox"  name="PeriodoActual" value="1">
                                                            A la actualidad
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!--Datos de expectativas laborales-->
                    <div id="expectativaslaborales">
                        <div class="row mt-4"><p class="letraMediaPerfil">Expectativas Laborales</p></div>
                        <div class="row">
                            <div class="card col-md-12">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dexplaboral">
                                            Editar
                                        </button>
                                        <div class="table-responsive">

                                            <table class="table table-hover">
                                                <tr>
                                                    <td class="text-intervid">Regi�n de preferencia</td>
                                                    <td>
                                                        <c:forEach var="reg" items="${region}">
                                                            ${reg.RegionID == lista[0].RegionPreferente ? reg.RegionNombre : ""}
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-intervid">Expectativas de renta</td>
                                                    <td>${lista[0].TipoMoneda} - $ ${lista[0].ExpectativaRenta}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-intervid">Jornada preferente</td>
                                                    <td>${lista[0].JornadaPreferente == 'ft'?'Full-Time':''}
                                                        ${lista[0].JornadaPreferente == 'pt'?'Part-Time':''}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--editar datos Expectativa Laboral-->
                        <div class="modal fade" id="dexplaboral" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Expectativas Laborales</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST">
                                                <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                <input type="hidden" value="6" name="Cuadro">
                                                <div class="form-group ">
                                                    <label class="col-form-label text-intervid">Expectativas de renta:</label>
                                                    <input type="text"  name="ExpectativaRenta" class="form-control"
                                                           value="${lista[0].ExpectativaRenta}">
                                                </div>
                                                <div class="form-row">

                                                    <label class="text-intervid">Moneda:</label>
                                                    <select name="TipoMoneda" class="form-control">
                                                        <option ${lista[0].TipoMoneda == 'CLP' ? 'selected' : '' } value="CLP">Pesos Chilenos</option>
                                                        <option ${lista[0].TipoMoneda == 'MXN' ? 'selected' : '' } value="MXN">Pesos Mexicanos</option>
                                                        <option ${lista[0].TipoMoneda == 'USD' ? 'selected' : '' } value="USD">D�lar</option>
                                                    </select>
                                                </div>

                                                <div class="form-row">

                                                    <label class="text-intervid">Region/Estado preferente para trabajar:</label>
                                                    <select name="RegionPreferente" class="form-control">
                                                        <c:forEach var="r" items="${region}">
                                                            <option ${lista[0].RegionPreferente == r.RegionID ? 'selected':''}
                                                                value="${r.RegionID}">${r.RegionNombre}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="form-row">

                                                    <label class="text-intervid">Jornada:</label>
                                                    <select name="JornadaPreferente" class="form-control">
                                                        <option ${lista[0].JornadaPreferente == 'ft' ? 'selected' : '' } value="ft">Full-Time</option>
                                                        <option ${lista[0].JornadaPreferente == 'pt' ? 'selected' : '' } value="pt">Part-Time</option>
                                                    </select>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group">
                                                        <label class="text-intervid">Disponibilidad para viajar:</label>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="DisponibilidadViaje"value="1"
                                                                   ${lista[0].DisponibilidadViaje == 'true' ? 'checked' : '' }>
                                                            <label class="form-check-label" >Si</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="DisponibilidadViaje" value="0"
                                                                   ${lista[0].DisponibilidadViaje == 'false' ? 'checked' : '' }>
                                                            <label class="form-check-label" >No</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group">
                                                        <label class="text-intervid">Disponibilidad para cambiar de residencia:</label>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" 
                                                                   ${lista[0].CambioResidencia == 'true' ? 'checked' : '' } type="radio" name="CambioResidencia"  value="1">
                                                            <label class="form-check-label" >Si</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="CambioResidencia" value="0"
                                                                   ${lista[0].CambioResidencia == 'false' ? 'checked' : '' }>
                                                            <label class="form-check-label" >No</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!--Datos de experiencia profesional-->
                    <div id="experienciaprofesional">
                        <div class="row mt-4"><p class="letraMediaPerfil">Experiencia Profesional</p></div>
                        <div class="row">
                            <div class="card col-md-12">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dexpro">
                                            Editar
                                        </button>




                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--editar datos-->
                        <div class="modal fade" id="dexpro" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Experiencia Profesional</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST">










                                            </form>
                                            <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                            <input type="submit" value="Editar" class="btn btn-success btn-right">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>





                    <!--Datos de idiomas -->
                    <div id="idiomas">
                        <div class="row mt-4"><p class="letraMediaPerfil">Idiomas</p></div>
                        <div class="row">
                            <div class="card col-md-12">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#">
                                            Editar
                                        </button>




                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Datos de otros conocimientos -->
                    <div id="otrosconocimientos">
                        <div class="row mt-4"><p class="letraMediaPerfil">Otros Conocimientos</p></div>
                        <div class="row">
                            <div class="card col-md-12 mb-5">
                                <div class="card-body">
                                    <div class="container">
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#">
                                            Editar
                                        </button>




                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>






                </div>
                <!--div de cerrado container-->
            </div>
            <!--Termino div central-->
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
                        <a class="alink nav-link border-link pb-0" href="contacto.php">Cont�ctanos</a>
                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                    </div>
                    <div class="col-lg-3 mt-1">
                        <h5 class="text-white">Reclutadores</h5>
                        <hr class="hr-custom-white" />

                        <a class="alink nav-link border-link pb-0" href="contacto.php">Cont�ctanos</a>
                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                        <a class="alink nav-link border-link pb-0" href="nosotros.html">Sobre Nosotros</a>
                    </div>
                    <div class="col-lg-3 mt-1">
                        <h5 class="text-white">Empresas</h5>
                        <hr class="hr-custom-white" />
                        <a class="alink nav-link border-link pb-0" href="contacto.php">Cont�ctanos</a>
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


    $(window).on("load", function () {
        $('#actualidadEstudioEdit').on('change', function ()
        {
            if ($(this).is(':checked'))
            {
                $("#perFinEdit").prop("disabled", true);

            } else {
                $("#perFinEdit").prop("disabled", false);
            }
        });
    });
    $(window).on("load", function () {
        $('#actualidadEstudio').on('change', function ()
        {
            if ($(this).is(':checked'))
            {
                $("#perFin").prop("disabled", true);

            } else {
                $("#perFin").prop("disabled", false);
            }
        });
    });



    //$("#form").on('submit', function () {
    //
    //        if ($('input[type="checkbox"]').val() !== null) {
    //            $('input[type="checkbox"]').val(1);
    //            console.log("WAAA");
    //        } else {
    //            $('input[type="checkbox"]').val(0)
    //            console.log("weee");
    //            ;
    //        }
    //    })

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
<script type="text/javascript" src="js/datelimiter.js"></script>
<script src="js/scrolling.js" type="text/javascript"></script>

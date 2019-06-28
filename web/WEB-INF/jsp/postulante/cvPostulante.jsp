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
        <title>Intervid - Curriculum de usuario</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Intervid - Curriculum de usuario</title> 
        <link rel="shortcut icon" type="image/x-icon" href="icon/inter2-favicon.ico" />
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css" charset="utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validarrut.js"></script>
        <script src="js/datosPostulante.js"></script>
        <script src="js/validarnumeros.js" type="text/javascript"></script>
        <script src="js/validaremail.js" type="text/javascript"></script>
    </head>

    <body>
        <jsp:include page="headerpostulante.jsp"></jsp:include>

            <!--Container principal-->
            <div class="container-fluid div-principal">
                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 col-md-3 bg-intervid intervid-fixed-nav">
                        <div class="container mt-4">
                            <ul class="list-unstyled static ">
                                <li>
                                    <a class="alink nav-link border-link" href="#datospersonales">Datos Personales</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#datoscontacto">Datos de Contacto</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#educacion">Educación</a>
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
                                                    <td class="pr-5 text-intervid">Género:</td>
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
                                                        <label class="text-intervid">Nombre(s):<red>*</red></label>
                                                        <input type="text" value="${lista[0].NombreUsuario}" required  name="nombre" class="form-control" 
                                                               onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)"
                                                               >
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="text-intervid">Apellido(s):<red>*</red></label>
                                                        <input type="text" value="${lista[0].ApellidoUsuario}"  required name="apellido" class="form-control"
                                                               onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)">
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group">
                                                            <label class="text-intervid">Género :<red>*</red></label>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="genero" id="Genero" value="Masculino"
                                                                       ${lista[0].Genero == 'Masculino' ? 'checked' : '' } required>
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
                                                            <label class="text-intervid">Nacionalidad <red>*</red></label>
                                                            <select name="nacionalidad" class="form-control" required>
                                                                <c:forEach var="p" items="${pais}">                                                        
                                                                    <option ${lista[0].Nacionalidad == p.PaisNombre ? 'selected' : '' } value="${p.PaisNombre}">${p.PaisNombre}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="col-lg-12">
                                                            <label class="text-intervid">Tipo de Identificación <red>*</red></label>
                                                        </div>
                                                        <div class="form-group col-lg-4">
                                                            <select name="documento" class="form-control col" required>
                                                                <option  ${lista[0].Documento == 'CI' ? 'selected' : '' } value="CI">Cédula de identidad</option>
                                                                <option  ${lista[0].Documento == 'CE' ? 'selected' : '' } value="CE">Cédula de extranjeria</option>
                                                                <option  ${lista[0].Documento == 'PA' ? 'selected' : '' } value="PA">Pasaporte</option>

                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-8">
                                                            <input type="text" name="numDocumento" maxlength="10" value="${lista[0].NumDocumento}" class="form-control col"
                                                                   oninput="checkRut(this)" required>
                                                        </div>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Fecha de nacimiento <red>*</red></label>
                                                        <input id="datefield" min="01-01-1990" max="01-01-2005" type="date" value="${lista[0].FechaNacimiento}" class="form-control"
                                                               name="fechaNacimiento" required>
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
                                                    <td class="pr-5 text-intervid">Dirección</td>
                                                    <td>${lista[0].DireccionResidencia}, ${lista[0].ComunaNombre}, ${lista[0].RegionNombre}, ${lista[0].PaisNombre}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Correo Electrónico</td>
                                                    <td>${lista[0].CorreoContacto}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pr-5 text-intervid">Télefonos</td>
                                                    <td>
                                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dtelefono">
                                                            Agregar
                                                        </button>
                                                    </td>
                                                </tr>
                                                <table class="table table-sm table-hover">
                                                    <c:forEach var="contacto" items="${num}">                                                    
                                                        <tr>
                                                            <td class="text-intervid">Tipo:</td>
                                                            <td >${contacto.ContactoTipo == "fijo" ? 'Fijo' : '' }
                                                                ${contacto.ContactoTipo == "movil" ? 'Móvil' : '' }
                                                            </td>
                                                            <td class="text-intervid">Número: </td>
                                                            <td>${contacto.NumeroTelefonico}</td>
                                                            <td>

                                                                <button class="btn btn-link edit_data_tel" id="${contacto.NumeroContactoID}">
                                                                    <img src="img/edit_24px.png" alt=""/>
                                                                </button>
                                                                <a class="btn" href="borrarTelefono.htm?id=${contacto.NumeroContactoID}">
                                                                    <img src="img/delete_sign_24px.png" alt=""/>
                                                                </a>
                                                            </td>
                                                        </tr> 

                                                    </c:forEach>
                                                </table>
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

                                                        <label class="text-intervid">País de residencia <red>*</red></label>
                                                        <select name="pais" id="pais" class="form-control" required>
                                                            <c:forEach var="p" items="${pais}">                                                        
                                                                <option ${lista[0].PaisID == p.PaisID ? 'selected' : '' } value="${p.PaisID}">${p.PaisNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Región/Estado <red>*</red></label>
                                                        <select  class="form-control" id="region" name="region" required>
                                                            <c:forEach var="r" items="${region}">                                                        
                                                                <option ${lista[0].RegionID == r.RegionID ? 'selected' : '' } value="${r.RegionID}">${r.RegionNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Comuna/Municipio <red>*</red></label>
                                                        <select name="ComunaResidencia" id="comuna" class="form-control" required>
                                                            <c:forEach var="c" items="${comuna}">                                                        
                                                                <option ${lista[0].ComunaResidencia == c.ComunaID ? 'selected' : '' } value="${c.ComunaID}">${c.ComunaNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row ">
                                                        <label class="col-form-label text-intervid">Dirección: <red>*</red></label>

                                                        <input type="text"  name="DireccionResidencia" class="form-control" required
                                                               value="${lista[0].DireccionResidencia}">
                                                    </div>

                                                    <div class="form-row">
                                                        <label class="col-form-label text-intervid">Correo electrónico:</label>

                                                        <input type="email"  name="CorreoContacto" class="form-control"
                                                               value="${lista[0].CorreoContacto}" onKeyUp="validarEmail(this.form.correo.value);">
                                                    </div>
                                                    <div class="mt-3">
                                                        <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                        <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                                    </div>
                                                </form>
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
                                            <h5 class="modal-title text-intervid">Agregar Teléfono</h5>
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

                                                        <label class="text-intervid">Tipo de Teléfono <red>*</red></label>
                                                        <select name="contactoTipo" class="form-control" required>
                                                            <option value="fijo">Fijo</option>
                                                            <option value="movil">Móvil</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row ">
                                                        <label class="col-form-label text-intervid">Número: <red>*</red></label>

                                                        <input type="text" placeholder="Ej: 9 4242 5644" name="NumeroTelefonico" 
                                                               required maxlength="11" minlength="9" class="form-control" onKeyPress="return SoloNumeros(event);" onkeydown="return SoloNumeros(event);" required>
                                                    </div>
                                                    <div class="mt-3">
                                                        <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                        <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Modal editar numero de telefono-->
                            <div class="modal fade" id="dedittelefono" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Agregar Teléfono</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <div class="form-row">
                                                        <input type="hidden"  id="id_telefono" name="id_telefono">
                                                        <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                        <input type="hidden" value="8" name="Cuadro">

                                                        <label class="text-intervid">Tipo de Teléfono <red>*</red></label>
                                                        <select name="contactoTipo" id="contactoTipo" class="form-control" required>
                                                            <option value="fijo">Fijo</option>
                                                            <option value="movil">Móvil</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row ">
                                                        <label class="col-form-label text-intervid">Número: <red>*</red></label>

                                                        <input type="text" id="NumeroTelefonico" placeholder="Ej: 9 4242 5644" name="NumeroTelefonico" 
                                                               required maxlength="11" minlength="9" class="form-control" onKeyPress="return SoloNumeros(event);" onkeydown="return SoloNumeros(event);" required>
                                                    </div>
                                                    <div class="mt-3">
                                                        <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                        <input type="submit" value="Editar" class="btn btn-success btn-right"> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--Datos de educacion-->
                        <div id="educacion">
                            <div class="row mt-4"><p class="letraMediaPerfil">Educación</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#deducacion">
                                                Agregar nueva institución
                                            </button>
                                            <div class="table-responsive">

                                                <table class="table table-sm table-hover">
                                                    <c:forEach var="nid" items="${edu}">
                                                        <tr>
                                                            <td class="text-intervid">Institución</td>
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
                                            <h5 class="modal-title text-intervid">Datos de Educación</h5>
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
                                                        <label class="col-form-label text-intervid">Institución: <red>*</red></label>
                                                        <input type="text"   name="Institucion" class="form-control" required/>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Nivel de estudios: <red>*</red></label>
                                                        <select name="NivelEstudio"  class="form-control" required>
                                                            <option  value="Basico">Básico</option>
                                                            <option  value="Medio" >Medio</option>
                                                            <option value="Superior">Superior</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-row">

                                                        <label class="text-intervid">Estado: <red>*</red></label>
                                                        <select name="EstadoEstudio"  class="form-control" required>
                                                            <option  value="En curso">En Curso</option>
                                                            <option value="Graduado">Graduado</option>
                                                            <option value="Abandonado">Abandonado</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">
                                                        <label class="text-intervid">Período: <red>*</red></label>
                                                        <div class="col-md-11"></div>
                                                        <div class="form-group col-md-8">

                                                            <input  class="form-control" type="date"  name="PeriodoInicio"  required/>
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
                                            <h5 class="modal-title text-intervid">Datos de Educación</h5>
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
                                                        <label class="col-form-label text-intervid">Institución: <red>*</red></label>
                                                        <input type="text" id="institucion"  name="Institucion" 
                                                               required class="form-control"/>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Nivel de estudios: <red>*</red></label>
                                                        <select name="NivelEstudio" id="estudios" class="form-control" required>
                                                            <option  value="Basico">Básico</option>
                                                            <option  value="Medio" >Medio</option>
                                                            <option value="Superior">Superior</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-row">

                                                        <label class="text-intervid">Estado: <red>*</red></label>
                                                        <select id="estadoEstudio" name="EstadoEstudio"  class="form-control" required>
                                                            <option  value="En curso">En Curso</option>
                                                            <option value="Graduado">Graduado</option>
                                                            <option value="Abandonado">Abandonado</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">
                                                        <label class="text-intervid">Período: <red>*</red></label>
                                                        <div class="col-md-11"></div>
                                                        <div class="form-group col-md-8">

                                                            <input id="periodoInicio" class="form-control" type="date"  name="PeriodoInicio" required />
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
                                                        <td class="text-intervid">Región de preferencia</td>
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
                                                        <label class="col-form-label text-intervid">Expectativas de renta: <red>*</red></label>
                                                        <input type="text"  name="ExpectativaRenta" class="form-control"
                                                               value="${lista[0].ExpectativaRenta}" required onKeyPress="return SoloNumeros(event);" onkeydown="return SoloNumeros(event);" >
                                                    </div>
                                                    <div class="form-row">

                                                        <label class="text-intervid">Moneda: <red>*</red></label>
                                                        <select name="TipoMoneda" class="form-control" required>
                                                            <option ${lista[0].TipoMoneda == 'CLP' ? 'selected' : '' } value="CLP">Pesos Chilenos</option>
                                                            <option ${lista[0].TipoMoneda == 'MXN' ? 'selected' : '' } value="MXN">Pesos Mexicanos</option>
                                                            <option ${lista[0].TipoMoneda == 'USD' ? 'selected' : '' } value="USD">Dólar</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Region/Estado preferente para trabajar: <red>*</red></label>
                                                        <select name="RegionPreferente" class="form-control" required>
                                                            <c:forEach var="r" items="${region}">
                                                                <option ${lista[0].RegionPreferente == r.RegionID ? 'selected':''}
                                                                    value="${r.RegionID}">${r.RegionNombre}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Jornada: <red>*</red></label>
                                                        <select name="JornadaPreferente" class="form-control" required>
                                                            <option ${lista[0].JornadaPreferente == 'ft' ? 'selected' : '' } value="ft">Full-Time</option>
                                                            <option ${lista[0].JornadaPreferente == 'pt' ? 'selected' : '' } value="pt">Part-Time</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group">
                                                            <label class="text-intervid">Disponibilidad para viajar: <red>*</red></label>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="DisponibilidadViaje"value="1"
                                                                       ${lista[0].DisponibilidadViaje == 'true' ? 'checked' : '' } required>
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
                                                            <label class="text-intervid">Disponibilidad para cambiar de residencia: <red>*</red></label>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" 
                                                                       ${lista[0].CambioResidencia == 'true' ? 'checked' : '' } required type="radio" name="CambioResidencia"  value="1">
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
                                                Agregar experiencia
                                            </button>
                                            <div class="table-responsive">

                                                <table class="table table-hover">
                                                    <c:forEach var="ex" items="${exp}">

                                                        <tr>
                                                            <td class="text-intervid">Empresa</td>
                                                            <td>
                                                                ${ex.EmpresaExperiencia}
                                                            </td>

                                                            <td class="text-intervid">Cargo</td>
                                                            <td>${ex.CargoDesempeñado}</td>

                                                            <td class="text-intervid text-truncate">
                                                                Descripción funciones</td>
                                                            <td>${ex.FuncionesLogros}
                                                            </td>

                                                            <td class="text-intervid">Perido</td>
                                                            <td>${ex.InicioPeriodo} - ${ex.FinPeriodo}</td>
                                                            <td>
                                                                <button class="btn btn-link edit_data_exp" id="${ex.ExperienciaProfesionalID}">
                                                                    <img src="img/edit_24px.png"/>
                                                                </button>
                                                            </td>
                                                            <td>
                                                                <a class="btn" href="borrarExperienciaLaboral.htm?id=${ex.ExperienciaProfesionalID}">
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

                            <!--agregar datos Experiencia Profesional-->
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
                                                    <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                    <input type="hidden" value="7" name="Cuadro">
                                                    <div class="form-group ">
                                                        <label class="col-form-label text-intervid">Nombre de la empresa: <red>*</red></label>
                                                        <input type="text"  required name="EmpresaExperiencia" class="form-control"/>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Cargo Desempeñado: <red>*</red></label>
                                                        <input type="text"  required name="CargoDesempeño" class="form-control"/>
                                                    </div>


                                                    <div class="form-row">
                                                        <label class="text-intervid">Período: <red>*</red></label>
                                                        <div class="col-md-11"></div>
                                                        <div class="form-group col-md-8">

                                                            <input  class="form-control" type="date" required  name="InicioPeriodo"/>
                                                            <input  class="form-control"  type="date"   name="FinPeriodo"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">

                                                        <label class="text-intervid">Descripción de funciones:</label>
                                                        <textarea name="FuncionesLogros"  class="form-control"></textarea>

                                                    </div>
                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Modal editar datos Experiencia Profesional-->
                            <div class="modal fade" id="deditexpro" tabindex="-1" role="dialog" aria-hidden="true">
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
                                                    <input type="hidden" id="id_empresa" name="id_empresa">
                                                    <input type="hidden" value="9" name="Cuadro">
                                                    <div class="form-group ">
                                                        <label class="col-form-label text-intervid">Nombre de la empresa: <red>*</red></label>
                                                        <input type="text" id="EmpresaExperiencia" name="EmpresaExperiencia" class="form-control" required/>
                                                    </div>

                                                    <div class="form-row">

                                                        <label class="text-intervid">Cargo Desempeñado: <red>*</red></label>
                                                        <input type="text" id="CargoDesempeñado" name="CargoDesempeñado" class="form-control" required/>
                                                    </div>


                                                    <div class="form-row">
                                                        <label class="text-intervid">Período: <red>*</red></label>
                                                        <div class="col-md-11"></div>
                                                        <div class="form-group col-md-8">

                                                            <input  class="form-control" required type="date" placeholder="Inicio" 
                                                                    name="InicioPeriodo" id="InicioPeriodo" />
                                                            <input  class="form-control"  type="date" placeholder="Fin"  name="FinPeriodo"
                                                                    id="FinPeriodo"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">

                                                        <label class="text-intervid">Descripción de funciones:</label>
                                                        <textarea name="FuncionesLogros" onkeyup="textAreaAdjust()" id="FuncionesLogros" class="form-control"></textarea>

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





                        <!--Datos de idiomas -->
                        <div id="idiomas">
                            <div class="row mt-4"><p class="letraMediaPerfil">Idiomas</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#didioma">
                                                Agregar
                                            </button>
                                            <div class="table-responsive">

                                                <table class="table table-hover">
                                                    <c:forEach var="idiPos" items="${idiPos}">

                                                        <tr>
                                                            <td class="text-intervid">Idioma</td>
                                                            <td>
                                                                ${idiPos.IdiomaFK == idi[0].IdiomaID ? idi[0].NombreIdioma:''}
                                                            </td>

                                                            <td class="text-intervid">Nivel Hablado</td>
                                                            <td>
                                                                ${idiPos.NivelHablado == 'basico' ? 'Básico':''}
                                                                ${idiPos.NivelHablado == 'medio' ? 'Medio':''}
                                                                ${idiPos.NivelHablado == 'avanzado' ? 'Avanzado':''}
                                                            </td>
                                                            <td class="text-intervid">Nivel Escrito</td>
                                                            <td>
                                                                ${idiPos.NivelEscrito == 'basico' ? 'Básico':''}
                                                                ${idiPos.NivelEscrito == 'medio' ? 'Medio':''}
                                                                ${idiPos.NivelEscrito == 'avanzado' ? 'Avanzado':''}
                                                            </td>
                                                            <td>
                                                                <button class="btn btn-link edit_data_idio" id="${idiPos.IdiomaPostulanteID}">
                                                                    <img src="img/edit_24px.png"/>
                                                                </button>
                                                            </td>
                                                            <td>
                                                                <a class="btn" href="borrarIdiomaPostulante.htm?id=${idiPos.IdiomaPostulanteID}">
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

                            <!-- agregar Idiomas -->
                            <div class="modal fade" id="didioma" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Idioma</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                    <input type="hidden" value="10" name="Cuadro">
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Idioma: <red>*</red></label>
                                                        <select  name="idiomaPostulante" required class="form-control">
                                                            <c:forEach items="${idi}" var="i">
                                                                <option value="${i.IdiomaID}">${i.NombreIdioma}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">

                                                        <label class="text-intervid">Nivel Hablado: <red>*</red></label>
                                                        <select class="form-control" name="nivelHablado" required>
                                                            <option value="basico">Básico</option>
                                                            <option value="medio">Medio</option>
                                                            <option value="avanzado">Avanzado</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="text-intervid">Nivel Escrito: <red>*</red></label>
                                                        <select name="nivelEscrito" class="form-control" required>
                                                            <option value="basico">Básico</option>
                                                            <option value="medio">Medio</option>
                                                            <option value="avanzado">Avanzado</option>
                                                        </select>
                                                    </div>
                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- editar Idiomas -->
                            <div class="modal fade" id="deditidioma" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Idioma</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <input type="hidden" id="idiomaPosID" name="idiomaPosID">
                                                    <input type="hidden" value="11" name="Cuadro">
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Idioma: <red>*</red></label>
                                                        <select id="idiomaPostulante" name="idiomaPostulante" required class="form-control">
                                                            <c:forEach items="${idi}" var="i">
                                                                <option value="${i.IdiomaID}">${i.NombreIdioma}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">

                                                        <label class="text-intervid">Nivel Hablado: <red>*</red></label>
                                                        <select class="form-control" id="nivelHablado"  name="nivelHablado" required>
                                                            <option value="basico">Básico</option>
                                                            <option value="medio">Medio</option>
                                                            <option value="avanzado">Avanzado</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="text-intervid">Nivel Escrito: <red>*</red></label>
                                                        <select name="nivelEscrito" id="nivelEscrito" class="form-control" required>
                                                            <option value="basico">Básico</option>
                                                            <option value="medio">Medio</option>
                                                            <option value="avanzado">Avanzado</option>
                                                        </select>
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

                        <!--Datos de otros conocimientos -->
                        <div id="otrosconocimientos">
                            <div class="row mt-4"><p class="letraMediaPerfil">Otros Conocimientos</p></div>
                            <div class="row">
                                <div class="card col-md-12 mb-5">
                                    <div class="card-body">
                                        <div class="container">
                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dconocimiento">
                                                Agregar
                                            </button>
                                            <div class="table-responsive">

                                                <table class="table table-hover">
                                                    <c:forEach var="con" items="${con}">

                                                        <tr>
                                                            <td class="text-intervid">Otros Conocimientos</td>
                                                            <td>
                                                                ${con.Conocimiento}
                                                            </td>

                                                            <td>
                                                                <button class="btn btn-link edit_data_cono" id="${con.OtrosConocimientosID}">
                                                                    <img src="img/edit_24px.png"/>
                                                                </button>
                                                            </td>
                                                            <td>
                                                                <a class="btn" href="borrarConocimientoPostulante.htm?id=${con.OtrosConocimientosID}">
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

                            <!-- agregar otros conocimientos -->
                            <div class="modal fade" id="dconocimiento" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Otros Conociemientos</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <input type="hidden" value="${lista[0].UsuarioPostulanteID}" name="id_usuarioPostulante">
                                                    <input type="hidden" value="12" name="Cuadro">
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Conocimiento: <red>*</red></label>
                                                        <textarea class="form-control" name="conocimiento" onkeyup="textAreaAdjust()" required=""
                                                                  style="resize: none" ></textarea>
                                                        </select>
                                                    </div>
                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Agregar" class="btn btn-success btn-right"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- agregar otros conocimientos -->
                            <div class="modal fade" id="deditconocimiento" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Otros Conociemientos</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <input type="hidden" id="id_conocimiento" name="id_conocimiento">
                                                    <input type="hidden" value="13" name="Cuadro">
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Conocimiento: <red>*</red></label>
                                                        <textarea class="form-control" name="conocimiento" id="conocimiento" onkeyup="textAreaAdjust()" required=""
                                                                  style="resize: none" ></textarea>
                                                        </select>
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
                    </div>

                    <!--div de cerrado container-->
                </div>
                <!--Termino div central-->

                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
    </body>
</html>

<script>

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

    $(window).on("load", function () {
        if ($('#actualidadEstudioEdit').is(':checked'))
        {
            $("#perFinEdit").prop("disabled", true);

        } else {
            $("#perFinEdit").prop("disabled", false);
        }
    });

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


    function textAreaAdjust(o) {
        o.style.height = "1px";
        o.style.height = (25 + o.scrollHeight) + "px";
    }

    $('#pais').change(function () {
        var paisID = $(this).val();
        if (paisID) {
            $.ajax({
                method: "POST",
                data: {pais_id: paisID},
                dataType: "json",
                url: "listaRegion.htm",
                success: function (data) {
                    if (data) {
                        $("#region").empty();
                        $("#comuna").empty();
                        $("#comuna").append('<option>Seleccione región o estado</option>');
                        $("#region").append('<option>Seleccione</option>');
                        $.each(data, function (key, value) {

                            $("#region").append('<option value="' + data[key].RegionID + '">' + data[key].RegionNombre + '</option>');
                        });

                    } else {
                        $("#region").empty();
                    }
                }
            });
        } else {
            $("#region").empty();
            $("#comuna").empty();
        }
    });


    $('#region').on('change', function () {
        var regionID = $(this).val();

        if (regionID) {
            $.ajax({
                method: "POST",
                data: {region_id: regionID},
                dataType: "json",
                url: "listaComuna.htm",
                success: function (data) {
                    if (data) {
                        $("#comuna").empty();
                        $("#comuna").append('<option>Seleccione</option>');
                        $.each(data, function (key, value) {

                            $("#comuna").append('<option value="' + data[key].ComunaID + '">' + data[key].ComunaNombre + '</option>');
                        });

                    } else {
                        $("#comuna").empty();
                    }
                }
            });
        } else {
            $("#comuna").empty();
        }
    });


</script>
<script type="text/javascript" src="js/datelimiter.js"></script>

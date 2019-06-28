<%-- 
    Document   : reclutadores
    Created on : 22-06-2019, 15:57:50
    Author     : sdasd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Intervid - Mis Reclutadores</title> 
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
            <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
        </head>
        <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>
            <!--Container principal-->
            <div class="container-fluid div-principal">

                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 bg-intervid intervid-fixed-nav d-none d-lg-block">
                        <div class="container mt-4">
                            <ul class="list-unstyled static ">
                                <li>
                                    <a class="alink nav-link border-link" href="#cuenta">Cuenta</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#contraseña">Contraseña</a>
                                </li>
                            </ul>
                        </div>
                    </div>


                    <div class="col-lg-10 mb-5">
                        <div class="container mt-4">
                        <c:choose>
                            <c:when test="${param.error == '1'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    La cuenta ya existe, por favor, utilice otra cuenta para agregar un reclutador.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '2'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Su contraseña es incorrecta.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.success == '1'}">        
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    Reclutador agregado exitosamente!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                        <div id="reclutador" class="mb-5">
                            <button id="" type="button" class="btn btn-right btn-link d-block mb-2" data-toggle="modal" data-target="#dreclutador" >
                                <img src="img/icons8_add_32.png" alt=""/>
                                Agregar Reclutador  
                            </button>
                            <div class="row d-block">
                                <h3 class="text-intervid">Mis Reclutadores</h3>
                                <hr/>
                                <table class="table table-responsive-sm table-hover border border-info">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Cuenta</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellido</th>
                                            <th scope="col">Cargo</th>
                                            <th scope="col" class="text-center">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <jsp:scriptlet>
                                            int count = 1;
                                        </jsp:scriptlet>
                                        <c:choose>
                                            <c:when test="${empty reclut}">
                                                <tr>
                                                    <td>No existen reclutadores</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="re" items="${reclut}">
                                                    <tr>
                                                        <td>
                                                            <%= count%>
                                                            <% count = count + 1;%>
                                                        </td>
                                                        <td>${re.CorreoUsuario}</td>
                                                        <td>${re.NombreUsuario}</td>
                                                        <td>${re.ApellidoUsuario}</td>
                                                        <td>${re.ReclutadorCargo}</td>
                                                        <td class="justify-content-center text-center">
                                                            <div class="btn-group" role="group" aria-label="Basic example">
                                                                <button id="${re.UsuarioReclutadorID}" type="button" class="btn" data-toggle="modal" data-target="#dereclutador">
                                                                    <img src="img/edit_24px.png" alt=""/>
                                                                </button>
                                                                <button type="button" class="btn">
                                                                    <img src="img/delete_sign_24px.png" alt=""/>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table> 
                            </div>
                        </div>

















                    </div>


                    <!--Agregar reclutador-->
                    <div class="modal fade" id="dreclutador" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-intervid">Agregar Reclutador</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <form method="POST" action="reclutadores.htm" class="mb-3">
                                            <input type="hidden" name="formulario" value="1"/>
                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Nombre Reclutador</label>
                                                    <input id="nombre" name="nombre" class="form-control" type="text" onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Apellido Reclutador</label>
                                                    <input id="apellido" name="apellido" class="form-control" type="text" onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-lg-12">
                                                    <label class="col-form-label text-intervid">Correo Electrónico</label>
                                                    <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Contraseña </label> <span id="msg"></span>
                                                    <input id="npass1" name="clave" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validatePassword(this.value);" onchange="validarPass();" required/>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Repetir Contraseña</label>
                                                    <input id="npass2" name="npass2" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validarPass();" required/>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Cargo</label>
                                                    <input id="rcargo" name="rcargo" class="form-control" type="text" onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline1" name="rgenero" value="Masculino" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline1">Masculino</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline2" name="rgenero" value="Femenino" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline2">Femenino</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline3" name="rgenero" value="Otro" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline3">Otro</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row justify-content-end">
                                                <div class="form-group">
                                                    <input id="sumb" type="submit" value="Agregar Reclutador" class="btn btn-success">
                                                    <button type="button" class="btn btn-primary ml-2" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Editar reclutador-->
                    <div class="modal fade" id="dereclutador" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-intervid">Editar Reclutador</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <form method="POST" action="reclutadores.htm" class="mb-3">
                                            <input type="hidden" name="formulario" value="1"/>
                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Nombre Reclutador</label>
                                                    <input id="nombre" name="nombre" class="form-control" type="text" required>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Apellido Reclutador</label>
                                                    <input id="apellido" name="apellido" class="form-control" type="text" required>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-lg-12">
                                                    <label class="col-form-label text-intervid">Correo Electrónico</label>
                                                    <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Contraseña </label> <span id="msg"></span>
                                                    <input id="npass1" name="clave" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validatePassword(this.value);" onchange="validarPass();" required/>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Repetir Contraseña</label>
                                                    <input id="npass2" name="npass2" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validarPass();" required/>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-lg-6">
                                                    <label class="col-form-label text-intervid">Cargo</label>
                                                    <input id="rcargo" name="rcargo" class="form-control" type="text" required>
                                                </div>
                                                <div class="form-group col-lg-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline1" name="rgenero" value="Masculino" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline1">Masculino</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline2" name="rgenero" value="Femenino" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline2">Femenino</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadioInline3" name="rgenero" value="Otro" class="custom-control-input" required>
                                                        <label class="custom-control-label" for="customRadioInline3">Otro</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row justify-content-end">
                                                <div class="form-group">
                                                    <input id="sumb" type="submit" value="Agregar Reclutador" class="btn btn-success">
                                                    <button type="button" class="btn btn-primary ml-2" data-dismiss="modal">Cancelar</button>
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
            <div class="row">
                <jsp:include page="../footer.jsp" ></jsp:include>
            </div>

        </div>
    </body>
</html>

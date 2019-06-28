<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
<%@page import="org.springframework.security.crypto.password.PasswordEncoder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    SecurityContext ctx = SecurityContextHolder.getContext();
    Authentication auth = ctx.getAuthentication();
    String username = auth.getName();
%>
<html>
    <head>
        <title>Intervid - Nuevo Aviso Laboral</title> 
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
            <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
        </head>
        <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>

            <!--Container principal-->
            <div class="container-fluid div-principal">

                <div class="row">
                    <!--Nav lateral-->
                    <!--                    <div class="col-lg-2 bg-intervid intervid-fixed-nav minh d-none d-lg-block">
                                            <div class="container">
                                                <ul class="list-unstyled static mt-4 ">
                                                    <li>
                                                        <a class="alink nav-link border-link" href="#cuenta">Cuenta</a>
                                                    </li>
                                                    <li>
                                                        <a class="alink nav-link border-link" href="#contraseña">Contraseña</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>-->
                    <div class="col-lg-1 bg-intervid"></div>
                    <div class="col-lg-10 mb-5">
                        <div class="container mb-5 mt-4">
                            <h3 class="text-intervid">Mis planes contratados</h3>
                            <hr/>

                            <div id="aviso">
                                <div class="row text-center">
                                    <p class="letraMediaPerfil">Nuevo aviso laboral</p>
                                </div>
                                <div class="row">
                                    <div class="card col-lg-12">
                                        <div class="card-body">
                                            <div class="container">
                                                <form method="POST">
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-12">
                                                            <label class="text-intervid">Título del aviso</label>
                                                            <input id="titulo" name="titulo" type="text" class="form-control" required/>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-12">
                                                            <label class="text-intervid">Descripción</label>
                                                            <textarea id="txtArea" class="form-control" name="descripcion" maxlength="2000" onfocus="charcountupdate(this.value)" onkeyup="charcountupdate(this.value)" onkeypress="textAreaAdjust(this)" onkeyup="textAreaAdjust()" required></textarea>
                                                            <span class="p-16 text-intervid" id="charcount"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">País</label>
                                                            <select class="form-control">
                                                                <option selected disabled value="38">Chile</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Región</label>
                                                            <select class="form-control">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Comuna</label>
                                                            <select class="form-control">
                                                                <option></option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Tipo Entrevista</label>
                                                            <select class="form-control" name="tipoentrevista">
                                                                <option value="1">Online</option>
                                                                <option value="2">Diferida</option>
                                                                <option value="3">Online - Diferida</option>
                                                                <option value="4">Solo publicación</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-12">
                                                            <label class="text-intervid">Requisitos</label>
                                                            <textarea id="txtArea" class="form-control" name="requisitos" maxlength="5000" onfocus="charcountupdate2(this.value)" onkeyup="charcountupdate2(this.value)" onkeypress="textAreaAdjust(this)" onkeyup="textAreaAdjust()" required></textarea>
                                                            <span class="p-16 text-intervid" id="charcount2"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-12">
                                                            <label class="text-intervid">Beneficios</label>
                                                            <textarea id="txtArea" class="form-control" name="beneficios" maxlength="5000" onfocus="charcountupdate3(this.value)" onkeyup="charcountupdate3(this.value)" onkeypress="textAreaAdjust(this)" onkeyup="textAreaAdjust()" required></textarea>
                                                            <span class="p-16 text-intervid" id="charcount3"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-2 col-sm-3">
                                                            <label class="text-intervid">Horarios de Entrevista</label>
                                                        </div>
                                                        <div class="form-group col-lg-1 col-sm-1 text-center">
                                                            desde
                                                        </div>
                                                        <div class="form-group col-lg-2 col-sm-1">
                                                            <input name="horarioinicio" type="time" class="form-control"/>
                                                        </div>
                                                        <div class="form-group col-lg-1 text-center col-sm-1">
                                                            hasta
                                                        </div>
                                                        <div class="form-group col-lg-2 col-sm-1">
                                                            <input name="horariofin" type="time" class="form-control"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Jornada</label>
                                                            <select name="jornada" class="form-control" >
                                                                <option>Full-time</option>
                                                                <option>Part-time</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Contrato</label>
                                                            <select name="contrato" class="form-control" >
                                                                <option>Indefinido</option>
                                                                <option>Plazo Fijo</option>
                                                                <option>Temporada</option>
                                                                <option>Aprendizaje</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Sueldo ofrecido</label>
                                                            <input name="sueldo" type="text" class="form-control" onKeyPress="return SoloNumeros(event);" onkeydown="return SoloNumeros(event);" required/>
                                                        </div>
                                                        <div class="form-group col-lg-6">
                                                            <label class="text-intervid">Plan</label>
                                                            <select class="form-control">
                                                                <option>asdf</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-row justify-content-end mt-3">
                                                        <button class="btn btn-success mr-2">Publicar Aviso</button>
                                                        <button class="btn btn-danger">Cancelar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-1 bg-intervid"></div>
                </div>
                <div class="row">
                <jsp:include page="../footer.jsp" ></jsp:include>
            </div>
        </div>

    </div>

</body>
</html>
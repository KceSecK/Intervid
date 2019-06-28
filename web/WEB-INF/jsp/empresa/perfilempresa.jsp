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
    String rol = auth.getAuthorities().toString();

%>
<html>
    <head>
        <title>Intervid - Curriculum de usuario</title> 
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
            <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
            <script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>
        </head>
        <body>
        <jsp:include page="headerempresa.jsp"></jsp:include>

            <!--Container principal-->
            <div class="container-fluid div-principal">
                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 bg-intervid intervid-fixed-nav minh d-none d-lg-block">
                        <div class="container mt-4">
                            <ul class="list-unstyled static ">
                                <li>
                                    <a class="alink nav-link border-link" href="#datos">Datos de la Empresa</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#descripcion">Descripción Empresa</a>
                                </li>
                                <li>
                                    <a class="alink nav-link border-link" href="#contacto">Datos Persona de Contacto</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-10 mb-5 mt-4">
                        <div class="container">
                        <c:choose>
                            <c:when test="${param.error == '1'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Hubo un error al modificar los datos de la empresa, porfavor revise los datos ingresados.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '2'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Hubo un error al modificar la descripción de la empresa, porfavor revise los datos ingresados.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '3'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Hubo un error al modificar los datos de la persona de contacto, porfavor revise los datos ingresados.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '999'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Ups!, algo ocurrió, revise los datos ingresados. Si el problema persiste contacte a un administrador.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.success == '1'}">        
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    Datos de empresa modificados correctamente!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.success == '2'}">        
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    Descripción de empresa modificada correctamente!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.success == '3'}">        
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    Datos de contacto modificados correctamente!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                        <h3 class="text-intervid">Mi Perfil</h3>
                        <hr/>
                        <!--datos empresa-->
                        <div id="datos">
                            <div class="row"><p class="letraMediaPerfil">Datos de la Empresa</p></div>
                            <div class="row">
                                <div class="card col-lg-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <div>
                                                <button id="datosempresa" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#ddatos">
                                                    Editar
                                                </button>
                                                <table class="table table-responsive-sm">
                                                    <tr>
                                                        <td class="text-intervid pr-5">Nombre</td>
                                                        <td>${perfil[0].NombreEmpresa}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Razón Social</td>
                                                        <td>${perfil[0].RazonSocial}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">RUT de la empresa</td>
                                                        <td>${perfil[0].RutEmpresa}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Dirección</td>
                                                        <td>${perfil[0].EmpresaDireccion}, ${perfil[0].PaisNombre}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Sector Empresarial</td>
                                                        <td>${perfil[0].SectorEmpresarial}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--editar perfil-->
                        <div class="modal fade" id="ddatos" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Editar datos de empresa</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST" class="mb-3">
                                                <input type="hidden" name="formulario" value="1"/>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-6">
                                                        <label class="text-intervid">Nombre de la empresa</label>
                                                        <input type="text" class="form-control" name="NombreEmpresa" value="${perfil[0].NombreEmpresa}" required>
                                                    </div>
                                                    <div class="form-group col-lg-6">
                                                        <label class="text-intervid">Razón Social</label>
                                                        <input type="text" class="form-control" name="RazonSocial" value="${perfil[0].RazonSocial}" onkeypress="return soloLetras(event);" onkeydown="return soloLetra(event)" required>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="text-intervid">País</label>
                                                        <select class="form-control" id="EmpresaUsuarioFK" name="EmpresaUsuarioFK">
                                                            <c:forEach var="p" items="${pais}">
                                                                <c:choose>
                                                                    <c:when test="${p.PaisID == perfil[0].EmpresaPais}">
                                                                        <option selected value="${p.PaisID}">${p.PaisNombre}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${p.PaisID}">${p.PaisNombre}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>                                                            
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="text-intervid">Dirección</label>
                                                        <input class="form-control" id="EmpresaDireccion" name="EmpresaDireccion" type="text" value="${perfil[0].EmpresaDireccion}" required/>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="text-intervid">Sector empresarial</label>
                                                        <input class="form-control" id="SectorEmpresarial" name="SectorEmpresarial" type="text" value="${perfil[0].SectorEmpresarial}" required/>
                                                    </div>
                                                </div>


                                                <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" value="Guardar Cambios" class="btn btn-success btn-right">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--descripción empresa-->
                        <div id="descripcion">
                            <div class="row mt-4"><p class="letraMediaPerfil">Descripción Empresa</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <div>
                                                <button id="datosempresa" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#ddescripcion">
                                                    Editar
                                                </button>
                                                <table class="table table-responsive-sm">
                                                    <tr>
                                                        <td class="text-intervid pr-5">Logo empresarial</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${empty perfil[0].LogoEmpresa}">
                                                                    <img class="img-fluid img-thumbnail box-img" src="img/logo_personalizado.png">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img class="img-fluid img-thumbnail box-img" src="${perfil[0].LogoEmpresa}" alt=""/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Página Web de la empresa</td>
                                                        <td>
                                                            <a href="${perfil[0].PaginaWeb}" target="_blank" hreflang="">${perfil[0].PaginaWeb}</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Descricpción</td>
                                                        <td>
                                                            ${perfil[0].DescripcionEmpresa}
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--editar descripcion-->
                        <div class="modal fade" id="ddescripcion" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Modificar Descripción Empresa</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST" class="mb-3">
                                                <input type="hidden" name="formulario" value="2"/>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="col-form-label text-intervid">Logo Empresarial (URL)</label>
                                                        <input id="LogoEmpresa" name="LogoEmpresa" type="url" class="form-control" value="${perfil[0].LogoEmpresa}" />
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="col-form-label text-intervid">Página Web (URL)</label>
                                                        <input id="PaginaEmpresa" name="PaginaEmpresa" type="url" class="form-control" value="${perfil[0].PaginaWeb}" />
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-lg-12">
                                                        <label class="col-form-label text-intervid">Descripción Empresa</label>
                                                        <textarea id="txtArea" class="form-control" name="DescripcionEmpresa" maxlength="2000"onfocus="charcountupdate(this.value)" onkeyup="charcountupdate(this.value)" onkeypress="textAreaAdjust(this)" onkeyup="textAreaAdjust()" required>${perfil[0].DescripcionEmpresa}</textarea>
                                                        <span class="p-16 text-intervid" id=charcount></span>
                                                    </div>
                                                </div>
                                                <div class="form-row justify-content-end">
                                                    <div class="form-group">
                                                        <input id="sumb" type="submit" value="Guardar Cambios" class="btn btn-success">
                                                        <button type="button" class="btn btn-primary ml-2" data-dismiss="modal">Cancelar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--datos persona de contacto-->
                        <div id="contacto">
                            <div class="row mt-4"><p class="letraMediaPerfil">Datos Persona de Contacto</p></div>
                            <div class="row mb-5">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">
                                            <div>
                                                <button id="datosempresa" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dcontacto">
                                                    Editar
                                                </button>
                                                <table class="table table-responsive-sm">
                                                    <tr>
                                                        <td class="text-intervid pr-5">Nombre</td>
                                                        <td>${perfil[0].NombreUsuario}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Apellido</td>
                                                        <td>${perfil[0].ApellidoUsuario}</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-intervid pr-5">Teléfono</td>
                                                        <td>${perfil[0].NumeroTelefonico}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--editar contacto-->
                        <div class="modal fade" id="dcontacto" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-intervid">Modificar Descripción Empresa</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <form method="POST" class="mb-3">
                                                <input type="hidden" name="formulario" value="3"/>
                                                <div class="form-group">
                                                    <label class="col-form-label text-intervid">Nombre</label>
                                                    <input id="nombre" name="nombre" type="text" class="form-control" value="${perfil[0].NombreUsuario}" required/>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label text-intervid">Apellido</label>
                                                    <input id="apellido" name="apellido" type="text" class="form-control" value="${perfil[0].ApellidoUsuario}"/>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label text-intervid">Teléfono</label>
                                                    <input id="NumeroTelefonico" class="form-control" name="NumeroTelefonico" type="tel" maxlength="11" value="${perfil[0].NumeroTelefonico}" onKeyPress="return SoloNumeros(event);" onkeydown="return SoloNumeros(event);" required/>
                                                </div>
                                                <div class="form-row justify-content-end">
                                                    <div class="form-group">
                                                        <input id="sumb" type="submit" value="Guardar Cambios" class="btn btn-success">
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
            </div>

            <div class="row">
                <jsp:include page="../footer.jsp" ></jsp:include>
            </div>
        </div>
        <script type="text/javascript">
            function textAreaAdjust(o) {
                o.style.height = "1px";
                o.style.height = (25 + o.scrollHeight) + "px";
            }

            $(document).ready(function () {
                bsCustomFileInput.init()
            })
        </script>
    </body>
</html>
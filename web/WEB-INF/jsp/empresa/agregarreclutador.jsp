<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-10 mb-5">
    <div class="container">
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
        <div id="reclutador">
            <div class="row mt-4"><p class="letraMediaPerfil">Mis Reclutadores</p></div>
            <div class="row">
                <div class="card col-md-12">
                    <div class="card-body">
                        <div class="container">

                            <table class="table table-responsive-lg">
                                <tr>
                                    <td class="font-weight-bold">
                                        Agregar Reclutadores
                                    </td>
                                    <td>
                                        <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dreclutador">
                                            Agregar Reclutador  
                                        </button>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--editar contraseña-->
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
                            <form method="POST" action="agregarreclutador.htm" class="mb-3">
                                <input type="hidden" name="formulario" value="1"/>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label class="col-form-label text-intervid">Nombre Reclutador</label>
                                        <input id="nombre" name="nombre" class="form-control" type="text" required>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label class="col-form-label text-intervid">Apellido Reclutador</label>
                                        <input id="apellido" name="apellido" class="form-control" type="text" required>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-lg-12">
                                        <label class="col-form-label text-intervid">Correo Electrónico</label>
                                        <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label class="col-form-label text-intervid">Contraseña </label>
                                        <input id="npass1" name="clave" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validatePassword(this.value);" onchange="validarPass();" required/>
                                        <span id="msg"></span>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label class="col-form-label text-intervid">Repetir Contraseña</label>
                                        <input id="npass2" name="npass2" type="password" minlength="6" maxlength="25" class="form-control" onkeyup="validarPass();" required/>
                                    </div>
                                </div>

                                <div class="row">
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

                                <div class="form-group">
                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                    <input id="sumb" type="submit" value="Agregar Reclutador" class="btn btn-success btn-right">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

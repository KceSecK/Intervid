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
        <title>Intervid - Curriculum de usuario</title>
      
         
        <jsp:include page="../head.jsp" flush="true"></jsp:include>
     
       <link href="css/toastr.css" rel="stylesheet" type="text/css"/>

            <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
        </head>
        <body>
           
        <jsp:include page="headerpostulante.jsp" flush="true"></jsp:include>

            <!--Container principal-->
            <div class="container-fluid div-principal">


                <div class="row">
                    <!--Nav lateral-->
                    <div class="col-lg-2 bg-intervid intervid-fixed-nav">
                        <div class="container">
                            <ul class="list-unstyled static ">
                                <h3 class="text-white mt-3">Mi cuenta</h3>
                                <hr class="hr-custom-white"/>
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
                        <div class="container">
                        <c:choose>
                            <c:when test="${param.error == '1'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Datos invalidos.
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
                            <c:when test="${param.error == '3'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Esta cuenta de usuario ya existe, porfavor utilice otra.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '4'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Las contraseñas no coinciden o la contraseña actual son incorrectas.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.error == '999'}">        
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Ups!, algo salió mal. Si el problema persiste, contacte al administrador del sistema.
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                            <c:when test="${param.success == '1'}">        
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    La contraseña ha sido cambiada exitosamente!
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:when>
                        </c:choose>
                        <div id="perfil">

                            <div class="row mt-4"><p class="letraMediaPerfil">Datos de Cuenta</p></div>
                            <div class="row">
                                <div class="card col-md-12">
                                    <div class="card-body">
                                        <div class="container">

                                            <div id="cuenta">
                                                <div class="row mt-4"><p class="letraMediaPerfil">Cuenta</p></div>
                                                <div class="row">
                                                    <div class="card col-md-12">
                                                        <div class="card-body">
                                                            <div class="container">

                                                                <table class="table table-responsive-lg">
                                                                    <th>
                                                                        Cambiar dirección de email<red>**</red>
                                                                    </th>
                                                                    <th>
                                                                    </th>
                                                                    <tr>
                                                                        <td>
                                                                            Al cambiar tu dirección de email, también cambiarán tus crecenciales para el inicio de sesión
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="text-intervid">Email: <br/><p class="text-dark"><%= username%></p> </td>
                                                                        <td>
                                                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dperfil">
                                                                                Cambiar dirección de email
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="contraseña">
                                                <div class="row mt-4"><p class="letraMediaPerfil">Contraseña</p></div>
                                                <div class="row">
                                                    <div class="card col-md-12">
                                                        <div class="card-body">
                                                            <div class="container">

                                                                <table class="table table-responsive-lg">
                                                                    <th>
                                                                        Cambiar contraseña
                                                                    </th>
                                                                    <th></th>
                                                                    <tr>
                                                                        <td class="text-intervid">Contraseña: <br/>
                                                                            <p class="text-dark p-24">&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;</p> 
                                                                        </td>
                                                                        <td>
                                                                            <button id="" type="button" class="btn btn-link btn-right" data-toggle="modal" data-target="#dcontraseña">
                                                                                Cambiar contraseña
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--editar perfil-->
                            <div class="modal fade" id="dperfil" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Cambiar dirección de email</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST" class="mb-3">
                                                    <input type="hidden" name="formulario" value="1"/>
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Nueva dirección de email</label>
                                                        <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Contraseña actual</label>
                                                        <input id="pass" name="pass" type="password" class="form-control" required/>
                                                    </div>

                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input type="submit" value="Guardar Cambios" class="btn btn-success btn-right">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--editar contraseña-->
                            <div class="modal fade" id="dcontraseña" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-intervid">Cambiar contraseña</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                                <form method="POST" class="mb-3">
                                                    <input type="hidden" name="formulario" value="2"/>
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Contraseña actual</label>
                                                        <input id="pass" name="pass" type="password" class="form-control" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Nueva Contraseña </label>
                                                        <input id="npass1" name="npass1" type="password" minlength="6" class="form-control" onchange="validarPass();" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-form-label text-intervid">Repetir Contraseña</label>
                                                        <input id="npass2" name="npass2" type="password" minlength="6" class="form-control" onkeyup="validarPass();" required/>
                                                    </div>

                                                    <button type="button" class="btn btn-primary btn-right ml-2" data-dismiss="modal">Cancelar</button>
                                                    <input id="sumb" type="submit" value="Guardar Cambios" class="btn btn-success btn-right">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
    </body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script src="js/toastr.min.js" type="text/javascript"></script>

<script>
    $.ajax({        
                method: "POST",
                dataType: "json",
                url: "obtenerNotificacionPostulante.htm",
                success: function (data) {
              
        console.log(data);
                        if (data) {
     toastr.success('<a style="display:d-inline" href="'+data[0].NotificacionLink+'">Tienes una video llamada</a>','Notificación',{
  "progressBar": true,
  "positionClass": "toast-bottom-right",
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut" 
   });
}
else if (data===null)
{
    
}
 
                    
                }
            });
    
 
 
</script>
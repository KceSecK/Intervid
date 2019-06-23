<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${param.error == '1'}">        
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Correo o contraseña incorrectas!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:when test="${param.error == '2'}">        
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Esta cuenta de usuario ya existe, porfavor utilice otra.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:when test="${param.success == '1'}">        
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            Cuenta creada con éxito!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>
<form action="<c:url value="/login" />" method="POST">
    <div class="form-group">
        <div class="col-12">
            <label class="text-intervid">Correo</label>                                 
            <input id="correo" class="form-control" type="email" name="correo" onKeyUp="validarEmail(this.form.correo.value);" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-12">
            <label class="text-intervid">Contraseña</label>
            <input type="password" class="form-control" name="clave">
        </div>
    </div>

    <div class="form-group">
        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <p>Mantenerme conectado</p>
            </div>


            <input type="submit" value="Ingresar" class="btn btn-success" style="width:100%">
        </div>
    </div>
</form>  

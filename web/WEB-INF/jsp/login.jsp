<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action="<c:url value="/login" />" method="POST"> 
    <c:if test="${param.error != null}">        
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Correo o clave invalidos.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
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

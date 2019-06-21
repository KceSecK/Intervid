
  
 $(window).on("load",function (){
     if($('#NoLicencia').is(':checked'))
     {
          $( ".lic" ).prop( "disabled", true );
         
       }
       else{
            $( ".lic" ).prop( "disabled", false );
       }
     
 });
   
    
    $(window).on("load",function (){
    $('#NoLicencia').on('change',function()
    {
       if($(this).is(':checked'))
       {
            $( ".lic" ).prop( "disabled", true );
         
       }
       else{
            $( ".lic" ).prop( "disabled", false );
       }
    }); 
    });
    
    
    
    $(document).ready(function () {
        $(document).on('click', '#editarTelefono', function () {
            var conTipo = document.getElementById("contactoTipo");
            var numTel = document.getElementById("NumeroTelefonico");
            var idTel = document.getElementById("idTel");
            var ct = conTipo.value;
            var nt = numTel.value;
            var id = idTel.value;
            console.log(id);
            console.log(ct);
            console.log(nt);
            $.ajax({
                type: "GET",
                url: "editarTelefono.htm",
                cache:false,
                data: {
                    conTipo: ct,
                    numTel: nt,
                    id: id
                },
                dataType:"text",
                success: function (data) {
                    if (data) {
                        window.location.reload("cvPostulante.htm");
}
                }
            
            });
        });
        
        });
   
        
//    rellenar Modal Experiencia profesional 
    $(document).ready(function () {
        $(document).on('click', '.edit_data_exp', function () {
            var id_experiencia = $(this).attr("id");
            $.ajax({
                url: "editExperienciaPostulante.htm",
                method: "POST",
                cache: false,
                data: {id: id_experiencia},
                dataType: "json",
                success: function (data) {
                     
                    $('#EmpresaExperiencia').val(data[0].EmpresaExperiencia);
                    $('#CargoDesempeño').val(data[0].CargoDesempeño);
                    $('#InicioPeriodo').val(data[0].InicioPeriodo);
                    $('#FinPeriodo').val(data[0].FinPeriodo);
                    $('#FuncionesLogros').val(data[0].FuncionesLogros);
                    $('#id_empresa').val(data[0].ExperienciaProfesionalID);
                    $("#deditexpro").modal('show');

                }


            });
        });

    });
//    rellenar Modal telefono 
    $(document).ready(function () {
        $(document).on('click', '.edit_data_tel', function () {

            var id_telefono = $(this).attr("id");
            
            $.ajax({
                url: "editTelefonoPostulante.htm",
                method: "POST",
                cache: false,
                data: {id: id_telefono},
                dataType: "json",
                success: function (data) {
                   

                    $('#contactoTipo').val(data[0].ContactoTipo);
                    $('#NumeroTelefonico').val(data[0].NumeroTelefonico);
                  $('#id_telefono').val(data[0].NumeroContactoID);
                  $('#dedittelefono').modal('show');

                }


            });
        });

    });
    $(document).ready(function () {
        $(document).on('click', '.edit_data', function () {

            var id_estudio = $(this).attr("id");
            console.log(id_estudio);
            $.ajax({
                url: "editEstudioPostulante.htm",
                method: "POST",
                cache: false,
                data: {id2: id_estudio},
                dataType: "json",
                success: function (data) {
                   

                    $('#id_educacion').val(data[0].EducacionPostulanteID);
                    $('#institucion').val(data[0].Institucion);
                    $('#estudios').val(data[0].NivelEstudio).prop('selected', true);
                    $('#estadoEstudio').val(data[0].EstadoEstudio).prop('selected', true);
                 
                   console.log(data[0].PeriodoActual);
                    if (data[0].PeriodoActual) {
                         $('#actualidadEstudioEdit').prop('checked', true);
                    
                }
                else{
                   $('#actualidadEstudioEdit').prop('checked', false);
                }
                    
                    $('#periodoInicio').val(data[0].PeriodoInicio);
                    $('#periodoFin').val(data[0].PeriodoFin);
                     $("#dediteducacion").modal('show');


                }


            });
        });

    });

    $(document).ready(function () {
        $(document).on('click', '.edit_data_idio', function () {

            var id_idiomaPostulante = $(this).attr("id");
            console.log(id_idiomaPostulante)
            $.ajax({
                url: "editIdiomaPostulante.htm",
                method: "POST",
                cache: false,
                data: {id: id_idiomaPostulante},
                dataType: "json",
                success: function (data) {
                   
                    console.log(data);
                    $('#idiomaPostulante').val(data[0].IdiomaFK).prop('selected', true);
                    $('#nivelHablado').val(data[0].NivelHablado).prop('selected', true);
                    $('#nivelEscrito').val(data[0].NivelEscrito).prop('selected', true);
                    $('#idiomaPosID').val(data[0].IdiomaPostulanteID);
                     $("#deditidioma").modal('show');


                }


            });
        });

    });



    $(document).ready(function () {
        $(document).on('click', '.edit_data_cono', function () {

            var id_cono = $(this).attr("id");
            $.ajax({
                url: "editConocimientoPostulante.htm",
                method: "POST",
                cache: false,
                data: {id: id_cono},
                dataType: "json",
                success: function (data) {
                   
                    console.log(data);
                    $('#id_conocimiento').val(data[0].OtrosConocimientosID);
                    $('#conocimiento').val(data[0].Conocimiento);
                     $("#deditconocimiento").modal('show');


                }


            });
        });

    });

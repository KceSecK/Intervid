 $('#pais').change(function(){
    var paisID = $(this).val();
    if(paisID){
        $.ajax({
               method: "POST",
                data: {pais_id: paisID},
                dataType: "json",
           url:"listaRegion.htm",
           success:function(data){
            if(data){
                $("#region").empty();
                $("#comuna").empty();
                $("#comuna").append('<option>Seleccione región o estado</option>');
                $("#region").append('<option>Seleccione</option>');
                $.each(data,function(key,value){

                    $("#region").append('<option value="'+data[key].RegionID+'">'+data[key].RegionNombre+'</option>');
                });

            }else{
               $("#region").empty();
            }
           }
        });
    }else{
        $("#region").empty();
        $("#comuna").empty();
    }
   });
    
     
    $('#region').on('change',function(){
    var regionID = $(this).val();
  
    if(regionID){
        $.ajax({
               method: "POST",
                data: {region_id: regionID},
                dataType: "json",
           url:"listaComuna.htm",
           success:function(data){
            if(data){
                $("#comuna").empty();
                $("#comuna").append('<option>Seleccione</option>');
                $.each(data,function(key,value){

                    $("#comuna").append('<option value="'+data[key].ComunaID+'">'+data[key].ComunaNombre+'</option>');
                });

            }else{
               $("#comuna").empty();
            }
           }
        });
    }else{
        $("#comuna").empty();
    }
   });
  
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
            console.log(id_experiencia);
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
                    $("#deditexpro").modal('show');


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

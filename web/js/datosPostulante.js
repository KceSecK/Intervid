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
                    console.log("SUCCESS: ", data[0])

                    $('#institucion').val(data[0].Institucion);
                    $('#estudios').val(data[0].NivelEstudio).prop('selected', true);
                    $('#estadoEstudio').val(data[0].EstadoEstudio).prop('selected', true);
                    $('#PeriodoActualidad').val(data[0].PeriodoActual).prop('checked', true);
                    $('#periodoInicio').val(data[0].PeriodoInicio);
                    $('#periodoFin').val(data[0].PeriodoFin);
                    $("#educacion_modal").modal('');


                }


            });
        });

    });

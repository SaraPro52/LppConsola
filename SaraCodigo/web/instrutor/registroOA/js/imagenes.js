$(document).on('ready', function () {
   var opcion={
       beforSend: function(){
           $("#progressbox").show();
           
           $("#progressbar").width('0%');
           $("#message").empty();
           $("#precent").html('%');
       },
       uploadProgress: function(evento,posicion,total,completado){
           $("#progressbar").width(completado + '%');
           $("#precent").html(completado + '%');
           
            if (completado>50) {
                $("#message").html("<font color='red'>El archivo se esta cargando... </font>");                
            }
       },
       success:function(){
           $("#progressbar").width('100 %');
           $("#precent").html('100 %');
       },
       complete:function (respose){
           console.log("Completo "+respose)
           $("#message").html("<font color='blue'>El archivo se cargo completamente</font>");

       },
       error:function(){
           $("#message").html("<font color='red'>Error: No se pudo =/</font>");
       }
   };
    $("#UploadForm").ajaxForm(opcion);
});
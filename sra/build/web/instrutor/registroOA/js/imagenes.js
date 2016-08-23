$(document).on('ready', function () {
    /*var opcion={
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
     };*/
    //$("#UploadForm").ajaxForm(opcion);
//    function Limpiar() {
//        if (window.File && window.FileReader && window.FileList && window.Blob) {
//            console.log("Navegador compatible");
//        } else {
//            console.log('Navegador no compatible.');
//        }
//        titulo = $("#Titulo").val("");
//        descripcion = $("#Descripcion").val("");
//        area = $("#Area").val("");
//        programa = $("#Programa").val("");
//        tema = $("#Tema").val("");
//        imagen = $("#Imagen").val("");
//        palabrasClave = $("#PalabrasClave").val("");
//        formato = $("#Formato").val("");
//        requisitos = $("#Requisitos").val("");
//        instruciones = $("#Instruciones").val("");
//        anniadir = $("#Anniadir").val("");
//    }
//

    $("#btnEnviar").on("click",function () {
        
        var formData = new FormData(document.getElementById("formuploadajax"));
        formData.append("dato", "valor");
        console.log(formData.getPrototypeOf());
                //formData.append(f.attr("name"), $(this)[0].files[0]);
//        $.ajax({
//            url: "archivoscontroller",
//            type: "post",
//            dataType: "html",
//            data: formData,
//            cache: false,
//            contentType: false,
//            processData: false
//        })
//                .done(function (res) {
//                    $("#mensaje").html("Respuesta: " + res);
//        });

    });
});
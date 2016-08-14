$(document).on('ready',function(){
    console.log("VivoImagenes");
    $("#cargar").uploadFile({
        url:"",
        multiple:"true",
        allowedTypes:"jpg,jpeg,png,rar,zip,iso",
        doneStr:"¡Archivo cargado!",
        extErrorStr:"Error al cargar el archivo",
        uploadErrorStr:"Ocurrio un error al crgar. intenta denuevo"
    });
});
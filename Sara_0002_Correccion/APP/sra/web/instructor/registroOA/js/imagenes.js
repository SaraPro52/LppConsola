$(document).on('ready', function () {
    alert("imagen");
console.log("Imagenes");
    var options = {
        beforeSend: function () {
            $("#progressbox").show();
            $("#progressbar").width('0%');
            $("#message").empty();
            $("#percent").html("0%");
        },
        uploadProgress: function (event, position, total, percentComplete) {
            $("#progressbar").width(percentComplete + '%');
            $("#percent").html(percentComplete + '%');
            if ((percentComplete > 1) && (percentComplete < 101)) {
                $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
            }
        },
        success: function () {
            var arrayAutor = "";
            var arrayTemas = [];
            for (var i = 0; i < arraySelecionAutor.length; i++) {
                if (i == 0) {
                    arrayAutor = idUser + "," + arraySelecionAutor[i];
                } else {
                    arrayAutor = arrayAutor + "," + (arraySelecionAutor[i]);
                }
            }
            for (var i = 0; i < arraySelecionEstr.length; i++) {
                arrayTemas.push(arraySelecionEstr[i] + "-0");
            }
            for (var i = 0; i < arraySelecionCate.length; i++) {
                arrayTemas.push(arraySelecionCate[i] + "-1");
            }
            men = $("#Titulo_Publicacion").val();
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn", worker: true};
            ajax(5, datos[5]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);
});
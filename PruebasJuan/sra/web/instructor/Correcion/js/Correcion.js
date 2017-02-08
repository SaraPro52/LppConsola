var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("CorrecionInstrutor");
$("#contenedor").hide();
$("#Clona").hide();
$("#formularioss").hide();
jso[0] = ['Crud_Controller','[{opcion:3,tabla2:17,tipo:2,elegir:[4,5,6,7],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:10,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:11,operador:0,valor1:2,añadir:0},{colum:9,operador:0,valor1:0}]",id:0,opSelect:6}]'];
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "correcion", worker: true};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);
$(document).on('click', '.btnCorrecion', function (e) {
    ob.limpiarTablaI($("#tablaNotificacion"));
    jso[1] = ['EvaluacionGeneral_Controller', '[{opcion:2,idEvalua:' + this.id + ',resultado:0}]'];
    selector[1] = $("#Respuestaitem");
    datos[1] = {nombre: "correcionCo", worker: true};
    ajax(1, datos[1]);
});

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
        $("#contenedor").show();
        $("#formularioss").hide();
        jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,archivoNom:' + $("#myfile").val() + '}]'];
        selector[5] = null;
        datos[5] = {nombre: "btn", worker: true};
        console.log(jso[5]);
        ajax(5, datos[5]);
    },
    error: function () {
        $("#message").html("<font color='red'>Error: al subir el archivo</font>");
    }
};
$("#UploadForm").ajaxForm(options);
function ajax(i, datos) {
    hilo[i] = new Worker("js/worker.js");
    hilo[i].postMessage(jso[i]);
    hilo[i].onmessage = function (event) {
        data[i] = event.data;
        ob.cargarTabla(data[i], selector[i], datos);
        hilo[i].terminate();
        peticionCompleta(i);
    };
}
function peticionCompleta(i) {
    if (i == 1) {
        $("#formularioss").show();
        $(".contenedor").hide();
    }
}
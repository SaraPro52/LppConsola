var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true, url = "", nomPV = "", idver = "0", extPermitida = "";
var ob = new $.Luna("Productos virtuales", $("#tablaNotificacion"));
ob.Vivo("CorrecionInstrutor");
$("#percent").hide();
$("#contenedor").hide();
$("#Clona").hide();
$("#formularioss").hide();
// CAMBIO 14/04/2017
//jso[0] = ['EvaluacionGeneral_Controller', '[{opcion:3,elegir:["' + idUser + '","' + idRol + '","' + idCentro + '","2","9,10"],opt:2}]'];
//-----
//-------Consulta Notificaciones
jso[0] = ['Notificaciones_Controller', '[{opcion:2,parametros:[' + idUser + ',' + idRol + ',0]}]'];
//----------
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "correcion"};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);

$(document).on('click', '.btnCorrecion', function (e) {
    var valors = this.id.split("$$");
    idver = valors[1];
    nomPV = valors[2];
    idNot = valors[3];
    url = valors[4];
    extPermitida = valors[5];
    ob.limpiarTablaI($("#tablaNotificacion"));
    jso[1] = ['EvaluacionGeneral_Controller', '[{opcion:2,idEvalua:' + valors[0] + ',resultado:0}]'];
    selector[1] = $("#Respuestaitem");
    datos[1] = {nombre: "correcionCo"};
    ajax(1, datos[1]);

});

var options = {
    beforeSend: function () {
        $("#percent").show();
        $("#progressbox").show();
        $("#progressbar").width('0%');
        $("#message").empty();
        $("#percent").html("0%");
        $("#formularioss").show();
    },
    uploadProgress: function (event, position, total, percentComplete) {
        $("#progressbar").width(percentComplete + '%');
        $("#percent").html(percentComplete + '%');
        if ((percentComplete > 1) && (percentComplete < 101)) {
            $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
        }
        $("#formularioss").show();
    },
    success: function () {
        $("#contenedor").show();
        $("#formularioss").hide();
        var path = $("#myfile").val();
        var filename = path.replace(/C:\\fakepath\\/, '');
        jso[5] = ['ProductoVirtual_Controller', '[{opcion:3,correccion:[' + idUser + ',' + idver + '],archivoNom:\"' + filename + '\",idNot:' + idNot + ',url:' + url + '}]'];
        selector[5] = null;
        datos[5] = {nombre: "btn"};
        $("#formularioss").show();
        ajax(5, datos[5]);
    },
    error: function () {
        $("#message").html("<font color='red'>Error: al subir el archivo</font>");
    }
};
$("#UploadForm").ajaxForm(options);

$('.input-file').change(function () {
    var nomArh = $(this).val();
    var ex = nomArh.split(".");
    nomArh = ex[ex.length - 1];
    var menAlert = "Selecione un archivo de extencion " + extPermitida;
    if (extPermitida != nomArh) {
        $("#myfile").notify(
                menAlert, 'warn',
                {position: "right"}
        );
        $(this).val('');
    }
    var sizeByte = this.files[0].size;
    var siezekiloByte = parseInt(sizeByte / 1024);
    if (siezekiloByte > $(this).attr('size')) {
        $(this).val('');
        $(".inputNotifi").notify(
                "El archivo supera el limite de 25 mb", 'warn',
                {position: "right"}
        );
    }
});

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
    } else if (i == 5) {
        $("#formularioss").show();
        var daMen = data[i].split("$$");
        if (daMen[0] == "true") {
            estado = ("success");
            men = "El producto  " + nomPV + " " + daMen[1];
        } else {
            estado = ("error");
            men = "El producto " + nomPV + " " + daMen[1];
        }
        jso[6] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
        datos[6] = {caso: "Notificaciones productos virtuales"};
        $.notify(men, estado);
        ajax(6)
    } else if (i == 6) {
        $("#CasoNombre").text(datos[i].caso);
        $("#cuerpo").empty();
        $("#cuerpo").append(data[i]);
    }
}
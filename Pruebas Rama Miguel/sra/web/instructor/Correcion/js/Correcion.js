var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("CorrecionInstrutor");
$("#percent").hide();
$("#contenedor").hide();
$("#Clona").hide();
$("#formularioss").hide();

//cambio--------------
jso[0] = ['EvaluacionGeneral_Controller','[{opcion:3,elegir:[4,5,6,7,11],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:10,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:11,operador:0,valor1:2,añadir:0},{colum:9,operador:0,valor1:0}]",opt:2}]'];
 //-------CAMBIADO
 
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "correcion"};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);

$(document).on('click', '.btnCorrecion', function (e) {
     //-------CAMBIADO
    var valors = this.id.split("$$");
    idver = valors[1];
    nomPV = valors[2];
    idNot = valors[3];
    url = valors[4];//--------URL VERSION
    
    ob.limpiarTablaI($("#tablaNotificacion"));
    jso[1] = ['EvaluacionGeneral_Controller', '[{opcion:2,idEvalua:' + valors[0] + ',resultado:0}]'];
     //-------CAMBIADO
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
        alert('[{opcion:3,correccion:[',idUser,',',idver,',',$("#myfile").val(),'],nomPV:',nomPV,',idNot:',idNot,'}]');
        //-------- Cambio 2
        jso[5] = ['ProductoVirtual_Controller', '[{opcion:3,correccion:['+idUser+','+ idver+',\"' + $("#myfile").val() + '\"],nomPV:\"'+nomPV+'\",idNot:'+idNot+',url:',url,'}]'];
        //-------- Cambio 2
        
        selector[5] = null;
        datos[5] = {nombre: "btn"};
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
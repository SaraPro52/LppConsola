var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
var ob = new $.Luna("producto", $("#tablaNotificacion"));
ob.Vivo("CorrecionInstrutor");
jso[0] = ['Crud_Controller','[{opcion:5,tabla:7,datos:[],elegir:[4,5,7,8,9,10,11,12],delimitador:"[{colum:4,operador:0,valor1:'+idUser+'}]",id:0,opSelect:6}]'];
selector[0] = $("#tablaNotificacion");
datos[0] = {nombre: "correcion", worker: true};
ob.TablaEspa(selector[0]);
ajax(0, datos[0]);
$(document).on('click', 'btnCorrecion', function (e) {
    console.log(this);
    jso[1] = ['Crud_Controller', '[{opcion:5,tabla:17,datos:[],elegir:[4,5,6],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:8,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:9,operador:0,valor1:2}]",id:0,opSelect:6}]'];
    selector[1] = $("#tablaNotificacion");
    datos[1] = {nombre: "correcion", worker: true};
    ob.limpiarTabla(selector[1]);
    ajax(1, datos[1]);
});

//jso[0] = ['Crud_Controller','[{opcion:5,tabla:7,datos:[],elegir:[4,5,7,8,9,10,11,12],delimitador:"[{colum:4,operador:0,valor1:'+idUser+'}]",id:0,opSelect:6}]'];
//jso[3] = ["Crud_Controller", "[{opcion:2,tabla:18,\n\
//datos:[''," + $("#tipoIdenti").val() + "',\n\
//'" + $("#numeroIdentificacion").val() + "',\n\
//'" + $("#nombre").val() + "',\n\
//'" + $("#apellido").val() + "',\n\
//'" + $("#email").val() + "',\n\
//'" + $("#cargo").val() + "',\n\
//'" + $("#ipSena").val() +"'],elegir:[],id:0,opSelect:7}]"];

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

    }
}
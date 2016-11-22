$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [];
    var ob = new $.Luna("funcionario", selector);
    ob.Vivo("DesabilitarFuncionario");
    
    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:11,datos:[],actualizar:[],delimitador:[],elegir:[0,1,3,5,6],id:0,opSelect:4}]'];
    selector[0] = $("#tablaAdmi");
    datos[0] = {nombre: "Funcionario", worker: true};
    ajax(0, datos[0]);
    ob.TablaEspa(selector[0]);
    $(document).on('click', '.botonclick', function (e) {
        jso[1] = ['Crud_Controller', '[{opcion:2,tabla:"18",datos:[],delimitador:[],elegir:[],actualizar:"[{9:2}]",id:' + this.id + ',opSelect:2}]'];
        selector[1] = $("#tablaAdmi");
        ob.limpiarTabla(selector[1]);
        $("#ccNoti").empty();
        $("#tablaAdmiP").empty();
        datos[1] = {nombre: "btn", worker: true};
        ajax(1, datos[1]);
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
            jso[2] = ['Crud_Controller', '[{opcion:5,tabla:11,datos:[],actualizar:[],delimitador:[],elegir:[0,1,3,5,6],id:0,opSelect:4}]'];
            selector[2] = $("#tablaAdmi");
            ajax(2, datos[0]);
        } else if (i == 2) {
            var men = "";
            if (data[2].length < data[0].length) {
                men = "fue deshabilitado correctamente.";
            } else if (data[2].length == data[0].length) {
                men = "No se a podido deshabilitado a  .";
            }
            $.notify({
                icon: 'ti-gift',
                message: men + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});
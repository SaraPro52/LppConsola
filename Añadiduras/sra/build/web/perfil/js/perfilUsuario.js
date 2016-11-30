$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuario");
    jso[0] = ['Crud_Controller','[{opcion:3,tabla2:7,tipo:2,elegir:[4,5,7,8,9,10,11,12],delimitador:"[{colum:4,operador:0,valor1:'+idUser+'}]",id:0,opSelect:6}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "perfil", worker: true};
    ajax(0, datos[0]);  


    $("#BtnModificar").click(function () {
   

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
        if (i == 0) {
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:28,tipo:1,elegir:[],delimitador:[],id:0,opSelect:1}]'];
            selector[1] = $("#IdentificacionFunTipo");
            datos[1] = {nombre: "Select", worker: true};
            ajax(1, datos[1]);
        }
    }
});


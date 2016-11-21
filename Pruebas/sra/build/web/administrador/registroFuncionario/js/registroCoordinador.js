$(document).on('ready', function () {
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("CalificarOA");
    var c = 0, cc = 0, selector = [], hilo = [], jso = [], data = [], es = [];
    selector[0] = $("#centroFormacion");
    jso[0] = ['Crud_Controller1', '[{opcion:5,tabla:10,datos:[""],delimitador:"",id:0,opSelect:4,elegir:["2","3"]}]', 0];
    selector[1] = $("#tipoUsuario");
    jso[1] = ['Crud_Controller1', '[{opcion:5,tabla:10,datos:[""],delimitador:"",id:0,opSelect:4,elegir:["2","3"]}]', 1];
    selector[2] = $("#tipoIdenti");
    jso[2] = ['Crud_Controller1', '[{opcion:5,tabla:11,datos:[""],delimitador:"",id:0,opSelect:4,elegir:["2","3"]}]', 2];
    var datos = {nombre: "Select"}
    ajax(2, datos);
    $("#tipoUsuario").hover(function () {
        if (c == 1) {
            ajax(0, datos);
        }
        c++;
    });
    $("#tipoIdenti").hover(function () {
        if (cc == 1) {
            ajax(2, datos);
        }
        cc++;
    });
    $("#centroFormacion").change(function () {
        $("#area").empty().append("<option>selecciona...</option>");
        var objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["0", "1"],
            delimitador: "[{colum:2 ,operador:0 ,valor1:" + $("#centroFormacion").val() + "}]", id: 0, opSelect: 6};
        selector = $("#area");
        //ob.ajax(objet, selector);
    });

    $("#boton1").on('click', function () {
        datosV();
    });
    function datosV() {
        var selector = "btn";
        var objet = {
            opcion: 1, url: "Funcionario_Controller", nombre: "btn",
            datos: [$("#tipoUsuario").val(), $("#tipoIdenti").val(), $("#numeroIdentificacion").val(), $("#nombre").val(), $("#apellido").val(),
                $("#email").val(), $("#cargo").val(), $("#ipSena").val(), "1", $("#centroFormacion").val(), $("#area").val()]
        };
        console.log(objet);
        //ob.ajax(objet, selector);
    }
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
        };
    }
});
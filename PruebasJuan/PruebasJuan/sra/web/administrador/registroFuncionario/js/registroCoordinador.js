$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estados = "", men = "";
    var ob = new $.Luna("RegistroFuncionario", selector);
    ob.Vivo("RegistroFuncionario1");
    $("#AnimacionCargando").hide();
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:["2","3"],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#centroFormacion");
    datos[0] = {nombre: "Select", worker: true};
    ajax(0, datos[0]);

    $("#centroFormacion").change(function () {
        $("#area").empty().append("<option selected='selected'>selecciona...</option>");
        jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:[0,1],delimitador:"[{colum:2 ,operador:0 ,valor1:' + $("#centroFormacion").val() + '}]",id:0,opSelect:6}]'];
        selector[4] = $("#area");
        datos[4] = {nombre: "Select", worker: true};
        ajax(4, datos[4]);
    });
          
    $("#boton1").click(function () {
        $(this).hide();
        $("#AnimacionCargando").show();
        jso[3] = ['Funcionario_Controller', "[{opcion:1,datos:['" + $("#tipoUsuario").val() + "','" + $("#tipoIdenti").val() + "','" + $("#numeroIdentificacion").val() + "','" + $("#nombre").val() + "','" + $("#apellido").val() + "','" + $("#email").val() + "','" + $("#cargo").val() + "','" + $("#ipSena").val() + "','1','" + $("#centroFormacion").val() + "','" + $("#area").val() + "']}]"];
        men = $("#nombre").val();
        datos[1] = {nombre: "btn", worker: true};
        ajax(3, datos[1]);
    });

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
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
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:25,tipo:1,elegir:["0","1"],delimitador:[],id:0,opSelect:4}]'];
            selector[1] = $("#tipoUsuario");
            datos[1] = {nombre: "Select", worker: true};
            ajax(1, datos[1]);
        } else if (i == 1) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:28,tipo:1,elegir:[],delimitador:[],id:0,opSelect:1}]'];
            selector[2] = $("#tipoIdenti");
            datos[2] = {nombre: "Select", worker: true};
            ajax(2, datos[2]);
        } else if (i == 3) {
            $("#formulario1 :input").val("");
            $("select").empty().append("<option selected='selected'>selecciona...</option>");
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estados = ("success");
                men = "El funcionario  " + men + " " + daMen[1];
            } else {
                estados = ("error");
                men = "El funcionario  " + men +" "+ daMen[1];
            }
            $.notify(men, estados);
            $("#boton1").show();
            $("#AnimacionCargando").hide();
        }
    }
});
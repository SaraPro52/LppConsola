$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", idArea;
    var ob = new $.Luna("Area", $("#tablaarea"));
    ob.Vivo("Area");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1,2],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#tablaarea");
    datos[0] = {nombre: "Area"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    var men = "";
    $("#btnArea").on('click', function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var selec = $(".select");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='#D23939'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        for (var i = 0; i < selec.length; i++) {
            if (selec[i].value == "A0") {
                selet = $(selec[i]);
                selet.focus().after("<div class='remove'><font color='#D23939'>seleccione una opcion</font><div>");
            } else {
                boo++;
            }
        }
        if (boo == 3) {
            BtnArea();
        }
    });

    $(document).on('click', '.botonArea', function (e) {
        campo = this.value;
        var ca = campo.split("$$");
        idArea = ca[0];
        $("#areaC").val(ca[1]);
        $("#areaL").val(ca[2]);
        $("#btnArea").html("Modificar Área");
    });

    function BtnArea() {
        var Nom = $("#btnArea").text();
        if (Nom == "Guardar Área") {
            jso[1] = ['FormacionPro_Controller', '[{opcion:2,tabla:2,delimitador:[],datos:["",' + $("#areaC").val() + ',' + $("#areaL").val() + '],idC:' + $("#CentroFormacion").val() + '}]'];
        } else if (Nom == "Modificar Área") {
            jso[1] = ['FormacionPro_Controller', '[{opcion:3,tabla:2,delimitador:[],datos:[' + idArea + ',' + $("#areaC").val() + ',' + $("#areaL").val() + '],idC:' + $("#CentroFormacion").val() + '}]'];
            $("#btnArea").html("Guardar Área");
        }
        selector[1] = $("#tablaarea");
        datos[1] = {nombre: "btn", worker: true};
        men = $("#areaC").val();
        ajax(1, datos[1]);
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
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:[2,3],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#CentroFormacion");
            datos[2] = {nombre: "Select"};
            ajax(2, datos[2]);
        }
        if (i == 1) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La area " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1,2],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#tablaarea");
            datos[2] = {nombre: "Area"};
            ob.limpiarTabla(selector[2]);
            ajax(2, datos[2]);
        }
    }
});
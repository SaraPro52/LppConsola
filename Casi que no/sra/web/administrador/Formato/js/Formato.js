$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", campo = [];
    var ob = new $.Luna("Formato", $("#tablaformato"));
    ob.Vivo("Formato1");

    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,delimitador:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#tablaformato");
    datos[0] = {nombre: "Formato", worker: true};
    ob.TablaEspa(selector[0]); 
    ajax(0, datos[0]);
    $(document).on('click', '.botonformato', function (e) {
        campo = this.value;
        var ca = campo.split("$$");
        $("#btnformato").val("Modificar formato");
        $("#formato").val(ca[0]);
        $("#descripcion").val(ca[1]);
    });
    var men = "";
    $("#btnformato").click(function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='#D23939'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        if (boo == 2) {
            Btnformato();
        }
    });

    function Btnformato() {
        var Nom = $("#btnformato").val();
        if (Nom == "Guardar formato") {
            console.log("Guarda formato");
            jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:17,tabla2:17,tipo:1,delimitador:[],datos:["",' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
        } else if (Nom == "Modificar formato") {
            $("#btnformato").val("Guardar formato");
            console.log("Modificar");
            jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:17,tabla2:17,tipo:1,delimitador:[],datos:["",' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
        }
        selector[1] = $("#tablaformato");
        datos[1] = {nombre: "Formato", worker: true};
        ob.limpiarTabla(selector[1]);
        men = $("#formato").val();
        ajax(1, datos[1]);
    }
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            peticionCompleta(i);
            hilo[i].terminate();
        };
    }
    function peticionCompleta(i) {
        if (i == 1) {
            if (data[0].length == data[i].length) {
                men = "El formato" + men + " no se ingreso.";
                estado = ("error");
            } else if (data[0].length < data[i].length) {
                men = "El formato " + men + " se ingreso correctamente";
                estado = ("success");
            }
            $.notify(men, estado);
        }
    }
});
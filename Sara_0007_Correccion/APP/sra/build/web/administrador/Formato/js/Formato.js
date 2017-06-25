$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", campo = [], idFormato;
    var ob = new $.Luna("Formato(s)", $("#tablaformato"));
    ob.Vivo("Formato");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,delimitador:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#tablaformato");
    datos[0] = {nombre: "Formato"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    $(document).on('click', '.botonformato', function (e) {
        campo = this.value;
        var ca = campo.split("$$");
        idFormato = (ca[0]);
        $("#formato").val(ca[1]);
        $("#descripcion").val(ca[2]);
        $("#btnformato").html("Modificar formato");
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
        var Nom = $("#btnformato").html();
        men = $("#formato").val();
        ob.limpiarTabla($("#tablaformato"));
        if (Nom == "Guardar formato") {
            jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:17,tabla2:17,tipo:1,delimitador:[],datos:["",' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
            selector[1] = $("#tablaformato");
            datos[1] = {nombre: "Formato"};
            ajax(1, datos[1]);
        } else if (Nom == "Modificar formato") {
            $("#btnformato").val("Guardar formato");
            jso[3] = ['Crud_Controller', '[{opcion:2,tabla1:17,tabla2:17,tipo:1,delimitador:[],actualizar:[' + idFormato + ',' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
            selector[3] = $("#tablaformato");
            datos[3] = {nombre: "Formato"};
            ajax(3, datos[3]);
        }
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
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,delimitador:[],elegir:[0,1,2],id:0,opSelect:4}]'];
            selector[2] = $("#tablaformato");
            datos[2] = {nombre: "Formato"};
            ob.limpiarTabla(selector[2]);
            ajax(2, datos[2]);
        } else if (i == 2) {
            if (data[2].length > data[0].length) {
                estado = ("success");
                men = "El formato " + men + " se agrego correctamente";
            } else {
                estado = ("error");
                men = "El formato " + men + " no se agrego";
            }
            $.notify(men, estado);
            $("#formato").val();
            $("#descripcion").val();
        } else if (i == 3) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El formato " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = "El formtao" + men + " " + daMen[1];
            }
            $.notify(men, estado);
            $("#formato").val();
            $("#descripcion").val();
        }
    }
});
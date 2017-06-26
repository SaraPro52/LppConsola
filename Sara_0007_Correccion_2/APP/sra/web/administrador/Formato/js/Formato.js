$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", campo = [], idFormato = 0, idTipoFormato = 0;
    var ob = new $.Luna("Formato(s)", null);
    ob.Vivo("Formato1");
    jso[0] = ['Modificar_Controller', '[{opcion:5,FormatoAdmin:[0,0,0,0]}]'];
    selector[0] = $("#tablaformato");
    datos[0] = {nombre: "Formato"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);

    $(document).on('click', '.botonformato', function (e) {
        campo = this.value;
        var ca = campo.split("$$");
        idFormato = ca[0];
        $("#tipoFormato option[value=" + ca[1] + "]").attr("selected", true);
        $("#formato").val(ca[2]);
        $("#descripcion").val(ca[3]);
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

        if (Nom == "Guardar formato") {
            jso[2] = ['Modificar_Controller', '[{opcion:5,FormatoAdmin:[1,0,' + $("#formato").val() + ',' + $("#descripcion").val() + ',' + $("#tipoFormato").val() + ']}]']
            datos[2] = {nombre: "btn"};
            men = $("#formato").val();
            ajax(2, datos[2]);
        } else if (Nom == "Modificar formato") {
            jso[1] = ['Modificar_Controller', '[{opcion:5,FormatoAdmin:[2,' + idFormato + ',' + $("#formato").val() + ',' + $("#descripcion").val() + ',' + $("#tipoFormato").val() + ']}]']
            datos[1] = {nombre: "btn"};
            men = $("#formato").val();
            ajax(1, datos[1]);
        }
        selector[1] = $("#tablaformato");
        $("#btnformato").html("Guardar formato");
    }

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            peticionCompleta(i);
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
        };
    }
    function peticionCompleta(i) {
        if (i == 0) {
            jso[5] = ['Crud_Controller', '[{opcion:3,tabla2:59,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[5] = $("#tipoFormato");
            datos[5] = {nombre: "Select"};
            ajax(5, datos[5]);
        } else if (i == 1) {//Modificar

            try {
                var response = jQuery.parseJSON(data[i]);
                if (typeof response == 'object') {
                    ob.limpiarTabla($("#tablaformato"));
                    datos[7] = {nombre: "Formato"};
                    ob.cargarTabla(data[i], selector[1], datos[7]);
                    estado = ("success");
                    men = "El formato " + men + " se a modificado correctamente";
                }
            } catch (e) {
                estado = ("error");
                men = "El formato " + men + " no se a modificado";
            }
            $.notify(men, estado);
            $("#formato").val("");
            $("#descripcion").val("");
            $("#tipoFormato option[value='A0']").attr("selected", true);
        } else if (i == 2) {//agregar lista
            if (data[2].length > data[0].length) {
                ob.limpiarTabla($("#tablaformato"));
                datos[7] = {nombre: "Formato"};
                ob.cargarTabla(data[i], selector[1], datos[7]);
                estado = ("success");
                men = "El formato " + men + " se aagregado correctamente";

            } else {
                estado = ("error");
                men = "El formato " + men + " no se a agregado";
            }
            $.notify(men, estado);
            $("#formato").val("");
            $("#descripcion").val("");
            $("#tipoFormato option[value='A0']").attr("selected", true);
        }
    }
});
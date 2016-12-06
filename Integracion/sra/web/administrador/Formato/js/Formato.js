$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Formato", $("#tablaformato"));
    ob.Vivo("Formato");

    jso[0] = ['Crud_Controller', '[{opcion:3,tabla:17,datos:[],delimitador:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#tablaformato");
    datos[0] = {nombre: "Formato", worker: true};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    $(document).on('click', '.botonformato', function (e) {
        switch (this.value) {
            case "m":
                objeto = {opcion: 2, id: this.id, nombre: "BtnModal"};
                break;
        }
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
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }

        if (boo == 2) {
            console.log("campos");
            btn();
        }
    });

    function btn() {
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla:17,delimitador:[],datos:["",' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
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
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i == 1) {
            if (data[0].length == data[i]) {
                men = "El formato " + men + " no se ingreso.";
            } else if (data[0] < data[i]) {
                men = "El formato " + men + "se ingreso correctamente";
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



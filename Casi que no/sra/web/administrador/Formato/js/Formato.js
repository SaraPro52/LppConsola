$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "";
    var ob = new $.Luna("Formato", $("#tablaformato"));
    ob.Vivo("Formato");

    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,delimitador:[],elegir:[0,1,2],id:0,opSelect:4}]'];
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
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:17,tabla2:17,tipo:1,delimitador:[],datos:["",' + $("#formato").val() + ',' + $("#descripcion").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
        selector[1] = $("#tablaformato");
        datos[1] = {nombre: "Formato", worker: true};
        ob.limpiarTabla(selector[1]);
        men = $("#formato").val();
        ajax(1, datos[1]);
    });

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
        console.log("PEticion completa" + i);
        if (i == 1) {
            console.log("Entrp");
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



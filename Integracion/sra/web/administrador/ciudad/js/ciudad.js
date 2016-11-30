$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Ciudade", $("#tablaCiudad"));
    ob.Vivo("Ciudad");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla:6,datos:[],delimitador:[],elegir:[0,1],id:0,opSelect:4}]'];
    selector[0] = $("#tablaCiudad");
    datos[0] = {nombre: "Ciudad", worker: true};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "m":
                objeto = {Opcion: 2, id: this.id, nombre: "BtnModal"};
                break;
            case "e":
                objeto = {Opcion: 4, id: this.id, nombre: "BtnModal"};
                break;
        }
    });
    var men = "";
    $("#btnCiudad").on('click', function () {
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla:6,delimitador:[],datos:["",' + $("#Ciudad").val() + '],elegir:[0,1],id:0,opSelect:4}]'];
        selector[1] = $("#tablaCiudad");
        men = $("#Ciudad").val();
        datos[1] = {nombre: "Ciudad", worker: true};
        ob.limpiarTabla(selector[1]);
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
            if (data[0].length == data[i].length) {
                men = "La ciudad" + men + " no se ingreso.";
            } else if (data[0] < data[i]) {
                men = "La Ciudad" + men + "se ingreso correctamente";
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

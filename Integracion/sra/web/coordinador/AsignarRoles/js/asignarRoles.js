$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("usuario", selector[0]);
    ob.Vivo("Asignar Roles");

    jso[0] = ['Funcionario_Controller', '[{opcion:2,centro:' + idCentro + '}]'];
    selector[0] = $("#tablaARoles");
    datos[0] = {nombre: "AsignarRol", worker: true};
    ajax(0, datos[0]);

    ob.TablaEspa(selector[0]);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) { 
            case "b":
                var bus = "Select" + this.id;
                bus = $("#bus").find($("#" + bus));
                jso[1] = ['Funcionario_Controller', '[{opcion:4,datos:["", "' + bus.val() + '","' + this.id + '"]}]'];
                selector[1] = $("#tablaARoles");
                datos[1] = {nombre: "btn", worker: true};
                ajax(1, datos[1]);
                break;
        }
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
    function peticionCompleta(i, datos) {
        if (i == 1) {
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
            jso[2] = ['Funcionario_Controller', '[{opcion:2,centro:' + idCentro + '}]'];
            selector[2] = $("#tablaARoles");
            datos[2] = {nombre: "AsignarRol", worker: true};
            ob.limpiarTabla(selector[2]);
            ajax(2, datos[2]);
            console.log("Cambiodd");
        }
    }
});
    
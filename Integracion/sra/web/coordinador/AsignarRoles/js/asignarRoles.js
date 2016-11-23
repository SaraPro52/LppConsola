$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], nombre = "";

    jso[0] = ['Funcionario_Controller', '[{opcion:2,centro:' + idCentro + '}]'];
    selector[0] = $("#tablaARoles");
    datos[0] = {nombre: "AsignarRol", worker: true};
    ajax(0, datos[0]);
    var ob = new $.Luna("usuario", selector[0]);
    ob.Vivo("Asignar Roles");
    ob.TablaEspa(selector[0]);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "A":
                var bus = "Select" + this.id;
                bus = $("#bus").find($("#" + bus));
                jso[1] = ['Crud_Controller', '[{opcion:1,tabla:26,datos:["", "'+bus.val()+'","'+this.id+'"],id:0,opSelect:7}]'];
                selector[1] = $("#tablaARoles");
                datos[1] = {nombre:"btn",worker: true};
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
        }
    }

});
    
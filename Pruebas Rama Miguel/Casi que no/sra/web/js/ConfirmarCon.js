function confirmarCon(fun) {
    var hilo = [], jso = [], data = [], datos = [];
    $("#btnContra").click(function () {
        s = $("#cont1").val();
        if ($("#cont1").val() === $("#cont2").val()) {
            jso[0] = ['Funcionario_Controller', '[{opcion:3,con:' + $("#cont1").val() + ',id:' + fun + '}]'];
            ajax(0);
        }
    });

    function ajax(i) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i == 0) {
            jso[1] = ['sesion_controller', '[{opcion:3}]'];
            ajax(1);
        } else if (i == 1) {
            $("#total").empty();
            $("#total").append(data[1]);
            var daMen = data[0].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        }
    }
}

$(document).on('ready', function () {
    var hilo = [], jso = [], data = [];
    $('#btnLogin').click(function () {
        jso[0] = ['sesion_controller', '[{user:' + $("#user").val()+ ',pwd:' + $("#pwd").val() + ',opcion:1}]'];
        ajax(0);
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
            if (data[i] == "false") {
                alert("Error del servidor ;)");
            } else {
                $("#estru").empty();
                $("#cuerpo").empty();
                $("#estru").append(data[i]);
            }

        }
    }
});




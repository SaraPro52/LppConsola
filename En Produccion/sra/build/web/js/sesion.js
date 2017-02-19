$(document).on('ready', function () {
    console.log('%c ¡La consola del navegador a sido bloqueada; es por la seguridad de nuestros clientes! :)', 'color: green; font-weight: bold;');
    //logger.disableLogger();
    var hilo = [], jso = [], data = [];
    $('#btnLogin').click(function () {
        jso[0] = ['sesion_controller', '[{user:' + $("#user").val() + ',pwd:' + $("#pwd").val() + ',opcion:1}]'];
        ajax(0);
        $("#btnLogin").prop('disabled', true);
    });

    $("#olvidoPa").click(function () {
        jso[0] = ['sesion_controller', '[{opcion:3}]'];
        ajax(0);
        $("#btnLogin").prop('disabled', true);
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
                alert("Error al conectarse con el servidor ;)");
            } else {
                $("#estru").empty();
                $("#cuerpo").empty();
                $("#estru").append(data[i]);
            }

        }
    }
});

var logger = function () {
    var oldConsoleLog = null;
    var pub = {};
    pub.disableLogger = function disableLogger() {
        oldConsoleLog = console.log;
        window['console']['log'] = function () {};
    };
    return pub;
}();



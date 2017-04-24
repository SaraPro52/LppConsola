$(document).on('ready', function () {
    console.log('%c ¡Las consola del navegador a sido bloqueada; es por la seguridad de nuestros clientes! :)', 'color: green; font-weight: bold;');
    //logger.disableLogger();
    $("#btnLogin").prop('disabled', false);
    $("#total").addClass("backgroundBody");
    var hilo = [], jso = [], data = [];
    $('#btnLogin').click(function () {
        jso[0] = ['sesion_controller', '[{user:' + $("#user").val() + ',pwd:' + $("#pwd").val() + ',opcion:1}]'];
        ajax(0);
        $("#btnLogin").prop('disabled', true);
    });

    $("#olvidoPa").click(function () {
        jso[1] = ['sesion_controller', '[{opcion:3}]'];
        ajax(1);
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


    $("#btnModales").click(function () {
        $('#myModal').modal('show');
    });

    function peticionCompleta(i) {
        if ((i == 0) || (i == 1)) {
            $("#contentss").html("");
            if (data[i] == "false") {
                alert("Error al conectarse con el servidor.");
            } else if (i == 0) {
                if (data[i] == 0) {
                    var error = "<p><font color='red'>Usuario o contraseña incorrecta; intente nuevamente</font></p>";
                    $("#contentss").append(error);
                } else {
                    $('#myModal').modal('hide');
                    $("div").removeClass("modal-backdrop");
                    $("div").removeClass("");
                    $("#footerPrin").empty();
                    $("#footerPrin1").empty();
                    $("#estru").empty();
                    $("#cuerpo").empty();
                    $("#footerPrincip").empty();
                    $("#estru").append(data[i]);
                }
            } else if (i == 1){
                $('#myModal').modal('hide');
                $("div").removeClass("modal-backdrop");
                $("div").removeClass("");
                $("#estru").empty();
                $("#cuerpo").empty();
                $("#estru").append(data[i]);
            }
            $("#btnLogin").prop('disabled', false);
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



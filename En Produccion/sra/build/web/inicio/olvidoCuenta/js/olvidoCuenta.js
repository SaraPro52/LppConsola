$(document).ready(function () {
    $("#total").css("background-color", "");
    var hilo = [], jso = [], data = [];
    console.log("Vivo??OlvidoContraseña?");
    $("#BtnCorreo").click(function () {
        jso[0] = ['Instrutor_Controller', '[{opcion:6,correo:' + $("#camCorreo").val() + '}]'];
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

        }
    }
});

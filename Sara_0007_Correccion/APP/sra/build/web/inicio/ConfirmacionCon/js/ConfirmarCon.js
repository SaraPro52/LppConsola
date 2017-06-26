function confirmarCon(fun) {
    var hilo = [], jso = [], data = [];
    console.log("Crear Contraseña");
    $('.password-container').pschecker({onPasswordValidate: validatePassword, onPasswordMatch: matchPassword});
    var submitbutton = $('.submit-button');
    var errorBox = $('.error');
    errorBox.css('visibility', 'hidden');
    submitbutton.attr("disabled", "disabled");
    function validatePassword(isValid) {
        if (!isValid)
            errorBox.css('visibility', 'visible');
        else
            errorBox.css('visibility', 'hidden');
    }

    function matchPassword(isMatched) {
        if (isMatched) {
            submitbutton.addClass('unlocked').removeClass('locked');
            submitbutton.removeAttr("disabled", "disabled");
        } else {
            submitbutton.attr("disabled", "disabled");
            submitbutton.addClass('locked').removeClass('unlocked');
        }
    }
    $("#btnContra").click(function () {

        if ($("#cont").val() === $("#cont1").val()) {
            jso[0] = ['Funcionario_Controller', '[{opcion:5,id:' + fun + ',con:' + $("#cont").val() + '}]'];
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
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La contraseña se a " + daMen[1];
            } else {
                estado = ("error");
                men = "La cntraseña no se a " + daMen[1];
            }
            $.notify(men, estado);
            document.location.href = "/sra007/";
        }
    }
}

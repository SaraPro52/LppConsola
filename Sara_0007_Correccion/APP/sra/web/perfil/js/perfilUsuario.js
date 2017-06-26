$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuario");
    $("#BtnModificar1").click(function () {
        $(".remove").remove();
        var inputs = $(".inputsC"), ccT = 0, input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div  style='font-size:15px;' class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                ccT++;
            }
        }
        if ($("#ConNueva").val().trim() === $("#ConNuevaF").val().trim()) {
            if (ccT == 4) {
                BtnCon();
            }
        } else {
            $("#ConNueva").val();
            $("#ConNuevaF").val();
            $("#ConNueva").focus().after("<div  style='font-size:15px;' class='remove'><font color='red'>Las contraseña no son iguales</font><div>");       
        }
        ccT = 0;
    });
    function BtnCon() {
        jso[1] = ['Funcionario_Controller', '[{opcion:3,modificarContra:[' + idUser + ','+$("#nIdentificaion").val()+','+ $("#ConActual").val() + ',' + $("#ConNuevaF").val() + ']}]'];
        ajax(1);
    }
    function ajax(i) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            peticionCompleta(i);
            hilo[i].terminate();
        };
    }

    function peticionCompleta(i) {
        if (i == 1) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La contraseña " + daMen[1];
            } else {
                estado = ("error");
                men = "La contraseña  " + daMen[1];
            }
            $.notify(men, estado);
            $("#user").val("");
            $("#ConActual").val("");
            $("#ConNueva").val("");
            $("#ConNuevaF").val("");
        }
    }
});


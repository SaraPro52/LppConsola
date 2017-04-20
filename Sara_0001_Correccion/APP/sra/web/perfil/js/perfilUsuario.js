$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuario");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:7,tipo:2,elegir:[4,5,7,8,9,10,11,12],delimitador:"[{colum:4,operador:0,valor1:' + idUser + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "btn"};
    ajax(0, datos[0]);

    $("#BtnModificar").click(function () {
        var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var selec = $(".select");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div  style='font-size:15px;' class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        for (var i = 0; i < selec.length; i++) {
            if (selec[i].value == "A0") {
                selet = $(selec[i]);
                selet.focus().after("<div style='font-size:15px;' class='remove'><font color='red'>seleccione una opcion</font><div>");
            } else {
                boo++;
            }
        }
        if (!emailreg.test($("#CorreoFun").val())) {
            $("#CorreoFun").focus().after("<div style='font-size:15px;' class='remove'><font color='red'>Ingrese un email correcto</font></div>");
            boo = boo - 1;
        }
        if (boo == 6) {
            BtnPerfil();
        }
    });
    function BtnPerfil() {
        jso[2] = ['Crud_Controller', '[{opcion:2,id:' + idUser + ',tabla1:18,actualizar:[' + $("#IdentificacionFunTipo").val() + ',' + $("#IdentificacionFun").val() + ',' + $("#NombreFun").val() + ',' + $("#ApellidoFun").val() + ',' + $("#CorreoFun").val() + ',' + $("#CaargoFun").val() + ',' + $("#IdSenaFun").val() + ']}]'];
        datos[2] = {nombre: "btn"};
        ajax(2, datos[2]);
    }
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
        jso[1] = ['Funcionario_Controller', '[{opcion:7,:' + idUser + ',conNueva:' + $("#ConNuevaF").val() + ',conA:' + $("#ConActual").val() + ',user:' + $("#user").val() + ',pwd:' + $("#ConActual").val() + '}]'];
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
    }
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
        if (i == 0) {
            jso = jQuery.parseJSON(data[i]);
            $("#NombreFun").val(jso[0].Nom_Funcionario);
            $("#ApellidoFun").val(jso[0].Apellidos);
            $("#IdentificacionFunTipo option[value=" + jso[0].Id_Tipo_Documento + "]").attr("selected", true);
            $("#IdentificacionFun").val(jso[0].Num_Documento);
            $("#IdSenaFun").val(jso[0].Ip_Sena);
            $("#CaargoFun").val(jso[0].Cargo);
            $("#CorreoFun").val(jso[0].Correo);
        } else if (i == 1) {
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
        } else if (i == 2) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El perfil  " + daMen[1];
            } else {
                estado = ("error");
                men = "El perfil " + daMen[1];
            }
            $.notify(men, estado);
        }
    }
});


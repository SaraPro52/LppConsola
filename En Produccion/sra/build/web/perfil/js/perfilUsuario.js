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
        if (boo == 10) {
            BtnPerfil();
        }
    });
    function BtnPerfil() {

        $("#ApellidoFun").val();
        $("#IdentificacionFunTipo").val();
        $("#IdentificacionFun").val();
        $("#IdSenaFun").val();
        $("#CaargoFun").val();
        $("#CorreoFun").val();

        jso[2] = ['Funcionario_Controller', '[{opcion:3,id:' + idUser + ',datos:[]}]'];
        datos[2] = {nombre: "btn"};
        ajax(2, datos[2]);
    }
    $("#BtnModificar1").click(function () {
        $(".remove").remove();
        var inputs = $(".inputsC");
        var ccT = 0;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs.value == "") {
                inputs.focus().after("<div  style='font-size:15px;' class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                ccT++;
            }
        }
        if ($("#ConNueva").val() == $("#ConNuevaF").val()) {
            if (ccT == 4) {
                BtnCon();
            }
        } else {
            $("#ConNueva").val();
            $("#ConNuevaF").val();
            $.notify("error", "Las contraseña no son iguales");
        }
        ccT = 0;
    });
    function BtnCon() {
        jso[1] = ['Funcionario_Controller', '[{opcion:3,id:' + idUser + ',con:' + $("#ConNuevaF").val() + ',conA:' + $("#ConActual").val() + ',user:' + $("#user").val() + ',pwd:' + $("#ConActual").val() + '}]'];
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
            $("#coambiarContra")[0].reset();
        }
    }
});


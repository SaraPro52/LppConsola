$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuarioq");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:7,tipo:2,elegir:[4,5,7,8,9,10,11,12],delimitador:"[{colum:4,operador:0,valor1:' + idUser + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "btn", worker: true};
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
        alert("LIsta para peticion");
    }
    $("#BtnModificar1").click(function () {
        $(".remove").remove();
        var ss = 0;
        var input;
        var inputs = $(".inputsC");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div  style='font-size:15px;' class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                ss++;
                var con = $("#ConNueva").val();
                var con1 = $("#ConNuevaF").val();
                if (con === con1) {
                    ss++;
                } else {
                    $(".remove").remove();
                    $("#ConNueva").focus().after("<div style='font-size:15px;' class='remove'><font color='red'>Las contraseñas no son iguales.</font></div>");
                    ss = ss - 1;
                }
            }
        }
        if (ss == 6) {
            BtnCon();
        }
    });
    function BtnCon() {
        console.log("HI");
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
            console.log(jso[0].Id_Tipo_Documento);
            
            $("#IdentificacionFunTipo option[value=" + jso[0].Id_Tipo_Documento + "]").attr("selected",true);
            $("#IdentificacionFun").val(jso[0].Num_Documento);
            $("#IdSenaFun").val(jso[0].Ip_Sena);
            $("#CaargoFun").val(jso[0].Cargo);
            $("#CorreoFun").val(jso[0].Correo);
        }
    }
});


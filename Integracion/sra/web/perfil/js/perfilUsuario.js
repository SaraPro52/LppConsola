$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuario");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla:17,delimitador:[],datos:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "perfil", worker: true};
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
            console.log(selec[i]);
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
            console.log("campos");
            //btnarea();
        }


    });
    $("#BtnModificar1").click(function () {
        $(".remove").remove();
        if( $("#ConActual").val() == "" ){
            $("#ConActual").focus().after("<div class='remove'><font color='red'>ingrese la contraseña actual</font></div>");
            
            }else if( $("#ConNuevaF").val() == "" ){
            $("#ConNuevaF").focus().after("<div class='remove'><font color='red'>ingrese la contraseña actual</font></div>");
        
            }else if( $("#ConNueva").val() == "" ){
            $("#ConNueva").focus().after("<div class='remove'><font color='red'>ingrese la contraseña actual</font></div>");
        
        }else if ($("#ConNueva").val().trim() != $("#ConNuevaF").val().trim()) {
            $("#ConNueva").focus().after("<div class='remove'><font color='red'>Las contraseñas no son iguales.</font></div>");
            boo = boo - 1;
        
                }
        });
    function btnmodificar() {

        var pass = "";
        if ($("#ConNueva").val() == "") {
            pass = $("#ConActual").val();
        }
        $("#NombreFun").val();
        $("#ApellidoFun").val();
        $("#CaargoFun").val();
        $("#IdSenaFun").val();
        $("#CorreoFun").val();
        $("#NFuncionarioFun").val();
        $("#IdentificacionFun").val();
        $("#IdentificacionFunTipo").val();

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
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla:28,datos:[],delimitador:[],elegir:[],id:0,opSelect:1}]'];
            selector[1] = $("#IdentificacionFunTipo");
            datos[1] = {nombre: "Select", worker: true};
            ajax(1, datos[1]);
        }
    }
});
//        $("#CorreoFun").keyup(function () {
//                if ($(this).val() != "" && emailreg.test($(this).val())) {
//                        $(".error").fadeOut();
//                        return false;
//                }
//        });

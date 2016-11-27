$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    var ob = new $.Luna("Perfil", $("#formulario1"));
    ob.Vivo("PerfilUsuario");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla:17,delimitador:[],datos:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "perfil", worker: true};
    ajax(0, datos[0]);


    $("#BtnModificar").click(function () {
        var pass = "";
        if ($("#ConNueva").val() == "") {
            pass=$("#ConActual"),val();
        }
        $("#NombreFun").val();
        $("#ApellidoFun").val();
        $("#CaargoFun").val();
        $("#IdSenaFun").val();
        $("#CorreoFun").val();
        $("#NFuncionarioFun").val();
        $("#IdentificacionFun").val();
        $("#IdentificacionFunTipo").val();


    });




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

//         $(".remove").remove();
//
//        if ($("#ConActual").val() == "") {
//                        $("#ConActual").focus().after("<div class='remove'><font color='red'>ingrese contraseña actual</font><div>");
//                        return false;
//         } else if (clave1.trim() != clave2.trim()) {
//            $("#ConNuevaF").focus().after("<div class='remove'><font color='red'>Las contraseñas no son iguales.</font></div>");
//            return false;
//        }

//        $("#BtnModificar").click(function () {
//        var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
//            $(".remove").remove();
//                if ($("#NombreFun").val() == "") {
//                        $("#NombreFun").focus().after("<div class='remove'><font color='red'>digite el nombre</font><div>");
//                        return false;
//        
//            } else if ($("#ApellidoFun").val() == "") {
//                        $("#ApellidoFun").focus().after("<div class='remove'><font color='red'>Ingrese un apellido</font></div>");
//                        return false;
//        } else if ($("#IdentificacionFunTipo").val() == "A0") {
//                        $("#IdentificacionFunTipo").focus().after("<div class='remove'><font color='red'>seleccione una opcion</font></div>");
//                        return false;
//        } else if ($("#IdentificacionFun").val() == "") {
//                        $("#IdentificacionFun").focus().after("<div class='remove'><font color='red'>ingrese su numero de identificacion</font></div>");
//                        return false;
//        } else if ($("#NFuncionarioFun").val() == "") {
//                        $("#NFuncionarioFun").focus().after("<div class='remove'><font color='red'>ingrese su numero de funsionario</font></div>");
//                        return false;
//        } else if ($("#CorreoFun").val() == "" || !emailreg.test($("#CorreoFun").val())) {
//                        $("#CorreoFun").focus().after("<div class='remove'><font color='red'>Ingrese un email correcto</font></div>");
//                        return false;
//        } else if ($("#IdSenaFun").val() == "") {
//                        $("#IdSenaFun").focus().after("<div class='remove'><font color='red'>ingrese una ip</font></div>");
//                        return false;
//        } else if ($("#CaargoFun").val() == "") {
//                        $("#CaargoFun").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
//                        return false;
//        }
//        });
//
//        $("#CorreoFun").keyup(function () {
//                if ($(this).val() != "" && emailreg.test($(this).val())) {
//                        $(".error").fadeOut();
//                        return false;
//                }
//        });

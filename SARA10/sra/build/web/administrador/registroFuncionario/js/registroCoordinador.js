$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("RegistroFuncionario", selector);
    ob.Vivo("RegistroFuncionario");
    jso[0] = ['Crud_Controller1', '[{opcion:5,tabla:10,datos:[],delimitador:[],elegir:["2","3"],id:0,opSelect:4}]'];
    selector[0] = $("#centroFormacion");
    jso[1] = ['Crud_Controller1', '[{opcion:3,tabla:25,datos:[],delimitador:[],elegir:["0","1"],id:0,opSelect:4}]'];
    selector[1] = $("#tipoUsuario");
    jso[2] = ['Crud_Controller1', '[{opcion:3,tabla:28,datos:[],delimitador:[],elegir:[],id:0,opSelect:1}]'];
    selector[2] = $("#tipoIdenti");
    datos[0] = {nombre: "Select", worker: true};
    ajax(0, datos[0]);

    $("#centroFormacion").change(function () {
        $("#area").empty().append("<option selected='selected'>selecciona...</option>");
        var objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["0", "1"],
            delimitador: "[{colum:2 ,operador:0 ,valor1:" + $("#centroFormacion").val() + "}]", id: 0, opSelect: 6};
        selector = $("#area");
        ob.ajax(objet, selector);
    });

    $("#boton1").on('click', function () { 
        jso[3] = ['Funcionario_Controller', "[{opcion:1,datos:['" + $("#tipoUsuario").val() + "','" + $("#tipoIdenti").val() + "','" + $("#numeroIdentificacion").val() + "','" + $("#nombre").val() + "','" + $("#apellido").val() + "','" + $("#email").val() + "','" + $("#cargo").val() + "','" + $("#ipSena").val() +"','1','" + $("#centroFormacion").val() + "','" + $("#area").val() + "']}]"];
        
        datos[1] = {nombre: "btn", worker: true};
        $("#boton1").attr("disabled", true);
        ajax(3, datos[1]);

    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
    function peticionCompleta(i, datos) {
        if ((i < 2) && (datos.nombre == "Select")) {
            i++;
            ajax(i, datos);
        } else if (datos.nombre == "btn") {
            $("#formulario1 :input").val("");
            $("#area").empty().append("<option selected='selected'>selecciona...</option>");
            $("#boton1").attr("disabled", false);
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
//    
//          var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
//    $("#boton1").click(function (){
//	
//    $(".remove").remove();
//        if( $("#tipoUsuario").val(AS) == "" ){
//            $("#tipoUsuario").focus().after("<div class='remove'><font color='red'>digite el nombre</font><div>");
//            return false;
//        
//    }else if( $("#nombre").val() == ""){
//            $("#nombre").focus().after("<div class='remove'><font color='red'>Ingrese un apellido</font></div>");
//            return false;
//		}else if( $("#apellido").val() == "" ){
//            $("#apellido").focus().after("<div class='remove'><font color='red'>seleccione una opcion</font></div>");
//            return false;
//		}else if( $("#tipoIdenti").val() == "" ){
//            $("#tipoIdenti").focus().after("<div class='remove'><font color='red'>ingrese su numero de identificacion</font></div>");
//            return false;
//		}else if( $("#numeroIdentificacion").val() == "" ){
//            $("#numeroIdentificacion").focus().after("<div class='remove'><font color='red'>ingrese su numero de funsionario</font></div>");
//            return false;
//		}else if( $("#email").val() == "" || !emailreg.test($("#email").val()) ){
//            $("#email").focus().after("<div class='remove'><font color='red'>Ingrese un email correcto</font></div>");
//            return false;
//		}else if( $("#centroFormacion").val(AB) == "" ){
//            $("#centroFormacion").focus().after("<div class='remove'><font color='red'>ingrese una ip</font></div>");
//            return false;
//		}else if( $("#area").val(AA) == "" ){
//            $("#area").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
//            return false;
//			}else if( $("#ipSena").val() == "" ){
//            $("#ipSena").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
//            return false;
//			}else if( $("#cargo").val() == "" ){
//            $("#cargo").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
//            return false;
//			}
//
//
//
//
//    });
//
//    $("#email").keyup(function(){
//        if( $(this).val() != "" && emailreg.test($(this).val())){
//            $(".error").fadeOut();
//            return false;
//        }
//    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
    function peticionCompleta(i, datos) {
        if ((i < 2) && (datos.nombre == "Select")) {
            i++;
            ajax(i, datos);
        } else if (datos.nombre == "btn") {
            $("#formulario1 :input").val("");
            $("#area").empty().append("<option selected='selected'>selecciona...</option>");
            //$("#boton1").attr("disabled", false);
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});
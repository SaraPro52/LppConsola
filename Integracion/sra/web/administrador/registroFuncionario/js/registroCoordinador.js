$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("RegistroFuncionario", selector);
    ob.Vivo("RegistroFuncionario");
    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:10,datos:[],delimitador:[],elegir:["2","3"],id:0,opSelect:4}]'];
    selector[0] = $("#centroFormacion");
    jso[1] = ['Crud_Controller', '[{opcion:3,tabla:25,datos:[],delimitador:[],elegir:["0","1"],id:0,opSelect:4}]'];
    selector[1] = $("#tipoUsuario");
    jso[2] = ['Crud_Controller', '[{opcion:3,tabla:28,datos:[],delimitador:[],elegir:[],id:0,opSelect:1}]'];
    selector[2] = $("#tipoIdenti");
    datos[0] = {nombre: "Select", worker: true};
    ajax(0, datos[0]);
    
    $("#centroFormacion").change(function () {
        $("#area").empty().append("<option selected='selected'>selecciona...</option>");
        jso[4] = ['Crud_Controller', '[{opcion:5,tabla:10,datos:[],elegir:[0,1],delimitador:"[{colum:2 ,operador:0 ,valor1:'+$("#centroFormacion").val()+'}]",id:0,opSelect:6}]'];
        selector[4] = $("#area");
        datos[4] = {nombre: "Select", worker: true};
        ajax(4, datos[4]); 
    });

    
          
    $("#boton1").click(function (){
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var selec = $(".select");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        for (var i = 0; i < selec.length; i++) {
            console.log(selec[i]);
            if (selec[i].value == "AD") {
                selet = $(selec[i]);
                selet.focus().after("<div class='remove'><font color='red'>seleccione una opcion</font><div>");
            } else {
                boo++;
            }
        }

        if (boo == 10) {
           boton1();
        }
        
    });

        function boton1() {
        jso[3] = ['Funcionario_Controller', "[{opcion:1,datos:['" + $("#tipoUsuario").val() + "','" + $("#tipoIdenti").val() + "','" + $("#numeroIdentificacion").val() + "','" + $("#nombre").val() + "','" + $("#apellido").val() + "','" + $("#email").val() + "','" + $("#cargo").val() + "','" + $("#ipSena").val() +"','1','" + $("#centroFormacion").val() + "','" + $("#area").val() + "']}]"];
        datos[1] = {nombre: "btn", worker: true};
        $("#boton1").attr("disabled", true);
        ajax(3, datos[1]);

    }
        
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
$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrayAreas = [], arrayTemas = [], mensaje = "El programa ";
    var ob = new $.Luna("Select", $("#SelecCentro"));
    $(".Mult").hide();
    ob.Vivo("Programa");
    jso[0] = ['Crud_Controller', '[{opcion:3,delimitador:[],tabla:5,datos:[],elegir:[0,2],id:0,opSelect:4}]'];
    selector[0] = $("#SelecCentro");
    datos[0] = {nombre: "Select", worker: true};
    ajax(0, datos[0]);
    $("#SelecCentro").change(function () {
        $(".Mult").show();
        if ($("#SelecCentro").val() != "A0") {
            jso[1] = ['Crud_Controller', '[{opcion:5,tabla:10,elegir:[0,1],\n\
                delimitador:"[{colum:2,operador:0,valor1:' + $("#SelecCentro").val() + '}]",id:0,opSelect:6}]'];
            selector[1] = $("#MultAreas");
            datos[1] = {nombre: "MultiSelect", worker: true};
            ajax(1, datos[1]);
        }
    });

    $("#MultAreas").multiSelect({
        afterSelect: function (valor) {
            arrayAreas.push(valor);
        },
        afterDeselect: function (val) {
            var buscando = $.inArray(val, arrayTemas);
            arrayAreas.splice(buscando, 1);
        }
    });
    $("#MultTemas").multiSelect({
        afterSelect: function (valor) {
            arrayTemas.push(valor);
        },
        afterDeselect: function (val) {
            var buscando = $.inArray(val, arrayTemas);
            arrayTemas.splice(buscando, 1);
        }
    });

    $("#btnPrograma").click(function () {
            
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

        if (boo == 3) {
            
            btnprograma();
        }

    
    });

    function btnprograma() {
        mensaje = $("#nomPro").val();
        jso[3] = ['Programa_Controller', '[{opcion:1,infoP:["","' + $("#nomPro").val() + '","' + $("#nivel").val() + '"],areas:[' + arrayAreas + '],temas:[' + arrayTemas + ']}]'];
        datos[3] = {nombre: "btn", worker: true};
        ajax(3, datos[3]);

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
        if (i == 1) {
            $(".Mult").show();
        } else if (i == 0) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla:27,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#MultTemas");
            datos[2] = {nombre: "MultiSelect", worker: true};
            ajax(2, datos[2]);
        } else if (i == 3) {
            $.notify({
                icon: 'ti-gift',
                message: mensaje + " " + data[i] +"."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
})
function calificarPV(idLista) {
    var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [];

    $("#iFecha").datepicker();

    $("#clone").hide();
    var ob = new $.Luna("Producto virtual", $("#divContainer"));
    ob.Vivo("CalificarOA");
    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:15,datos:[],elegir:[0,1,4],delimitador:"[{colum:3,operador:0,valor1:' + idLista + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#divContainer");
    datos[0] = {nombre: "calificar", worker: true};
    ajax(0, datos[0]);

    $("#btnEvaluar").click(function () {
        console.log("as");
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        if (boo == 4) {
            console.log("HH");
            //btnEvaluar(this);
        }
    });

    var options = {
        beforeSend: function () {
            $("#progressbox").show();
            $("#progressbar").width('0%');
            $("#message").empty();
            $("#percent").html("0%");
        },
        uploadProgress: function (event, position, total, percentComplete) {
            $("#progressbar").width(percentComplete + '%');
            $("#percent").html(percentComplete + '%');
            if ((percentComplete > 1) && (percentComplete < 101)) {
                $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
            }

        },
        success: function () {
            //Peticion para guardar la correcion en bd
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn", worker: true};
            console.log(jso[5]);
            ajax(5, datos[5]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);

    function btnEvaluar(ele) {
        var campo = "";
        var infoItems = [];
        $("input:checkbox:checked").each(function () {
            campo = $(ele).val();
            if (campo !== "on") {
                infoItems.push("1¤" + $("#" + campo).val() + "¤" + campo);
            }
        });
        $("input:checkbox:not(:checked)").each(function () {
            campo = $(ele).val();
            if (campo !== "on") {
                infoItems.push("0¤" + $("#" + campo).val() + "¤" + campo);
            }
        });
        var resultado = 3;
        if ($(".Resultado").is(':checked')) {
            resultado = 1;
        } else if ($(".Resultado1").is(':checked')) {
            resultado = 0;
        }
        jso[1] = ['EvaluacionGeneral_Controller', '[{opcion:1,idNoti:0,infoEva:["' + $("#areaObservacion").val() + '","' + resultado + '","' + idVersion + '","' + idLista + '","' + idUser + '","' + $("#iFecha").val() + '"],infoItem:[' + infoItems + ']}]'];
        selector[1] = null;
        datos[1] = {nombre: "btn", worker: true};
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
        if (i == 1) {
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
}
    
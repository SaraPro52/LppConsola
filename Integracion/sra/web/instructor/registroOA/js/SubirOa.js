$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], nombre = "";
    var ob = new $.Luna("AutoComplet", "Null");
    ob.Vivo("SubirOA2");

    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:13,datos:[],elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#Titulo_Publicacion");
    datos[0] = {nombre: "AutoComplet", worker: true};
    ajax(0, datos[0]);

    var arraySelecionAutor = [];
    $('#SelectAutores').multiSelect({
        afterSelect: function (valor) {
            arraySelecionAutor.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionAutor);
            arraySelecionAutor.splice(busqueda, 1);
        }
    });

    $("#formato").hover(function () {
    });
    var arraySelecionCate = [];
    $('#SelectCategoria').multiSelect({
        afterSelect: function (valor) {
            arraySelecionCate.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionCate);
            arraySelecionCate.splice(busqueda, 1);
        }
    });
    var arraySelecionEstr = [];
    $('#SelectEstrutura').multiSelect({
        afterSelect: function (valor) {
            arraySelecionEstr.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionEstr);
            arraySelecionEstr.splice(busqueda, 1);
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
            if (percentComplete > 50) {
                $("#message").html("<font color='red'>El archivo se esta subiendo</font>");
            }
        },
        success: function () {
            $("#progressbar").width('100 %');
            $("#percent").html('100 %');
            console.log("s");
            var arrayAutor = "";
            var arrayTemas = [];
            for (var i = 0; i < arraySelecionAutor.length; i++) {
                if (i == 0) {
                    arrayAutor = idUser + "," + arraySelecionAutor[i];
                } else {
                    arrayAutor = arrayAutor + "," + (arraySelecionAutor[i]);
                }
            }
            for (var i = 0; i < arraySelecionEstr.length; i++) {
                arrayTemas.push(arraySelecionEstr[i] + "-0");
            }
            for (var i = 0; i < arraySelecionCate.length; i++) {
                arrayTemas.push(arraySelecionCate[i] + "-1");
            }
            jso[5] = ['ProductoVirtual_Controller','[{opcion:1,info:['+$("#Titulo_Publicacion").val()+','+$("#descripcion_oa").val()+','+$("#palabras_claves").val()+','+$("#formato").val()+',0,0,'+ $("#instrucciones").val()+','+$("#requisitos_instalacion").val()+'],arrayFun:['+arrayAutor+'],arrayTemas:['+arrayTemas+'],archivoNom:'+$("#myfile").val()+'}]'];
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
            jso[1] = ['Crud_Controller', '[{arr:0,opcion:5,tabla:7,datos:[],elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:' + idCentro + ',añadir:0},{colum:4,operador:7,valor1:' + idUser + ',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]",id:0,opSelect:4}]'];
            selector[1] = $("#SelectAutores");
            datos[1] = {nombre: "MultiSelect", worker: true};
            ajax(1, datos[1]);
        } else if (i == 1) {
            jso[2] = ['Crud_Controller', '[{opcion:3,delimitador:[],tabla:17,datos:[],elegir:[0,1],id:0,opSelect:4}]'];
            selector[2] = $("#formato");
            datos[2] = {nombre: "Select", worker: true};
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:5,delimitador:[],tabla:4,datos:[],elegir:[6,7],id:0,opSelect:4}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "MultiSelect", worker: true};
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[4] = ['Crud_Controller', '[{opcion:5,tabla:18,datos:[],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:1}]",id:0,opSelect:4}]'];
            selector[4] = $("#SelectEstrutura");
            datos[4] = {nombre: "MultiSelect", worker: true};
            ajax(4, datos[4]);
        } else if (i == 5) {
            $.notify({
                icon: 'ti-gift',
                message: data[5] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});
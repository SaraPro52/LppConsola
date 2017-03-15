$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("producto", $("#tablaActualizacion"));
    ob.Vivo("Actualizar");
    $("#contenedor").show();
    $("#formularioss").hide();
    //Peticion para obtener los productos virtuales o versiones a realizar una actualizacion
    jso[0] = ['Version_Controller', '[{opcion:1,idFun:'+idUser+'}]'];
    selector[0] = $("#tablaActualizacion");
    datos[0] = {nombre: "actualizacion"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);

    $(document).on('click', '.btnActualizar', function (e) {
        //actualizaion
        jso[6] = ['Crud_Controller', '[{opcion:5,tabla:17,datos:[],elegir:[4,5,6],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},{colum:8,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:9,operador:0,valor1:2}]",id:0,opSelect:6}]'];
        selector[6] = "btn";
        datos[0] = {nombre: "actualizacionP"};
        ob.TablaEspa(selector[0]);
        ajax(6, datos[6]);
    });

    var options = {
        beforeSend: function () {
            $("#progressbox").show();
            s
            $("#progressbar").width('0%');
            $("#message").empty();
            $("#percent").html("0%");
        }, uploadProgress: function (event, position, total, percentComplete) {
            $("#progressbar").width(percentComplete + '%');
            $("#percent").html(percentComplete + '%');
            if ((percentComplete > 1) && (percentComplete < 101)) {
                $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
            }
        }, success: function () {
            $("#contenedor").show();
            $("#formularioss").hide();
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn"};
            console.log(jso[5]);
            ajax(5, datos[5]);
        }, error: function () {
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
        if (i == 6) {
            jso[1] = ['Crud_Controller', '[{arr:0,opcion:5,tabla:7,datos:[],elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:' + idCentro + ',añadir:0},{colum:4,operador:7,valor1:' + idUser + ',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]",id:0,opSelect:4}]'];
            selector[1] = $("#SelectAutores");
            datos[1] = {nombre: "MultiSelect"};
            ajax(1, datos[1]);
        } else if (i == 1) {
            jso[2] = ['Crud_Controller', '[{opcion:3,delimitador:[],tabla:17,datos:[],elegir:[0,1],id:0,opSelect:4}]'];
            selector[2] = $("#formato");
            datos[2] = {nombre: "Select"};
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:5,delimitador:[],tabla:4,datos:[],elegir:[6,7],id:0,opSelect:4}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "MultiSelect"};
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[4] = ['Crud_Controller', '[{opcion:5,tabla:18,datos:[],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:1}]",id:0,opSelect:4}]'];
            selector[4] = $("#SelectEstrutura");
            datos[4] = {nombre: "MultiSelect"};
            ajax(4, datos[4]);
        }
    }
});


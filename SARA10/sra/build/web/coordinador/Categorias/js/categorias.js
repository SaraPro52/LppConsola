$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], nombre = "";
    $('#myModal').modal('hide');
    var arraySelecion = [];
    var ob = new $.Luna("MultiSelect", $("#SelectTemas"));
    ob.Vivo("Categorias");
    jso[0] = ['Crud_Controller1', '[{opcion:3,tabla:27,datos:[],elegir:[0,1],id:0,opSelect:4,delimitador:[]}]'];
    selector[0] = $("#SelectTemas");
    datos[0] = {nombre: "MultiSelect", worker: true};
    ajax(0, datos[0]);

    $("#btnTema").click(function () {
        jso[1] = ['Crud_Controller1', '[{opcion:1,tabla:27,delimitador:[],datos:["",' + $("#NombreTema").val() + ',' + $("#DescripcionTema").val() + ',1],elegir:[0,1],id:0,opSelect:4}]'];
        selector[1] = $("#SelectTemas");
        datos[1] = {nombre: "MultiSelect", opt: "Div", worker: true};
        nombre = $("#NombreTema").val();
        ajax(1, datos[1]);
    });

    $('#SelectTemas').multiSelect({
        afterSelect: function (valor) {
            arraySelecion.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });

    $("#btnCategoria").click(function () {
        var arrayS = [];
        for (var j = 0; j < arraySelecion.length; j++) {
            if (j == 0) {
                arrayS = "" + arraySelecion[j];
            } else {
                arrayS = arrayS + "," + arraySelecion[j];
            }
        }
        jso[2] = ['Categoria_Controller', '[{opcion:1,catego:[' + $("#NombreCategoria").val() + ',' + $("#DescripcionCategoria").val() + ',2],temas:arrayS}]'];
        datos[2] = {nombre: "btn", worker: true};
        nombre = $("#NombreTema").val();
        ajax(2, datos[2]);

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
        if ((i == 1) || (i == 2)) {
            men = data[i];
            $.notify({ 
                icon: 'ti-gift',
                message: men + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});


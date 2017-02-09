$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "";
    $('#myModal').modal('hide');
    var arraySelecion = [];
    var ob = new $.Luna("MultiSelect", $("#SelectTemas"));
    ob.Vivo("Categorias");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:27,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#SelectTemas");
    datos[0] = {nombre: "MultiSelect", worker: true};
    ajax(0, datos[0]);

    $("#btnTema").click(function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        } 
        if (boo == 2) {
            BtnTema();
        }
    });

    function BtnTema() {
        men = $("#NombreTema").val();
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:27,tabla2:27,tipo:1,datos:["",' + $("#NombreTema").val() + ',' + $("#DescripcionTema").val() + ',1],elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
        selector[1] = $("#SelectTemas");
        datos[1] = {nombre: "MultiSelect", opt: "Div", worker: true};
        ajax(1, datos[1]);

    }

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
        $(".remove").remove();
        var coo = 0;
        var inputs = $(".inputsC");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                coo++;
            }
        }
        if (coo == 2) {
            BtnCate();
        }
    });

    function BtnCate() {
        men = $("#NombreCategoria").val();
        jso[2] = ['Categoria_Controller', '[{opcion:1,catego:["' + $("#NombreCategoria").val() + '","' + $("#DescripcionCategoria").val() + '",' + idUser + '],temas:[' + arraySelecion + ']}]'];
        datos[2] = {nombre: "btn", worker: true};
        ajax(2, datos[2]);
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
            if (data[0].length < data[1].length) {
                men = "El tema: " + men + " fue agregado exitosamente";
                estado = ("success");
            } else if (data[0].length == data[1].length) {
                men = "El tema: " + men + " no fue agregado exitosamente";
                estado = ("error");
            }
            $.notify(men, estado);
        } else if (i == 2) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La categoria " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        }
    }

});


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
           if ($("#NombreTema").val() == "") {
                        $("#NombreTema").focus().after("<div class='remove'><font color='red'>digita el nombre del tema</font><div>");
                        return false;
            } else if ($("#DescripcionTema").val() == "") {
                        $("#DescripcionTema").focus().after("<div class='remove'><font color='red'>digita la decripcion del tema</font></div>");
                        return false;
        }


        unio();

    });

    function unio() {

        nombre = $("#NombreTema").val();
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

        console.log("vivieee");
        $(".remove").remove();
           if ($("#NombreCategoria").val() == "") {
                        $("#NombreCategoria").focus().after("<div class='remove'><font color='red'>digita el nombre del tema</font><div>");
                        return false;
            } else if ($("#DescripcionCategoria").val() == "") {
                        $("#DescripcionCategoria").focus().after("<div class='remove'><font color='red'>digita la decripcion del tema</font></div>");
                        return false;
        }
        estr();
    });

    function estr() {
        men=$("#NombreCategoria").val();
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
                men = "El item: " + nombre + " fue agregado exitosamente";
                estado = ("success");
            } else if (data[0].length == data[1].length) {
                men = "El item: " + nombre + " no fue agregado exitosamente";
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
                men = daMen;
            }
            $.notify(men, estado);
        }
    }

});


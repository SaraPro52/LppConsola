function listaChequeo(idTipoItem, idUser) {
    var selector = [], hilo = [], jso = [], data = [], datos = [], men = "", estado = "";
    var ob = new $.Luna("MultiItems", $("#SelectItem"));
    ob.Vivo("ListaDeChequeo1");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:19,tipo:1,elegir:[0,1],delimitador:"[{colum: 2,operador: 0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#SelectItem");
    datos[0] = {nombre: "MultiSelect", worker: true};
    ajax(0, datos[0]);
    var arraySelecion = [];
    $('#SelectItem').multiSelect({
        afterSelect: function (valor) {
            arraySelecion.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });
    $("#BtnLista").on('click', function () {
        $(".remove").remove();
                if ($("#NombreL").val() == "") {
                        $("#NombreL").focus().after("<div class='remove'><font color='red'>diguita nombre de lista</font><div>");
                        return false;
        
            } else if ($("#DescripcionL").val() == "") {
                        $("#DescripcionL").focus().after("<div class='remove'><font color='red'>diguita descripcon de lista</font></div>");
                        return false;
        }
        tre();
    });

    function tre() {

        var arrayS = [];
        for (var j = 0; j < arraySelecion.length; j++) {
            if (j == 0) {
                arrayS = "" + arraySelecion[j];
            } else {
                arrayS = arrayS + "," + arraySelecion[j];
            }
        }
        men = $("#NombreL").val();
        jso[2] = ['ListaChequeo_Controller', '[{opcion:1,lista:[' + $("#NombreL").val() + ',' + $("#DescripcionL").val() + ',' + idUser + '],items:[' + arrayS + ']}]'];
        datos[2] = {nombre: "btn", worker: true};
        ajax(2, datos[2]);
    }

    $("#btnItem").on('click', function () {

        $(".remove").remove();
        if ($("#Descripcion").val() == "") {
                        $("#Descripcion").focus().after("<div class='remove'><font color='red'>diguita descripcion</font></div>");
                        return false;
        }

        greek();
    });

    function  greek() {
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:19,tabla2:19,tipo:1,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        selector[1] = $("#SelectItem");
        datos[1] = {nombre: "MultiSelect", worker: true, opt: "Div"};
        ajax(1, datos[1]);
    }

    function ajax(i, datos) {
        console.log(i);
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
            if (i == 1) {
                if (data[0].length < data[1].length) {
                    men = "El item " + $("#Descripcion").val() + " fue agregado exitosamente";
                    estado = ("success");
                } else if (data[0].length == data[1].length) {
                    men = "El item: " + $("#Descripcion").val() + " no fue agregado exitosamente";
                    estado = ("error");
                }
                $.notify(men, estado);
            }
            if (i == 2) {
                var daMen = data[i].split("$$");
                if (daMen[0] == "true") {
                    estado = ("success");
                    men = "La lista  " + men + " " + daMen[1];
                } else {
                    estado = ("error");
                    men = daMen;
                }
                $.notify(men, estado);
            }
        }
    }
}
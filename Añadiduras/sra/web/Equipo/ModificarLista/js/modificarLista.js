function modificar(idTipoItem) {
    var jso = [], selector = [], hilo = [], data = [], ww = "", multi = [], arraySelecion = [], Lista = -8, men = "", men1 = "", estado = "";
    $(".EspacioItems").hide();
    $("#tablaItems").hide();
    var ob = new $.Luna("Lista", $("#tablalista"));
    ob.Vivo("ModificarListaDeChequeo");
    jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:12,tipo:2,elegir:[0,1,2,3],delimitador: "[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
    var datos = {nombre: "Lista", worker: true};
    selector[2] = $("#tablalista");
    ob.TablaEspa(selector[2]);
    ajax(2, datos);
    $("#btnItem").on('click', function () {
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
        if (boo == 1) {
            BtnItem();
        }
    });

    function BtnItem() {
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:19,tabla2:19,tipo:1,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        var datos = {nombre: "MultiSelects", worker: true, opt: "Div"};
        selector[1] = $("#SelectItem");
        men = $("#Descripcion").val();
        ajax(1, datos);
    }
    $(document).on('click', '.btnclick', function (e) {
        $(".EspacioItems").show();
        $("#CompoLista").hide();
        var s = [];
        var dat = $(this).val();
        s = dat.split("$$$");
        $("#NombreL").val(s[0]);
        $("#DescripcionL").val(s[1]);
        jso[0] = ['Crud_Controller', '[{opcion:3, tabla2: 15,tipo:2, elegir:[0,1],delimitador: "[{colum:3,operador:0,valor1:' + this.id + ',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id: 0, opSelect: 6}]'];
        var datos = {nombre: "btn", worker: true};
        selector[0] = "null";
        Lista = this.id;
        ajax(0, datos);
    });


    $('#SelectItem').multiSelect({
        afterSelect: function (valor) {
            arraySelecion.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });
    $("#BtnLista").click(function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs1");
        var input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        if (boo == 2) {
            BtnLista();
        }
    });

    function BtnLista() {
        jso[5] = ['ListaChequeo_Controller', '[{opcion: 2,mLista:["' + Lista + '","' + $("#NombreL").val() + '","' + $("#DescripcionL").val() + '"],mItems:[' + arraySelecion + ']}]'];
        datos[5] = {nombre: "btn", worker: true};
        men1 = $("#NombreL").val();
        ajax(5, datos[5]);
    }

    function ajax(i, datos) {
        try {
            hilo[i] = new Worker("js/worker.js");
            hilo[i].postMessage(jso[i]);
            hilo[i].onmessage = function (event) {
                data[i] = event.data;
                ob.cargarTabla(data[i], selector[i], datos);
                if (i != 5) {
                    data[i] = jQuery.parseJSON(event.data);
                }
                hilo[i].terminate();
                peticionCompleta(i, data[i]);
            };
        } catch (error) {
            console.log(error);
        }
    }
    function peticionCompleta(i, daos) {
        if (i == 0) {
            var p = "";
            for (var f = 0; f < daos.length; f++) {
                p = '</br> <label class=' + daos[f].Id_Item_Lista + '>' + f + "  " + daos[f].Des_Item_Lista + '</label>';
                $("#campoItemsDatos").append(p);
                if ((daos[f] == daos[0])) {
                    ww = daos[f].Id_Item_Lista;
                } else {
                    ww = ww + ',' + daos[f].Id_Item_Lista;
                }
            }
            jso[3] = ['Crud_Controller', '[{opcion: 3,tabla2:19,tipo:1,elegir: [0,1],delimitador:"[{colum:0,operador:7,valor1:' + ww + ',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id:0,opSelect:6}]'];
            selector[3] = $("#SelectItem");
            datos[3] = {nombre: "MultiSelect", worker: true};
            selector[3].multiSelect();
            ajax(3, datos[3]);
        } else if (i == 1) {
            if (data[0].length == data[i].length) {
                men = "El item " + men + " no se ingreso.";
                estado = ("error");
            } else if (data[0].length < data[i].length) {
                men = "El item " + men + " se ingreso correctamente";
                estado = ("success");
            }
            $.notify(men, estado);
        } else if (i == 5) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La lista " + men1 + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        }
    }
}
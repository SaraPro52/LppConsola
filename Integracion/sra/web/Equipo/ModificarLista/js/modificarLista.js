function modificar(idTipoItem) {
    var jso = [], selector = [], hilo = [], data = [], ww = "", multi = [], arraySelecion = [];
    $(".EspacioItems").hide();
    $("#tablaItems").hide(); 
    var ob = new $.Luna("Lista", $("#tablalista"));
    ob.Vivo("ModificarListaDeChequeo");
    jso[2] = ['Crud_Controller', '[{opcion:5,tabla:12,datos:[],elegir:[0,1,2,3],delimitador: "[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
    var datos = {nombre: "Lista", worker: true};
    selector[2] = $("#tablalista");
    ob.TablaEspa(selector[2]);
    ajax(2, datos);
    $("#btnItem").on('click', function () {
        jso[1] = ['Crud_Controller1', '[{opcion:1,tabla:19,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        var datos = {nombre: "MultiSelects", worker: true, opt: "Div"};
        selector[1] = $("#SelectItem");
        ajax(1, datos);
    });
    $(document).on('click', '.btnclick', function (e) {
        $(".EspacioItems").show();
        $("#CompoLista").hide();
        var s = [];
        var dat = $(this).val();
        s = dat.split("$$$");
        $("#NombreL").val(s[0]);
        $("#DescripcionL").val(s[1]);
        jso[0] = ['Crud_Controller', '[{opcion: 5, tabla: "15", elegir: ["0", "1"], datos:"[]",delimitador: "[{colum:3,operador:0,valor1:' + this.id + ',aÃ±adir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id: 0, opSelect: 6}]'];
        var datos = {nombre: "MultiSelects", worker: true};
        selector[0] = $("#SelectItem");
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
        //Array de items arraySelecion
        jso[0] = ['Crud_Controller', '[{opcion: 5, tabla: "15", elegir: ["0", "1"], datos:"[]",delimitador: "[{colum:3,operador:0,valor1:' + this.id + ',aÃ±adir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id: 0, opSelect: 6}]'];
    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            data[i] = jQuery.parseJSON(event.data);
            hilo[i].terminate();
            peticionCompleta(i, data[i]);
        };
    }
    function peticionCompleta(i, daos) {
        if (i == 0) {
            var p = "";
            for (var f = 0; f < daos.length; f++) {
                if ((daos.length == 0) || (daos.length - 1 == f)) {
                    ww = daos[f].Id_Item_Lista;
                }
                if ((daos.length > 1) && (i < daos.length - 1)) {
                    ww = daos[f].Id_Item_Lista + ',';
                }
                multi.push({Id_Item_Lista: daos[f].Id_Item_Lista, Des_Item_Lista: daos[f].Des_Item_Lista});
                p = '</br> <label>' + i + "  " + [f].Des_Item_Lista + '</label>';
                $("#campoItemsDatos").append(p);
            }
            jso[3] = ['Crud_Controller1', '[{opcion: 3,tabla: "19",elegir: ["0", "1"],datos:"[]" ,delimitador: "[{colum:0,operador:7,valor1:' + ww + ',aÃ±adir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id:0,opSelect:6}]'];
            selector[3] = $("#SelectItem");
            datos[3] = {nombre: "MultiSelect", worker: true};
            selector[3].multiSelect();
            ajax(3, datos[3]);
        }
    }
}
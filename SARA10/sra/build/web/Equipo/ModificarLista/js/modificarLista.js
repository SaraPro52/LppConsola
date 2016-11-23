function modificar(idTipoItem) {
    var jso = [], selector = [], hilo = [], data = [], ww = "", multi = [];
    $(".EspacioItems").hide();
    $("#tablaItems").hide();
    selector = $("#tablalista");
    var objet = {opcion: 5, nombre: "Lista", url: "Crud_Controller", tabla: "12", datos: [""], elegir: ["0", "1", "2", "3"],
        delimitador: "[{'colum':'5','operador':'0' ,'valor1':" + idRol + "}]", id: 0, opSelect: 6};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("ModificarListaDeChequeo");
    var view = $("#lista");
    ob.tipoUsuario($("#vista").val(), view);
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);

    $("#btnItem").on('click', function () {
        var objeto = {opcion: 1, nombre: "MultiSelect", opt: "Div",
            url: "Crud_Controller", tabla: "19", datos: ["", $("#Descripcion").val(), idTipoItem], elegir: ["0", "1"],
            delimitador: "[{colum:2,operador:0,valor1:" + idTipoItem + "}]", id: 0, opSelect: 6};
        ob.ajax(objeto, selector);
    });
    $(document).on('click', '.btnclick', function (e) {
        $(".EspacioItems").show();
        $("#CompoLista").hide();
        var s = [];
        var dat = $(this).val();
        s = dat.split("$$$");
        $("#NombreL").val(s[0]);
        $("#DescripcionL").val(s[1]);
        jso[0] = ['Crud_Controller', '[{opcion: 5, tabla: "15", elegir: ["0", "1"], datos:"[]",delimitador: "[{colum:3,operador:0,valor1:' + this.id + ',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id: 0, opSelect: 6}]'];
        var datos = {nombre: "MultiSelects", worker: true};
        selector[0] = $("#SelectItem");
        ajax(0, datos);
    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            var json2 = jQuery.parseJSON(event.data);
            console.log(json2);
            for (var q = 0; q < json2; q++) {
                data[i].push(json2[q]);
            }
            console.log(data[i]);
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, data[i]);
        };
    }
    function peticionCompleta(i, data) {
        if (i == 0) {
            var json1 = jQuery.parseJSON(data);
            for (var i = 0; i < json1.length; i++) {
                if (json1.length == 1) {
                    ww = json1[i].Id_Item_Lista;
                }
                if ((i == 0) && (jso.length > 1) && (i < jso.length - 1)) {
                    ww = json1[i].Id_Item_Lista + ',';
                }
                multi.push(json1[i].Id_Item_Lista);
                data[1] = json1[i];
            }
            jso[1] = ['Crud_Controller', '[{opcion: 3,tabla: "19",elegir: ["0", "1"],datos:"[]" ,delimitador: "[{colum:0,operador:7,valor1:' + ww + ',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id:0,opSelect:6}]'];
            selector[1] = $("#SelectItem");
            datos = {nombre: "MultiSelect", worker: true};
            ajax(1, datos);
            selector[1].multiSelect('select', multi);
        }
    }
}
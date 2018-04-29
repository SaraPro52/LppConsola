function modificar(idTipoItem) {
    var jso = [], selector = [], hilo = [], data = [], ww = "", arraySelecion = [], Lista = -8, men = "", men1 = "", estado = "", arrItemsC = [], arrItems = [];
    $(".EspacioItems").hide();
    $("#tablaItems").hide();
    var ob = new $.Luna("Lista(s)", $("#tablalista"));
    ob.Vivo("ModificarListaDeChequeo");

    //23/04/2017
    //jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:12,tipo:2,elegir:[0,1,2,3],delimitador: "[{colum:4,operador:0,valor1:' + idUser + ',añadir:0},{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
    jso[2] = ['ListaChequeo_Controller', '[{opcion:5,idUser:'+idUser+',idRol:'+idRol+'}]']; //24/04/2017
    var datos = {nombre: "Lista", worker: true};
    selector[2] = $("#tablalista");
    ob.TablaEspa(selector[2]);
    ajax(2, datos);

    $('.itemselect').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un item...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un item...'>",
        afterInit: function (ms) {
            var that = this,
                    $selectableSearch = that.$selectableUl.prev(),
                    $selectionSearch = that.$selectionUl.prev(),
                    selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                    selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

            that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                    .on('keydown', function (e) {
                        if (e.which === 40) {
                            that.$selectableUl.focus();
                            return false;
                        }
                    });

            that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                    .on('keydown', function (e) {
                        if (e.which == 40) {
                            that.$selectionUl.focus();
                            return false;
                        }
                    });
        },
        afterSelect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            arraySelecion.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });

    $(document).on('click', '.btnclick', function (e) {
        $(".EspacioItems").show();
        $("#CompoLista").hide();
        var s = [];
        var dat = $(this).val();
        s = dat.split("$$$");
        $("#NombreL").val(s[0]);
        $("#DescripcionL").val(s[1]);
        //Retorna 
        //"Des_Item_Lista": 
        //"tipo": 1 o 0 -> 1: items relacionados con la lista. 0: Items no relacionados con la lista
        //(todos estan en un solo array de objetos, para que se separen por el valor de tipo, 
        //lledo cada conjunto a una columna diferente del multiselect)
        //"Id_Item_Lista": 
        //23/04/2017
        jso[0] = ['ListaChequeo_Controller', '[{opcion:3,lista:' + this.id + ',tipoItem:' + idTipoItem + '}]'];
        var datos = {nombre: "btn"};
        selector[0] = "null";
        Lista = this.id;
        ajax(0, datos);
    });

    $("#btnItem").click(function () {
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
        if (boo == 1) {
            BtnItem();
        }
    });

    function  BtnItem() {
        //jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:19,tabla2:19,tipo:1,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        //20/04/2017
        jso[1] = ['ListaChequeo_Controller', '[{opcion:4,datosItem:[' + $("#Descripcion").val() + ',' + idTipoItem + ']}]'];
        selector[1] = $("#SelectItem");
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
    }

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
        //Modificar lista, retorna los registros de las listas ha modificar
         //24/04/2017
        jso[5] = ['ListaChequeo_Controller', '[{opcion:2,idUser:'+idUser+',idRol:'+idRol+',mLista:["' + Lista + '","' + $("#NombreL").val() + '","' + $("#DescripcionL").val() + '"],mItems:[' + arraySelecion + ']}]'];
        datos[5] = {nombre: "btn"};
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
                if ( (i != 5)&& (i!=1 )) {
                    data[i] = jQuery.parseJSON(event.data);
                }
                hilo[i].terminate();
                peticionCompleta(i);
            };
        } catch (error) {
            console.log(error);
        }
    }
    function peticionCompleta(i) {
        if (i == 0) {
            var js = data[i];
            $("#SelectItem").empty();
            datos[3] = {nombre: "MultiselectLista"};
            ob.cargarTabla(js, $("#SelectItem"), datos[3]);
            arrItemsC = [];
        } else if (i == 1) {
            var daMen = data[1].split("$$");
            if (daMen[0] === "true") {
                men = "El item " + $("#Descripcion").val() + " fue agregado exitosamente";
                estado = ("success");
                var items = jQuery.parseJSON(daMen[2]);
                var j = items.length - 1;
                $('#SelectItem').multiSelect('addOption', {value: items[j].id_item_lista, text: items[j].des_item_lista, index: 0});
            } else if (data[0].length == data[1].length) {
                men = "El item: " + $("#Descripcion").val() + " no fue agregado exitosamente";
                estado = ("error");
            }
            $.notify(men, estado);
            $("#Descripcion").val("");
        } else if (i == 5) {
            $(".EspacioItems").hide();
            $("#CompoLista").show();
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La lista " + men1 + " " + daMen[1];
            } else {
                estado = ("error");
                men = "La lista " + men1 + " " + daMen[1];
            }
            $("#SelectItem").empty();
            arrItemsC = [];
            $.notify(men, estado);
        }
    }
}
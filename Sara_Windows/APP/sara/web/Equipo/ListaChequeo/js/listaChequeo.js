function listaChequeo(idTipoItem, idUser) {
    var selector = [], hilo = [], jso = [], data = [], datos = [], men = "", estado = "";
    var ob = new $.Luna("MultiItems", $("#SelectItem"));
    ob.Vivo("ListaDeChequeo2");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:37,tipo:1,elegir:[0,1],delimitador:"[{colum: 2,operador: 0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#SelectItem");
    datos[0] = {nombre: "MultiSelect", opt: "NN"};
    ajax(0, datos[0]);
    var arraySelecion = [];
    $('.itemSelect').multiSelect({
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

    $("#BtnLista").on('click', function () {
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
        if (arraySelecion.length == 0) {
            input = $("#SelectItem");
            input.focus().after("<div class='remove'><font color='red'>Selecione almenos un item</font><div>");
        }
        if ((boo === 2) && (arraySelecion.length > 0)) {
            BtnLista();
        }
    });
    function BtnLista() {
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
        datos[2] = {nombre: "btn"};
        $('.itemSelect').multiSelect('deselect_all');
        $('#formAgreLista')[0].reset();
        ajax(2, datos[2]);
    }

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

    function  BtnItem() {
        //jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:19,tabla2:19,tipo:1,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        //20/04/2017
        jso[1] = ['ListaChequeo_Controller', '[{opcion:4,datosItem:[' + $("#Descripcion").val() + ',' + idTipoItem + ']}]'];
        selector[1] = $("#SelectItem");
        datos[1] = {nombre: "btn", compuesto: false};
        ajax(1, datos[1]);
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
        if ((i == 1) || (i == 2)) {
            if (i == 1) {
                var daMen = data[1].split("$$");
                if (daMen[0] == "true") {
                    men = "El item " + $("#Descripcion").val() + " fue agregado exitosamente";
                    estado = ("success");
                    var items = jQuery.parseJSON(daMen[2]);
                    var j = items.length - 1;
                    $('#SelectItem').multiSelect('addOption', {value: items[j].id_item_lista, text: items[j].des_item_lista, index: 0});
                } else if (data[0].length == data[1].length) {
                    men = "El item: " + $("#Descripcion").val() + " no fue agregado exitosamente";
                    estado = ("error");
                }
                $('#formAgregaItem')[0].reset();
            }
            if (i == 2) {
                $('.itemSelect').multiSelect('deselect_all');
                var daMen = data[i].split("$$");
                if (daMen[0] == "true") {
                    estado = ("success");
                    men = "La lista  " + men + "  fue registrada";
                } else {
                    estado = ("error");
                    men = daMen[1];
                }
            }
            $.notify(men, estado);
        }
    }
}
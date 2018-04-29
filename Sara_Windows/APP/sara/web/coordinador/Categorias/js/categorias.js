$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "";
    var arraySelecion = [];
    var ob = new $.Luna("MultiSelect", "null");
    ob.Vivo("Categorias1");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:53,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#itemCategoria");
    $("#itemCategoria").empty();
    datos[0] = {nombre: "MultiSelect", compuesto: false};
    ajax(0, datos[0]);
    $('.itemCategorias').multiSelect({
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


    $("#btnTema").click(function () {
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
        if (boo == 2) {
            BtnTema();
        }
    });

    function BtnTema() {
        men = $("#NombreTema").val();
        //jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:27,tabla2:27,tipo:1,datos:["",' + $("#NombreTema").val() + ',' + $("#DescripcionTema").val() + ',1],elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
        //20/04/2017
        jso[1] = ['Categoria_Controller', '[{opcion:2,datosTema:[' + $("#NombreTema").val() + ',' + $("#DescripcionTema").val() + ']}]'];
        selector[1] = $("#itemCategoria");
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
    }

    $("#btnCategoria").click(function () {
        $(".remove").remove();
        var coo = 0;
        var inputs = $(".inputsC");
        var input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                coo++;
            }
        }
        if (arraySelecion.length < 1) {
            input = $("#itemCategoria");
            input.focus().after("<div class='remove'><font color='red'>Selecione al menos un tema</font><div>");   
        }
        if ((coo == 2) && (arraySelecion.length > 0)) {
            BtnCate();
        }
    });

    function BtnCate() {
        men = $("#NombreCategoria").val();
        jso[2] = ['Categoria_Controller', '[{opcion:1,catego:["' + $("#NombreCategoria").val() + '","' + $("#DescripcionCategoria").val() + '",' + idUser + '],temas:[' + arraySelecion + ']}]'];
        datos[2] = {nombre: "btn"};
        arraySelecion = [];
        ajax(2, datos[2]);
    }

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            //alert(data[i]);
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i == 1) {
            console.log(data[1]);
            var daMen = data[1].split("$$");
            if (daMen[0] == "true") {
                men = "El item " + men + " fue agregado exitosamente";
                estado = ("success");
                var items = jQuery.parseJSON(daMen[2]);
                var j = items.length - 1;
                $('#itemCategoria').multiSelect('addOption', {value: items[j].id_tema, text: items[j].nom_tema, index: 0});
            } else if (data[0].length == data[1].length) {
                men = "El item: " + men + " no fue agregado exitosamente";
                estado = ("error");
            }
            $("#agregarTema")[0].reset();
            $.notify(men, estado);
        } else if (i == 2) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La categoria " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = "La categoria " + men + " " + daMen[1];
            }
            $("#itemCategoria").multiSelect('deselect_all');
            $("#AgregarCate")[0].reset();
            $.notify(men, estado);
        }
    }
});


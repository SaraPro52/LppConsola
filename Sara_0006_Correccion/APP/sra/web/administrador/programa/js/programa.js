$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrayAreas = [], arrayTemas = [], men = "", estado = "";
    var ob = new $.Luna("Select", $("#SelecCentro"));
    $(".Mult").hide();
    ob.Vivo("Programas");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:5,tipo:1,elegir:[0,2],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#SelecCentro");
    datos[0] = {nombre: "Select"};
    ajax(0, datos[0]);
    $("#multiselectAreas").show();
    $("#SelecCentro").change(function () {
        $(".Mult").show();
        $("#MultAreas").empty();
        if ($("#SelecCentro").val() != "A0") {
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:10,tipo:2,elegir:[0,1],\n\
                delimitador:"[{colum:2,operador:0,valor1:' + $("#SelecCentro").val() + '}]",id:0,opSelect:6}]'];
            selector[1] = $("#MultAreas");
            datos[1] = {nombre: "MultiSelect"};
            ajax(1, datos[1]);
        } else {
            $("#multiselectAreas").hide();
        }
    });
    $('.MultAreas').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca una area...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca una area...'>",
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
            arrayAreas.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arrayAreas);
            arrayAreas.splice(busqueda, 1);
        }
    });

    $('.MultTemasFormacion').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un tema...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un tema...'>",
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
            arrayTemas.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arrayTemas);
            arrayTemas.splice(busqueda, 1);
        }
    });


    $("#btnPrograma").click(function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var selec = $(".select");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        for (var i = 0; i < selec.length; i++) {
            if (selec[i].value === "A0") {
                selet = $(selec[i]);
                selet.focus().after("<div class='remove'><font color='red'>seleccione una opcion</font><div>");
            } else {
                boo++;
            }
        }
        if (arrayTemas.length == 0) {
            selet = $("#MultTemasFormacion");
            selet.focus().after("<div class='remove'><font color='red'>seleccione almenos un tema</font><div>");
        }
        if (arrayAreas.length == 0) {
            selet = $("#MultAreas");
            selet.focus().after("<div class='remove'><font color='red'>seleccione almenos una area</font><div>");
        }

        if ((boo == 3) && (arrayAreas.length > 0) && (arrayTemas.length > 0)) {
            BtnPrograma();
        }
    });
    function BtnPrograma() {
        men = $("#nomPro").val();
        jso[3] = ['FormacionPro_Controller', '[{opcion:1,datos:["","' + $("#nomPro").val() + '","' + $("#nivel").val() + '"],areas:[' + arrayAreas + '],temas:[' + arrayTemas + ']}]'];
        datos[3] = {nombre: "btn"};
        ajax(3, datos[3]);
    }

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
    function peticionCompleta(i, datos) {
        if (i == 1) {
            $(".Mult").show();
        } else if (i == 0) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:27,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#MultTemasFormacion");
            $("#MultTemasFormacion").empty();
            datos[2] = {nombre: "MultiSelect"};
            ajax(2, datos[2]);
        } else if (i == 3) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El programa " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
            $("#nomPro").val();
            $("#SelecCentro option:contains('YourTextHere')").val();
            $("#nivel option:contains('YourTextHere')").val();
        }
    }
});
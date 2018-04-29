$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrayTemas = [], men = "", estado = "", idPrograma = 0;
    var ob = new $.Luna("programa", $("#SelecCentro"));
    $(".Mult").hide();
    ob.Vivo("Programas");
    jso[0] = ['Modificar_Controller', '[{opcion:2,ProgramaAdmin:[0,0,0,0,0]}]'];
    selector[0] = $("#tablaPrograma");
    ob.TablaEspa(selector[0]);
    datos[0] = {nombre: "ConsultaPrograma"};
    ajax(0, datos[0]);

    $(document).on('click', '.btnModificarPrograma', function (e) {
        var valors = this.id.split("$$");
        idPrograma = valors[0];
        $("#nomPro").val(valors[1]);
        $("#nivel option[value=" + valors[2] + "]").attr("selected", true);
        $("#btnPrograma").html("Modificar programa");
        jso[2] = ['Modificar_Controller', '[{opcion:2,ProgramaAdmin:[3,' + idPrograma + ',0,0,0]}]']
        selector[2] = $("#MultTemasFormacion");
        $("#MultTemasFormacion").empty();
        datos[2] = {nombre: "MultiSelectArrayPrograma", compuesto: true};
        ajax(2, datos[2]);
    });

    $("#btnTemaP").click(function () {
        $("#NombreTema").val();
        $("#DescripcionTema").val();
        if (($("#NombreTema").val() == "") || ($("#DescripcionTema").val() == "")) {
            alert("Agrege el nombre o la descripción del tema");
        } else {
            men = $("#NombreTema").val();
            jso[10] = ['Categoria_Controller', '[{opcion:2,datosTema:[' + $("#NombreTema").val() + ',' + $("#DescripcionTema").val() + ']}]'];
            selector[10] = $("#itemCategoria");
            datos[10] = {nombre: "btn"};
            ajax(10, datos[10]);

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
        if ((boo == 2) && (arrayTemas.length > 0)) {
            BtnPrograma();
        }
    });
    function BtnPrograma() {
        var aTemas = [];
        for (var a = 0; a < arrayTemas.length; a++) {
            aTemas = aTemas + "," + (arrayTemas[a]);
        }
        men = $("#nomPro").val();
        if ($("#btnPrograma").html() == "Modificar programa") {
            men = $("#nomPro").val();
            jso[3] = ['Modificar_Controller', '[{opcion:2,ProgramaAdmin:[2,' + idPrograma + ',' + $("#nomPro").val() + ',' + $("#nivel").val() + ',\"' + arrayTemas + '\"]}]'];
            datos[3] = {nombre: "btn"};
            ajax(3, datos[3]);
        } else {
            men = $("#nomPro").val();
            jso[4] = ['Modificar_Controller', '[{opcion:2,ProgramaAdmin:[1,0,' + $("#nomPro").val() + ',' + $("#nivel").val() + ',\"' + arrayTemas + '\"]}]'];
            datos[4] = {nombre: "btn"};
            ajax(4, datos[4]);
        }
        $("#btnPrograma").html("Guardar Programa");
        $("#nomPro").val("");
        $("#nivel option[value='A0']").attr("selected", true);
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
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:53,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#MultTemasFormacion");
            $("#MultTemasFormacion").empty();
            datos[2] = {nombre: "MultiSelect"};
            ajax(2, datos[2]);
        } else if (i == 3) {//Modificar
            try {
                var response = jQuery.parseJSON(data[i]);
                if (typeof response == 'object') {
                    selector[1] = $("#tablaPrograma");
                    datos[7] = {nombre: "ConsultaPrograma"};
                    ob.cargarTabla(data[i], selector[1], datos[7]);
                    estado = ("success");
                    men = "El programa " + men + " se a modificado correctamente";
                }
            } catch (e) {
                estado = ("error");
                men = "El programa " + men + " no se a modificado";
            }
            $.notify(men, estado);
            datos[2] = {nombre: "MultiSelect"};
            peticionCompleta(0, datos[2]);
        } else if (i == 4) {//Agregar elemento
            if (data[4].length > data[0].length) {
                selector[1] = $("#tablaPrograma");
                datos[7] = {nombre: "ConsultaPrograma"};
                ob.cargarTabla(data[i], selector[1], datos[7]);
                estado = ("success");
                men = "El programa " + men + "  correctamente";

            } else {
                estado = ("error");
                men = "El programa  " + men + " no se a agregado";
            }
            $.notify(men, estado);
            datos[2] = {nombre: "MultiSelect"};
            peticionCompleta(0, datos[2]);
        } else if (i == 10) {
            var daMen = data[10].split("$$");
            if (daMen[0] == "true") {
                men = "El tema: " + men + " fue agregado exitosamente";
                estado = ("success");
                var items = jQuery.parseJSON(daMen[2]);
                var j = items.length - 1;
                $('#MultTemasFormacion').multiSelect('addOption', {value: items[j].id_tema, text: items[j].nom_tema, index: 0});
            } else if (data[0].length == data[1].length) {
                men = "El tema: " + men + " no fue agregado exitosamente";
                estado = ("error");
            }
            $.notify(men, estado);
        }
    }
}
);
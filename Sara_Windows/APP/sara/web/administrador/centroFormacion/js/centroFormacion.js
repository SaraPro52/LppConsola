$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrayTemas = [], men = "", estado = "", idCentro = 0;
    var ob = new $.Luna("Select", null);
    $(".Mult").hide();
    ob.Vivo("centro de formacion");
    jso[0] = ['Modificar_Controller', '[{opcion:4,CentroAdmin:[0,0,0,0,0,0,0]}]'];
    selector[0] = $("#tablaCentro");
    ob.TablaEspa(selector[0]);
    datos[0] = {nombre: "ConsultaCentros"};
    ajax(0, datos[0]);

    $(document).on('click', '.btnModificarCentros', function (e) {
        var valors = this.id.split("$$");
        idCentro = valors[0];
        $("#nomCentro").val(valors[2]);
        $("#numCentro").val(valors[3]);
        $("#nomDirrecion").val(valors[4]);
        $("#ciudad option[value=" + valors[1] + "]").attr("selected", true);
        $("#btnCentro").html("Modificar centro");
        jso[7] = ['Modificar_Controller', '[{opcion:4,CentroAdmin:[3,' + idCentro + ',0,0,0,0,0]}]'];
        selector[7] = $("#MultTemasFormacion");
        $("#MultTemasFormacion").empty();
        datos[7] = {nombre: "MultiSelectArrayCentro", compuesto: true};
        ajax(7, datos[7]);
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


    $("#btnCentro").click(function () {
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

        if ((boo == 4) && (arrayTemas.length > 0)) {
            BtnPrograma();
        }
    });

    function BtnPrograma() {
        var aTemas = [];
        for (var a = 0; a < arrayTemas.length; a++) {
            aTemas = aTemas + "," + (arrayTemas[a]);
        }
        men = $("#nomCentro").val();
        if ($("#btnCentro").html() == "Modificar ccentro") {
            jso[3] = ['Modificar_Controller', '[{opcion:4,CentroAdmin:[2,' + idCentro + ',' + $("#nomCentro").val() + ',' + $("#numCentro").val() + ',' + $("#nomDirrecion").val() + ',' + $("#ciudad").val() + ',' + arrayTemas + ']}]']
            datos[3] = {nombre: "btn"};
            ajax(3, datos[3]);
        } else {
            jso[4] = ['Modificar_Controller', '[{opcion:4,CentroAdmin:[1,0,' + $("#nomCentro").val() + ',' + $("#numCentro").val() + ',' + $("#nomDirrecion").val() + ',' + $("#ciudad").val() + ',\"' + arrayTemas + '\"]}]'];
            datos[4] = {nombre: "btn"};
            ajax(4, datos[4]);
        }
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
        if (i == 0) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            //jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:53,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#MultTemasFormacion");
            $("#MultTemasFormacion").empty();
            datos[2] = {nombre: "MultiSelect"};
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[19] = ['Crud_Controller', '[{opcion:3,tabla2:11,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            //jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            //jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:53,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[19] = $("#ciudad");
            $("#ciudad").empty().append("<option value='A0'>Seleccionar...</option>");
            datos[19] = {nombre: "Select"};
            ajax(19, datos[19]);
        } else if (i == 3) {//Modificar
            try {
                var response = jQuery.parseJSON(data[i]);
                if (typeof response == 'object') {
                    selector[1] = $("#tablaCentro");
                    datos[7] = {nombre: "ConsultaCentros"};
                    ob.cargarTabla(data[i], selector[1], datos[7]);
                    estado = ("success");
                    men = "El centro de formacion " + men + " se a modificado correctamente";
                }
            } catch (e) {
                estado = ("error");
                men = "El centro de formacion " + men + " no se a modificado";
            }
            $("#btnCentro").html("Guardar centro de formacion");
            $("#nomCentro").val("");
            $("#numCentro").val("");
            $("#nomDirrecion").val("");
            $("#ciudad option[value='A0']").attr("selected", true);
            $.notify(men, estado);
            datos[2] = {nombre: "MultiSelect"};
            peticionCompleta(0, datos[2]);
        } else if (i == 4) {//Agregar elemento
            $("#btnCentro").html("Guardar centro de formacion");
            $("#nomCentro").val("");
            $("#numCentro").val("");
            $("#nomDirrecion").val("");
            $("#ciudad option[value='A0']").attr("selected", true);
            if (data[4].length > data[0].length) {
                selector[1] = $("#tablaCentro");
                datos[7] = {nombre: "ConsultaCentros"};
                ob.cargarTabla(data[i], selector[1], datos[7]);
                estado = ("success");
                men = "Centro de formacion " + men + " se a guardado correctamente";

            } else {
                estado = ("error");
                men = "Centro de formacion " + men + " no se a agregado";
            }
            $.notify(men, estado);
            datos[2] = {nombre: "MultiSelect"};
            peticionCompleta(0, datos[2]);
        }
    }
});

$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "", nombre = "",
            arraySelecionAutor = [], arraySelecionEstr = [], arraySelecionCate = [], arrayselecT = [], arrayselecTF = [];
    $("#ECategoriaSelect").hide();
    $("#EProgramaFSelect").hide();
    var ob = new $.Luna("AutoComplet", "Null");
    ob.Vivo("SubirOA3");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:13,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#Titulo_Publicacion");
    datos[0] = {nombre: "AutoComplet", worker: true};
    ajax(0, datos[0]);

    $('.autoresMultiselect').multiSelect({
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
            arraySelecionAutor.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecionAutor);
            arraySelecionAutor.splice(busqueda, 1);
        }
    });

    $('.programaFormacionMultiSelect').multiSelect({
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
            arraySelecionEstr.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecionEstr);
            arraySelecionEstr.splice(busqueda, 1);
        }
    });

    $('.categoriaMultiselect').multiSelect({
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
            arraySelecionCate.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecionCate);
            arraySelecionCate.splice(busqueda, 1);
        }
    });
    ///Peticiones del programa de formacion
    $("#selectCiudad").change(function () {
        var option = $("#selectCiudad").val();
        ob.limpiarSelector($("#selectCentroF"));
        ob.limpiarSelector($("#Area"));
        if (option != "A0") {
            jso[7] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[1,3],delimitador:"[{colum:5,operador:0,valor1:' + $("#selectCiudad").val() + '}]",id:0,opSelect:6}]'];
            selector[7] = $("#selectCentroF");
            datos[7] = {nombre: "Select"};
            ajax(7, datos[7]);
        }
        $("#SelectEstruturaDiv").hide();
    });
    $("#selectCentroF").change(function () {
        var option = $("#selectCentroF").val();
        ob.limpiarSelector($("#Area"));
        if (option != "A0") {
            jso[8] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[7,8],delimitador:"[{colum:5,operador:0,valor1:' + $("#selectCiudad").val() + ',añadir:0},{colum:1,operador:0,valor1:' + $("#selectCentroF").val() + '}]",id:0,opSelect:6}]'];
            selector[8] = $("#selectAreaF");
            datos[8] = {nombre: "Select"};
            ob.limpiarSelector(selector[8]);
            ajax(8, datos[8]);
        }
        $("#SelectEstruturaDiv").hide();
    });
    $("#selectAreaF").change(function () {
        var option = $("#Area").val();
        if (option != "A0") {
            jso[9] = ['Crud_Controller', '[{opcion:3,tabla2:2,tipo:2,elegir:[4,5],delimitador:"[{colum:1,operador:0,valor1:' + $("#selectAreaF").val() + '}]",id:0,opSelect:6}]'];
            $("#SelectEstrutura").empty();
            selector[9] = $("#SelectEstrutura");
            datos[9] = {nombre: "MultiSelect"};
            ajax(9, datos[9]);
            $("#SelectEstruturaDiv").show();
            $("#divBtPro").show();
        } else {
            $("#SelectEstruturaDiv").hide();
            $("#divBtPro").hide();
        }
    });
    var countCC = 0;
    $("#btnACategoriaF").click(function () {
        if (countCC == 0) {
            $("#EProgramaFSelect").show();
        }
        var jso = jQuery.parseJSON(data[9]);
        var j = Object.keys(jso[0]);
        var dd = [], campS = [], st = [], arraySelecionE = [], s = "";
        for (var q = 0; q < jso.length; q++) {
            dd.push(jso[q][j[0]]);
            campS.push(jso[q][j[1]]);
            if (q < arraySelecionEstr.length) {
                var tam = arraySelecionEstr[q];
                arraySelecionE.push(tam);
            }
        }

        for (var i = 0; i < dd.length; i++) {
            for (var y = 0; y < arraySelecionE.length; y++) {
                if (dd[i] == arraySelecionE[y]) {
                    st = campS[i];
                }
                if (i == 0) {
                    var con = arraySelecionE[i];
                    arrayselecTF.push(con);
                }
            }
        }
        $("#SelectEstrutura").empty();
        var clonCategoria = $("#ClonPrograma").clone();
        clonCategoria.find("#labelPro").text("Categoria:  " + $("#selectAreaF option:selected").text());
        clonCategoria.find("#labelProItems").text("Temas: " + st);
        clonCategoria.find("#buttonPro").val('ProSelect' + countCC);
        clonCategoria.find(".contenPro").attr('id', 'ProSelect' + countCC);
        clonCategoria.find(".arrayPro").attr('id', 'aProSelect' + countCC);
        clonCategoria.find("#aProSelect" + countCC).attr('text', '[' + arraySelecionEstr + ']');
        clonCategoria.children().appendTo($("#EProgramaFSelect"));
        countCC++;
        $("#SelectEstrutura").multiSelect('deselect_all');
        arraySelecionEstr = [];
    });
    $(document).on('click', '.clickPro', function (e) {
        select = this.value;
        var aselect = 'a' + this.value;
        var arr = $("#" + aselect).text();
        for (var i = 0; i < arr.length; i++) {
            var busqued = $.inArray(arr[i], arrayselecTF);
            arrayselecTF.splice(busqued, 1);
        }
        $("#" + select).remove();
    });

    ///Peticiones de la categoria 
    $("#SelectCategoria").change(function () {
        var optionn = $("#SelectCategoria").val();
        if (optionn != "A0") {
            $("#divBtnaCate").show();
            jso[6] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[6,7,8],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:3}]'];
            selector[6] = $("#MultiCategoria");
            datos[6] = {nombre: "MultiSelect"};
            $("#MultiCategoria").empty();
            $("#SelectCategoriaDiv").show();
            ajax(6, datos[6]);
        } else {
            $("#divBtnaCate").hide();
        }
    });

    var countC = 0;
    $("#btnACategoria").click(function () {
        var jso = jQuery.parseJSON(data[6]);
        var j = Object.keys(jso[0]);
        var dd = [];
        var campS = [], st = [];
        for (var q = 0; q < jso.length; q++) {
            dd.push(jso[q][j[0]]);
            campS.push(jso[q][j[1]]);
        }
        for (var i = 0; i < dd.length; i++) {
            for (var y = 0; y < arraySelecionCate.length; y++) {
                if (dd[i] == arraySelecionCate[y]) {
                    st = campS[i];
                }
                if (i == 0) {
                    $("#ECategoriaSelect").show();
                    var con = arraySelecionCate[i];
                    arrayselecT.push(con);
                }
            }
        }
        var clonCategoria = $("#Cloncategoria").clone();
        clonCategoria.find("#labelCate").text("Categoria:  " + $("#SelectCategoria option:selected").text());
        clonCategoria.find("#labelCateItems").text("Temas: " + st);
        clonCategoria.find("#buttonCate").val('categoriaSelect' + countC);
        clonCategoria.find(".contenCate").attr('id', 'categoriaSelect' + countC);
        clonCategoria.find(".arrayCate").attr('id', 'acategoriaSelect' + countC);
        clonCategoria.find("#acategoriaSelect" + countC).attr('text', '[' + arraySelecionCate + ']');
        clonCategoria.children().appendTo($("#ECategoriaSelect"));
        countC++;
        $("#MultiCategoria").multiSelect('deselect_all');
        arraySelecionCate = [];
    });
    $(document).on('click', '.clickCate', function (e) {
        select = this.value;
        var aselect = 'a' + this.value;
        var arr = $("#" + aselect).text();
        for (var i = 0; i < arr.length; i++) {
            var busqued = $.inArray(arr[i], arrayselecT);
            arrayselecT.splice(busqued, 1);
        }
        $("#" + select).remove();
    });

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
        if (i == 0) {
            jso[1] = ['Crud_Controller', '[{arr:0,opcion:3,tabla2:7,tipo:2,elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:' + idCentro + ',añadir:0},{colum:4,operador:7,valor1:' + idUser + ',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]",id:0,opSelect:4}]'];
            selector[1] = $("#SelectAutores");
            datos[1] = {nombre: "MultiSelect"};
            ajax(1, datos[1]);
        } else if (i == 1) {
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#formato");
            datos[2] = {nombre: "Select"};
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:37,tipo:2,elegir:[4,5,6,7,8,9],delimitador:"[{colum:2,operador:0,valor1:' + idRol + ',añadir:0},colum:12,operador:0,valor1:' + idCentro + ',añadir:0},{colum:0,operador:0,valor1:' + idUser + ',añadir:0},{colum:13,operador:6,valor1:\'2,3\',añadir:0},{colum:11,operador:0,valor1:0}]",id:0,opSelect:6}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "Select"};
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:6,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[4] = $("#selectCiudad");
            datos[4] = {nombre: "Select"};
            ajax(4, datos[4]);
        } else if (i == 5) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El producto  " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        }
    }
    var options = {
        beforeSend: function () {
            $("#progressbox").show();
            $("#progressbar").width('0%');
            $("#message").empty();
            $("#percent").html("0%");
        },
        uploadProgress: function (event, position, total, percentComplete) {
            $("#progressbar").width(percentComplete + '%');
            $("#percent").html(percentComplete + '%');
            if ((percentComplete > 1) && (percentComplete < 99)) {
                $("#message").html("<font color='blue'>Cargando el archivo...</font>");
            } else if (percentComplete == 100) {
                $("#message").html("");
            }
        },
        success: function () {
            $("#message").html("");
            var arrayAutor = "";
            var arrayTemas = [];
            for (var i = 0; i < arraySelecionAutor.length; i++) {
                if (i == 0) {
                    arrayAutor = idUser + "," + arraySelecionAutor[i];
                } else {
                    arrayAutor = arrayAutor + "," + (arraySelecionAutor[i]);
                }
            }
            for (var i = 0; i < arrayselecTF.length; i++) {
                arrayTemas.push(arrayselecTF[i] + "-0");
            }
            for (var i = 0; i < arrayselecT.length; i++) {
                arrayTemas.push(arrayselecT[i] + "-1");
            }
            men = $("#Titulo_Publicacion").val();
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn"};
            ajax(5, datos[5]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);

    $('.input-file').change(function () {
        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (siezekiloByte > $(this).attr('size')) {
            $(this).val('');
            $(".inputNotifi").notify(
                    "El archivo supera el limite de 25 mb", 'warn',
                    {position: "right"}
            );
        }
    });
});

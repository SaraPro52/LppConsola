$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "", arraySelecionAutor = [], arraySelecionEstr = [], arraySelecionCate = [], arrayselecT = [], arrayselecTF = [], arrFuciona = [], extenFormat = [], extFrom = "";
    $("#ECategoriaSelect").hide();
    $("#EProgramaFSelect").hide();
    var ob = new $.Luna("AutoComplet", "Null");
    ob.Vivo("SubirProductoVirtual1");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:13,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#Titulo_Publicacion");
    datos[0] = {nombre: "AutoComplet"};
    ajax(0, datos[0]);

    //TIPO FORMATO (IMAGEN, VIDEO, DOCUMENTO)
    //jso[0] = ['SubirPv_Controller','[{opcion:1,tipoFormato:[1,0]}]'];

    //EXTENCION DE ACUERDO AL IDFORMATO SELECCIONADO (JPJ ETC)
    ///jso[0] = ['SubirPv_Controller','[{opcion:1,tipoFormato:[2,'+idTipoFormato+']}]'];
    $("#formato").change(function () {
        $("#myfile").val("");
        $("#extPermitidas").html("");
        if ($("#formato").val() != "A0") {
            jso[23] = ['SubirPv_Controller', '[{opcion:1,tipoFormato:[2,' + $("#formato").val() + ']}]'];
            selector[0] = $("#Titulo_Publicacion");
            datos[23] = {nombre: "btn"};
            ajax(23, datos[23]);
        }
    });

    $('.autoresMultiselect').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un autor...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un autor...'>",
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
    $("#SelectArea").change(function () {
        var option = $("#SelectArea").val();
        ob.limpiarSelector($("#selectProgramaF"));
        if (option != "A0") {
            jso[7] = ['Crud_Controller', '[{opcion:3,tabla2:2,tipo:2,elegir:[4,5],delimitador:"[{colum:1,operador:0,valor1:' + option + '}]",id:0,opSelect:6}]'];
            selector[7] = $("#selectProgramaF");
            datos[7] = {nombre: "Select"};
            ajax(7, datos[7]);
        }
        $("#SelectEstruturaDiv").hide();
    });
    $("#selectProgramaF").change(function () {
        var optionP = $("#selectProgramaF").val();
        $("#SelectEstruturaDiv").hide();
        if (optionP != "A0") {
            jso[8] = ['Crud_Controller', '[{opcion:3,tabla2:3,tipo:2,elegir:[4,5],delimitador:"[{colum:1,operador:0,valor1:' + optionP + '}]",id:0,opSelect:6}]'];
            selector[8] = $("#SelectEstrutura");
            datos[8] = {nombre: "MultiSelect"};
            $("#SelectEstrutura").empty();
            $("#SelectEstruturaDiv").show();
            ajax(8, datos[8]);
        }
    });

    var countCC = 0;
    $("#btnACategoriaF").click(function () {
        if (countCC == 0) {
            $("#EProgramaFSelect").show();
        }
        var jso = jQuery.parseJSON(data[8]);
        var j = Object.keys(jso[0]);
        var campS = [], st = "null", dd = [];
        for (var q = 0; q < jso.length; q++) {
            dd.push(jso[q][j[0]]);
            campS.push(jso[q][j[1]]);
        }
        for (var i = 0; i < dd.length; i++) {
            for (var y = 0; y < arraySelecionEstr.length; y++) {
                if (dd[i] == arraySelecionEstr[y]) {
                    if (st == "null") {
                        st = campS[i];
                    } else {
                        st = st + "," + campS[i];
                    }
                }
                if (i == 0) {
                    var con = arraySelecionEstr[y];
                    arrayselecTF.push(con);
                }
            }
        }
        $("#SelectEstrutura").empty();
        var clonCategoria = $("#ClonPrograma").clone();
        clonCategoria.find("#labelPro").text("Categoria:  " + $("#selectProgramaF option:selected").text());
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
            jso[6] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[6,7,8],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:6}]'];
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
        var campS = [], st = "null", dd = [];
        for (var q = 0; q < jso.length; q++) {
            dd.push(jso[q][j[0]]);
            campS.push(jso[q][j[1]]);
        }
        for (var i = 0; i < dd.length; i++) {
            for (var y = 0; y < arraySelecionCate.length; y++) {
                if (dd[i] == arraySelecionCate[y]) {
                    if (st == "null") {
                        st = campS[i];
                    } else {
                        st = st + "," + campS[i];
                    }
                }
                if (i == 0) {
                    var cons = arraySelecionCate[y];
                    arrayselecT.push(cons);
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
        $("#ECategoriaSelect").show();
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
            peticionCompleta(5);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);

    function peticionCompleta(i) {
        if (i == 0) {
            jso[1] = ['Crud_Controller', '[{arr:0,opcion:3,tabla2:7,tipo:2,elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:' + idCentro + ',añadir:0},{colum:4,operador:7,valor1:' + idUser + ',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]",id:0,opSelect:4}]'];

            selector[1] = $("#SelectAutores");

            datos[1] = {nombre: "btn"};
            ajax(1, datos[1]);
        } else if (i == 1) {
            var jsonR = jQuery.parseJSON(data[i]);
            arrFuciona = [{Id_Item_Lista: idUser, Des_Item_Lista: nomUser, tipo: true}];
            for (var i = 0; i < jsonR.length; i++) {
                arrFuciona.push({Id_Item_Lista: jsonR[i].Id_Funcionario, Des_Item_Lista: jsonR[i].Nom_Funcionario, tipo: false});
            }
            selector[1] = $("#SelectAutores");
            datos[1] = {nombre: "MultiSelect", compuesto: true};
            ob.cargarTabla(arrFuciona, selector[1], datos[1]);
            jso[2] = ['SubirPv_Controller', '[{opcion:1,tipoFormato:[1,0]}]'];
            selector[2] = $("#formato");
            datos[2] = {nombre: "SelectInvertido"};
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:38,tipo:2,elegir:[0,1],delimitador:"[{colum:4,operador:0,valor1:' + idCentro + '})",id:0,opSelect:6}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "Select"};
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[7,8],delimitador:"[{colum:1,operador:0,valor1:' + $("#CentroDF").text() + '}]",id:0,opSelect:6}]'];
            selector[4] = $("#SelectArea");
            datos[4] = {nombre: "Select"};
            ajax(4, datos[4]);
        } else if (i == 5) {
            $("#message").html("");
            var arrayAutor = idUser;
            var arrayTemas = [];
            for (var a = 0; a < arraySelecionAutor.length; a++) {
                arrayAutor = arrayAutor + "," + (arraySelecionAutor[a]);
            }
            for (var i = 0; i < arrayselecTF.length; i++) {
                arrayTemas.push(arrayselecTF[i] + "-0");
            }
            for (var p = 0; p < arrayselecT.length; p++) {
                arrayTemas.push(arrayselecT[p] + "-1");
            }
            men = $("#Titulo_Publicacion").val();
            var path = $("#myfile").val();
            var nomArchivo = path.replace(/C:\\fakepath\\/, '');
            jso[11] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + extFrom + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + nomArchivo + '}]'];
            selector[11] = null;
            datos[11] = {nombre: "btn"};
            ajax(11, datos[11]);
        } else if (i == 11) {
            var daMen = data[i].split("$$");
            if (daMen[0] === "true") {
                estado = ("success");
                men = "El producto  " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = "El producto " + men + " " + daMen[1];
            }
            jso[22] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
            datos[22] = {caso: "Notificaciones productos virtuales"};
            $.notify(men, estado);
            ajax(22);
        } else if (i == 22) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
        } else if (i == 23) {
            extenFormat = [];
            var jsonExten = jQuery.parseJSON(data[i]);
            for (var i = 0; i < jsonExten.length; i++) {
                var idFormato = jsonExten[i].id_formato;
                var nomFormato = jsonExten[i].nom_formato;
                extenFormat.push({formato: idFormato[0], nombre: nomFormato[0]});
            }
        }
    }
    $('.input-file').change(function () {
        var nomArh = $(this).val();
        var arrexte = [];
        var ex = nomArh.split(".");
        nomArh = ex[ex.length - 1];
        var countExten = 0;
        for (var i = 0; i < extenFormat.length; i++) {
            arrexte.push(extenFormat[i].nombre);
            if (extenFormat[i].nombre == nomArh) {
                countExten++;
                extFrom = extenFormat[i].formato;
            }
        }
        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (siezekiloByte > $(this).attr('size')) {
            $(this).val('');
            $(".inputNotifi").notify(
                    "El archivo supera el limite de 25 mb", 'warn',
                    {position: "right"}
            );
        }
        if (countExten <= 0) {
            var menexten = "Selecione un archivo de formato " + arrexte;
            $(".inputNotifi").notify(
                    menexten, 'warn',
                    {position: "right"}
            );
            $(this).val('');
        }
    });
});
$(document).ready(function () {
    var selector = [], hilo = [], idPv = 0, jso = [], data = [], datos = [], estado = "", men = "", arraySelecionAutor = [], arraySelecionEstr = [], arraySelecionCate = [], arrayselecT = [], arrayselecTF = [], arrFuciona = [],extPermitida="";
    var ob = new $.Luna("Productos virtuales", $("#tablaActualizacion"));
    ob.Vivo("Actualizar");
    $("#contenedorass").show();
    $("#formularioss").hide();
    selector[0] = $("#tablaActualizacion");
    //jso[0] = ['Version_Controller', '[{opcion:1,idFun:' + idUser + '}]'];
    //-------Consulta Notificaciones
    jso[0] = ['Notificaciones_Controller', '[{opcion:5,parametros:[' + idUser + ',' + idRol + ',0]}]'];
    //----------
    datos[0] = {nombre: "actualizacionVersion"};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);

    $(document).on('click', '.btnAñadirVersion', function (e) {
        var element = this.id;
        var arr = element.split("$$");
        idPv = arr[1];//20/04/2017
        jso[1] = ['Version_Controller', '[{opcion:2,idPv:' + arr[1] + ',idVer:' + arr[0] + '}]'];
        selector[1] = "btn";
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
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
    $("#ECategoriaSelect").show();
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
            $("#message").html("");
            jstotal = jQuery.parseJSON(data[1]);
            var arrayAutor = "";
            var peticionautores = jstotal.Peticion_2;
            peticionautores.forEach(function (val) {
                if (idUser === val.id_funcionario[0]) {
                    arrayAutor = val.id_funcionario[0];
                } else {
                    arrayAutor = arrayAutor + "," + val.id_funcionario[0];
                }
            });
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
            //jso[12] = ['Version_Controller', '[{opcion:3,info:[' + idPv + ',' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];

            //20/04/2017
            var path = $("#myfile").val();
            var filename = path.replace(/C:\\fakepath\\/, '');

            jso[12] = ['Version_Controller', '[{opcion:3,info:[' + idPv + ',' + filename + ',0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + ']}]'];
            selector[12] = null;
            datos[12] = {nombre: "btn"};
            ajax(12, datos[12]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadFormula").ajaxForm(options);

    $('.input-file').change(function () {
        var nomArh = $(this).val();
        var ex = nomArh.split(".");
        nomArh = ex[ex.length - 1];
        var menAlert="Selecione un archivo de formato " + extPermitida;
        if (extPermitida != nomArh) {
            $("#myfile").notify(
                    menAlert, 'warn',
                    {position: "right"}
            );
            $(this).val('');
        }
        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (siezekiloByte > $(this).attr('size')) {
            $(this).val('');
            $("#myfile").notify(
                    "El archivo supera el limite de 25 mb", 'warn',
                    {position: "right"}
            );
        }
    });
    var jstotal;
    function peticionCompleta(i) {
        if (i == 1) {
            jso[2] = ['Crud_Controller', '[{arr:0,opcion:3,tabla2:7,tipo:2,elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:' + idCentro + ',añadir:0},{colum:4,operador:7,valor1:' + idUser + ',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]",id:0,opSelect:4}]'];
            selector[2] = $("#SelectAutores");
            datos[2] = {nombre: "btn"};
            $("#contenedorass").hide();
            $("#formularioss").show();
            ajax(2, datos[2]);
            jstotal = jQuery.parseJSON(data[1]);
        } else if (i == 2) {
            var peticion2 = jstotal.Peticion_2;
            arrFuciona = [];
            var id = String(idUser);
            peticion2.forEach(function (val) {
                if (id === val.id_funcionario[0]) {
                    arrFuciona.push({Id_Item_Lista: val.id_funcionario[0], Des_Item_Lista: val.nombrecompleto[0], tipo: true});
                } else {
                    arrFuciona.push({Id_Item_Lista: val.id_funcionario[0], Des_Item_Lista: val.nombrecompleto[0]});
                }
            });
            var jsonR = jQuery.parseJSON(data[i]);
            var citemsS = 0;
            for (var i = 0; i < jsonR.length; i++) {
                for (var j = 0; j < arrFuciona.length; j++) {
                    if (arrFuciona[j].id_item_lista === jsonR[i].Id_Funcionario) {
                        citemsS++;
                    }
                    if (citemsS == 2) {
                        arrFuciona.remove(j);
                    }
                }
                if (citemsS == 0) {
                    arrFuciona.push({Id_Item_Lista: jsonR[i].Id_Funcionario, Des_Item_Lista: jsonR[i].Nom_Funcionario, tipo: false});
                }
                citemsS = 0;
            }
            selector[1] = $("#SelectAutores");
            datos[1] = {nombre: "MultiSelect", compuesto: true};

            ob.cargarTabla(arrFuciona, selector[1], datos[1]);
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[3] = $("#formato");
            datos[3] = {nombre: "Select"};
            ajax(3, datos[3]);
        } else if (i == 3) {
            var peticion1 = jstotal.Peticion_1;
            peticion1.forEach(function (val) {
                $("#Titulo_Publicacion").val(val.nom_p_virtual);
                $("#formato").val(val.nom_formato);
                extPermitida=val.nom_formato;
                $("#palabras_claves").val(val.palabras_clave);
                $("#descripcion_oa").val(val.des_p_virtual);
            });
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:38,tipo:2,elegir:[0,1],delimitador:"[{colum:4,operador:0,valor1:' + idCentro + '})",id:0,opSelect:6}]'];
            selector[4] = $("#SelectCategoria");
            datos[4] = {nombre: "Select"};
            ajax(4, datos[4]);
        } else if (i == 4) {
            var itemsas = 0;
            var peticion3 = jstotal.Peticion_3;
            peticion3.forEach(function (val) {
                if (itemsas == 0) {
                    itemsas = "";
                    itemsas = val.nom_tema[0];
                } else {
                    itemsas = itemsas + "," + val.nom_tema[0];
                }
            });
            if (itemsas != 0) {
                var itemClo = "<div class='contenPro col-md-12'><label>Temas del producto virtual: " + itemsas + "</label></div>"
                $("#EProgramaFSelect").append(itemClo);
            }
            itemsas = 0;
            var peticion4 = jstotal.Peticion_4;
            peticion4.forEach(function (val) {
                if (itemsas == 0) {
                    itemsas = "";
                    itemsas = val.nom_tema[0];
                } else {
                    itemsas = itemsas + "," + val.nom_tema[0];
                }
            });
            if (itemsas != 0) {
                itemClo = "<div class='contenPro col-md-12'><label>Temas del producto virtual: " + itemsas + "</label></div>"
                $("#ECategoriaSelect").append(itemClo);
            }
            jso[5] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[7,8],delimitador:"[{colum:1,operador:0,valor1:' + $("#CentroDF").text() + '}]",id:0,opSelect:6}]'];
            selector[5] = $("#SelectArea");
            datos[5] = {nombre: "Select"};
            ajax(5, datos[5]);
        } else if (i == 12) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "El producto  " + men + " " + daMen[1];
            } else {
                estado = ("error");
                men = "El producto " + men + " " + daMen[1];
            }
            jso[11] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
            datos[11] = {caso: "Notificaciones productos virtuales"};
            $.notify(men, estado);
            ajax(11);
        } else if (i == 122) {
            selector[12] = null;
            datos[12] = {nombre: "btn"};
            //alert("aqui2");
            //jso[12] = ['Version_Controller', '[{opcion:3,info:[10,' + $("#myfile").val() + ',0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + ']}]'];
            //ajax(16, datos[12]);
        } else if (i == 11) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
        } else if (i == 166) {
//            jso[11] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
//            datos[11] = {caso: "Notificaciones productos virtuales"};
//            $.notify(men, estado);
//            ajax(11);
        }
    }
});


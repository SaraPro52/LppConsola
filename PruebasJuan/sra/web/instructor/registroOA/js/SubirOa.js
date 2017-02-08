$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "", nombre = "",
            arraySelecionAutor = [], arraySelecionEstr = [], arraySelecionCate = [], arrayselecT = [];
    var ob = new $.Luna("AutoComplet", "Null");
    ob.Vivo("SubirOA96");
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
    $("#SelectCategoria").change(function () {
        jso[5] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[6,7,8],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:3}]'];
        selector[5] = $("#MultiCategoria");
        datos[5] = {nombre: "MultiSelect"};
        ajax(5, datos[5]);
    });

    var countC = 0;
    $("#btnACategoria").click(function () {
        var dd = data[5][0];
        var campS = [];
//       for (var i = 0; i < arraySelecionCate.length; i++) {
//            arrayselecT.push(arraySelecionCate[i]);
//            if (dd[i] == arraySelecionCate[i]) {
//                campS.push(dd[i]);
//            }
//        }

        var cam = "categoria:  " + $("#SelectCategoria option:selected").text() + " Temas: " + campS;
        var clonCategoria = $("#Cloncategoria").clone();
        clonCategoria.find("#labelCate").text(cam);
        clonCategoria.find("#buttonCate").val('categoriaSelect' + countC);
        clonCategoria.find(".contenCate").attr('id', 'categoriaSelect' + countC);
        clonCategoria.find("#arrayCate").attr('text', '[' + arraySelecionCate + ']');
        clonCategoria.children().appendTo($("#ECategoriaSelect"));
        countC++;
        arraySelecionCate = [];
    });

    $(document).on('click', '.clickCate', function (e) {
        select = this.value;
        arrayselecT
        var arr = $("#arrayCate").text();
        for (var i = 0; i < arr.length; i++) {
            var busqued = $.inArray(arr[i], arrayselecT);
            arraySelecionCate.splice(busqued, 1);
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
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:6,tipo:1,elegir:[],delimitador:[],id:0,opSelect:3}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "Select"};
            ajax(3, datos[3]);
            //[{opcion:3,tabla2:4,tipo:2,elegir:[6,7],delimitador:[],id:0,opSelect:4}]
        } else if (i == 3) {
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:18,tipo:2,elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:1}]",id:0,opSelect:4}]'];
            selector[4] = $("#SelectEstrutura");
            datos[4] = {nombre: "MultiSelect"};
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
            if ((percentComplete > 1) && (percentComplete < 101)) {
                $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
            }
        },
        success: function () {


            var arrayAutor = "";
            var arrayTemas = [];
            for (var i = 0; i < arraySelecionAutor.length; i++) {
                if (i == 0) {
                    arrayAutor = idUser + "," + arraySelecionAutor[i];
                } else {
                    arrayAutor = arrayAutor + "," + (arraySelecionAutor[i]);
                }
            }
            for (var i = 0; i < arraySelecionEstr.length; i++) {
                arrayTemas.push(arraySelecionEstr[i] + "-0");
            }
            for (var i = 0; i < arraySelecionCate.length; i++) {
                arrayTemas.push(arraySelecionCate[i] + "-1");
            }
            men = $("#Titulo_Publicacion").val();
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:1,info:[' + $("#Titulo_Publicacion").val() + ',' + $("#descripcion_oa").val() + ',' + $("#palabras_claves").val() + ',' + $("#formato").val() + ',0,0,' + $("#instrucciones").val() + ',' + $("#requisitos_instalacion").val() + '],arrayFun:[' + arrayAutor + '],arrayTemas:[' + arrayTemas + '],archivoNom:' + $("#myfile").val() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn", worker: true};
            //ajax(5, datos[5]);
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

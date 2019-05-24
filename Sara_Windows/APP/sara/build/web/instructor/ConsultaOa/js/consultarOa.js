$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true, arraySelecionPrograma = [], arraySelectCategoria = [];
      var pagina = "<li id='pag1' class='pagination'><a><lavel>1</label></a></li>";
    $("#dataInicialA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataFinalA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataInicialA").datepicker("option", "maxDate", new Date());
    $("#dataFinalA").datepicker("option", "maxDate", new Date());
    $("#dataInicialA").change(function () {
        $("#dataFinalA").datepicker("option", "minDate", $("#dataInicialA").val());
    });
    $("#dataFinalA").change(function () {
        $("#dataInicialA").datepicker("option", "maxDate", $("#dataFinalA").val());
    });


    //    filtros[0]="0";//id Producto virtual
//    filtros[1]="";//Id Formato
//    filtros[2]="2017/04/15";//Fecha Inicial o Fecha unica
//    filtros[3]="2017/04/15";//Fecha finalS
//    filtros[4]="";//id Funcionario
//    filtros[5]="";//Categoria o Programa 
//    filtros[6]="";//tipoTEMA C O P = 0 -> Programa De Formacion 1 -> Categoria 

//    caso = 0 o 1 = 0 Cuando consulta inical sin ningun filtro, 1 consulta por los filtros
    jso[0] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:["","","","","","",""],caso:1}]'];//--->17/04/2017

    //jso[0] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:[],caso:29}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "ConsOaP"};
    ajax(0, datos[0]);
    var ob = new $.Luna("Consultar PV", $("#formulario1"));
    ob.Vivo("ConsultarPV");

    $("#btnActu").click(function () {
        $("#paginador").empty().append(pagina);
        $("#resultadosProductos").empty();
        datos[0] = {nombre: "ConsOaP", op: true};
        ajax(0, datos[0]);
    });
    $("#Programas").change(function () {
        $("#SelectCategoria").empty();
        $("#ElementoCategoria").hide();
        $("#ElementoFormacion").show();
        $("#ElementoPrograma").hide();
        $("#Programa").hide();
        $("#programa").empty();
        tipoPet = 1;
        if ($("#Categoria").prop('checked')) {
            $("#Categoria").prop('checked', false);
            tipoPet = 1;
        } else {
            $("#Programas").prop('checked');

        }
        if ($("#Programas").prop('checked')) {
            ob.limpiarSelector($("#CentroF"));
            ob.limpiarSelector($("#Area"));
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:6,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[4] = $("#CiudadFormacion");
            datos[4] = {nombre: "Select"};
            ob.limpiarSelector(selector[4]);
            ajax(4, datos[4]);
        }
    });

    $("#Categoria").change(function () {
        tipoPet = 0;
        if ($("#Programas").prop('checked')) {
            $("#Programas").prop('checked', false);
            tipoPet = 0;
        } else {
            $("#Categoria").prop('checked');
        }
        $("#ElementoCategoria").show();
        $("#ElementoFormacion").hide();
        $("#ElementoPrograma").hide();
        $("#Programa").empty();
        if ($("#Categoria").prop('checked')) {
            jso[8] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[8] = $("#SelectCategoria");
            datos[8] = {nombre: "MultiSelect"};
            $("#SelectCategoria").empty();
            ajax(8, datos[8]);
        }
    });

    $("#CiudadFormacion").change(function () {
        var option = $("#CiudadFormacion").val();
        ob.limpiarSelector($("#CentroF"));
        ob.limpiarSelector($("#Area"));
        $("#Programa").empty();
        if (option != "A0") {
            $("#ElementoPrograma").hide();
            jso[7] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[1,3],delimitador:"[{colum:5,operador:0,valor1:' + $("#CiudadFormacion").val() + '}]",id:0,opSelect:6}]'];
            selector[7] = $("#CentroF");
            datos[7] = {nombre: "Select"};
            ob.limpiarSelector(selector[7]);
            ajax(7, datos[7]);
        }
    });
    $("#CentroF").change(function () {
        var option = $("#CentroF").val();
        $("#ElementoPrograma").hide();
        ob.limpiarSelector($("#Area"));
        if (option != "A0") {
            jso[10] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[7,8],delimitador:"[{colum:5,operador:0,valor1:' + $("#CiudadFormacion").val() + ',añadir:0},{colum:1,operador:0,valor1:' + $("#CentroF").val() + '}]",id:0,opSelect:6}]'];
            selector[10] = $("#Area");
            datos[10] = {nombre: "Select"};
            ob.limpiarSelector(selector[10]);
            ajax(10, datos[10]);
        }
    });
    $("#Area").change(function () {
        var option = $("#Area").val();
        $("#Programa").empty();
        if (option != "A0") {
            $("#ElementoPrograma").show();
            jso[9] = ['Crud_Controller', '[{opcion:3,tabla2:2,tipo:2,elegir:[4,5],delimitador:"[{colum:1,operador:0,valor1:' + $("#Area").val() + '}]",id:0,opSelect:6}]'];
            selector[9] = $("#Programa");
            datos[9] = {nombre: "MultiSelect"};
            ajax(9, datos[9]);
        } else if (option == "A0") {
            $("#ElementoPrograma").hide();
        }
    });

    $("#BusquedaAvanzada").on('click', function () {
        if (constan == true) {
            $("#Avando").show();
            $("#BusquedaAvanzada").text("Busqueda normal.");
            constan = false;
        } else {
            $("#Avando").hide();
            $("#BusquedaAvanzada").text("Busqueda avanzada.");
            constan = true;
        }
    });
    $(document).on('click', '.pagination li', function (e) {
        if (this.id != $("#pagActual").val()) {
            $("." + this.id).show();
            var pagE = $("#pagActual").val();
            $("." + pagE).hide();
            $("#pagActual").val(this.id);
            $(".pagination" + this.id).css("background-color", "");
            $("#pag" + this.id).css("background-color", "blue");
        }
    });
    $("#btnBuscar").click(function () {
        btnbuscar();
    });

    $('.SelectCategoria').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca una categoria...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca una categoria...'>",
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
            arraySelectCategoria.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelectCategoria);
            arraySelectCategoria.splice(busqueda, 1);
        }
    });


    $('.Programa').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un programa...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un programa...'>",
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
            arraySelecionPrograma.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecionPrograma);
            arraySelecionPrograma.splice(busqueda, 1);
        }
    });
    function btnbuscar() {
        var formato = "";
        //Array de programa selecionados variable arraySelecionPrograma 
        //Array de categoria selecionados variable arraySelectCategoria
        if ($("#Formato").val() != "AF") {
            formato = $("#Formato").val();
        }
        jso[6] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:["' + $("#txtBuscarTitle").val() + '","' + formato + '","' + $("#dataInicialA").val() + '","' + $("#dataFinalA").val() + '","' + $("#Autores").val() + '","' + arraySelecionPrograma + '"],caso:1}]'];
        selector[6] = $("#formulario1");
        datos[6] = {nombre: "ConsOaP"};
        $("#resultadosProductos").empty();
        $("#paginador").empty().append(pagina);
        ajax(6, datos[6]);
    }
    $("#programa").click(function () {
        $("#ElementoFormacion").show();
        $("#CategoriaTem").hide();
    });
    var cc = 0;
    $("#categoria").click(function () {
        $("#CategoriaTem").show();
        $("#ElementoFormacion").hide();
        if (cc == 0) {
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[3] = $("#SelectCategoria");
            datos[3] = {nombre: "Select"};
            ajax(3, datos[3]);
        }
        cc++;
    });
    $("#SelectCategoria").change(function () {
        if ($("#categoria").val() == "A0") {
        } else {
            jso[5] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[6,7],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:6}]'];
            selector[5] = $("#TemaC");
            datos[5] = {nombre: "Select"};
            ajax(5, datos[5]);
        }
    });
    $(document).on('click', '.mom', function (e) {
        var a = this.value;
        jso[2] = ['Instrutor_Controller', '[{opcion:5,ti:' + idRol + '}]'];
        var daMen = a.split("$$");
        datos[2] = {idProducto: daMen[0], titulo: daMen[1], descripcion: daMen[2], caso: "Detalles del producto virtual."};
        ajax(2, datos[2]);
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
            $(".pag" + 1).show();
            $("#pag0" + 1).css("background-color", "blue");
            jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:13,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[1] = $("#txtBuscarTitle");
            datos[1] = {nombre: "AutoComplet"};
            $("#pagActual").val("pag1");
            if (datos[i].op != true) {
                ajax(1, datos[1]);
            }
        } else if (i == 1) {
            jso[11] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[11] = $("#Formato");
            datos[11] = {nombre: "Select"};
            ajax(11, datos[11]);
        } else if (i == 2) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
            $("#idPro").text(datos[i].idProducto);
            $("#tituloPro").text(datos[i].titulo);
            $("#DescripcionProducto").text("Descripcion del producto: " + datos[i].descripcion);
            $(".ui-datepicker-group").remove();
        } else if (i == 11) {
            jso[12] = ['Crud_Controller', '[{opcion:3,tabla2:26,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[12] = $("#Autores");
            datos[12] = {nombre: "Select"};
            ajax(12, datos[12]);
        }
    }
});
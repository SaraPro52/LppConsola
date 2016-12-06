$(document).on('ready', function () {
    $("#dataInicialA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataFinalA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataInicialA").change(function () {
        $("#dataFinalA").datepicker("option", "minDate", $("#dataInicialA").val());
    });
    $("#dataFinalA").change(function () {
        $("#dataInicialA").datepicker("option", "maxDate", $("#dataFinalA").val());
    });
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    jso[0] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:[],caso:29}]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "ConsOaP", worker: true};
    ajax(0, datos[0]);
    var ob = new $.Luna("Consultar PV", $("#formulario1"));
    ob.Vivo("ConsultarPV");
    $("#Programas").change(function () {
        if ($("#Categoria").prop('checked')) {
            $("#Categoria").prop('checked', false);
        }
        $("#ElementoCategoria").hide();
        $("#ElementoFormacion").show();
        if ($("#Programas").prop('checked')) {
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:6,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[4] = $("#CiudadFormacion");
            datos[4] = {nombre: "Select", worker: true};
            ob.limpiarSelector(selector[4]);
            ajax(4, datos[4]);
        }
    });
    $("#CiudadFormacion").change(function () {
        var option = $("#CiudadFormacion").val();
        if (option != "A0") {
            jso[7] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[1,3],delimitador:"[{colum:5,operador:0,valor1:' + $("#CiudadFormacion").val() + '}]",id:0,opSelect:6}]'];
            selector[7] = $("#CentroF");
            datos[7] = {nombre: "Select", worker: true};
            ob.limpiarSelector(selector[7]);
            ajax(7, datos[7]);
        }
    });
    $("#CentroF").change(function () {
        var option = $("#CentroF").val();
        if (option != "A0") {
            jso[8] = ['Crud_Controller', '[{opcion:3,tabla2:1,tipo:2,elegir:[7,8],delimitador:"[{colum:5,operador:0,valor1:' + $("#CiudadFormacion").val() + ',añadir:0},{colum:1,operador:0,valor1:' + $("#CentroF").val() + '}]",id:0,opSelect:6}]'];
            selector[8] = $("#Area");
            datos[8] = {nombre: "Select", worker: true};
            ob.limpiarSelector(selector[8]);
            ajax(8, datos[8]);
        }
    });
    $("#Area").change(function () {
        var option = $("#Area").val();
        if (option != "A0") {
            jso[9] = ['Crud_Controller', '[{opcion:3,tabla2:2,tipo:2,elegir:[4,5],delimitador:"[{colum:1,operador:0,valor1:' + $("#Area").val() + '}]",id:0,opSelect:6}]'];
            selector[9] = $("#Programa");
            datos[9] = {nombre: "MultiSelect", worker: true};
            ajax(9, datos[9]);
        }
    });
    $("#Categoria").change(function () {
        if ($("#Programas").prop('checked')) {
            $("#Programas").prop('checked', false);
        }
        $("#ElementoCategoria").show();
        $("#ElementoFormacion").hide();
        if ($("#Categoria").prop('checked')) {
            jso[8] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[8] = $("#SelectCategoria");
            datos[8] = {nombre: "MultiSelect", worker: true};
            ajax(8, datos[8]);
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
        }
    });
    $(document).on('click', '.mom', function (e) {
        var a = $("." + this.value).find('p');
        var c = $(a[0]);
        var objeto = {url: "Instrutor_Controller", Opcion: 5, name: 'cuerpo'};
        idProducto = this.value;
        Titulo = c.text();
        obtenerP(objeto);
    });
    function obtenerP(datos) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                res(json, datos.name);

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus + errorThrown + " Disculpa.");
            }
        });
    }
    function res(body, select) {
        switch (select) {
            case"cuerpo":
                $("#cuerpo").empty();
                $("#cuerpo").append(body);
                break;
        }
    }
    $("#btnBuscar").click(function () {
        btnbuscar();
    });
    var arraySelectCategoria = [];
    $('#SelectCategoria').multiSelect({
        afterSelect: function (valor) {
            arraySelectCategoria.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelectCategoria);
            arraySelectCategoria.splice(busqueda, 1);
        }
    });
    var arraySelecionPrograma = [];
    $('#Programa').multiSelect({
        afterSelect: function (valor) {
            arraySelecionPrograma.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionPrograma);
            arraySelecionPrograma.splice(busqueda, 1);
        }
    });

    function btnbuscar() {
        //Array de programa selecionados variable arraySelecionPrograma 
        //Array de categoria selecionados variable arraySelectCategoria
        jso[8] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:["' + $("#txtBuscarTitle").val() + '","' + $("#Formato").val() + '","' + $("#dataInicialA").val() + '","' + $("#dataFinalA").val() + '","' + $("#Autores").val() + '",""],caso:27}]'];
        selector[8] = $("#formulario1");
        datos[8] = {nombre: "ConsOaP", worker: true};
        selector[8].empty();
        ajax(8, datos[8]);
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
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[4] = $("#SelectCategoria");
            datos[4] = {nombre: "Select", worker: true};
            ajax(4, datos[4]);
        }
        cc++;
    });
    $("#SelectCategoria").change(function () {
        if ($("#categoria").val() == "A0") {
        } else {
            jso[5] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[6,7],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:6}]'];
            selector[5] = $("#TemaC");
            datos[5] = {nombre: "Select", worker: true};
            ajax(5, datos[5]);
        }
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
            $(".pag" + 0).show();
            jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:13,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#txtBuscarTitle");
            datos[2] = {nombre: "AutoComplet", worker: true};
            $("#pagActual").val("pag0");
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:3,tabla2:17,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[3] = $("#Formato");
            datos[3] = {nombre: "Select", worker: true};
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[6] = ['Crud_Controller', '[{opcion:3,tabla2:26,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[6] = $("#Autores");
            datos[6] = {nombre: "Select", worker: true};
            ajax(6, datos[6]);
        }
    }
});

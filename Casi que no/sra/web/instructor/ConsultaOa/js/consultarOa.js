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
    //jso[0] = ['ProductoVirtual_Controller','[{opcion:5,filtrar:[],caso:29}]'];
    jso[0] = ['ProductoVirtual_Controller', '[{opcion:6,id:'+idProductoVirtual+'}]'];//DETALLES
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "ConsOaP", worker: true};
    ajax(0, datos[0]);
    var ob = new $.Luna("Consultar PV", $("#formulario1"));
    ob.Vivo("ConsultarOA");
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
        jso[8] = ['ProductoVirtual_Controller', '[{opcion:5,filtrar:["' + $("#txtBuscarTitle").val() + '","' + $("#Formato").val() + '","' + $("#dataInicialA").val() + '","' + $("#dataFinalA").val() + '","' + $("#Autores").val() + '",""],caso:27}]'];
        selector[8] = $("#formulario1");
        datos[8] = {nombre: "ConsOaP", worker: true};
        selector[8].empty();
        ajax(8, datos[8]);


    });
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
        //Categoria
        //jso[6] = ['Crud_Controller', '[{opcion:3,tabla2:4,tipo:2,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
        //Programa de formacion
        //jso[6] = ['Crud_Controller', '[{opcion:3,tabla2:3,tipo:2,elegir:[1,2],delimitador:[],id:0,opSelect:4}]'];


    }
});

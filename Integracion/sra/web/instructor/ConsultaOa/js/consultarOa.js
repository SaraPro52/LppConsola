$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    jso[0] = ['ProductoVirtual_Controller', '[{opcion:5]'];
    selector[0] = $("#formulario1");
    datos[0] = {nombre: "ConsOaP", worker: true};
    ajax(0, datos[0]);
    var ob = new $.Luna("Consultar PV", $("#formulario1"));
    ob.Vivo("ConsultarOA");

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
            selector = $("#txtBuscar");
            objet = {opcion: 5, url: "", nombre: "", tabla: "22", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
            jso[0] = ['Crud_Controller', '[{opcion:5]'];
            selector[0] = $("#formulario1");
            datos[0] = {nombre: "AutoComplet", worker: true};
            ajax(0, datos[0]);


        }

        if (i == 1) {
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }

    var limpiandpo = $('<option>', {value: 'A0', text: 'Seleciona...'});


    var constan = true;
    var consta = true;
    var busT = 0;
    $("#txtBuscar").hover(function () {
        if (busT == 0) {

        }
        busT++;
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
    var c = 0;
    $("#Resultado").change(function () {
        if (consta == true) {
            $("#CategoriaTem").hide();
            $("#ElementoFormacion").show();
            consta = false;
        } else {
            $("#CategoriaTem").show();
            $("#ElementoFormacion").hide();
            consta = true;
        }
    });
    $("#Categoria").hover(function () {
        if (c == 0) {
            selector = $("#Categoria");
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "4", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
        c++;
    });
    var categoria = "A0";
    $("#Categoria").change(function () {
        categoria = $("#Categoria").val();
    })
    var tc = 0;
    $("#TemaC").hover(function () {
        selector = $("#TemaC");
        if (idprograma.trim() == "A0") {
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "30", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
        } else {
            objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "3", datos: [""], elegir: ["4", "5"],
                delimitador: "[{colum:1,operador:0 ,valor1: " + categoria + "}]", id: 0, opSelect: 6};
        }
        ob.ajax(objet, selector);
    });
    ///Ahora Eventos de Programa de formacion =/
    var ccon = 0;
    $("#CiudadFormacion").hover(function () {
        if (ccon == 0) {
            selector = $("#CiudadFormacion");
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "6", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
        ccon++;
    });

    $("#Ciudad").change(function () {
        selector = $("#CentroF");
        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "1", datos: [""], elegir: ["1", "3"],
            delimitador: "[{colum:5,operador:0 ,valor1: " + $("#Ciudad").val() + "}]", id: 0, opSelect: 6};
        ob.ajax(objet, selector);
    });
    $("#CentroF").hover(function () {
        console.log($("#Ciudad").val());
        $("#CentroF").empty().append(limpiandpo);
        selector = $("#CentroF");
        if ($("#Ciudad").val() == "A0") {
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "5", datos: [""], elegir: ["0", "2"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });
    $("#CentroF").change(function () {
        selector = $("#Area");
        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "1", datos: [""], elegir: ["7", "8"],
            delimitador: "[{colum:5,operador:0 ,valor1: " + $("#Ciudad").val() + ",añadir:1},{colum:1,operador:0,valor1:" + $("#CentroF").val() + "}]", id: 0, opSelect: 6};
        ob.ajax(objet, selector);
    });
    $("#Area").hover(function () {
        if (($("#CentroF").val() == "A0") || ($("#Ciudad").val() == "A0")) {
            $("#Area").empty().append(limpiandpo);
            selector = $("#Area");
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "1", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });
    $("#Area").change(function () {
        selector = $("#Programa");
        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "2", datos: [""], elegir: ["4", "5"],
            delimitador: "[{colum:1,operador:0 ,valor1: " + $("#Area").val() + "}]", id: 0, opSelect: 6};
        ob.ajax(objet, selector);
    });
    $("#Programa").hover(function () {
        selector = $("#Programa");
        if ($("#Area").val() == "A0") {
            $("#Programa").empty().append(limpiandpo);
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "24", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });
    $("#Programa").change(function () {
        selector = $("#TemaPrograma");
        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "3", datos: [""], elegir: ["4", "5"],
            delimitador: "[{colum:1,operador:0 ,valor1: " + $("#Programa").val() + "}]", id: 0, opSelect: 6};
        ob.ajax(objet, selector);
    });
    $("#TemaPrograma").hover(function () {
        if ($("#Programa").val() == "A0") {
            $("#TemaPrograma").empty().append(limpiandpo);
            selector = $("#TemaPrograma");
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "30", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });

//    $("#Formacion").hover(function () {
//        selector = $("#Formacion");
//        objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "0", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
//        //ob.ajax(objet,selector);
//    });
//
//    $("#Formacion").on('change', function () {
//        if ($("#Formacion").val() == "A0") {
//            $("#formacionC").hide();
//            $("#ElementoCategoria").show();
//        } else {
//            $("#formacionC").show();
//            $("#ElementoCategoria").hide();
//        }
//    });
//    $(document).on('click', '.btn-info', function (e) {
//        var boton = $(this);
//        console.log(boton.val());
//        var objeto = {id: this.id};
//    });
//    $(document).on('click', '.clickEstre', function (e) {
//        var estrella = $(this);
//        var objeto = {valor: this.id, id: estrella.val()};
//        console.log(objeto);
//    });

});


$(document).on('ready', function () {
    $("#iFecha").datepicker();
    var selector = [], hilo = [], jso = [], data = [], datos = [], constan = true;
    jso[0] = ['Crud_Controller', '[{opcion:5,tabla:22,elegir:[0,1,2,3,4],delimitador:[],id:0,opSelect:4}]'];
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
        console.log(this);

        var a = $("." + this.value).find('p');
        var c = $(a[0]);

        var objeto = {url: "Instrutor_Controller", Opcion: 5, name: 'cuerpo'};
        idProducto = this.value;
        Titulo = c.text();
        obtenerP(objeto);
    });


    function obtenerP(datos) {
        console.log(datos);
        console.log("s");
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log(json);
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
        var jso = data[2];
        console.log($("#txtBuscarTitle").val());

        jso = jQuery.parseJSON(data[2]);
        for (var i = 1; i <= jso.length; i++) {
            var a = $("." + i).find('p');
            console.log(a);
            var c = $(a[0]);
            console.log($(a[0]));
            $("." + i).show();
            if ($("#txtBuscarTitle").val() == c.text()) {
                $("." + i).show();
            } else {
                $("." + i).hide();
            }
        }

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
            jso[4] = ['Crud_Controller', '[{opcion:3,tabla:4,datos:[],delimitador:[],elegir:[0,1],id:0,opSelect:4}]'];
            selector[4] = $("#SelectCategoria");
            datos[4] = {nombre: "Select", worker: true};
            ajax(4, datos[4]);
        }
        cc++;
    });
    $("#SelectCategoria").change(function () {
        if ($("#categoria").val() == "A0") {
        } else {
            jso[5] = ['Crud_Controller', '[{opcion:5,tabla:4,elegir:[6,7],delimitador:"[{colum:0,operador:0,valor1:' + $("#SelectCategoria").val() + '}]",id:0,opSelect:6}]'];
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
            jso[2] = ['Crud_Controller', '[{opcion:5,tabla:13,datos:[],elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
            selector[2] = $("#txtBuscarTitle");
            datos[2] = {nombre: "AutoComplet", worker: true};
            $("#pagActual").val("pag0");
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Crud_Controller', '[{opcion:3,delimitador:[],tabla:17,datos:[],elegir:[0,1],id:0,opSelect:4}]'];
            selector[3] = $("#Formato");
            datos[3] = {nombre: "Select", worker: true};
            ajax(3, datos[3]);
        }
    }



});
//
//    $("#Resultado").change(function () {
//        if (consta == true) {
//            $("#CategoriaTem").hide();
//            $("#ElementoFormacion").show();
//            consta = false;
//        } else {
//            $("#CategoriaTem").show();
//            $("#ElementoFormacion").hide();
//            consta = true;
//        }
//    });
//    

//
//    function peticionCompleta(i) {
//        if (i == 0) {
//            selector = $("#");
//            objet = {opcion: 5, tabla: "22", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//            jso[0] = ['Crud_Controller', '[{opcion:5]'];
//            selector[0] = $("#txtBuscar");
//            datos[0] = {nombre: "AutoComplet", worker: true};
//            ajax(0, datos[0]);
//        }
//
//        if (i == 1) {
//            $.notify({
//                icon: 'ti-gift',
//                message: data[i] + "."
//            }, {
//                type: 'success',
//                timer: 4000
//            });
//        }
//    }
//
//    var limpiandpo = $('<option>', {value: 'A0', text: 'Seleciona...'});
//
//
//    var constan = true;
//    var consta = true;
//    var busT = 0;
//    $("#txtBuscar").hover(function () {
//        if (busT == 0) {
//
//        }
//        busT++;
//    });
//
//    var c = 0;
//
//    $("#Categoria").hover(function () {
//        if (c == 0) {
//
//        }
//        c++;
//    });
//
//
//    ///Ahora Eventos de Programa de formacion =/
//    var ccon = 0;
//    $("#CiudadFormacion").hover(function () {
//        if (ccon == 0) {
//            selector = $("#CiudadFormacion");
//            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "6", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//        }
//        ccon++;
//    });
//
//    $("#CentroF").change(function () {
//        selector = $("#Area");
//        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "1", datos: [""], elegir: ["7", "8"],
//            delimitador: "[{colum:5,operador:0 ,valor1: " + $("#Ciudad").val() + ",aÃ±adir:1},{colum:1,operador:0,valor1:" + $("#CentroF").val() + "}]", id: 0, opSelect: 6};
//        ob.ajax(objet, selector);
//    });
//    $("#Area").hover(function () {
//        if (($("#CentroF").val() == "A0") || ($("#Ciudad").val() == "A0")) {
//            $("#Area").empty().append(limpiandpo);
//            selector = $("#Area");
//            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "1", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//        }
//    });
//    $("#Area").change(function () {
//        selector = $("#Programa");
//        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "2", datos: [""], elegir: ["4", "5"],
//            delimitador: "[{colum:1,operador:0 ,valor1: " + $("#Area").val() + "}]", id: 0, opSelect: 6};
//        ob.ajax(objet, selector);
//    });
//    $("#Programa").hover(function () {
//        selector = $("#Programa");
//        if ($("#Area").val() == "A0") {
//            $("#Programa").empty().append(limpiandpo);
//            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "24", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//        }
//    });
//    $("#Programa").change(function () {
//        selector = $("#TemaPrograma");
//        objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "3", datos: [""], elegir: ["4", "5"],
//            delimitador: "[{colum:1,operador:0 ,valor1: " + $("#Programa").val() + "}]", id: 0, opSelect: 6};
//        ob.ajax(objet, selector);
//    });
//    $("#TemaPrograma").hover(function () {
//        if ($("#Programa").val() == "A0") {
//            $("#TemaPrograma").empty().append(limpiandpo);
//            selector = $("#TemaPrograma");
//            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "30", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//        }
//    });
//
////    $("#Formacion").hover(function () {
////        selector = $("#Formacion");
////        objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "0", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
////        //ob.ajax(objet,selector);
////    });
////
////    $("#Formacion").on('change', function () {
////        if ($("#Formacion").val() == "A0") {
////            $("#formacionC").hide();
////            $("#ElementoCategoria").show();
////        } else {
////            $("#formacionC").show();
////            $("#ElementoCategoria").hide();
////        }
////    });
////    $(document).on('click', '.btn-info', function (e) {
////        var boton = $(this);
////        console.log(boton.val());
////        var objeto = {id: this.id};
////    });
////    $(document).on('click', '.clickEstre', function (e) {
////        var estrella = $(this);
////        var objeto = {valor: this.id, id: estrella.val()};
////        console.log(objeto);
////    });
//
//
//

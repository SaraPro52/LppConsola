$(document).on('ready', function () {
    var objet = {opcion: 5, url: "ProductoVirtual_Controller", nombre: "ConsOaP"};
    var selector = $("#formulario1");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("ConsultarOA");
    ob.ajax(objet, selector);
    var constan = true;
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
    $("#Categoria").hover(function(){
        selector = $("#Categoria");
        objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "4", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
        //ob.ajax(objet,selector);
    });
    $("#Categoria").on('change', function () {
        if ($("#Categoria").val() == "A0") {
            $("#CategoriaTem").hide();
            $("#ElementoFormacion").show();
        } else {
            $("#CategoriaTem").show();
            $("#ElementoFormacion").hide();
        }
    });

    $(document).on('change', '.clickformacion', function (e) {
        var obj = $(this);
        console.log(obj.val());
    });
    //CONSULTAS
    
    //POR CIUDAD - SIN PARAMETROS
    objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "6", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    
    //POR CENTRO DE FORMACION - con parametro y sin parametro
    objet = {opcion: 5, url: "Crud_Controller", nombre: "ConsOaP", tabla: "1", datos: [""], elegir: ["1","3"], 
            delimitador:"[{colum:5,operador:0 ,valor1: "+IdCiudad+"}]",id: 0, opSelect: 6};
    
    objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "5", datos: [""], elegir: ["0", "2"], id: 0, opSelect: 4};
    
    //POR AREAS DE CONOCIMIENTO - con y sin paramentros
    objet = {opcion: 5, url: "Crud_Controller", nombre: "ConsOaP", tabla: "1", datos: [""], elegir: ["7","8"], 
            delimitador:"[{colum:5,operador:0 ,valor1: "+IdCiudad+",añadir:1},{colum:1,operador:0,valor1:"+IdCentro1+"}]",id: 0, opSelect: 6};
    
    objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "1", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    
    //POR PROGRAMAS DE FORMACION - con y sin parametros
    objet = {opcion: 5, url: "Crud_Controller", nombre: "ConsOaP", tabla: "2", datos: [""], elegir: ["4","5"], 
            delimitador:"[{colum:1,operador:0 ,valor1: "+IdArea+"}]",id: 0, opSelect: 6};
    
    objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "24", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    
    //POR TEMA - con y sin paramentros 
    objet = {opcion: 5, url: "Crud_Controller", nombre: "ConsOaP", tabla: "3", datos: [""], elegir: ["4","5"], 
            delimitador:"[{colum:1,operador:0 ,valor1: "+Idprograma+"}]",id: 0, opSelect: 6};
    
    objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "30", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    
    
    
    $("#Formacion").hover(function(){
        selector = $("#Formacion");
        objet = {opcion: 3, url: "Crud_Controller", nombre: "ConsOaP", tabla: "0", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
        //ob.ajax(objet,selector);
    });
    
    $("#Formacion").on('change', function () {
        if ($("#Formacion").val() == "A0") {
            $("#formacionC").hide();
            $("#ElementoCategoria").show();
        } else {
            $("#formacionC").show();
            $("#ElementoCategoria").hide();
        }
    });
    $(document).on('click', '.btn-info', function (e) {
        var boton = $(this);
        console.log(boton.val());
        var objeto = {id: this.id};
    });
    $(document).on('click', '.clickEstre', function (e) {
        var estrella = $(this);
        var objeto = {valor: this.id, id: estrella.val()};
        console.log(objeto);
    });

});


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


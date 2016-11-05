$(document).on('ready', function () {
    var objeto = [
        {Titulo: "Juan", Autores: "Nose,valeM", FechaPublicacion: "31/10/1234", Descripcion: "Esta es una prueba ;)", IdOa: 1},
        {Titulo: "kira", Autores: "valeM", FechaPublicacion: "31/11/1234", Descripcion: "Esta es una prueba 2;)", IdOa: 2},
        {Titulo: "kiras", Autores: "valeM", FechaPublicacion: "31/11/1234", Descripcion: "Esta es una prueba 2;)", IdOa: 2}
    ];
    var nombre = "ConsOaP";
    var datos= $("#resultados");
    cargarOa(objeto, nombre,datos);
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


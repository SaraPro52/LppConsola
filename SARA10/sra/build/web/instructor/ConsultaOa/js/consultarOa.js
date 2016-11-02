$(document).on('ready', function () {
    console.log("Vivo??Consultar");
    var objeto = {Titulo: "Juan", Autores: "Nose,valeM", FechaPublicacion: "31/10/1234", Descripcion: "Esta es una prueba ;)", IdOa: 1};
    var nombre = "carga";
    cargarOa(objeto, nombre);
    objeto = {Titulo: "kira", Autores: "valeM", FechaPublicacion: "31/11/1234", Descripcion: "Esta es una prueba 2;)", IdOa: 2};
    cargarOa(objeto, nombre);
    objeto = {Titulo: "kira", Autores: "valeM", FechaPublicacion: "31/11/1234", Descripcion: "Esta es una prueba 2;)", IdOa: 2};
    cargarOa(objeto, nombre);
    var objeto = {Opcion: 3, url: "oacontroller", nombre: "Titulo"};
    obtenerDatos(objeto);

    objeto={Opcion:3,url:"programafor",nombre:"Formacion"};
    obtenerDatos(objeto);
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
    function cargarOa(Datos, nombre) {
        switch (nombre) {
            case "carga":
                var oAItem;
                oAItem = $("#formulario1").clone();
                oAItem.find("#TituloOa").text(Datos.Titulo);
                oAItem.find("#AutoresOa").text(Datos.Autores);
                oAItem.find("#FechaPublicacionOa").text(Datos.FechaPublicacion);
                oAItem.find("#DescripcionOa").text(Datos.Descripcion);
                oAItem.find("#BtnDescargar").val(Datos.IdOa);
                oAItem.children().appendTo("#resultados");
                break;
            case "Titulo":
                var json = $(Datos).map(function () {
                    return {value: this.Nom_P_Virtual, id: this.Id_Formato}
                }).get();
                $("#txtBuscar").autocomplete({
                    source: json,
                    minLength: 2
                });
                break;
            case "Formacion":
                for (var i = 0; i < Datos.length; i++) {
                    $("#Formacion").append( $('<option>', {
                        value: Datos[i].Id_Programa,
                        text: Datos[i].Nom_Programa
                    }));
                }
                break;
        }
    }
    $("#Categoria").on('change', function () {
        if ($("#Categoria").val() == "A0") {
            $("#CategoriaTem").hide();
            $("#ElementoFormacion").show();
        } else {
            $("#CategoriaTem").show();
            $("#ElementoFormacion").hide();
        }
    });
    
    $(document).on('change','.clickformacion',function(e){
        var obj= $(this);
        console.log(obj.val());
        var objeto ={id:obj,url:""};
        
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
    function obtenerDatos(datos) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                //console.log(json);
                cargarOa(json, datos.nombre);
            },
            error: function () {
                alert("Disculpa, pero existe un error :/");
            }
        });
    }
});


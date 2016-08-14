$(document).on('ready', function () {
    console.log("Vivo??");
    cargarDatos();
    $("#btnRegistrar").on('click', function () {
        var selector="btn";
        var objeto = {
            Opcion: 1,
            url: "funcionariocontroller",
            nombre: "Funcionario",
            STipoUsuario: $("#tipoUsuario").val(),
            CNombre: $("#CampoNombre").val(),
            CApellido: $("#CampoApellido").val(),
            StipoIdentificacion: $("#selectionTIdentificacion").val(),
            CIdentificacion: $("#campIdentificacion").val(),
            CEmail: $("#campEmail").val(),
            CSena: $("#campSena").val(),
            SCargo: $("#cargo").val(),
            SCentro: $("#Centro").val(),
            SArea: $("#Area").val(),
            SEstado: $("#Estado").val()
        };
        obtenerDatos(objeto,selector);
    });
    function cargarDatos() {
        var selector = $("#Estado");
        var objeto = {
            Opcion: 3,
            url: "EstadoController",
            nombre: "Estado"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Area");
        objeto = {
            Opcion: 3,
            url: "areacontronller",
            nombre: "Area"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Centro");
        objeto = {
            Opcion: 3,
            url: "CentroController",
            nombre: "Centro"
        };
        obtenerDatos(objeto,selector);
    }
    function AddOption(Datos, nombre, Selector) {
        switch (nombre) {
            case "Area":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Area,
                        text: Datos[i].Nom_Area
                    }));
                }
                break;
            case "Estado":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Estado,
                        text: Datos[i].Nom_Estado
                    }));
                }
                break;
            case "Centro":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Centro,
                        text: Datos[i].Nom_Centro
                    }));
                }
                break;
            case "btn":
                alert("Funcionario registrado correctamente ");
                break;
        }
    }
    function obtenerDatos(datos, selector) {
        alert("a "+datos.url);
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                console.log("Peticion completa con respuesta  selector" + datos.nombre + "Respuesta " + json);
                AddOption(json, datos.nombre, selector);
            },
            error: function (request, status, error) {
                alert("Disculpa, pero existe un error :/" + request.responseText);
            }
        });
    }
});
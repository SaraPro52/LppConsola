$(document).ready(function () {
    console.log("Vivio??SubirOA");
    cargarDatos();
    
    function cargarDatos() {
        var selector;
        var objeto;
        selector = $("#Area");
        objeto = {
            Opcion: 3,
            url: "areacontroller",
            nombre: "Area"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Programa");
        objeto = {
            Opcion: 3,
            url: "ProgramaController",
            nombre: "Programa"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Tema");
        objeto = {
            Opcion: 3,
            url: "temacontroller",
            nombre: "Area"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Formato");
        objeto = {
            Opcion: 3,
            url: "FormatoController",
            nombre: "Formato"
        };
        obtenerDatos(objeto, selector);
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
        }
    }
    function obtenerDatos(datos, selector) {
        $.ajax({
            url: datos.url,
            type: "POST",
            async: true,
            cache: false,
            datatype: "Json",
            data: datos,
           success: function (json) {
                console.log("Peticion completa con respuesta  selector:" + datos.nombre + " Respuesta " + json);
                AddOption(json, datos.nombre, selector);
            },
            error: function (request, status, error) {
                alert("Funcionario registrado correctamente :)" + request.responseText);
            }
        });
    }
});
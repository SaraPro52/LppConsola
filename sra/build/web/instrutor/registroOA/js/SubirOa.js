$(document).ready(function () {
    console.log("Vivio??SubirOA");
    cargarDatos();

    $("#btnaceptar").on('ready', function () {
        var selector = ("guardando");
        var objeto = {
            Opcion: 1,
            url: "areacontroller",
            nombre: "Area",
            titulo: $("#Titulo").val(),
            autores : $("#Autores").val(),
            descripcion: $("#Descripcion").val(),
            area: $("#Area").val(),
            programa: $("#Programa").val(),
            tema: $("#Tema").val(),
            palabras: $("#PalabrasClave").val(),
            formato: $("#Formato").val(),
            requisitos: $("#Requisitos").val(),
            instruciones: $("#Instruciones").val()
        };
        obtenerDatos(objeto,selector);
    });
    function cargarDatos() {
        var selector;
        var objeto;
        selector = $("#Area");
        objeto = {
            Opcion: 3,
            url: "archivoscontroller",
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
            nombre: "Tema"
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
            case "Programa":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Programa,
                        text: Datos[i].Nom_Programa
                    }));
                }
                break;
            case "Tema":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Tema,
                        text: Datos[i].Nom_Tema
                    }));
                }
                break;
            case "Formato":
                for (var i = 0; i < Datos.length; i++) {
                    Selector.append($('<option>', {
                        value: Datos[i].Id_Formato,
                        text: Datos[i].Nom_Formato
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
                //console.log("Peticion completa con respuesta  selector:" + datos.nombre + " Respuesta " + json);
                AddOption(json, datos.nombre, selector);
            },
            error: function (request, status, error) {
                alert("Funcionario registrado correctamente :)" + request.responseText);
            }
        });
    }

});
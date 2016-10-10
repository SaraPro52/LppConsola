$(document).ready(function () {
    console.log("Vivio??SubirOA");
    var selector;
    var objeto;
    selector = $("#options1");
    objeto = {Opcion: 3, url: "areacontroller", nombre: "Area"};

    $("#subir_oa").on('click', function () {
        $("#div").remove();
        if ($("#Titulo_Publicacion").val() == "") {
                             $("#Titulo_Publicacion").focus().after("<div style='border: 1px solid red'  id='div'> <span class='error'>Ingrese un Titulo de Publicacion</div></span><br/>");
                             return false;
                } else if ($("#autores").val() == "") {
                             $("#autores").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese un autores</div></span><br/>");
                              return false;
        } else if ($('#options1').val().trim() === '') {
            $("#options1").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>selecione un cargo</div></span><br/>");
            return false;
        } else if ($('#options2').val().trim() === '') {
            $("#options2").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>selecione un rol</div></span><br/>");
            return false;
        } else if ($("#palabras_claves").val() == "") {
                             $("#palabras_claves").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese las palabras claves</div></span><br/>");
                             return false;
        } else if ($("#descripcion_oa").val() == "") {
                             $("#descripcion_oa").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>ingrese la descripcion de la OA</div></span><br/>");
                             return false;
        } else if ($("#formato").val() == "") {
                           $("#formato").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese el formato</div></span><br/>");
                     return false;
        } else if ($("#Numero_funcionario").val() == "") {
                     $("#Numero_funcionario").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese su Numero de funcionario</div></span><br/>");
                     return false;
        } else if ($("#requisitos_instalacion").val() == "") {
                     $("#requisitos_instalacion").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese requisitos de instalacion</div></span><br/>");
                     return false;
        } else if ($("#instrucciones").val() == "") {
                       $("#instrucciones").focus().after("<div style='border: 1px solid red' id='div'> <span class='error'>Ingrese las instrucciones</div></span><br/>");
                       return false;
        } else {
            datosV();
        }

    });
    function datosV() {
        var selector = ("guardando");
        var objeto = {
            Opcion: 1,
            url: "areacontroller",
            nombre: "Area",
            titulo: $("#Titulo_Publicacion").val(),
            autores: $("#autores").val(),
            descripcion: $("#descripcion_oa").val(),
            area: $("#options1").val(),
            programa: $("#options2").val(),
            tema: $("#Tema").val(),
            palabras: $("#palabras_claves").val(),
            formato: $("#formato").val(),
            requisitos: $("#requisitos_instalacion").val(),
            instruciones: $("#instrucciones").val()
        };
        obtenerDatos(objeto, selector);
        archivos();
    }
    function archivos() {
        var formData = new FormData(document.getElementById("formuploadajax"));
        formData.append("dato", "valor");
        //console.log(formData.getPrototypeOf());
        formData.append(f.attr("name"), $(this)[0].files[0]);
        $.ajax({
            url: "archivoscontroller",
            type: "post",
            dataType: "html",
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        })
                .done(function (res) {
                    $("#mensaje").html("Respuesta: " + res);
                });
    }
    $("#options1").change(function(e){
        alert(this.value);
        
    });
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
                console.log("Peticion completa con respuesta  selector:" + datos.nombre + " Respuesta " + json);
                AddOption(json, datos.nombre, selector);
            },
            error: function (request, status, error) {
                alert("Funcionario registrado correctamente :)" + request.responseText);
            }
        });
    }
});
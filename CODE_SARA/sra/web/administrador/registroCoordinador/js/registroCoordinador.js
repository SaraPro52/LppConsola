$(document).on('ready', function () {
    console.log("Vivo??");
    cargarDatos();
    $("#boton1").on('click', function () {
         $(".error").remove();
        if( $("#nombre").val() == "" ){
            $("#nombre").focus().after("<div> <span class='error' style='color:#FF0040;'><div/>Ingrese su nombre</span>");
            return false;
        }else if( $("#apellido").val() == "" ){
            $("#apellido").focus().after(" <div> <span class='error' style='color:#FF0040;'>Ingrese su apellido<div/></span>");
            return false;
        }else if( $("#Numero_funcionario").val() == "" ){
                    $("#Numero_funcionario").focus().after("<div> <span class='error' style='color:#FF0040;'>Ingrese su Numero de funcionario</span>");
                    return false;
      }else if($("#email").val().indexOf('@', 0) == -1 || $("#email").val().indexOf('.', 0) == -1) {
        $("#email").focus().after("<div style='color:#031503'> <div/><span class='error' style='color:#FF0040;'>Ingrese su correo</span>");
        return false;
        }else if( $("#contraseña").val() == "" ){
                  $("#contraseña").focus().after(" <div><span class='error' style='color:#FF0040;'>Ingrese su contraseña<div/></span>");
                  return false;
        }else if( $("#confirmar_contraseña").val() == "" ){
                    $("#confirmar_contraseña").focus().after("<div><span class='error' style='color:#FF0040;'>confirme su confirmar<div/></span>");
                    return false;
        }else if($('#options').val().trim() === '') {
              $("#options").focus().after("<div><span class='error' style='color:#FF0040;'>confirme su campo<div/></span><br/>");
                          return false;
          }else if( $("#Numero_identificacion").val() == "" ){
                      $("#Numero_identificacion").focus().after("<div><span class='error' style='color:#FF0040;'>Ingrese su Numero_identificacion<div/></span>");
                      return false;
        }else if( $("#Ip_sena").val() == "" ){
                    $("#Ip_sena").focus().after("<div><span class='error' style='color:#FF0040;'>Ingrese su Ip_sena<div/></span>");
                    return false;
      }else if( $("#cargo").val() == "" ){
                  $("#cargo").focus().after("<div'><span class='error' style='color:#FF0040;'>Ingrese su cargo<div/></span>");
                  return false;
            }else if($('#options2').val().trim() === '') {
                  $("#options2").focus().after("<div><span class='error' style='color:#FF0040;'>confirme su campo<div/></span>");
                              return false;
                } else {
            datosV();
        }
        });
    function datosV() {
        alert("");
        var selector = "btn";
        var objeto = {
            Opcion: 1,
            url: "funcionariocontroller",
            nombre: "Funcionario",
            STipoUsuario: $("#tipoUsuario").val(),
            CNombre: $("#nombre").val(),
            CApellido: $("#apellido").val(),
            StipoIdentificacion: $("#options").val(),
            CIdentificacion: $("#Numero_identificacion").val(),
            CEmail: $("#email").val(),
            CSena: $("#Ip_sena").val(),
            SCargo: $("#Cargo").val(),
            SCentro: $("#options2").val(),
            SArea: $("#Area").val(),
            SEstado: $("#Estado").val()
        };
        obtenerDatos(objeto, selector);
    }
    function cargarDatos() {
        var selector = $("#Estado");
        var objeto = {
            Opcion: 3,
            tipo: 1,
            url: "estadocontroller",
            nombre: "Estado"
        };
        obtenerDatos(objeto, selector);
        selector = $("#Area");
        objeto = {
            Opcion: 3,
            url: "areacontroller",
            nombre: "Area"
        };
        obtenerDatos(objeto, selector);
        selector = $("#options2");
        objeto = {
            Opcion: 3,
            url: "centrocontroller",
            nombre: "Centro"
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
            case "Estado":
                for (var i = 0; i < Datos.length; i++) {
                    if (Datos[i].Id_Tipo_Estado == 1) {
                        Selector.append($('<option>', {
                            value: Datos[i].Id_Estado,
                            text: Datos[i].Nom_Estado
                        }));
                    }
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
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                //console.log("Peticion completa con respuesta  selector" + datos.nombre + "Respuesta " + json);
                AddOption(json, datos.nombre, selector);
            },
            error: function (request, status, error) {
                alert("error" + request.responseText);
            }
        });
    }
});
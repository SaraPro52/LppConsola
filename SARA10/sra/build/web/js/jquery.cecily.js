jQuery.Luna = function (Datos, selector) {
    this.cor = ("El gato lopez");
    this.Nombre = selector;
    this.Cons = Datos;
    this.setCons = function (dato) {
        this.Cons = dato
    };
    function setNombre(dato) {
        this.Nombre = dato
    }
    ;
    function getNombre() {
        return this.Nombre;
    }
    this.Vivo = function (mensaje) {
        console.log("Vivo??Cecily." + mensaje + " ");
    };
    this.limpiarTabla = function (selector) {
        var tabla = selector.DataTable();
        tabla
                .clear()
                .draw();
        $("input").val("");
    };
    this.tipoUsuario = function (tipo, lista) {
        var texto = "";
        if (tipo == 0) {
            texto = lista.text();
            texto = (texto + " equipo tecnico");
            lista.text(texto);
        } else if (tipo == 1) {
            texto = lista.text();
            texto = (texto + " equipo pedagogico");
            lista.text(texto);
        }
    }

    this.TablaEspa = function (datos) {
        datos.DataTable({
            language: {
                paginate: {
                    first: "Primera",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Anterior"
                },
                processing: "Cargando datos...",
                lengthMenu: "Mostrar _MENU_ " + this.Cons + "s",
                info: "Se encontaron _TOTAL_ " + this.Cons + "s",
                infoEmpty: "Mostradas 0 de _MAX_ entradas",
                "infoFiltered": "(filtrada a partir de  _MAX_ registro)",
                infoPostFix: "",
                loadingRecords: "Cargando...",
                "zeroRecords": "Ningun@ " + this.Cons + " encontrada - Disculpa :/",
                emptyTable: "No hay ningun@ " + this.Cons,
                search: "Buscar:"
            }
        });
    };
    this.archivosAjax = function (selector) {
        var formData = new FormData(document.getElementById(selector));
        formData.append("dato", "valor");
        console.log(formData.getPrototypeOf());
        formData.append(f.attr("name"), $(this)[0].files[0]);
        $.ajax({
            url: "archivos",
            type: "post",
            dataType: "html",
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        })
                .done(function (res) {
                    alert("Funciona" + res);
                });
    }
    this.ajax = function (datos, selector) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                cargarTabla(json, selector, datos);

            },
            error: function () {
                alert = ("Disculpa, pero existe un error al cargar datos del servidor :/");
            }, complete: function (jqXHR, textStatus) {
                var a = jqXHR.responseText;
                console.log(a);
                if ($.trim(a) == "Si Registro") {
                    $.notify(a, "success");
                }
                if ($.trim(a) == "No Registro") {
                    $.notify(a, "error");

                }
            }
        });
    };
    this.cargarTabla = function (json, selector, datos) {
        cargarTabla(json, selector, datos);
    };
    function cargarTabla(json, selector, datos) {
        var c = 1;
        switch (datos.nombre) {
            case "MultiSelect":
                console.log("cambio");
                var jso;
                if (datos.worker == true) {
                    jso = jQuery.parseJSON(json);
                } else {
                    jso = json;
                }
                if (datos.opt == "Div") {
                    selector.multiSelect('deselect_all');
                }
                selector.multiSelect('refresh');
                var j = Object.keys(jso[0]);
                for (var i = 0; i < jso.length; i++) {
                    selector.multiSelect('addOption', {value: jso[i][j[0]], text: jso[i][j[1]], index: i, nested: 'optgroup_label'});
                }
                break;
            case "Select":
                var jsSelect;
                if (datos.worker == true) {
                    jsSelect = jQuery.parseJSON(json);
                } else {
                    jsSelect = json;
                }
                var j = Object.keys(jsSelect[0]);
                for (var i = 0; i < jsSelect.length; i++) {
                    selector.append($('<option>', {
                        value: jsSelect[i][j[0]],
                        text: jsSelect[i][j[1]]
                    }));
                }
                break;
            case "ConsOaP":
                var oAItem;
                for (var i = 0; i < json.length; i++) {
                    oAItem = selector.clone();
                    oAItem.find("#TituloOa").text(json[i].Nom_P_Virtual);
                    oAItem.find("#AutoresOa").text(json[i].Autores);
                    oAItem.find("#FechaPublicacionOa").text(json[i].Fecha_Publicacion);
                    oAItem.find("#DescripcionOa").text(json[i].Des_P_Virtual);
                    oAItem.find("#BtnDescargar").val(json[i].Id_P_Virtual);
                    oAItem.children().appendTo($("#resultados"));
                }
                break;
            case "calificar":
                for (var i = 0; i < json.length; i++) {
                    var conte = $("#clone").clone();
                    conte.find('.chex').attr('value', json[i].Id_Detalles_Lista);
                    conte.find('.textarea').attr('id', json[i].Id_Detalles_Lista);
                    conte.find('.locura').text(json[i].Des_Item_Lista);
                    conte.children().appendTo(selector);
                }
                break;
            case "AutoComplet":
                var j = Object.keys(json[0]);
                var s = [];
                for (var i = 0; i < json.length; i++) {
                    s.push(json[i][j[1]]);
                }
                selector.autocomplete({
                    source: s,
                    minChars: 2
                });
                break;
            case "Notificacion":
                var jso = jQuery.parseJSON(json);
                var selecNo = selector.selector + "P";
                $(selecNo).empty();
                for (var i = 0; i < jso.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        jso[i].Conte_Notificacion,
                        jso[i].Fecha_Envio
                    ]);
                    if (i < 5) {
                        $(selecNo).append('<li><a><label class="Notify" id=' + jso[i].Ides_Proceso + '>' + jso[i].Conte_Notificacion + '</label></a></li>');
                    }else if(i==5){
                        $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas notificaciones</label></a></li>');
                    }
                }
                $("#ccNoti").append(i);
                break;
            case "correcion":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Conte_Notificacion,
                        json[i].Fecha_Envio,
                        "<button  type='button' id='" + json[i].Ides_Proceso + "' class='btn btn-info btn-lg btnCorrecion'>Correguir P.V</button>"
                    ]);
                }
                break;
            case "consutarOa":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Conte_Notificacion,
                        json[i].Fecha_Envio,
                        "<button  type='button' id='" + json[i].Ides_Proceso + "' class='btn btn-info btn-lg btnEvaluar'>Evaluar Producto</button>",
                        "<button  type='button' id='" + json[i].Url_Version + "' class='btn btn-info btn-lg btnDescargar'>Descargar Producto</button>",
                    ]);
                }
                break;
            case "ConsultarLista":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Lista_Chequeo,
                        json[i].Des_Lista_Chequeo,
                        json[i].Fecha_Creacion.substring(0, 11),
                        "<button id='ca' value='" + json[i].Id_Lista_Chequeo + "' class='btnclickca btn btn-info'>Escojer </button>"
                    ]);
                }
                break;
            case "Lista":
                for (var i = 0; i < json.length; i++) {
                    yu = [json[i].Nom_Lista_Chequeo + "$$$" + json[i].Des_Lista_Chequeo];
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Lista_Chequeo,
                        json[i].Des_Lista_Chequeo,
                        json[i].Fecha_Creacion.substring(0, 11),
                        "<button id='" + json[i].Id_Lista_Chequeo + "' value='" + yu + "' class='btnclick btn btn-success'>Modificar</button>"
                    ]);
                }
                break;
            case "Ciudad":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Ciudad,
                        "<button id='" + json[i].Id_Ciudad + "' value='m' class='btnclick btn btn-success'>Modificar</button>",
                        "<button id='" + json[i].Id_Ciudad + "' value='e' class='btnclick btn btn-danger'>Eliminar</button>"
                    ]);
                }
                break;
            case "Habilitar":
                var jsSelect = jQuery.parseJSON(json);
                for (var i = 0; i < jsSelect.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        jsSelect[i].Nom_P_Virtual,
                        jsSelect[i].Num_Version,
                        "<button id='" + jsSelect[i].Id_Version + "'class='btnclick btn btn-info'>Habilitar</button>"
                    ]);
                }
                break;
            case "Area":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        c,
                        json[i].Nom_Area,
                        json[i].Lider_Area,
                        "<button id='" + json[i].Id_Area + "' class='btn btn-success botonclick'value='m' >modificar</button>"
                    ]);
                    c++;
                }
                break;
            case "Funcionario":
                var jsFuncionario;
                jsFuncionario = jQuery.parseJSON(json);
                for (var i = 0; i < jsFuncionario.length; i++) {
                    table = selector.dataTable().fnAddData([
                        c,
                        jsFuncionario[i].NombreCompleto,
                        jsFuncionario[i].Cargo,
                        jsFuncionario[i].Nom_Area,
                        jsFuncionario[i].Nom_Estado,
                        "<button id='" + jsFuncionario[i].Id_Funcionario + "' class='botonclick btn btn-danger'>Deshabilitar Usuario</button>"
                    ]);
                    c++;
                }
                break;
            case "Formato" :
                var w = getNombre();
                if ((datos.d == 1) && (w == json.length)) {
                    $.notify("Formato guardado", "success");
                } else if (datos.d == 1) {
                    $.notify("El formato ya existe, intenta de nuevo", "info");
                }

                for (var i = 0; i < json.length; i++) {
                    table = $("#tablaformato").dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Formato,
                        json[i].Des_Formato,
                        "<button id='" + json[i].Id_Formato + "' class='btn btn-success botonclick'value='m' >modificar</button>",
                        "<button id='" + json[i].Id_Formato + "' class='btn btn-danger botonclick' value='e'>eliminar</button>"
                    ]);
                }
                setNombre(i + 1);
                break;
            case "AsignarRol":
                for (var i = 0; i < json.length; i++) {
                    var select = ("'><option value='1'>Intructor</option><option value='2'>Equipo Tecnico</option><option value='3'>Equipo Pedagogico</option></select>");
                    table = $("#tablaARoles").dataTable().fnAddData([
                        i + 1,
                        json[i].NombreCompleto,
                        json[i].Cargo,
                        json[i].Nom_Area,
                        json[i].Nom_Centro,
                        json[i].Nom_Ciudad,
                        "<select id='Select" + json[i].Id_Funcionario + "'value='0'" + select,
                        "<button id='" + json[i].Id_Funcionario + "' class='btnclick btn btn-success botonclick'value='A' >Asignar</button>"
                    ]);
                }
                break;
        }
    }
};

jQuery.Luna = function (Datos, selector) {
    this.cor = ("El gato lopez");
    this.Nombre = selector;
    this.Cons = Datos;
    this.setCons = function (dato) {
        this.Cons = dato
    };
    this.setNombre = function (dato) {
        this.Nombre = dato
    };
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
                lengthMenu: "Mostrar _MENU_ " + this.Cons + "s",
                "infoFiltered": "(filtrada a partir de  _MAX_ registro)",
                info: "Se encontaron _TOTAL_ " + this.Cons + "s",
                loadingRecords: "Cargando...",
                "zeroRecords": "Ninguna " + this.Cons + "encontrada - Disculpa :/",
                emptyTable: "No hay ningun@ " + this.Cons,
                search: "Buscar:"
            }
        });
    };

    this.ajax = function (datos, selector) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {
                //console.log(json);
                cargarTabla(json, selector, datos);
            },
            error: function () {
                alert = ("Disculpa, pero existe un error al cargar datos del servidor :/");
            }
        });
    };
    function cargarTabla(json, selector, datos) {
        var c = 1;
        console.log(datos.nombre);
        switch (datos.nombre) {
            case "btn":
                alert(json);
                break;
            case "MultiSelect":
                if (datos.opt == "Div") {
                    selector.multiSelect('deselect_all');
                }
                selector.multiSelect('refresh');
                var j = Object.keys(json[0]);
                for (var i = 0; i < json.length; i++) {
                    selector.multiSelect('addOption', {value: json[i][j[0]], text: json[i][j[1]], index: i, nested: 'optgroup_label'});
                }
                break;
            case "Select":
                var j = Object.keys(json[0]);
                for (var i = 0; i < json.length; i++) {
                    selector.append($('<option>', {
                        value: json[i][j[0]],
                        text: json[i][j[1]]
                    }));
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
            case "consutarOa":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_P_Virtual,
                        json[i].Nom_Estado,
                        json[i].Num_Version,
                        json[i].Fecha_Vigencia.substring(0, 11),
                        "<button  type='button' id='" + json[i].Id_P_Virtual + "' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal'>Evaluar Producto</button>"
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
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Lista_Chequeo,
                        json[i].Des_Lista_Chequeo,
                        json[i].Fecha_Creacion.substring(0, 11),
                        "<button id='" + json[i].Id_Lista_Chequeo + "' value='m' class='btnclick btn btn-success'>Modificar</button>"
                    ]);
                }
                break;
            case "Ciudad":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Ciudad,
                        "<button id='" + json[i].Id_Ciudad + "' value='m' class='btnclick btn btn-success'>modificar</button>",
                        "<button id='" + json[i].Id_Ciudad + "' value='e' class='btnclick btn btn-danger'>eliminar</button>"
                    ]);
                }
                break;
            case "Habilitar":
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_P_Virtual,
                        json[i].Num_Version,
                        json[i].Fecha_Vigencia.substring(0, 11),
                        "<button id='" + json[i].Id_Ciudad + "' value='H' class='btnclick btn btn-info'>Habilitar</button>"
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
                for (var i = 0; i < json.length; i++) {
                    table = selector.dataTable().fnAddData([
                        c,
                        json[i].NombreCompleto,
                        json[i].Cargo,
                        json[i].Nom_Area,
                        json[i].Nom_Estado,
                        "<button id='" + json[i].Id_Funcionario + "' class='botonclick btn btn-danger'>Deshabilitar</button>"
                    ]);
                    c++;
                }
                break;
            case "Formato" :
                for (var i = 0; i < json.length; i++) {
                    table = $("#tablaformato").dataTable().fnAddData([
                        i + 1,
                        json[i].Nom_Formato,
                        json[i].Des_Formato,
                        "<button id='" + json[i].Id_Formato + "' class='btn btn-success botonclick'value='m' >modificar</button>",
                        "<button id='" + json[i].Id_Formato + "' class='btn btn-danger botonclick' value='e'>eliminar</button>"
                    ]);
                }
                break;
        }
    }
};
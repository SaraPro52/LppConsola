jQuery.Luna = function (Datos, selector) {
    this.cor = ("El gato lopez");
    this.Nombre = selector.selector;
    this.Cons = Datos;
    this.setCons = function (dato) {
        this.Cons = dato
    };
    this.setNombre = function (dato) {
        this.Nombre = dato
    };
    this.Vivo = function (mensaje) {
        console.log("Vivo??Cecily." + mensaje);
    };
    this.limpiarTabla = function () {
        var tabla = this.Nombre.DataTable();
        tabla
                .clear()
                .draw();
        console.log("Limpiando");
    };
    this.TablaEspa = function (datos) {
        datos.selector.DataTable({
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
                //console.log(selector);
                cargarTabla(json, selector, datos.nombre);
            },
            error: function () {
                alert = ("Disculpa, pero existe un error al cargar datos del servidor :/");
            }
        });
    };
    this.archivos = function () {
        var formData = new FormData(document.getElementById("formuploadajax"));
        formData.append("dato", "valor");
        //console.log(formData.getPrototypeOf());
        formData.append(f.attr("name"), $(this)[0].files[0]);
        alert(FormData);
    };
    function cargarTabla(json, selector, nombre) {
        var c = 1;
        switch (nombre) {
            case "btn":
                alert("Btn" + json);
                break;
            case "Select":
                for (var i = 0; i < json.length; i++) {
                    selector.selector.append($('<option>', {
                        value: json[i].Id_Area,
                        text: json[i].Nom_Area
                    }));
                }
                break;
            case "Area":
                for (var i = 0; i < json.length; i++) {
                    table = selector.selector.dataTable().fnAddData([
                        c,
                        json[i].Nom_Area,
                        json[i].Lider_Area,
                        "<button id='" + json[i].Id_Area + "' class='btn btn-success botonclick'value='m' >modificar</button>",
                        "<button id='" + json[i].Id_Area + "' class='btn btn-danger botonclick' value='e'>eliminar</button>"
                    ]);
                    c++;
                }
                break;
            case "Funcionario":
                for (var i = 0; i < json.length; i++) {
                    if (json[i].Id_Estado == 1) {
                        table = selector.selector.dataTable().fnAddData([
                            c,
                            json[i].Nom_Funcionario,
                            json[i].Cargo,
                            json[i].Id_Area_Centro,
                            json[i].Id_Estado = "Activo",
                            "<button id='" + json[i].Id_Funcionario + "' class='botonclick btn btn-danger'>Inhabilitar</button>"
                        ]);
                        c++;
                    }
                }
                break;
        }
    }
};
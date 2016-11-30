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
    this.archivosAjax = function (url, data) {
        $.ajax({
            url: url,
            type: 'POST',
            contentType: false,
            processData: false,
            data: data,
            success: function (resultado) {
                alert(resultado);
            }
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
            }
        });
    };
    this.cargarTabla = function (json, selector, datos) {
        cargarTabla(json, selector, datos);
    };
    function cargarTabla(json, selector, datos) {
        try {
            var c = 1;
            switch (datos.nombre) {
                case "Comentario":
                    var jso = jQuery.parseJSON(json);
                    console.log(jso);
                    var SeleComent = selector.clone();
                    console.log(SeleComent);
                    console.log(jso.length);
                    $(".RComentarios" + datos.id).empty();
                    for (var i = 0; i < jso.length; i++) {
                        SeleComent.find("#contenido").addClass(jso[i].Id_Comentario);
                        SeleComent.find("#BaseNombreComen").text(jso[i].Nombre_Completo);
                        SeleComent.find("#BaseComment").val(jso[i].Comentario);
                        console.log(SeleComent);
                        SeleComent.children().appendTo($(".RComentarios" + datos.id));
                    }
                    break;
                case "DetallesOaC":
                    var jso = jQuery.parseJSON(json);
                    var oAItem;
                    for (var i = 0; i < jso.length; i++) {
                        oAItem = selector.clone();
                        oAItem.find("#consul").addClass("consul" + jso[i].Id_Version);
                        oAItem.find("#NumVersion").text("Version: " + datos.nom + " " + jso[i].Id_Version);
                        oAItem.find("#NumVersion").addClass(jso[i].Id_Version);
                        oAItem.find("#PvAutores").text(jso[i].Autores);
                        oAItem.find("#PvPublicacion").text(jso[i].Fecha_Publicacion);
                        oAItem.find("#PvFechaVigencia").text(jso[i].Fecha_Vigencia);
                        oAItem.find("#PvRequisitos").val(jso[i].Reqst_Instalacion);
                        oAItem.find("#PvInstalacion").val(jso[i].Inst_Instalacion);
                        oAItem.find(".labelEstrella").addClass(jso[i].Id_Version);
                        oAItem.find("#RComentarios").addClass("RComentarios" + jso[i].Id_Version);
                        oAItem.find("#comment").addClass('Comment' + jso[i].Id_Version);
                        oAItem.find("#Url_Version").val(jso[i].Url_Version);
                        oAItem.find("#Actualizar").val(jso[i].Id_Version);
                        oAItem.find("#btn_Comentar").val(jso[i].Id_Version);
                        oAItem.children().appendTo($("#resultados"));
                    }
                    break;
                case "carga":
                    
                    break;
                case "MultiSelect":
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
                    var pag = 0;
                    var q = 3;
                    var jso = jQuery.parseJSON(json);
                    var oAItem;
                    for (var i = 0; i < jso.length; i++) {
                        if (q == i) {
                            pag++;
                            s = "<li id=pag" + pag + " class='pagination'><a><lavel>" + pag + "</label></a></li>";
                            $("#paginador").append(s);
                            q = q + 3;
                        }
                        oAItem = selector.clone();
                        oAItem.find("#TituloOa").text(jso[i].Nom_P_Virtual);
                        oAItem.find("#AutoresOa").text(jso[i].Autores);
                        oAItem.find("#FechaPublicacionOa").text(jso[i].Fecha_Publicacion);
                        oAItem.find("#DescripcionOa").text(jso[i].Des_P_Virtual);
                        oAItem.find("#BtnDescargar").val(jso[i].Id_P_Virtual);
                        oAItem.find("#BtnDescargar").addClass('mom');
                        oAItem.find("#Contenedora").addClass(jso[i].Id_P_Virtual);
                        oAItem.find("#Contenedora").addClass('pag' + pag);
                        oAItem.children().appendTo($("#resultados"));
                        if (pag > 0) {
                            $(".pag" + pag).hide();
                        }
                    }
                    break;
                case "calificar":
                    var jso = jQuery.parseJSON(json);
                    for (var i = 0; i < jso.length; i++) {
                        var conte = $("#clone").clone();
                        conte.find('.chex').attr('value', jso[i].Id_Detalles_Lista);
                        conte.find('.textarea').attr('id', jso[i].Id_Detalles_Lista);
                        conte.find('.locura').text(jso[i].Des_Item_Lista);
                        conte.children().appendTo(selector);
                    }
                    break;
                case "AutoComplet":
                    var jso = jQuery.parseJSON(json);
                    var j = Object.keys(jso[0]);
                    var s = [];
                    for (var i = 0; i < jso.length; i++) {
                        s.push(jso[i][j[1]]);
                    }
                    selector.autocomplete({
                        source: s,
                        minChars: 2
                    });
                    break;
                case "Notificacion":
                    var jso = jQuery.parseJSON(json);
                    var selecNo = selector.selector + "P";
                    $("#ccNoti").empty();
                    $(selecNo).empty();
                    for (var i = 0; i < jso.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].Conte_Notificacion,
                            jso[i].Fecha_Envio
                        ]);
                        if (i < 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jso[i].Ides_Proceso + '>' + jso[i].Conte_Notificacion + '</label></a></li>');
                        } else if (i == 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas notificaciones</label></a></li>');
                        }
                    }
                    $("#ccNoti").append(i);
                    break;
                case "correcion":
                    var jsoCorre = jQuery.parseJSON(json);
                    for (var i = 0; i < jsoCorre.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsoCorre[i].Conte_Notificacion,
                            jsoCorre[i].Fecha_Envio,
                            "<button  type='button' id='" + jsoCorre[i].Ides_Proceso + "' class='btn btn-info btn-lg btnCorrecion'>Correguir P.V</button>"
                        ]);
                    }
                    break;
                case "consutarOa":
                    var selecNo = selector.selector + "P";
                    $(selecNo).empty();
                    $("#ccNoti").empty();
                    var jso = jQuery.parseJSON(json);
                    for (var i = 0; i < jso.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].Conte_Notificacion,
                            jso[i].Fecha_Envio,
                            "<button  type='button' id='" + jso[i].Url_Version + "' class='btn btn-info  btnDescargar'>Descargar P.V</button>",
                            "<button  type='button' id='" + jso[i].Ides_Proceso + "' class='btn btn-info  btnEvaluar'>Evaluar P.V</button>"
                        ]);
                        if ((i < 4) && (datos.dat == true)) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jso[i].Ides_Proceso + '>' + jso[i].Conte_Notificacion + '</label></a></li>');
                        } else if ((i == 4) && (datos.dat == true)) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas productos virtuales</label></a></li>');
                        }
                    }
                    if ((datos.dat == true)) {
                        $("#ccNoti").append(i);
                    }

                    break;
                case "ConsultarLista":
                    var jso = jQuery.parseJSON(json);
                    for (var i = 0; i < jso.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].Nom_Lista_Chequeo,
                            jso[i].Des_Lista_Chequeo,
                            jso[i].Fecha_Creacion.substring(0, 11),
                            "<button id='ca' value='" + jso[i].Id_Lista_Chequeo + "' class='btnclickca btn btn-info'>Escojer </button>"
                        ]);
                    }
                    break;
                case "Lista":
                    var jso = jQuery.parseJSON(json);
                    for (var i = 0; i < jso.length; i++) {
                        yu = [jso[i].Nom_Lista_Chequeo + "$$$" + jso[i].Des_Lista_Chequeo];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].Nom_Lista_Chequeo,
                            jso[i].Des_Lista_Chequeo,
                            jso[i].Fecha_Creacion.substring(0, 11),
                            "<button id='" + jso[i].Id_Lista_Chequeo + "' value='" + yu + "' class='btnclick btn btn-info'>Modificar</button>"
                        ]);
                    }
                    break;
                case "Ciudad":
                    jsCiudad = jQuery.parseJSON(json);
                    for (var i = 0; i < jsCiudad.length; i++) {
                        var data = [jsCiudad.Nom_Ciudad];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsCiudad[i].Nom_Ciudad,
                            "<button id='" + jsCiudad[i].Id_Ciudad + "' value='" + data + "' class='btnclick btn btn-info'>Modificar</button>"
                        ]);
                    }
                    break;
                case "Habilitar":
                    var jsSelect = jQuery.parseJSON(json);
                    var selecNo = selector.selector + "P";
                    $(selecNo).empty();
                    $("#ccNoti").empty();

                    for (var i = 0; i < jsSelect.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsSelect[i].Nom_P_Virtual,
                            jsSelect[i].Num_Version,
                            "<button id='" + jsSelect[i].Id_Version + "'class='btnclick btn btn-info'>Habilitar</button>"
                        ]);
                        if (i < 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jsSelect[i].Id_Version + '>Producto virtual ' + jsSelect[i].Nom_P_Virtual + '</label></a></li>');
                        } else if (i == 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas productos</label></a></li>');
                        }
                    }
                    $("#ccNoti").append(i);
                    break;
                case "Area":
                    jsArea = jQuery.parseJSON(json);
                    for (var i = 0; i < jsArea.length; i++) {
                        var data = [jsArea[i].Nom_Area, jsArea[i].Lider_Area];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsArea[i].Nom_Area,
                            jsArea[i].Lider_Area,
                            "<button id='" + jsArea[i].Id_Area + "' class='btn btn-info botonArea'value='" + data + "' >modificar</button>"
                        ]);
                    }
                    break;
                case "Funcionario":
                    var jsFuncionario;
                    jsFuncionario = jQuery.parseJSON(json);
                    var selecNo = selector.selector + "P";
                    $(selecNo).empty();
                    $("#ccNoti").empty();
                    for (var i = 0; i < jsFuncionario.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsFuncionario[i].NombreCompleto,
                            jsFuncionario[i].Cargo,
                            jsFuncionario[i].Nom_Area,
                            jsFuncionario[i].Nom_Estado,
                            "<button id='" + jsFuncionario[i].Id_Funcionario + "' class='botonclick btn btn-danger'>Deshabilitar Usuario</button>"
                        ]);
                        if (i < 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + i + '>Nuevo funcionario ' + jsFuncionario[i].Cargo + '</label></a></li>');
                        } else if (i == 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas funcionarios</label></a></li>');
                        }
                    }
                    $("#ccNoti").append(i);
                    break;
                case "Formato" :
                    jsFormato = jQuery.parseJSON(json);
                    for (var i = 0; i < jsFormato.length; i++) {
                        var dat = [jsFormato[i].Nom_Formato, jsFormato[i].Des_Formato];
                        table = $("#tablaformato").dataTable().fnAddData([
                            i + 1,
                            jsFormato[i].Nom_Formato,
                            jsFormato[i].Des_Formato,
                            "<button id='" + jsFormato[i].Id_Formato + "' class='btn btn-success botonformato'value='" + dat + "' >modificar</button>"
                        ]);
                    }
                    setNombre(i + 1);
                    break;
                case "AsignarRol":
                    var jsSelect = jQuery.parseJSON(json);
                    for (var i = 0; i < json.length; i++) {
                        var select = ("'><option value='1'>Intructor</option><option value='2'>Equipo Tecnico</option><option value='3'>Equipo Pedagogico</option></select>");
                        table = $("#tablaARoles").dataTable().fnAddData([
                            i + 1,
                            jsSelect[i].NombreCompleto,
                            jsSelect[i].Cargo,
                            jsSelect[i].Nom_Area,
                            jsSelect[i].Nom_Centro,
                            jsSelect[i].Nom_Ciudad,
                            "<select id='Select" + jsSelect[i].Id_Funcionario + "'value='0'" + select,
                            "<button id='" + jsSelect[i].Id_Funcionario + "' class='btnclick btn btn-success botonclick'value='b' >Asignar</button>"
                        ]);
                    }
                    break;
            }
        } catch (error) {
            console.log(error.message);
        }
    }
};

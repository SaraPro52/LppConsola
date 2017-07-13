jQuery.Luna = function (Datos, selector) {
    this.cor = ("El gato lopez");
    this.Nombre = selector;
    this.Cons = Datos;
    this.contador = 0;
    this.bus = [1, 2, 3, 4];
    this.setCons = function (dato) {
        this.Cons = dato;
    };
    function setNombre(dato) {
        this.Nombre = dato;
    }
    ;
    function setBus(n) {
        this.bus = [];
        this.bus = n;
    }
    this.ObtenerBus = function () {
        return this.bus;
    };
    this.Vivo = function (mensaje) {
        console.log("Vivo??Cecily." + mensaje + " ");
        //logger.disableLogger();
    };
    this.limpiarSelector = function (selector) {
        selector.empty().append('<option value="A0">Seleccionar...</option>');
    };
    this.tablaEm = function (selector) {
        selector.empty();
        estrutura = "<thead>\n\
                    <tr>\n\
                      <th>#</th>\n\
                      <th>Nombre lista</th>\n\
                      <th>Descripcion lista</th>\n\
                      <th>Fecha vigencia</th>\n\
                      <th></th>\n\
                      </tr>\n\
                   </thead>\n\
                   <tbody></tbody>"
        selector.append(estrutura);
    };
    this.limpiarTablaI = function (selector) {
        var tabla = selector.DataTable();
        tabla
                .clear()
                .draw();
    };
    this.limpiarTabla = function (selector) {
        var tabla = selector.DataTable();
        tabla
                .clear()
                .draw();
    };
    function limpiarTabla() {
        var tabla = selector.DataTable();
        tabla
                .clear()
                .draw();
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
                lengthMenu: "Mostrar _MENU_ " + this.Cons,
                info: "Se encontaron _TOTAL_ " + this.Cons,
                infoEmpty: "0 Resultados de _MAX_ entradas",
                "infoFiltered": "(filtrada a partir de  _MAX_ registros)",
                infoPostFix: "",
                loadingRecords: "Cargando...",
                "zeroRecords": "Ningun " + this.Cons + " encontrada",
                emptyTable: "No hay ningun " + this.Cons,
                search: "Buscar:"
            }
        });
    };
    this.mostrarVentana = function (selector) {
        selector.show();
    };
    this.ocultarVentana = function (selector) {
        selector.hide();
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
                case "MutiCategoria":
                    //Lo mirare posee el mismo dilema que encontre con multiselect con la busqueda de quicksechars =0
                    break;
                case "correcionCo":
                    var jso = jQuery.parseJSON(json);
                    var jso1 = jQuery.parseJSON(jso.Items);
                    $("#Respuestaitem").html("");
                    $("#NomLista").text("Lista de chequeo: " + jso.Nom_Lista_Chequeo);
                    $("#FechaEvaluacion").text("Fecha de evaluacion " + jso.Fecha_Evaluacion);
                    for (var i = 0; i < jso1.length; i++) {
                        var oAItem = $("#Clona").clone();
                        oAItem.find("#textitem").text('Item :' + jso1[i].Des_Item_Lista);
                        oAItem.find("#observacionItem").val(jso1[i].Observacion);
                        oAItem.children().appendTo($("#Respuestaitem"));
                    }
                    $("#ObservacionGeneral").val(jso.Observacion_General);
                    break;
                case "DetallesOaC":
                    try {
                        var jso = jQuery.parseJSON(json);
                        var oAItem, oAComen, cc = 1;
                        for (var i = 0; i < jso.length; i++) {
                            oAItem = selector.clone();
                            oAItem.find("#consul").addClass("consul" + jso[i].id_version);
                            oAItem.find("#NumVersion").text("Version " + cc + ": " + datos.nom);
                            oAItem.find("#NumVersion").addClass(jso[i].id_version);
                            oAItem.find("#PvAutores").text(jso[i].autores);
                            oAItem.find("#PvPublicacion").text(jso[i].fecha_publicacion);
                            oAItem.find("#PvFechaVigencia").text(jso[i].fecha_vigencia);
                            oAItem.find("#PvRequisitos").val(jso[i].reqst_instalacion);
                            oAItem.find("#PvInstalacion").val(jso[i].inst_instalacion);
                            oAItem.find(".labelEstrella").addClass(jso[i].id_version);
                            oAItem.find(".RComentarios").attr('id', "RComentarios" + jso[i].id_version);
                            oAItem.find("#comment").addClass('Comment' + jso[i].id_version);
                            oAItem.find("#Url_Version").attr('href', 'DescargaArchivo?archivo=' + jso[i].url_version + '&version=' + jso[i].id_version + '');
                            oAItem.find("#btn_Comentar").val(jso[i].id_version);
                            oAItem.children().appendTo($("#resultados"));
                            var jsoComen = jQuery.parseJSON(jso[i].comentarios);
                            for (var j = 0; j < jsoComen.length; j++) {
                                oAComen = $("#BaseComentario").clone();
                                oAComen.find(".contenidoCome").attr('id', "Comentario" + jsoComen[j].id_comentario);
                                oAComen.find("#NombreAComen").text(jsoComen[j].nombre_completo);
                                oAComen.find("#BaseComment").val(jsoComen[j].comentario);
                                oAComen.children().appendTo($("#RComentarios" + jso[i].id_version));
                            }
                            cc++;
                        }
                    } catch (error) {
                        console.log(error.message);
                    }
                    break;
                case "Comentario":
                    $("#RComentarios" + datos.id).empty();
                    var jsoComen = jQuery.parseJSON(json);
                    for (var j = 0; j < jsoComen.length; j++) {
                        oAComen = $("#BaseComentario").clone();
                        oAComen.find(".contenidoCome").attr('id', "Comentario" + jsoComen[j].id_comentario);
                        oAComen.find("#NombreAComen").text(jsoComen[j].nombre_completo);
                        oAComen.find("#BaseComment").val(jsoComen[j].comentario);
                        oAComen.children().appendTo($("#RComentarios" + datos.id));
                    }
                    break;
                case "MultiselectLista":
                    var j = Object.keys(json[0]);
                    var opcion = "";
                    for (var i = 0; i < json.length; i++) {
                        if (json[i].tipo === 1) {
                            opcion = "<option value=" + json[i][j[2]] + " disabled='disabled' selected>" + json[i][j[0]] + "</option>";
                        } else if (json[i].tipo === 0) {
                            opcion = "<option value=" + json[i][j[2]] + ">" + json[i][j[0]] + "</option>";
                        } else {
                            opcion = "<option value=" + json[i][j[2]] + " selected>" + json[i][j[0]] + "</option>";
                        }
                        selector.append(opcion);
                    }
                    selector.multiSelect('refresh');
                    break;

                case "MultiSelectArrayCentro":
                    if (datos.compuesto == true) {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(jso[0]);
                        var opcion = "", id = "", nombre = "", tipo = 3;
                        for (var i = 0; i < jso.length; i++) {
                            tipo = jso[i][j[0]];
                            id = jso[i][j[1]];
                            nombre = jso[i][j[2]];
                            if (tipo == "1") {
                                opcion = "<option value=" + id + " disabled='disabled' selected>" + nombre + "</option>";
                            } else if (tipo == "0") {
                                opcion = "<option value=" + id + ">" + nombre + "</option>";
                            } else {
                                opcion = "<option value=" + id + " selected>" + nombre + "</option>";
                            }
                            selector.append(opcion);
                        }
                    } else {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(jso[0]);
                        for (var i = 0; i < jso.length; i++) {
                            id = jso[i].Id_Programa;
                            nombre = jso[i].Nom_Programa;
                            var opcion = "<option value=" + id[0] + ">" + nombre[0] + "</option>";
                            selector.append(opcion);
                        }
                    }
                    selector.multiSelect('refresh');
                    if (datos.opt == "Div") {
                        selector.multiSelect('deselect_all');
                    }
                    break;



                case "MultiSelectArrayPrograma":
                    if (datos.compuesto == true) {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(json[0]);
                        var opcion = "", id = "", nombre = "", tipo = 3;
                        for (var i = 0; i < jso.length; i++) {
                            tipo = jso[i].tipo;
                            id = jso[i].id_tema;
                            nombre = jso[i].nom_tema;
                            if (tipo == "1") {
                                opcion = "<option value=" + id + " disabled='disabled' selected>" + nombre + "</option>";
                            } else if (tipo == "0") {
                                opcion = "<option value=" + id + ">" + nombre + "</option>";
                            } else {
                                opcion = "<option value=" + id + " selected>" + nombre + "</option>";
                            }
                            selector.append(opcion);
                        }
                    } else {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(jso[0]);
                        for (var i = 0; i < jso.length; i++) {
                            id = jso[i].Id_Tema;
                            nombre = jso[i].nom_tema;
                            var opcion = "<option value=" + id[0] + ">" + nombre[0] + "</option>";
                            selector.append(opcion);
                        }
                    }
                    selector.multiSelect('refresh');
                    if (datos.opt == "Div") {
                        selector.multiSelect('deselect_all');
                    }
                    break;

                case "MultiSelectArray":
                    if (datos.compuesto == true) {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(json[0]);
                        var opcion = "", id = "", nombre = "", tipo = 3;
                        console.log(jso);
                        for (var i = 0; i < jso.length; i++) {
                            tipo = jso[i].tipo;
                            id = jso[i].id_programa;
                            nombre = jso[i].nom_programa;
                            if (tipo == "1") {
                                opcion = "<option value=" + id + " disabled='disabled' selected>" + nombre + "</option>";
                            } else if (tipo == "0") {
                                opcion = "<option value=" + id + ">" + nombre + "</option>";
                            } else {
                                opcion = "<option value=" + id + " selected>" + nombre + "</option>";
                            }
                            selector.append(opcion);
                        }
                    } else {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(jso[0]);
                        for (var i = 0; i < jso.length; i++) {
                            id = jso[i].id_programa;
                            nombre = jso[i].nom_programa;
                            var opcion = "<option value=" + id[0] + ">" + nombre[0] + "</option>";
                            selector.append(opcion);
                        }
                    }
                    selector.multiSelect('refresh');
                    if (datos.opt == "Div") {
                        selector.multiSelect('deselect_all');
                    }
                    break;

                case "MultiSelect":
                    if (datos.compuesto == true) {
                        var j = Object.keys(json[0]);
                        var opcion = "";
                        for (var i = 0; i < json.length; i++) {
                            if (json[i].tipo == true) {
                                opcion = "<option value=" + json[i][j[0]] + " disabled='disabled' selected>" + json[i][j[1]] + "</option>";
                            } else if (json[i].tipo == false) {
                                opcion = "<option value=" + json[i][j[0]] + ">" + json[i][j[1]] + "</option>";
                            } else {
                                opcion = "<option value=" + json[i][j[0]] + " selected>" + json[i][j[1]] + "</option>";
                            }
                            selector.append(opcion);
                        }
                    } else {
                        var jso = jQuery.parseJSON(json);
                        var j = Object.keys(jso[0]);
                        for (var i = 0; i < jso.length; i++) {
                            var opcion = "<option value=" + jso[i][j[0]] + ">" + jso[i][j[1]] + "</option>";
                            selector.append(opcion);
                        }
                    }
                    selector.multiSelect('refresh');
                    if (datos.opt == "Div") {
                        selector.multiSelect('deselect_all');
                    }
                    break;
                case "MultiSelect1":
                    console.log("Cambio14");
                    var arraySelecion = [];
                    console.log(arraySelecion);
                    var sele = selector.attr('class');
                    var tipo = "<input type='text' class='search-input form-control' autocomplete='off' placeholder='" + selector.attr('title') + "'>";
                    var jso = jQuery.parseJSON(json);
                    var j = Object.keys(jso[0]);
                    for (var i = 0; i < jso.length; i++) {
                        var opcion = "<option value=" + jso[i][j[0]] + ">" + jso[i][j[1]] + "</option>";
                        selector.append(opcion);
                    }
                    $('.' + sele).multiSelect({
                        selectableHeader: tipo,
                        selectionHeader: tipo,
                        afterInit: function (ms) {
                            var that = this,
                                    $selectableSearch = that.$selectableUl.prev(),
                                    $selectionSearch = that.$selectionUl.prev(),
                                    selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                                    selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';
                            that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                                    .on('keydown', function (e) {
                                        if (e.which === 40) {
                                            that.$selectableUl.focus();
                                            return false;
                                        }
                                    });
                            that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                                    .on('keydown', function (e) {
                                        if (e.which == 40) {
                                            that.$selectionUl.focus();
                                            return false;
                                        }
                                    });
                        },
                        afterSelect: function (val) {
                            this.qs1.cache();
                            this.qs2.cache();
                            arraySelecion.push(val);
                            console.log(arraySelecion);
                            setBus(arraySelecion);
                        },
                        afterDeselect: function (val) {
                            this.qs1.cache();
                            this.qs2.cache();
                            var busqueda = $.inArray(val, arraySelecion);
                            arraySelecion.splice(busqueda, 1);
                            setBus(arraySelecion);
                        }
                    });
                    break;

                case "Select":
                    if (datos.tipo == true) {
                        var jso = json;
                    } else {
                        var jso = jQuery.parseJSON(json);

                    }
                    var j = Object.keys(jso[0]);
                    for (var i = 0; i < jso.length; i++) {
                        selector.append($('<option>', {
                            value: jso[i][j[0]],
                            text: jso[i][j[1]]
                        }));
                    }
                    break;

                case "SelectInvertido":
                    if (datos.tipo == true) {
                        var jso = json;
                    } else {
                        var jso = jQuery.parseJSON(json);

                    }
                    var j = Object.keys(jso[0]);
                    for (var i = 0; i < jso.length; i++) {
                        selector.append($('<option>', {
                            value: jso[i][j[1]],
                            text: jso[i][j[0]]
                        }));
                    }
                    break;

                case "SelectArray":
                    var jso = jQuery.parseJSON(json);
                    var j = Object.keys(jso[0]);
                    for (var i = 0; i < jso.length; i++) {
                        var ar = jso[i].TABLE_NAME;
                        selector.append($('<option>', {
                            value: 0,
                            text: ar
                        }));
                    }
                    break;
                case "ConsOaP":
                    var pag = 1;
                    var q = 2;
                    var jso = jQuery.parseJSON(json);
                    if (jso != null) {
                        var oAItem;
                        for (var i = 0; i < jso.length; i++) {
                            if (q == i) {
                                pag++;
                                s = "<li id=pag" + pag + " class='pagination'><a><lavel>" + pag + "</label></a></li>";
                                $("#paginador").append(s);
                                q = q + 2;
                            }
                            var comple = jso[i].Id_Formato + "$$" + jso[i].Nom_P_Virtual + "$$" + jso[i].Des_P_Virtual;
                            oAItem = selector.clone();
                            oAItem.find("#ImagenOA").attr('src', 'Archivos/Formatos/' + jso[i].Nom_Tipo_Formato + '.png');
                            oAItem.find("#TituloOa").text(jso[i].Nom_P_Virtual);
                            oAItem.find("#AutoresOa").text(jso[i].Autores);
                            oAItem.find("#FechaPublicacionOa").text(jso[i].Fecha_Publicacion);
                            oAItem.find("#DescripcionOa").text(jso[i].Des_P_Virtual);
                            oAItem.find("#BtnDescargar").val(comple);
                            oAItem.find("#BtnDescargar").addClass('mom');
                            oAItem.find("#Contenedora").addClass(jso[i].Id_P_Virtual);
                            oAItem.find("#Contenedora").addClass('pag' + pag);
                            oAItem.children().appendTo($("#resultadosProductos"));
                            if (pag > 0) {
                                $(".pag" + pag).hide();
                            }
                        }
                    } else {
                        var di = ("<label>No existe ningun producto virtual.</label>");
                        $("#resultadosProductos").append(di);
                    }
                    break;
                case "calificar":
                    var jso = jQuery.parseJSON(json);
                    var row = "", cc = 1;
                    for (var i = 0; i < jso.length; i++) {
                        row = ("<tr class='col-md-12'>\n\
                                    <td class='col-md-1'><label>" + cc + "</label></td>\n\
                                    <td class='col-md-6'><label>" + jso[i].Des_Item_Lista + "</label></td>\n\
                                    <td class='col-md-1'><input type='checkbox' value=" + jso[i].Id_Detalles_Lista + "></td>\n\
                                    <td class='col-md-4'><textarea id=" + jso[i].Id_Detalles_Lista + " class='form-control esac'></textarea></td>\n\
                                </tr>");
                        selector.append(row);
                        cc++;
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
                            jso[i].nom_p_virtual,
                            jso[i].num_version,
                            jso[i].conte_notificacion,
                            jso[i].fecha_envio
                        ]);
                        if (i < 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jso[i].ides_proceso + '>' + jso[i].conte_notificacion + '</label></a></li>');
                        } else if (i == 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas notificaciones</label></a></li>');
                        }
                    }
                    $("#ccNoti").append(i);
                    break;
                case "correcion":
                    var jsoCorre = jQuery.parseJSON(json);
                    for (var i = 0; i < jsoCorre.length; i++) {
                        var extencion = jsoCorre[i].url_version;
                        var arrExtencion = extencion.toString().split(".");
                        extencion = arrExtencion[arrExtencion.length - 1];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsoCorre[i].nom_p_virtual,
                            jsoCorre[i].num_version,
                            jsoCorre[i].conte_notificacion,
                            jsoCorre[i].fecha_envio,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jsoCorre[i].url_version + ">Descargar P.V</a>",
                            "<button  type='button' id='" + jsoCorre[i].ides_proceso + "$$" + jsoCorre[i].id_version + "$$" + jsoCorre[i].nom_p_virtual + "$$" + jsoCorre[i].id_notificacion + "$$" + jsoCorre[i].url_version + "$$" + extencion + "' class='btn btn-info btnCorrecion'>Correguir P.V</button>"
                        ]);
                    }
                    break;
                case "actualizacionVersion":
                    var jsItem = jQuery.parseJSON(json);
                    for (var i = 0; i < jsItem.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsItem[i].nom_p_virtual,
                            jsItem[i].num_version,
                            jsItem[i].nom_formato,
                            jsItem[i].fecha_vigencia,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jsItem[i].url_version + ">Descargar P.V</a>",
                            "<button  type='button' id='" + jsItem[i].id_version + "$$" + jsItem[i].id_p_virtual + "' class='btn btn-info btnAñadirVersion'>Actualizar P.V</button>"
                        ]);
                    }
                    break;
                case "Misproductos":
                    var jsItem = jQuery.parseJSON(json);
                    for (var i = 0; i < jsItem.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsItem[i].nom_p_virtual,
                            jsItem[i].num_version,
                            jsItem[i].fecha_envio,
                            jsItem[i].nom_estado,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jsItem[i].url_version+ ">Descargar P.V</a>"
                        ]);
                    }
                    break;
                case "consutarOa":
                    var selecNo = selector.selector + "P";
                    $(selecNo).empty();
                    setNombre($("#tablaListaChequeo"));
                    $("#ccNoti").empty();
                    var jso = jQuery.parseJSON(json);
                    for (var i = 0; i < jso.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].nom_p_virtual,
                            jso[i].num_version,
                            jso[i].conte_notificacion,
                            jso[i].fecha_envio,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jso[i].url_version + ">Descargar P.V</a>",
                            "<button  type='button' id='" + jso[i].ides_proceso + "' class='btn btn-info  btnEvaluar' value=" + jso[i].id_notificacion + ">Evaluar P.V</button>"
                        ]);
                        if ((i < 4) && (datos.dat == true)) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jso[i].ides_proceso + '>' + jso[i].conte_notificacion + '</label></a></li>');
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
                    var dat = [];
                    for (var i = 0; i < jso.length; i++) {
                        dat = [jso[i].Nom_Lista_Chequeo + "$$" + jso[i].Des_Lista_Chequeo + "$$" + jso[i].Fecha_Creacion.substring(0, 11)];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].Nom_Lista_Chequeo,
                            jso[i].Des_Lista_Chequeo,
                            jso[i].Fecha_Creacion.substring(0, 11),
                            "<button id='" + dat + "' value='" + jso[i].Id_Lista_Chequeo + "' class='btnclickca btn btn-info'>Escojer </button>"
                        ]);
                    }
                    break;
                case "ConsultaPrograma":
                    var jso = jQuery.parseJSON(json);
                    var dat = [];
                    selector.dataTable().fnClearTable();
                    for (var i = 0; i < jso.length; i++) {
                        dat = jso[i].id_programa + "$$" + jso[i].nom_programa + "$$" + jso[i].nivel_formacion;
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jso[i].nom_programa,
                            jso[i].nivel_formacion,
                            "<button id='" + dat + "'  class='btnModificarPrograma btn btn-info'>Modificar</button>"
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
                        var data = [jsCiudad.nom_ciudad];
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsCiudad[i].Nom_Ciudad,
                            "<button id='" + jsCiudad[i].id_ciudad + "' value='" + data + "' class='btnclick btn btn-info'>Modificar</button>"
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
                            jsSelect[i].conte_notificacion,
                            jsSelect[i].nom_p_virtual,
                            jsSelect[i].num_version,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jsSelect[i].url_version + ">Descargar P.V</a>",
                            "<button id='" + jsSelect[i].ides_proceso + "'class='btnclickHabilitar btn btn-info'>Habilitar</button>"
                        ]);
                        if (i < 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=' + jsSelect[i].ides_proceso + '>Producto virtual ' + jsSelect[i].nom_p_virtual + '</label></a></li>');
                        } else if (i == 4) {
                            $(selecNo).append('<li><a><label class="Notify" id=verMasNotificaciones>Ver mas productos</label></a></li>');
                        }
                    }
                    $("#ccNoti").append(i);
                    break;
                case "Area":
                    jsArea = jQuery.parseJSON(json);
                    for (var i = 0; i < jsArea.length; i++) {
                        var data = (jsArea[i].id_area + "$$" + jsArea[i].nom_area + "$$" + jsArea[i].lider_area);
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsArea[i].nom_area,
                            jsArea[i].lider_area,
                            "<button  class='btn btn-info botonArea'value='" + data + "' >Modificar</button>"
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
                        var dat = (jsFormato[i].id_formato + "$$" + jsFormato[i].id_tipo_formato + "$$" + jsFormato[i].nom_formato + "$$" + jsFormato[i].des_formato);
                        table = $("#tablaformato").dataTable().fnAddData([
                            i + 1,
                            jsFormato[i].nom_formato,
                            jsFormato[i].des_formato,
                            "<button  class='btn btn-success botonformato'value='" + dat + "' >modificar</button>"
                        ]);
                    }
                    break;
                case "AsignarRol":
                    var jsSelect = jQuery.parseJSON(json);
                    for (var i = 0; i < json.length; i++) {
                        var data = jsSelect[i].id_funcionario + "$$" + jsSelect[i].funcionario;
                        table = $("#tablaARoles").dataTable().fnAddData([
                            i + 1,
                            jsSelect[i].funcionario,
                            jsSelect[i].nom_rol,
                            "<button id='" + data + "' class='btn btn-success modificarRol'value='b' >Asignar rol</button>"
                        ]);
                    }
                    break;
                case "consultaTipoFormatos":
                    var jsSelect = jQuery.parseJSON(json);
                    var data = "";
                    selector.dataTable().fnClearTable();
                    for (var i = 0; i < jsSelect.length; i++) {
                        data = jsSelect[i].id_tipo_formato + "$$" + jsSelect[i].nom_tipo_formato + "$$" + jsSelect[i].urlimgtipoformato;
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsSelect[i].nom_tipo_formato,
                            jsSelect[i].urlImgtipoformato,
                            "<button id='" + data + "' class='btnModificarTipoFor btn btn-info'>Modificar</button>"
                        ]);
                    }
                    break;
                case "ConsultaCentros":
                    var jsSelect = jQuery.parseJSON(json);
                    selector.dataTable().fnClearTable();
                    for (var i = 0; i < jsSelect.length; i++) {
                        var data = jsSelect[i].id_centro + "$$" + jsSelect[i].id_ciudad + "$$" + jsSelect[i].nom_centro + "$$" + jsSelect[i].num_centro + "$$" + jsSelect[i].direccion;
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsSelect[i].nom_centro,
                            jsSelect[i].nom_centro,
                            jsSelect[i].direccion,
                            jsSelect[i].nom_ciudad,
                            "<button id='" + data + "' class='btnModificarCentros btn btn-success'  >Modificar</button>"
                        ]);
                    }
                    break;
                case "Reporte":
                    var colum = [];
                    var ths = "";
                    var obj = jQuery.parseJSON(json);
                    if (obj.length > 0) {
                        for (var i = 0; i < Object.keys(obj[0]).length; i++) {
                            colum.push({"data": Object.keys(obj[0])[i]})
                            ths += "<th>" + Object.keys(obj[0])[i] + "</th>";
                        }

                        $('#' + selector).html("<thead><tr>" + ths + "</tr></thead>");
                        var tabla = $('#' + selector).DataTable({
                            data: obj,
                            columns: colum,
                            destroy: true
                        });
                        $("#" + selector + "_filter").hide();
                    } else {
                        alert("No se encontaron registros");
                    }
                    break;
            }
        } catch (error) {
            console.log(error.message);
        }
    }
    var logger = function () {
        var oldConsoleLog = null;
        var pub = {};
        pub.disableLogger = function disableLogger() {
            oldConsoleLog = console.log;
            window['console']['log'] = function () {};
        };
        return pub;
    }();
};

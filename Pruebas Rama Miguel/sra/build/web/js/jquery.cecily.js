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
        console.log(this.bus);
        this.bus = n;
        console.log(this.bus);
    }
    this.ObtenerBus = function () {
        return this.bus;
    };
    this.Vivo = function (mensaje) {
        console.log("Vivo??Cecily." + mensaje + " ");
        //logger.disableLogger();
    };
    this.limpiarSelector = function (selector) {
        selector.empty().append('<option value="A0">selecione...</option>');
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
                    var jso = jQuery.parseJSON(json);
                    var oAItem, oAComen, cc = 1;
                    for (var i = 0; i < jso.length; i++) {
                        oAItem = selector.clone();
                        oAItem.find("#consul").addClass("consul" + jso[i].Id_Version);
                        oAItem.find("#NumVersion").text("Version " + cc + ": " + datos.nom);
                        oAItem.find("#NumVersion").addClass(jso[i].Id_Version);
                        oAItem.find("#PvAutores").text(jso[i].Autores);
                        oAItem.find("#PvPublicacion").text(jso[i].Fecha_Publicacion);
                        oAItem.find("#PvFechaVigencia").text(jso[i].Fecha_Vigencia);
                        oAItem.find("#PvRequisitos").val(jso[i].Reqst_Instalacion);
                        oAItem.find("#PvInstalacion").val(jso[i].Inst_Instalacion);
                        oAItem.find(".labelEstrella").addClass(jso[i].Id_Version);
                        oAItem.find(".RComentarios").attr('id', "RComentarios" + jso[i].Id_Version);
                        oAItem.find("#comment").addClass('Comment' + jso[i].Id_Version);
                        oAItem.find("#Url_Version").attr('href', 'DescargaArchivo?archivo=' + jso[i].Url_Version + '');
                        oAItem.find("#btn_Comentar").val(jso[i].Id_Version);
                        oAItem.children().appendTo($("#resultados"));
                        var jsoComen = jQuery.parseJSON(jso[i].Comentarios);
                        for (var j = 0; j < jsoComen.length; j++) {
                            oAComen = $("#BaseComentario").clone();
                            oAComen.find(".contenidoCome").attr('id', "Comentario" + jsoComen[j].Id_Comentario);
                            oAComen.find("#NombreAComen").text(jsoComen[j].Nombre_Completo);
                            oAComen.find("#BaseComment").val(jsoComen[j].Comentario);
                            oAComen.children().appendTo($("#RComentarios" + jso[i].Id_Version));
                        }
                        cc++;
                    }
                    break;
                case "Comentario":
                    $("#RComentarios" + datos.id).empty();
                    var jsoComen = jQuery.parseJSON(json);
                    for (var j = 0; j < jsoComen.length; j++) {
                        oAComen = $("#BaseComentario").clone();
                        oAComen.find(".contenidoCome").attr('id', "Comentario" + jsoComen[j].Id_Comentario);
                        oAComen.find("#NombreAComen").text(jsoComen[j].Nombre_Completo);
                        oAComen.find("#BaseComment").val(jsoComen[j].Comentario);
                        oAComen.children().appendTo($("#RComentarios" + datos.id));
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
                    var jso = jQuery.parseJSON(json);
                    var j = Object.keys(jso[0]);
                    for (var i = 0; i < jso.length; i++) {
                        selector.append($('<option>', {
                            value: jso[i][j[0]],
                            text: jso[i][j[1]]
                        }));
                    }
                    break;
                case "ConsOaP":
                    var arryImagen = [
                        {nombre: "TextoPlano", arrayExt: ["txt", "log"]},
                        {nombre: "Word", arrayExt: ["dot", "doc"]},
                        {nombre: "Excel", arrayExt: ["xls", "xlm", "xlt", "xlv"]},
                        {nombre: "Acces", arrayExt: ["mdb"]},
                        {nombre: "PowePoint", arrayExt: ["ppt", "pps", "pot"]},
                        {nombre: "PDF", arrayExt: ["pdf"]},
                        {nombre: "Imagen", arrayExt: ["gif", "dib", "jpg", "png", "tga", "tiff", "pcx", "plic", "emf", "ico", "htm", "html"]},
                        {nombre: "BaseDatos", arrayExt: ["sql"]},
                        {nombre: "Net", arrayExt: ["asp","aspx"]},
                        {nombre: "Java", arrayExt: ["jar"]},
                        {nombre: "Php", arrayExt: ["php"]},
                        {nombre: "Css", arrayExt: ["css"]},
                        {nombre: "Js", arrayExt: ["js"]},
                        {nombre: "Compress", arrayExt: ["arj","zip","iso","lha","izh","img","bin"]}
                    ];
                    var pag = 0;
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
                            var comple = jso[i].Id_P_Virtual + "$$" + jso[i].Nom_P_Virtual + "$$" + jso[i].Des_P_Virtual;
                            oAItem = selector.clone();
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
                            jso[i].Nom_P_Virtual,
                            jso[i].Num_Version,
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
                    //---------CAMBIO
                    for (var i = 0; i < jsoCorre.length; i++) {
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsoCorre[i].Nom_P_Virtual,
                            jsoCorre[i].Num_Version,
                            jsoCorre[i].Conte_Notificacion,
                            jsoCorre[i].Fecha_Envio,
                            "<button  type='button' id='" + jsoCorre[i].Ides_Proceso + "$$"+ jsoCorre[i].Id_Version +"$$"+ jsoCorre[i].Nom_P_Virtual +"$$"+jsoCorre[i].Id_Notificacion+"' class='btn btn-info btnCorrecion'>Correguir P.V</button>"
                        ]);
                    }
                    //---------
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
                            jso[i].Producto,
                            jso[i].Conte_Notificacion,
                            jso[i].Fecha_Envio,
                            "<a class='btn btn-info' href=DescargaArchivo?archivo=" + jso[i].Url_Version + ">Descargar P.V</a>",
                            "<button  type='button' id='" + jso[i].Ides_Proceso + "' class='btn btn-info  btnEvaluar' value=" + jso[i].Id_Notificacion + ">Evaluar P.V</button>"
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
                            "<button id='" + jsSelect[i].Id_Version + "'class='btnclickHabilitar btn btn-info'>Habilitar</button>"
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
                        var data = (jsArea[i].Id_Area + "$$" + jsArea[i].Nom_Area + "$$" + jsArea[i].Lider_Area);
                        table = selector.dataTable().fnAddData([
                            i + 1,
                            jsArea[i].Nom_Area,
                            jsArea[i].Lider_Area,
                            "<button  class='btn btn-info botonArea'value='" + data + "' >modificar</button>"
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
                        var dat = (jsFormato[i].Id_Formato + "$$" + jsFormato[i].Nom_Formato + "$$" + jsFormato[i].Des_Formato);
                        table = $("#tablaformato").dataTable().fnAddData([
                            i + 1,
                            jsFormato[i].Nom_Formato,
                            jsFormato[i].Des_Formato,
                            "<button  class='btn btn-success botonformato'value='" + dat + "' >modificar</button>"
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

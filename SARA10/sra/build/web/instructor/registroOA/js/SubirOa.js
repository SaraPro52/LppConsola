$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], nombre = "";
    var c = 0;
    $("#SelectCategoriaDiv").hide();
    $("#SelectEstruturaDiv").hide();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "7", datos: [""], elegir: ["4", "6"], delimitador: "[{colum:0,operador:0,valor1:1}]", id: 0, opSelect: 4};

    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("SubirOas");
    jso[0] = ['Crud_Controller', '[{arr:0,opcion:5,tabla:7,datos:[],elegir:[4,8],delimitador:"[{colum:16,operador:0,valor1:'+idCentro+',añadir:0},{colum:4,operador:7,valor1:'+idUser +',añadir:0},{colum:1,operador:0,valor1:1}]",id:0,opSelect:6}]'];
    selector[0] = $("#SelectAutores");
    datos[0] = {nombre: "MultiSelect", worker: true};
    ajax(0, datos[0]);
    
    jso[1] = ['Crud_Controller', '[{opcion:3,tabla:17,datos:[],elegir:[4,8],delimitador:[],id:0,opSelect:4}]'];
    selector[1] = $("#formato");
    datos[1] = {nombre: "select", worker: true};
    ajax(1, datos[1]);

    ob.ajax(objets, selector);
    var arraySelecionAutor = [];

    $('#SelectAutores').multiSelect({
        afterSelect: function (valor) {
            arraySelecionAutor.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionAutor);
            arraySelecionAutor.splice(busqueda, 1);
        }
    });


    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "14", datos: [""], elegir: ["0", "1"],
        delimitar: "[{comlum:2,operador:0,valor1:1}]", id: 0, opSelect: 6};

    var arraySelecionCate = [];
    $('#SelectCategoria').multiSelect({
        afterSelect: function (valor) {
            arraySelecionCate.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionCate);
            arraySelecionCate.splice(busqueda, 1);
        }
    });


    var cs = 0;
    $("#Categorias").change(function (e) {
        if (cs == 0) {
            $("#SelectCategoriaDiv").show();
            selector = $("#SelectCategoria");
            objet = {nombre: "MultiSelect", opcion: 5, url: "Crud_Controller", tabla: "4", datos: [""], elegir: ["6", "7"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
            cs++;
        } else if (cs == 1) {
            $("#SelectCategoriaDiv").hide();
            cs = cs - 1;
        }
    });


    var arraySelecionEstr = [];
    $('#SelectEstrutura').multiSelect({
        afterSelect: function (valor) {
            arraySelecionEstr.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecionEstr);
            arraySelecionEstr.splice(busqueda, 1);
        }
    });
    var es = 0;
    $("#Estruturas").change(function (e) {
        if (es == 0) {
            $("#SelectEstruturaDiv").show();
            selector = $("#SelectEstrutura");
            objet = {nombre: "MultiSelect", opcion: 5, url: "Crud_Controller", tabla: "18", datos: [""], elegir: ["0", "1"],
                delimitador: "[{colum:2,operador:0,valor1:1}]", id: 0, opSelect: 4};
            ob.ajax(objet, selector);
            es++;
        } else if (es == 1) {
            $("#SelectEstruturaDiv").hide();
            es = es - 1;
        }

    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
        var arrayAutor = "";
        var arrayTemas = [];
        for (var i = 0; i < arraySelecionAutor.length; i++) {
            if (i == 0) {
                arrayAutor = idUser + "," + arraySelecionAutor[i];
            } else {
                arrayAutor = arrayAutor + "," + (arraySelecionAutor[i]);
            }
        }
        for (var i = 0; i < arraySelecionEstr.length; i++) {
            arrayTemas.push(arraySelecionEstr[i] + "-0");
        }
        for (var i = 0; i < arraySelecionCate.length; i++) {
            arrayTemas.push(arraySelecionCate[i] + "-1");
        }
        var s = $("#Documento");
        var selector = ("btn");
        var objeto = {opcion: 1, url: "ProductoVirtual_Controller", nombre: "Area",
            info: [$("#Titulo_Publicacion").val(),
                $("#descripcion_oa").val(),
                $("#palabras_claves").val(),
                $("#formato").val(),
                "", "", $("#instrucciones").val(), $("#requisitos_instalacion").val()], arrayFun: arrayAutor, arrayTemas: arrayTemas, archivoNom: $("#Documento").val()
        };
        console.log(objeto);
        ob.ajax(objeto, selector);
    }
      function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if ((i == 1) || (i == 2)) {
            if (i == 1) {
                if (data[0].length < data[1].length) {
                    men = "El item: " + nombre+ " fue agregado exitosamente";
                } else if (data[0].length == data[1].length) {
                    men = "El item: " + nombre + " no fue agregado exitosamente";
                }
            } else {
                men = data[i];
            }
            $.notify({
                icon: 'ti-gift',
                message: men + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});
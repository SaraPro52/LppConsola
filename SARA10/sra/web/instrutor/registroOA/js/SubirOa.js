$(document).ready(function () {
    var c = 0;
    $("#TemaCategoria").hide();
    $("#SelecEstrutura").hide();
    $("#SelecCategoria").hide();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "7", datos: [""], elegir: ["4", "6"], delimitador: "[{colum:0,operador:0,valor1:1}]", id: 0, opSelect: 4};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("SubirOa");
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "14", datos: [""], elegir: ["0", "1"],
        delimitar: "[{comlum:2,operador:0,valor1:1}]", id: 0, opSelect: 6};
    $("#formato").hover(function () {
        if (c == 0) {
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "16", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            selector = $("#formato");
            ob.ajax(objet, selector);
        }
        c++;
    });
    var autoCategoria = new $.GAutoTags();
    objet = {nombre: "MultiSelect", opcion: 5, url: "Crud_Controller", tabla: "7", datos: [""], elegir: ["4", "8"], delimitador: "[{colum:0,operador:0,valor1:1}]", id: 0, opSelect: 4};
    var selector = $("#Autores");
    autoCategoria.ajax(objet, selector);
    
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

    $("#Categorias").change(function (e) {
        selector= $("#SelectCategoria");
        objet = {nombre: "MultiSelect", opcion: 5, url: "Crud_Controller", tabla: "4", datos: [""], elegir: ["6", "7"], id: 0, opSelect: 4};
        ob.ajax(objet, selector);

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
    
    $("#Estruturas").change(function (e) {
        selector= $("#SelectEstrutura");
        objet = {nombre: "MultiSelect",opcion: 5, url: "Crud_Controller", tabla: "18", datos: [""], elegir: ["0", "1"],
            delimitador: "[{colum:2,operador:0,valor1:1}]", id: 0, opSelect: 4};
        ob.ajax(objet, selector);
    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
        var arrayTemas = [];
        for(var i = 0; i < arraySelecionEstr.length;i++){
            arrayTemas.push(arraySelecionEstr[i] + "-0");
        }
        for (var i = 0; i < arraySelecionCate.length; i++){
            arrayTemas.push(arraySelecionCate[i] + "-1");
        }
        var s = $("#Documento");
        var selector = ("btn");
        var objeto = {opcion: 1, url: "ProductoVirtual_Controller", nombre: "Area",
            info: [$("#Titulo_Publicacion").val(), $("#descripcion_oa").val(), $("#palabras_claves").val(), $("#formato").val(),
                "0", "0", $("#instrucciones").val(), $("#requisitos_instalacion").val()], arrayFun: $("#autores").val(), arrayTemas: arrayTemas, imagenNom: $("#Imagen").val(), archivoNom: $("#Documento").val()
        };
        ob.ajax(objeto, selector);
    }
});
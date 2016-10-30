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
    objet = {mensaje: "un autor...", Constante: "Autores", arr: "0",opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "7", datos: [""], elegir: ["4", "8"], delimitador: "[{colum:0,operador:0,valor1:1}]", id: 0, opSelect: 4};
    var selector = $("#Autores");
    autoCategoria.ajax(objet, selector);

    $("#Categorias").change(function (e) {
    });
    $("#Estruturas").change(function (e) {

    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
        var s = $("#Documento");
        var selector = ("btn");
        var objeto = {opcion: 1, url: "ProductoVirtual_Controller", nombre: "Area",
            info: [$("#Titulo_Publicacion").val(), $("#descripcion_oa").val(), $("#palabras_claves").val(), $("#formato").val(),
                "0", "0", $("#instrucciones").val(), $("#requisitos_instalacion").val()], arrayFun: $("#autores").val(), arrayTemas:  arrays, imagenNom: $("#Imagen").val(), archivoNom: $("#Documento").val()
        };
        ob.ajax(objeto, selector);
    }
});
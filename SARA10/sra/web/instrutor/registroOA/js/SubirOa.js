$(document).ready(function () {
    var c = 0;
    var x = "";
    $("#SelecEstrutura").hide();
    $("#SelecCategoria").hide();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "13", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    var selector = $("#Titulo_Publicacion");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("SubirOa");
    ob.ajax(objet, selector);

    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "14", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    $("#formato").hover(function () {
        if (c == 0) {
            objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "16", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            selector = $("#formato");
            ob.ajax(objet, selector);
        }
        c++;
    });

    var autoCategoria = new $.GAutoTags();
    $("#Categorias").change(function (e) {
        if ($("#Categorias").is(':checked')) {
            var objet = {mensaje: "una categoria...", Constante: "Categoria", arr: "0", opcion: 5, url: "Crud_Controller", tabla: "8", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            x = $("#Categoria");
            autoCategoria.ajax(objet, x);
            $("#SelecCategoria").show();
            selector = $("#Categoria");
        } else {
            $("#SelecCategoria").hide();
        }
    });
    $("#btnCategoria").click(function () {
        var as = $("#Categoria_Datos").val().split(",");
        var objet = {arr: "1", contenedor: "#TemaCategoria", opcion: 5, url: "Crud_Controller", tabla: "8", datos: [""], elegir: ["6", "7"], delimitador: "[{colum:1,operador:0,valor1:'\"" + as[i] + "\"'}]", id: 0, opSelect: 6};
        x = $("#Categoria_Datos");
        autoCategoria.puroAjax(objet, x);
        var autoCategoria = new $.GAutoTags();
        autoCategoria.puroAjax(objet, x);

    });
    $("#Estrutura").change(function (e) {
        if ($("#Estrutura").is(':checked')) {
            var autoCategoria1 = new $.GAutoTags();
            var objet = {opcion: 5, url: "Crud_Controller", mensaje: "una categoria...", Constante: "Categoria", arr: "0", tabla: "6", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            var x = $("#Categoria");
            autoCategoria1.puroAjax(objet, x);
            $("#SelecEstrutura").show();
        } else {
            $("#SelecEstrutura").hide();
        }
    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
        var s = $("#Documento");
        console.log(s);
        var selector = ("btn");
        var objeto = {Opcion: 1, url: "oacontroller", nombre: "Area", titulo: $("#Titulo_Publicacion").val(), autores: $("#autores").val(),
            descripcion: $("#descripcion_oa").val(), area: $("#options1").val(), programa: $("#options2").val(), tema: $("#Tema").val(),
            palabras: $("#palabras_claves").val(), formato: $("#formato").val(), requisitos: $("#requisitos_instalacion").val(),
            instruciones: $("#instrucciones").val()
        };
        //ob.ajax(objeto, selector);
        //ob.archivos() ;
    }
});
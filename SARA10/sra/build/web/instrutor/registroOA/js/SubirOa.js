$(document).ready(function () {
    var c = 0;
    var x = "";
    $("#TemaCategoria").hide();
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
        console.log("Cambio");
        if ($("#Categorias").is(':checked')) {
            var objet = {mensaje: "una categoria...", Constante: "Categoria", arr: "0", opcion: 5, url: "Crud_Controller", tabla: "4", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            x = $("#Categoria");
            autoCategoria.ajax(objet, x);
            $("#SelecCategoria").show();
            selector = $("#Categoria");
        } else {
            $("#SelecCategoria").hide();
        }
    });
    $("#btnCategoria").click(function () {
        $("#seCa").accordion();
        var as = $("#Categoria_Datos").val().split(",");
        var objet = {arr: "1", contenedor: "#TemaCategoria", opcion: 5, url: "Crud_Controller", tabla: "8", datos: [""], elegir: ["6", "7"], delimitador: "[{colum:1,operador:0,valor1:'\"" + as + "\"'}]", id: 0, opSelect: 6};
        x = $("#Categoria_Datos");
        var js = ['Colombia', 'ecuador', 'Chile', 'Bolivia', 'Argentina', 'Brasil'];
        var s = $("#TemaCategoria");
        autoCategoria.CagarHijo(objet, x, s, js);

    });
    var ww = 0;
    $(document).on('click', '.accordion', function (e) {
        var se = this;
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
        if (ww == 0) {
            console.log("Hola" + ww);
        }
        ww++;
    });
    $("#Estruturas").change(function (e) {
        if ($("#Estruturas").is(':checked')) {
            var autoCategoria1 = new $.GAutoTags();
            var objet = {opcion: 5, url: "Crud_Controller", mensaje: "Programa de formacion...", Constante: "Estrutura", arr: "0", tabla: "6", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            var x = $("#Estrutura");
            autoCategoria1.ajax(objet, x);
            $("#SelecEstrutura").show();
        } else {
            $("#SelecEstrutura").hide();
        }
    });
    $("#btnCategoria").click(function () {
        $("#seCa").accordion();
        var as = $("#Categoria_Datos").val().split(",");
        var objet = {arr: "1", contenedor: "#TemaCategoria", opcion: 5, url: "Crud_Controller", tabla: "8", datos: [""], elegir: ["6", "7"], delimitador: "[{colum:1,operador:0,valor1:'\"" + as + "\"'}]", id: 0, opSelect: 6};
        x = $("#Categoria_Datos");
        var js = ['Colombia', 'ecuador', 'Chile', 'Bolivia', 'Argentina', 'Brasil'];
        var s = $("#TemaCategoria");
        autoCategoria.CagarHijo(objet, x, s, js);

    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
        var s = $("#Documento");
        var selector = ("btn");
        var objeto = {Opcion: 1, url: "ProductoVirtual_Controller", nombre: "Area", titulo: $("#Titulo_Publicacion").val(), autores: $("#autores").val(),
            descripcion: $("#descripcion_oa").val(), area: $("#options1").val(), programa: $("#options2").val(), tema: $("#Tema").val(),
            palabras: $("#palabras_claves").val(), formato: $("#formato").val(), requisitos: $("#requisitos_instalacion").val(),
            instruciones: $("#instrucciones").val(),imagenNom:$("#Imagen").val(),archivoNom:$("#Documento").val()
        };
        ob.ajax(objeto, selector);
    }
});
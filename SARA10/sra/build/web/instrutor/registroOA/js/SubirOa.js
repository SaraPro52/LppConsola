$(document).ready(function () {
    var c = 0;
    var x = "";
    $("#TemaCategoria").hide();
    $("#SelecEstrutura").hide();
    $("#SelecCategoria").hide();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "AutoComplet", tabla: "7", datos: [""], elegir: ["4", "6"], delimitador: "[{colum:0,operador:0,valor1:1}]", id: 0, opSelect: 4};

    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("SubirOa");
    //ob.ajax(objet, selector);
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
    $(document).on('click', '.accordion', function (e) {
        var objet = {};
        var se = this.id;
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
        var fin = se.length + 1;
        fin = se.substring(2, fin);
        var llamar = fin;
        se = $('#' + fin);
        var con = this.id;
        fin = con.substring(0, 2);
        if (fin == "L6") {
            objet = {opcion: 5, url: "Crud_Controller", mensaje: "un tema...", Constante: "Estrutura", arr: "0", tabla: "4", datos: [""], elegir: ["6", "7"],
                delimitador: "[{colum:1,operador:0,valor1:'\"" + llamar + "\"'}]", id: 0, opSelect: 6};

        } else if (fin == "L4") {
            objet = {opcion: 5, url: "Crud_Controller", mensaje: "Programa de formacion...", Constante: "Estrutura", arr: "0", tabla: "2", datos: [""], elegir: ["4", "5"],
                delimitador: "[{colum:1,operador:0,valor1:1}]", id: 0, opSelect: 4};//DEBE OPTENER EL VALOR DEL AREA

        }
        autoCategoria.ajax(objet, se);
    });
    $(document).on('click', '.accordion', function (e) {
        var objet = {opcion: 5, url: "Crud_Controller", mensaje: "Programa de formacion...", Constante: "Estrutura", arr: "0", tabla: "4", datos: [""], elegir: ["4", "5"]
            ,id: 0, opSelect: 4};//DEBE OPTENER EL VALOR DEL PROGRAMA
    });
    $("#Estruturas").change(function (e) {
        if ($("#Estruturas").is(':checked')) {
            var autoCategoria1 = new $.GAutoTags();

            var objet = {opcion: 3, url: "Crud_Controller", mensaje: "Programa de formacion...", Constante: "Estrutura", arr: "0", tabla: "26", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
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
        var s = $("#TemaCategoria");
        var seca = $("#seCa");
        autoCategoria.CagarHijo(objet, x, s, seca);
    });
    $("#btnEstrutura").click(function () {
        $("#seEs").accordion();
        var as = $("#Estrutura_Datos").val().split(",");
        var objet = {arr: "1", contenedor: "#TemaCategoria", opcion: 5, url: "Crud_Controller", tabla: "8", datos: [""], elegir: ["6", "7"], delimitador: "[{colum:1,operador:0,valor1:'\"" + as + "\"'}]", id: 0, opSelect: 4};
        x = $("#Estrutura_Datos");
        var s = $("#TemaCategoria");
        var seca = $("#seEs");
        autoCategoria.CagarHijo(objet, x, s, seca);
    });
    $("#subir_oa").on('click', function () {
        datosV();
    });
    function datosV() {
       var arrays=[];
       //arrays=$("#Categoria_Datos").val();
       //$("#Estrutura_Datos").val()
        var s = $("#Documento");
        var selector = ("btn");
        var objeto = {opcion: 1, url: "ProductoVirtual_Controller", nombre: "Area",
            info: [$("#Titulo_Publicacion").val(), $("#descripcion_oa").val(), $("#palabras_claves").val(), $("#formato").val(),
                "0", "0", $("#instrucciones").val(), $("#requisitos_instalacion").val()], arrayFun: $("#autores").val(), arrayTemas:  arrays, imagenNom: $("#Imagen").val(), archivoNom: $("#Documento").val()
        };
        ob.ajax(objeto, selector);
    }
});
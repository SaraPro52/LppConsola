$(document).on('ready', function () {
    $("#oculto").hide();
    //centro del area / temas  Cosas que hay que hacer
    var objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
    var selector = $("#SelecCentro");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Programa");
    ob.ajax(objet, selector);

    $("#SelecCentro").change(function () {
        if ($("#SelecCentro").val() != "A0") {
            selector = $("#SelecArea");
            objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });

    $("#SelecArea").change(function () {
        $("#oculto").show();
        if ($("#SelecArea").val() != "A0") {
            selector = $("#MultTemas");
            objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "MultiSelect", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
    });

    $("#btnPrograma").on('click', function () {
        var objeto = {d: 1, opcion: 1, url: "Crud_Controller", nombre: "Formato", tabla: "17", datos: ["", $("#formato").val(), $("#descripcion").val()], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
        ob.limpiarTabla(selector);
        ob.ajax(objeto, "btn");
    });
})
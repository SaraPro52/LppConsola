function calificarPV(idLista) {
    $("#clone").hide();
    alert(idLista);
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "calificar", tabla: "15", datos: [""], elegir: ["0", "1"],
        delimitador: "[{colum:3, operador:0, valor1:" + idLista + "}]", id: 0, opSelect: 6};
    var selector = $("#divContainer");
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("Producto virtual" + $("#vista").val());
    ob.ajax(objet, selector);

}
$("#btnEvaluar").click(function () {
    var campo="";
    var object = {itemsText: []};
    $("input:checkbox:checked").each(function () {
        campo = $(this).val();
        if (campo !== "") {
            object.itemsText.push({
                id: campo,
                valor: 1,
                text: $("#" + campo).val()
            });
        }
    });
    $("input:checkbox:not(:checked)").each(function () {
        campo = $(this).val();
        if (campo !== "") {
            object.itemsText.push({
                id: campo,
                valor: 0,
                text: $("#" + campo).val()
            });
        }
    });

    console.log($("#ObservacionCompleta").val());
    console.log(object);
    console.log($('input[name=Resultado]:checked', '#res').val());
});
    
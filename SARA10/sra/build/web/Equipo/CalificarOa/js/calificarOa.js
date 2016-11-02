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
    var resultado;
    var itemsOk = [];
    var itemsFail = [];
    var ite = [];
    var object = {itemsText: []};
    $("input:checkbox:checked").each(function () {
        var campo = $(this).val();
        if (campo !== "") {
            itemsOk.push($(this).val());
            ite.push($(this).val());
        }
    });
    $("input:checkbox:not(:checked)").each(function () {
        var campo = $(this).val();
        if (campo !== "") {
            itemsFail.push($(this).val());
            ite.push($(this).val());
        }
    });
    for (var i = 0; i < ite.length; i++) {
        object.itemsText.push({id: ite[i], text: $("#" + ite[i]).val()});
    }

    console.log(object);
    console.log($('input[name=Resultado]:checked', '#myForm').val());
    console.log(itemsOk);
    console.log(itemsFail);

});
    
function calificarPV(idLista) {
    $("#clone").hide();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "calificar", tabla: "15", datos: [""], elegir: ["0", "1","4"],
        delimitador: "[{colum:3, operador:0, valor1:" + idLista + "}]", id: 0, opSelect: 6};
    var selector = $("#divContainer");
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("CalificarOA");
    ob.ajax(objet, selector);
}
$("#btnEvaluar").click(function () {
    var campo="";
    var infoItems = [];
    $("input:checkbox:checked").each(function () {
        campo = $(this).val();
        if (campo !== "") {
            infoItems.push("1¤"+$("#" + campo).val()+"¤"+campo);
        }
    });
    $("input:checkbox:not(:checked)").each(function () {
        campo = $(this).val();
        if (campo !== "") {
            infoItems.push("0¤"+$("#" + campo).val()+"¤"+campo);
            
        }
    });

    objet = {opcion:1,
        url:"EvaluacionGeneral_Controller",infoEva:[""+$("#ObservacionCompleta").val()+"",""+$("#Resultado").val()+"",""+idVersion+"",""+idLista+"",""+idUser+"",""+$("#iFecha").val()+""],
        infoItem:infoItems};
    selector = "btn";
    ob.ajax(objet,selector);
    
});
    
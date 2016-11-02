$(document).ready(function () {
    //35    
    $('#myModal').modal('hide');
    var arraySelecion = [];
    var objet = {opcion: 3, url: "Crud_Controller", nombre: "MultiSelect", tabla: "26", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
    var selector = $("#SelectTemas");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Categorias");
    ob.ajax(objet, selector);
    $('#SelectTemas').multiSelect({
        afterSelect: function (valor) {
            arraySelecion.push(valor)
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });
    $("#btnTema").click(function () {
        var objeto = {opcion: 1, nombre: "MultiSelect", opt: "Div",
            url: "Crud_Controller", tabla: "26", datos: ["", $("#NombreTema").val(), $("#DescripcionTema").val(), "1"], elegir: ["0", "1"],
            id: 0, opSelect: 4}
        ob.ajax(objeto, selector);
    });
    $("#btnCategoria").click(function () {
        var arrayS = [];
        for (var j = 0; j < arraySelecion.length; j++) {
            if (j == 0) {
                arrayS = "" + arraySelecion[j];
            } else {
                arrayS = arrayS + "," + arraySelecion[j];
            }
        }
        objet = {opcion: 1, url: "Categoria_Controller", catego: [$("#NombreCategoria").val(), $("#DescripcionCategoria").val(), "2"], temas: arrayS};
        ob.ajax(objet, selector);
    });
});


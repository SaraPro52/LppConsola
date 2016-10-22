$(document).on('ready', function () {
    var val= $("#vista").val();
    var arraySelecion = [];
    var objet = {opcion: 3, url: "Crud_Controller", nombre: "MultiSelect",
        tabla: "18", datos: [""], elegir: ["0", "1"],
        delimitador: "[{colum: 2,operador: 0,valor1:"+val+"}]", id: 0, opSelect: 6};
    var selector = $("#SelectItem");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("ListaDeChequeo" + $("#vista").val());
    var view = $("#lista");
    ob.tipoUsuario($("#vista").val(), view);
    ob.ajax(objet, selector);

    $('#SelectItem').multiSelect({
        afterSelect: function (valor) {
            arraySelecion.push(valor);
        },
        afterDeselect: function (val) {
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });
    $("#btnItem").on('click', function () {
        var val= $("#vista").val();
        var objeto = {opcion: 1, nombre: "MultiSelect", opt: "Div",
            url: "Crud_Controller", tabla: "18", datos: ["", $("#Descripcion").val(), val], elegir: ["0", "1"],
            delimitador: "[{colum:2,operador:0,valor1:"+val+"}]", id: 0, opSelect: 6};
        console.log(objeto); 
        ob.ajax(objeto, selector);
    });
    $("#BtnLista").on('click', function () {
        var arrayS = [];
        for (var j = 0; j < arraySelecion.length; j++) {
            if (j == 0) {
                arrayS = "" + arraySelecion[j];
            } else {
                arrayS = arrayS + "," + arraySelecion[j];
            }
        } 
        var objeto = {opcion: 1, nombre: "btn", url: "ListaChequeo_Controller", lista: [$("#NombreL").val(), $("#DescripcionL").val(), "2"], items: arrayS};
        ob.ajax(objeto, "null");
    });
})
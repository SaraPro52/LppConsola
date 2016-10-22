$(document).on('ready', function () {
    $("#tablaItems").hide();
    selector = $("#tablalista");
    var objet = {opcion: 5, nombre: "Lista", url: "Crud_Controller", tabla: "12", datos: [""], elegir: ["0", "1", "2", "3"],
        delimitador: "[{'colum':'5','operador':'0' ,'valor1':2}]", id: 0, opSelect: 6};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("ModificarListaDeChequeo" + $("#vista").val());
    var view = $("#lista");
    ob.tipoUsuario($("#vista").val(), view);
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);

    $("#btnItem").on('click', function () {
        var objeto = {opcion: 1, nombre: "MultiSelect", opt: "Div",
            url: "Crud_Controller", tabla: "18", datos: ["", $("#Descripcion").val(), "1"], elegir: ["0", "1"],
            delimitador: "[{colum:2,operador:0,valor1:1}]", id: 0, opSelect: 6} 
        ob.ajax(objeto, selector);
    });
    $(document).on('click', '.btnclick', function (e) {
        $("#tabla").hide();
        $("#tablaItems").show();
        $("#SelectItem").show();
        objeto = {opcion: 5, url: "Crud_Controller", nombre: "MultiSelect", tabla: "15",
            elegir: ["0","1"],delimitador:"[{'colum':'3','operador':'0','valor1':'"+this.id+"',añadir:0},{'colum':'2','operador':'0','valor1':'1'}]", id: this.id, opSelect:6};
        selector=$("#SelectItem");
        ob.ajax(objeto, selector);
        //cuidado con el manejo de los tipos de item 1 y 0

    });
});
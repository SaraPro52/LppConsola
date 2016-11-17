$(document).on('ready', function () {
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "Funcionario" ,tabla: "11",
        elegir: ["0", "1", "3", "5", "6"], id: 0, opSelect: 4};
    var selector = $("#tablaAdmi");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("EstadoFuncionario");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.botonclick', function (e) {
        objeto = {opcion: 2, url: "Crud_Controller", nombre: "FuncionarioRecarga", tabla: "18",
            elegir: [""], actualizar: "[{'9':'2'}]", id: this.id, opSelect: 2};
        ob.limpiarTabla(selector);
        ob.ajax(objeto, selector);
    });
    //objet = {opcion: 5, url: "Crud_Controller", nombre: "Funcionario", tabla: "2",
    //        elegir: ["0", "1", "3", "5", "6"], id: 0, opSelect: 4};
    //selector = $("#tablaAdmi");
    //ob.ajax(objet, selector);
});
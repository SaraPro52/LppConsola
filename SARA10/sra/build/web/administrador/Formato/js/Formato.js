$(document).on('ready', function () {
//Cam
//denueo
//hollaaaa
    var objet = {opcion: 3, url: "Crud_Controller", nombre: "Formato", tabla: "16", datos:[""], elegir:["0","1","2"],id:0, opSelect: 4};
    var selector = $("#tablaformato");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Ciudad Modificar");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "m":
                objeto = {opcion: 2, id: this.id, nombre: "BtnModal"};
                break;
            case "e":
                objeto = {opcion: 4, id: this.id, nombre: "BtnModal"};
                break;
        }
        alert(objeto.Opcion + " s " + objeto.id);
        ob.ajax(objeto, selector);
    });
    $("#btnformato").on('click', function () {
        var objeto = {opcion: 1, url: "Crud_Controller",nombre: "Formato",tabla:"16",datos:["",$("#formato").val(),$("#descripcion").val()],elegir:["0","1","2"],id:0, opSelect: 4};
        ob.limpiarTabla();
        ob.ajax(objeto, selector);
    });
});
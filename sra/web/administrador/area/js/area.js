$(document).on('ready', function ()     {    
    var tabla = {selector: $("#tablaarea")};
    var objet = {Opcion: 3, url: "areacontroller", nombre: "Area"};
    var selector = {selector: $("#tablaarea")};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Area");
    ob.TablaEspa(tabla);
    ob.ajax(objet, selector);
    
    $("#btnArea").on('click', function () {
        objeto = {Opcion: 1,url: "areacontroller", nombre:"Area",Nombrea: $("#areaC").val(), Lider: $("#areaL").val()};
        ob.limpiarTabla();
        $("#areaC").val("");
        $("#areaL").val("");
        ob.ajax(objeto, selector);
    });
    $(document).on('click', '.botonclick', function (e) {
        switch (this.value) {
            case "m":
                break;
            case "e":
                break;
        }
    });
});
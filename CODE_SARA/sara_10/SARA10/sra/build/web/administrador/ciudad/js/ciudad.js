$(document).on('ready', function () {
    var tabla = {selector: $("#tablaCiudad")};
    var objet = {Opcion: 3, url: "Crud_Controller", nombre: "Ciudad"};
    var selector = {selector: $("#tablaCiudad")};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Area");
    ob.TablaEspa(tabla);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "m":
                objeto = {Opcion: 2, id: this.id,nombre:"BtnModal"};
                break;
            case "e":
                objeto = {Opcion: 4, id: this.id,nombre:"BtnModal"};
                break;
        }
        alert(objeto.Opcion +" s "+objeto.id );
        ob.ajax(objeto,selector);
    });
    $("#btnEstado").on('click', function () {
        var objeto = {Opcion: 1,ciudad: $("#Ciudad").val(),nombre:"Btn",url:"Crud_Controller"};
        ob.ajax(objeto,selector);
        $("#Ciudad").val("");
    });
});

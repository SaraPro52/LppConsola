$(document).on('ready', function () {
    var objet = {opcion: 5 , url :"Crud_Controller",nombre: "Habilitar",tabla:"9",datos :[""],elegir:[""],id : 0, opSelect: 1};//HABILITAR_P
    var selector = $("#tablaAprobar");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Habilitar Producto");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "H":
                objeto = {Opcion: 2, id: this.id, nombre: "BtnModal"};
                break;
        }
        alert(objeto.Opcion + " s " + objeto.id);
        ob.ajax(objeto, selector);
    });
});



$(document).on('ready', function () {
    var objet = {opcion: 3, url:"Crud_Controller", nombre: "Ciudad",tabla:"6",datos:[""],elegir:["0","1"],id:0,opSelect: 4};//TABLA Ciudad
    var selector = $("#tablaCiudad");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Ciudad Modificar");
    ob.TablaEspa(selector); 
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "m": objeto = {Opcion: 2, id: this.id,nombre:"BtnModal"};break;
            case "e": objeto = {Opcion: 4, id: this.id,nombre:"BtnModal"};break;
        }
        alert(objeto.Opcion +" s "+objeto.id);
        ob.ajax(objeto,selector);
    });
    $("#btnCiudad").on('click', function () {
        var objeto = {opcion: 1,nombre:"Ciudad",url:"Crud_Controller",tabla:"5",datos:["",$("#Ciudad").val()],elegir:["0","1"],id:0,opSelect:4};//VIEW Ciudad
        ob.limpiarTabla(); 
        ob.ajax(objeto,selector);
        $("#Ciudad").val("");
    });
});

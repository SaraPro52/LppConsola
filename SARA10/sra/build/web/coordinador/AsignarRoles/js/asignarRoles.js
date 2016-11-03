$(document).on('ready', function () {
    var objet = {opcion: 2 , url :"Funcionario_Controller",nombre: "AsignarRol",centro:idCentro};
    var selector = $("#tablaARoles"); 
    var ob = new $.Luna("usuario", selector);
    ob.Vivo("Asignar Roles");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "A":
                objet = {opcion: 1 , url :"Crud_Controller",nombre: "btn",tabla:25,datos:["","1","6"],id:0,opSelect:7};
                var selector = "btn"; 
                var ob = new $.Luna("usuario", selector);
                ob.Vivo("Asignar Roles");
                ob.ajax(objet, selector);
                alert("si funciono");
                break;
        }
    });
});
    
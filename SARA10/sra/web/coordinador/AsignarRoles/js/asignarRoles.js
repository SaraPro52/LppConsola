$(document).on('ready', function () {
    var objet = {opcion: 5 , url :"Crud_Controller",nombre: "Habilitar",tabla:"20",datos :[""],
        elegir:["0","1","2","4","6","8"],
        delimitador:"[{colum:3,operador:0,valor1:"+idCentro+"},]",id : 0, opSelect:6};
    var selector = $("#tablaARoles"); 
    var ob = new $.Luna("usuario", selector);
    ob.Vivo("Asignar Roles");
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
    
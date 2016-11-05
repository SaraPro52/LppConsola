$(document).on('ready', function () {
    var objet = {opcion: 5 , url :"Crud_Controller",nombre:"Habilitar",tabla:"9",datos :[""],elegir:["0","1","2","3"],
        delimitador:"[{colum:4,operador:0,valor1:"+idCentro+"}]",id : 0, opSelect: 6};//HABILITAR_P
    var selector = $("#tablaAprobar"); 
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("Habilitar Producto");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "H":
                objeto = {opcion: 4, url:"ProductoVirtual_Controller",aprobacion:[idUser,this.id],nombre: "BtnModal"};
                break;
        }
        ob.ajax(objeto, selector);
    });
});



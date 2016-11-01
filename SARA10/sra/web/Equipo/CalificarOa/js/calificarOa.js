function calificarPV(idLista){
    alert("Id_Lista :"+idLista);
    $("#clone").hide(); 
    var listaSelect = $("#Nombrelista").val();
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "calificar", tabla: "15", datos: [""], elegir: ["0", "1"],
        delimitador: "[{colum:3, operador:0, valor1:"+this.idLista+"}]", id: 0, opSelect: 6};
    var selector = $("#divContainer"); 
    var ob = new $.Luna("Producto virtual", selector);
    ob.Vivo("Producto virtual" + $("#vista").val());
    ob.ajax(objet, selector);
};

    
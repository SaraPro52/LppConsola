selector = $("#tablaNotificacion");

var objet = {opcion: 5, url: "Crud_Controller", nombre: "correcion", tabla: "17", datos: [""], elegir: ["4", "5", "6"],
    delimitador: "[{colum:2, operador:0, valor1:" + idRol + ",añadir:0},{colum:8,operador:0,valor1:"+idCentro+",añadir:0},\n\
                   {colum:0,operador:0,valor1:"+idUser+",añadir:0},{colum:9,operador:0, valor1:2}]", id: 0, opSelect: 6};
var ob = new $.Luna("producto", selector);
ob.Vivo("CorrecionInstrutor");
ob.TablaEspa(selector);
ob.ajax(objet, selector); 
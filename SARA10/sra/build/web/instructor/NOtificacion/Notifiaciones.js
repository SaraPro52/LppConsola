selector = $("#tablaNotificacion");
var objet = {opcion: 5, url: "Crud_Controller", nombre: "consutarOa", tabla: "17", datos: [""], elegir: ["4", "5", "6"],
    delimitador: "[{colum:2, operador:0, valor1:" + idRol + ",añadir:0},{colum:8,operador:0,valor1:"+idCentro+",añadir:0},\n\
                   {colum:0,operador:0,valor1:"+idUser+"}]", id: 0, opSelect: 6};
var ob = new $.Luna(objet.nombre, selector);
ob.Vivo("NotifiacionesInstrutor");
ob.TablaEspa(selector);
ob.ajax(objet, selector);
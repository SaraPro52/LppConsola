selector = $("#tablaNotificacion");
var objet = {opcion: 5, nombre: "Lista", url: "Crud_Controller", tabla: "12", datos: [""], elegir: ["0", "1", "2", "3"],
    delimitador: "[{'colum':'5','operador':'0' ,'valor1':2}]", id: 0, opSelect: 6};
var ob = new $.Luna(objet.nombre, selector);
ob.Vivo("NotifiacionesInstrutor");
ob.TablaEspa(selector);
ob.ajax(objet, selector);
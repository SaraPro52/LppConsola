$(document).on('ready', function () {
    var tabla = {selector: $("#tablaAdmi")};
    var s = {opcion: 3, url:"Crud_Controller", nombre: "aa",tabla:"5",datos:[" ","popo5"],elegir:[" ","1"],opSelect:1};
    
    
    var objet = {opcion: 3, url:"Crud_Controller", nombre: "Funcionario",tabla:"17",datos:null,elegir:["4","5","6"],opSelect:1};
    var selector = {selector: $("#tablaAdmi")};
    var ob = new $.Luna(objet.nombre,selector);
    ob.Vivo("EstadoFuncionario");
    ob.TablaEspa(tabla);
    ob.ajax(s, selector);
    $(document).on('click', '.botonclick', function (e) {
        objeto = {Opcion: 4, Id_Fun: this.id,nombre: "Funcionario",url:"Funcionario_Controller"};
        ob.limpiarTabla();
        ob.ajax(objeto,selector);
    });
});

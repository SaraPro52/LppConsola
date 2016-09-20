$(document).on('ready', function () {
    var tabla = {selector: $("#tablaAdmi")};
    var objet = {Opcion: 3, url: "funcionariocontroller", nombre: "Funcionario"};
    var selector = {selector: $("#tablaAdmi")};
    var ob = new $.Luna(objet.nombre,selector);
    ob.Vivo("EstadoFuncionario");
    ob.TablaEspa(tabla);
    ob.ajax(objet, selector);
    $(document).on('click', '.botonclick', function (e) {
        objeto = {Opcion: 4, Id_Fun: this.id,nombre: "Funcionario",url: "funcionariocontroller"};
        ob.limpiarTabla();
        ob.ajax(objeto,selector);
    });
});

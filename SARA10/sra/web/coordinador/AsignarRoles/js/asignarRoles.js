$(document).on('ready', function () {
    var objet = {opcion: 2, url: "Funcionario_Controller", nombre: "AsignarRol", centro: idCentro};
    var selector = $("#tablaARoles");
    var ob = new $.Luna("usuario", selector);
    ob.Vivo("Asignar Roles");
    ob.TablaEspa(selector);
    ob.ajax(objet, selector);
    $(document).on('click', '.btnclick', function (e) {
        switch (this.value) {
            case "A":
                var bus = "Select"+this.id;
                bus = $("#bus").find($("#"+bus));
                objet = {opcion: 1, url: "Crud_Controller", nombre: "btn", tabla: 26, datos: ["", bus.val(), this.id], id: 0, opSelect: 7};
                ob.ajax(objet, selector);
                break;
        }
    });
});
    
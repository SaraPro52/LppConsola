$(document).on('ready', function () {
    var objet = {Opcion: 3, url: "areacontroller", nombre: "Select"};
    var selector = {selector: $("#Area")};
    var ob = new $.Luna("RegistroFuncionario", selector);
    ob.Vivo("RegistroFuncionario");
    ob.ajax(objet,selector);
    $("#boton1").on('click', function () {
        datosV();
    });
    function datosV() {
        var selector = "btn";
        var objet = {
            Opcion: 1,
            url: "funcionariocontroller",
            nombre: "btn",
            STipoUsuario: $("#tipoUsuario").val(),
            CNombre: $("#nombre").val(),
            CApellido: $("#apellido").val(),
            StipoIdentificacion: $("#options").val(),
            CIdentificacion: $("#Numero_identificacion").val(),
            CEmail: $("#email").val(),
            CSena: $("#Ip_sena").val(),
            SCargo: $("#cargo").val(),
            SCentro: $("#options2").val(),
            SArea: $("#Area").val(),
            SEstado: $("#Estado").val()
        };
        console.log(objet);
        ob.ajax(objet, selector);
    }
});
//PD 138 Lineas a ver como queda ;)
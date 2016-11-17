$(document).on('ready', function () {
    var objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "perfil", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
    var selector = $("#formulario");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("PerfilUsuario");
    ob.ajax(objet, selector);
    var cF = 0;
    $("#BtnModificar").click(function(){
        $("#NombreFun").val();
        $("#ApellidoFun").val();
        $("#IdentificacionFunTipo").val();
        $("#IdentificacionFun").val();
        $("#NFuncionarioFun").val();
        $("#CorreoFun").val();
        $("#IdSenaFun").val();
        $("#CaargoFun").val();
    });
    $("#Btncontrasena").click(function () {
        //$("#myModal").modal('show');
    });
    $("#IdentificacionFun").hover(function () {
        if (cF == 0) {
            selector = $("#IdentificacionFun");
            objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "perfil", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
        cF++;
    });
    $("#BtnMcontrasena").click(function () {
        if (($("#ConNueva").val() == $("#ConNuevaF").val()) && ($("#ConNuevaF").val() != "")) {
            console.log("Listo para peticion");
            $("#ConActual").val();
            $("#ConNueva").val();
        }
    });
});


$(document).on('ready', function () {
    var c = 1;var cc=1;
    var objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["2", "3"], id: 0, opSelect: 4};
    var selector = $("#centroFormacion");
    var ob = new $.Luna("RegistroFuncionario", selector);
    ob.Vivo("RegistroFuncionario");
    ob.ajax(objet, selector);

    $("#tipoUsuario").hover(function () {
        if (c == 1) {
            selector = $("#tipoUsuario"); 
            var objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "25", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
        c++;
    });
    $("#tipoIdenti").hover(function () {
        if (cc==1) {
            selector = $("#tipoIdenti");
            var objet = {opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "28", datos: [""],elegir: [""],id: 0, opSelect: 1};
            ob.ajax(objet, selector);
        }
        cc++;
    });
    $("#centroFormacion").change(function () {
        $("#area").empty().append("<option>selecciona...</option>");
        var objet = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["0", "1"],
            delimitador: "[{colum:2 ,operador:0 ,valor1:" + $("#centroFormacion").val() + "}]", id: 0, opSelect: 6};
        selector = $("#area");
        ob.ajax(objet, selector);
    });

    $("#boton1").on('click', function () {
        datosV();
    });
    function datosV() {
        var selector = "btn";
        var objet = {
            opcion: 1,url: "Funcionario_Controller",nombre: "btn",
            datos: [$("#tipoUsuario").val(),$("#tipoIdenti").val(),$("#numeroIdentificacion").val(),$("#nombre").val(),$("#apellido").val(),
                $("#email").val(),$("#cargo").val(),$("#ipSena").val(),"1",$("#centroFormacion").val(),$("#area").val()]
        };
        console.log(objet);
        ob.ajax(objet, selector);
    }
});
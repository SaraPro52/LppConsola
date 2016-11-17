$(document).on('ready', function () {
    var c = 0;
    var tabla = $("#tablaarea");
    var objet = {opcion: 3, url: "Crud_Controller", nombre: "Area", tabla: "1", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};//TABLA Area
    var selector = $("#tablaarea");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Area");
    ob.TablaEspa(tabla);
    ob.ajax(objet, selector);
    $("#btnArea").on('click', function () {
        objeto = {opcion: 1, url: "Crud_Controller", nombre: "Area", tabla: "0", datos: ["", $("#areaC").val() + "", $("#areaL").val() + ""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};//TABLA Area
        ob.limpiarTabla();
        ob.ajax(objeto, selector);
    });
    $("#SelecionCentro").hover(function (e) {
        if (c == 0) {
            var objets = {opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["2", "3"], id: 0, opSelect: 4};//VISTA V_Area
            var selectors = $("#SelecionCentro");
            ob.ajax(objets, selectors);
        }
        c++;
    });
    $("#SelecionCentro").change(function (e) {
        if ($("#SelecionCentro").val() != 0) {
            $("#formularioEstado").show();
            $("#tablaarea").show();
        } else {
            ob.limpiarTabla();
            $("#formularioEstado").hide();
            $("#tablaarea").hide();
        }
    });
    $(document).on('click', '.botonclick', function (e) {
        switch (this.value) {
            case "m":
                selector = $("#selecAreafun");
                
                ob.ajax(objet,selector);
                console.log("DinamicoM" + this.id);
                break;
        }
    });
});
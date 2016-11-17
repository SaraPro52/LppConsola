$(document).on('ready', function () {
    $("#oculto1").hide();
    $("#oculto2").hide();
    //centro del area / temas  Cosas que hay que hacer
    var objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "Select", tabla: "5", datos: [""], elegir: ["0","2"], id: 0, opSelect: 4};
    var selector = $("#SelecCentro");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("Programa");
    ob.ajax(objet, selector);

//    $("#SelecCentro").change(function () {
//        $("#SelecArea").html("<option value='A0'>Seleciona...</option>");
//        var centroid =$("#SelecCentro").val();
//        if (centroid != "A0") {
//            selector = $("#SelecArea");
//            objet = {d: 0, opcion: 5, url: "Crud_Controller", nombre: "Select", tabla: "10", datos: [""], elegir: ["0","1"],
//                delimitador:"[{colum:2,operador:0,valor1:"+centroid+"}]", id: 0, opSelect: 6};
//            ob.ajax(objet, selector);
//        } 
//    });
    
//    $("#SelecCentro").change(function () {
//        var centroid =$("#SelecCentro").val();
//        if (centroid != "A0"){
////            $("#oculto1").show();
//            selector = $("#MultAreas");
//            objet = {d: 0, opcion: 5, url: "Crud_Controller", nombre: "MultiSelect", tabla: "10", datos: [""], elegir: ["0","1"],
//                delimitador:"[{colum:2,operador:0,valor1:"+centroid+"}]", id: 0, opSelect: 6};
//            ob.ajax(objet, selector);
//        } 
//    });

    $("#lblArea").on("click",function(){
        $("#oculto1").show();
        selector = $("#MultAreas");
        objet = {d: 0, opcion: 5, url: "Crud_Controller", nombre: "MultiSelect", tabla: "10", datos: [""], elegir: ["0","1"],
            delimitador:"[{colum:2,operador:0,valor1:"+centroid+"}]", id: 0, opSelect: 6};
        ob.ajax(objet, selector);
    });
    
    $("#lblTema").on("click",function(){
        $("#oculto2").show();
        selector = $("#MultTemas");
        objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "MultiSelect", tabla: "27", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
        ob.ajax(objet, selector);
    });
    
//    $("#SelecArea").change(function () {
////        $("#oculto").show();
//        if ($("#SelecArea").val() != "A0") {
//            selector = $("#MultTemas");
//            objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "MultiSelect", tabla: "27", datos: [""], elegir: ["0", "1"], id: 0, opSelect: 4};
//            ob.ajax(objet, selector);
//        }
//    });
    
    var arrayTemas = [];
    $('#MultTemas').multiSelect({
        afterSelect: function (valor) {
            arrayTemas.push(valor);
        },
        afterDeselect: function (val) {
            var buscando = $.inArray(val, arrayTemas);
            arrayTemas.splice(buscando, 1);
        }
    });

    $("#btnPrograma").on('click', function () {
        console.log(arrayTemas);
        
        var objeto = {d: 1, opcion: 1, url: "Programa_Controller", nombre: "Formato",infoP:["", Nombre, nivel],areas:arrayAreas, temas:arrayTemas};
        ob.limpiarTabla(selector);
        ob.ajax(objeto, "btn");
    });
})
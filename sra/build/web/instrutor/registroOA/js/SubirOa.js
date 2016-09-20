$(document).ready(function () {
    var objet = {Opcion: 3, url: "areacontroller", nombre: "Select"};
    var selector = {selector: $("#options1")};
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("SubirOa");
    ob.ajax(objet, selector);
    var objet = {Opcion: 3, url: "areacontroller", nombre: "Select"};
    var selector = {selector: $("#options1")};
    
    $("#subir_oa").on('click',function(){
        datosV();
    });
    function datosV() {
        var s= $("#Documento");
        console.log(s);
        var selector = ("btn");
        var objeto = {
            Opcion: 1,
            url: "oacontroller",
            nombre: "Area",
            titulo: $("#Titulo_Publicacion").val(),
            autores: $("#autores").val(),
            descripcion: $("#descripcion_oa").val(),
            area: $("#options1").val(),
            programa: $("#options2").val(),
            tema: $("#Tema").val(),
            palabras: $("#palabras_claves").val(),
            formato: $("#formato").val(),
            requisitos: $("#requisitos_instalacion").val(),
            instruciones: $("#instrucciones").val()
        };
        //ob.ajax(objeto, selector);
        //ob.archivos();
    }
});
//Pd 119 lineas vamos a ver ;)
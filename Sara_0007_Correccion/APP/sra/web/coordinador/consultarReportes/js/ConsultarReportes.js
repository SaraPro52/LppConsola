$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", idArea;
    var ob = new $.Luna("Area", $("#tablaarea"));
    ob.Vivo("Reporte");

    $("#tabs").tabs();
    $("#dataPicke1rAño").datepicker({ dateFormat: 'yy' });
    $("#dataPicker1Mes").datepicker({ dateFormat: 'M' });


});
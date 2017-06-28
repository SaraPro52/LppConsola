$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], arrAnios = [], sele = [];
    var ob = new $.Luna("Area", null);
    ob.Vivo("Reportes");
    $("#tabs").tabs();
    var jsonMes = [
        {id: "01", mes: "Enero"},
        {id: "02", mes: "Febrero"},
        {id: "03", mes: "Marzo"},
        {id: "04", mes: "Abril"},
        {id: "05", mes: "Mayo"},
        {id: "06", mes: "Junio"},
        {id: "07", mes: "Julio"},
        {id: "08", mes: "Agosto"},
        {id: "09", mes: "Septiembre"},
        {id: "10", mes: "Octubre"},
        {id: "11", mes: "Noviembre"},
        {id: "12", mes: "Diciembre"}];
    var hoy = new Date();
    var anio = hoy.getFullYear();
    for (var i = 2012; i <= anio; i++) {
        arrAnios.push({id: i, nombre: i});
    }
    datos[11] = {nombre: "Select", tipo: true};
    ob.cargarTabla(jsonMes, $(".mes"), datos[11]);
    datos[11] = {nombre: "Select", tipo: true};
    ob.cargarTabla(arrAnios, $(".anio"), datos[11]);
    jso[0] = ['Estadisticas_Controller', '[{opcion:1,reportes:[1,' + idCentro + ',0,0]}]'];
    selector[0] = "tablaReporte1";
    datos[0] = {nombre: "Reporte"};
    ob.setCons("area");
    sele[0] = $("#tablaReporte1");
    //ob.TablaEspa(sele);
    ajax(0, datos[0]);
    $(document).on('click', '.btnReporte', function (e) {
        var casoBoton = this.id;
        var mes = "mes" + casoBoton;
        var anio = "anio" + casoBoton;
        var tabla = "tablaReporte" + casoBoton;
        jso[7] = ['Estadisticas_Controller', '[{opcion:1,reportes:[' + casoBoton + ',' + idCentro + ',' + $("#" + mes).val() + ',' + $("#" + anio).val() + ']}]'];
        selector[7] = tabla;
        datos[7] = {nombre: "Reporte"};
        var table = $("#" + tabla);
        table.dataTable().fnClearTable();
        table.dataTable().fnDestroy();
        ajax(7, datos[7]);
    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i == 0) {
            jso[1] = ['Estadisticas_Controller', '[{opcion:1,reportes:[2,' + idCentro + ',0,0]}]'];
            selector[1] = "tablaReporte2";
            datos[1] = {nombre: "Reporte"};
            ob.setCons("formato");
            //ob.TablaEspa($("#tablaReporte2"));
            ajax(1, datos[1]);
        } else if (i == 1) {
            jso[2] = ['Estadisticas_Controller', '[{opcion:1,reportes:[3,' + idCentro + ',0,0]}]'];
            selector[2] = "tablaReporte3";
            datos[2] = {nombre: "Reporte"};
            ob.setCons("categoria");
            //ob.TablaEspa($("#tablaReporte3"));
            ajax(2, datos[2]);
        } else if (i == 2) {
            jso[3] = ['Estadisticas_Controller', '[{opcion:1,reportes:[4,' + idCentro + ',0,0]}]'];
            selector[3] = "tablaReporte4";
            datos[3] = {nombre: "Reporte"};
            ob.setCons("visitas del producto virtual");
            //ob.TablaEspa($("#tablaReporte4"));
            ajax(3, datos[3]);
        } else if (i == 3) {
            jso[4] = ['Estadisticas_Controller', '[{opcion:1,reportes:[5,' + idCentro + ',0,0]}]'];
            selector[4] = "tablaReporte5";
            datos[4] = {nombre: "Reporte"};
            ob.setCons("productos virtuales");
            // ob.TablaEspa($("#tablaReporte5"));
            ajax(4, datos[4]);
        } else if (i == 4) {
            jso[5] = ['Estadisticas_Controller', '[{opcion:1,reportes:[6,' + idCentro + ',0,0]}]'];
            selector[5] = "tablaReporte6";
            datos[5] = {nombre: "Reporte"};
            ob.setCons("centro de formacion");
            //  ob.TablaEspa($("#tablaReporte6"));
            ajax(5, datos[5]);
        } else if (i == 5) {
            jso[6] = ['Estadisticas_Controller', '[{opcion:1,reportes:[7,' + idCentro + ',0,0]}]'];
            selector[6] = "tablaReporte7";
            datos[6] = {nombre: "Reporte"};
            ob.setCons("publicaciones de funcionarios");
            //  ob.TablaEspa($("#tablaReporte1"));
            ajax(6, datos[6]);
        }
        else if (i==6){
            jso[7] = ['Estadisticas_Controller', '[{opcion:3}]'];
            selector[7] = "tablaReporte8";
            datos[7] = {nombre: "Reporte"};
            ob.setCons("publicaciones de funcionarios");
            //  ob.TablaEspa($("#tablaReporte1"));
            ajax(7, datos[7]);
        }
    }
});
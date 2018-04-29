$(document).ready(function () {

    var selector = [], hilo = [], jso = [], data = [], datos = [], arrAnios = [];
    var ob = new $.Luna("usuario", selector[0]);
    ob.Vivo("Estadistica");

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

    jso[0] = ['Estadisticas_Controller', '[{opcion:2,graficas:[1,' + idCentro + ',0,0]}]'];
    selector[0] = "ProductoirtualE";
    datos[0] = {nombre: "btn", btn: false};
    ajax(0, datos[0]);


    $("#btnAreaE").click(function () {
        jso[1] = ['Estadisticas_Controller', '[{opcion:2,graficas:[2,' + idCentro + ',' + $("#mesArea").val() + ',' + $("#anioArea").val() + ']}]'];
        // mes : valor 01,02,03 etc de acuerdo a los meses del año
        // anio : valor 2016,2017 etc de acuerdo al año
        selector[1] = "ProductoirtualE";
        datos[1] = {nombre: "btn", btn: true};
        ajax(1, datos[1]);
    });

    $("#btnProductoE").click(function () {
        //jso[0] = ['Estadisticas_Controller', '[{opcion:1,fechas:["' + $("#dataInicialP").val() + '","' + $("#dataFinalP").val() + '"],diagrama:1}]'];
        jso[0] = ['Estadisticas_Controller', '[{opcion:2,graficas:[1,' + idCentro + ',' + $("#mesTipo").val() + ',' + $("#anioTipo").val() + ']}]'];
        // mes : valor 01,02,03 etc de acuerdo a los meses del año
        // anio : valor 2016,2017 etc de acuerdo al año
        selector[0] = "ProductoirtualE";
        datos[0] = {nombre: "btn", btn: true};
        ajax(0, datos[0]);
    });

  
    $("#btnCategoriaE").click(function () {
        $("#dataInicialC").val();
        $("#dataFinalC").val();
        //jso[2] = ['Estadisticas_Controller', '[{opcion:1,fechas:["' + $("#dataInicialC").val() + '","' + $("#dataFinalC").val() + '"],diagrama:3}]'];

        jso[2] = ['Estadisticas_Controller', '[{opcion:2,graficas:[3,' + idCentro + ',' + $("#mesCategoria").val() + ',' + $("#anioCategoria").val() + ']}]'];
        // mes : valor 01,02,03 etc de acuerdo a los meses del año
        // anio : valor 2016,2017 etc de acuerdo al año

        selector[2] = "ProductoirtualE";
        datos[2] = {nombre: "btn", btn: true};
        ajax(2, datos[2]);
    });

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, data[i]);
        };
    }
    function peticionCompleta(i, data) {
        try {
            if (i == 0) {
                var js = jQuery.parseJSON(data);
                var datas = [];
                for (var i = 0; i < js.length; i++) {
                    var nombre = js[i].nom_tipo_formato;
                    var publicaciones = js[i].publicaciones;
                    datas.push({label: nombre[0], value: publicaciones[0]});
                }
                var ageGroupChart = new FusionCharts({
                    type: 'pie2d',
                    renderAt: 'ProductoirtualE',
                    width: '450',
                    height: '300',
                    dataFormat: 'json',
                    dataSource: {
                        "chart": {
                            "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                            "bgColor": "#ffffff",
                            "showBorder": "0",
                            "use3DLighting": "0",
                            "showShadow": "0",
                            "enableSmartLabels": "0",
                            "startingAngle": "0",
                            "showPercentValues": "1",
                            "showPercentInTooltip": "0",
                            "decimals": "1",
                            "captionFontSize": "14",
                            "subcaptionFontSize": "14",
                            "subcaptionFontBold": "0",
                            "toolTipColor": "#ffffff",
                            "toolTipBorderThickness": "0",
                            "toolTipBgColor": "#000000",
                            "toolTipBgAlpha": "80",
                            "toolTipBorderRadius": "2",
                            "toolTipPadding": "5",
                            "showHoverEffect": "1",
                            "showLegend": "1",
                            "legendBgColor": "#ffffff",
                            "legendBorderAlpha": '0',
                            "legendShadow": '0',
                            "legendItemFontSize": '10',
                            "legendItemFontColor": '#666666'
                        },
                        "data": datas
                    }
                }).render();
                if (datos[0].btn == false) {
                    //jso[1] = ['Crud_Controller', '[{opcion:3,tabla2:33,tipo:2,elegir:[0,1,2],delimitador:"[{colum:3,operador:0,valor1:' + idCentro + '}]",id:0,opSelect:6}]'];
                    jso[1] = ['Estadisticas_Controller', '[{opcion:2,graficas:[2,' + idCentro + ',0,0]}]'];
                    selector[1] = "chartArea";
                    datos[1] = {nombre: "btn", btn: false};
                    ajax(1, datos[1]);
                }
            } else if (i == 1) {
                var js = jQuery.parseJSON(data);
                var datas = [];
                for (var i = 0; i < js.length; i++) {
                    var nombre = js[i].nom_area;
                    var publicacion = js[i].publicaciones;
                    datas.push({label: nombre[0], value: publicacion[0]});
                }
                var revenueChart = new FusionCharts({
                    type: 'pie3d',
                    renderAt: 'chartArea',
                    width: '450',
                    height: '300',
                    dataFormat: 'json',
                    dataSource: {
                        "chart": {
                            "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                            "bgColor": "#ffffff",
                            "showBorder": "0",
                            "use3DLighting": "0",
                            "showShadow": "0",
                            "enableSmartLabels": "0",
                            "startingAngle": "0",
                            "showPercentValues": "1",
                            "showPercentInTooltip": "0",
                            "decimals": "1",
                            "captionFontSize": "14",
                            "subcaptionFontSize": "14",
                            "subcaptionFontBold": "0",
                            "toolTipColor": "#ffffff",
                            "toolTipBorderThickness": "0",
                            "toolTipBgColor": "#000000",
                            "toolTipBgAlpha": "80",
                            "toolTipBorderRadius": "2",
                            "toolTipPadding": "5",
                            "showHoverEffect": "1",
                            "showLegend": "1",
                            "legendBgColor": "#ffffff",
                            "legendBorderAlpha": '0',
                            "legendShadow": '0',
                            "legendItemFontSize": '10',
                            "legendItemFontColor": '#666666'
                        },
                        "data": datas
                    }
                }).render();
                if (datos[1].btn == false) {
                    //jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:35,tipo:2,elegir:[0,1,2],delimitador:"[{colum:3,operador:0,valor1:' + idCentro + '}]",id:0,opSelect:6}]'];

                    jso[2] = ['Estadisticas_Controller', '[{opcion:2,graficas:[3,' + idCentro + ',0,0]}]'];

                    selector[2] = "chartCategoria";
                    datos[2] = {nombre: "btn", btn: false};
                    ajax(2, datos[2]);
                }
            } else if (i == 2) {
                var js = jQuery.parseJSON(data);
                var datas = [];
                for (var i = 0; i < js.length; i++) {
                    var nombre = js[i].nom_categoria;
                    var publicaciones = js[i].publicaciones;
                    datas.push({label: nombre[0], value: publicaciones[0]});
                }
                var revenueChart = new FusionCharts({
                    type: 'doughnut3d',
                    renderAt: 'chartCategoria',
                    width: '450',
                    height: '300',
                    dataFormat: 'json',
                    dataSource: {
                        "chart": {
                            "numberPrefix": "$",
                            "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                            "bgColor": "#ffffff",
                            "showBorder": "0",
                            "use3DLighting": "0",
                            "showShadow": "0",
                            "enableSmartLabels": "0",
                            "startingAngle": "310",
                            "showLabels": "0",
                            "showPercentValues": "1",
                            "showLegend": "1",
                            "legendShadow": "0",
                            "legendBorderAlpha": "0",
                            "decimals": "0",
                            "captionFontSize": "14",
                            "subcaptionFontSize": "14",
                            "subcaptionFontBold": "0",
                            "toolTipColor": "#ffffff",
                            "toolTipBorderThickness": "0",
                            "toolTipBgColor": "#000000",
                            "toolTipBgAlpha": "80",
                            "toolTipBorderRadius": "2",
                            "toolTipPadding": "5",
                        },
                        "data": datas
                    }
                }).render();
            }
        } catch (e) {
            console.log(e);
        }
    }
});
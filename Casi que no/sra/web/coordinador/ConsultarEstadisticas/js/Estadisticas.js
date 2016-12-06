$(document).ready(function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("usuario", selector[0]);
    ob.Vivo("Estadisticas");

   
    jso[1] = ['Crud_Controller','[{opcion3,tabla2:31,tipo:2,elegir:[0,1,2],delimitador:"[{colum:3,operador:0,valor1:'+idCentro+'}]",id:0,opSelect:6}]'];
   //CARGA INICIAL TIPO FORMATO
   jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:33,tipo:2,elegir:[0,1,2],delimitador:"[{colum:3,operador:0,valor1:'+idCentro+'}]",id:0,opSelect:6}]'];
   //CARGA INICIAL AREA
   jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:35,tipo:2,elegir:[0,1,2],delimitador:"[{colum:3,operador:0,valor1:'+idCentro+'}]",id:0,opSelect:6}]'];
   //CARGA INICIAL CATEGORIA 
   
    
    //jso[0] = ['Estadisticas_Controller','[{opcion:1,fechas:["'+$("#dataInicialP").val()+'","'+$("#dataFinalP").val()+'"],diagrama:1}]'];
    //solo se cambia el numero de diagrama 1= tipo formato 2 = area 3 = categoria
    selector[1] = "ProductoirtualE";
    datos[1] = {nombre: "btn", worker: true, titulo: "Productos", subtitulo: "Ultimo mes"};
    ajax(1, datos[1]);

    $("#dataInicialA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataFinalA").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataInicialA").change(function () {
        $("#dataFinalA").datepicker("option", "minDate", $("#dataInicialA").val());
    });
    $("#dataFinalA").change(function () {
        $("#dataInicialA").datepicker("option", "maxDate", $("#dataFinalA").val());
    });
    $("#btnAreaE").click(function () {
        $("#dataInicialA").val();
        $("#dataFinalA").val();

    });
    $("#dataInicialP").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataFinalP").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataInicialP").change(function () {
        $("#dataFinalP").datepicker("option", "minDate", $("#dataInicialP").val());
    });
    $("#dataFinalP").change(function () {
        $("#dataInicialP").datepicker("option", "maxDate", $("#dataFinalP").val());
    });
    
    
    $("#btnProductoE").click(function () {
        $("#dataFinalP").val();
        $("#dataInicialP").val();
        jso[1] = ['Crud_Controller', '[{opcion:3,tabla:1,delimitador:[],datos:[],elegir:[0,1,2],id:0,opSelect:4}]'];
        selector[1] = "ProductoirtualE";
        datos[1] = {nombre: "btn", worker: true};
        ajax(1, datos[1]);
    });
    $("#dataInicialC").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataFinalC").datepicker({defaultDate: "+1w", changeMonth: true, numberOfMonths: 2});
    $("#dataInicialC").change(function () {
        $("#dataFinalC").datepicker("option", "minDate", $("#dataInicialC").val());
    });
    $("#dataFinalC").change(function () {
        $("#dataInicialC").datepicker("option", "maxDate", $("#dataFinalC").val());
    });
    $("#btnCategoriaE").click(function () {
        $("#dataInicialC").val();
        $("#dataFinalC").val();
    });

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i,data[i]);
        };
    }
    function peticionCompleta(i,data) {
        if (i == 0) {
            var js = jQuery.parseJSON(data);
            var data = [];
            for (var i = 0; i < js.length; i++) {
                data.push({"label": js[i].Nombre, "value": js[i].valor});
            }
            console.log(data);
            var myChart = new FusionCharts({
                type: 'InverseMSColumn2D',
                dataFormat: 'json',
                renderAt: 'chartArea',
                width: '500',
                height: '300',
                dataSource: {
                    "chart": {
                        "caption": "Average Page Load Time (hsm.com)",
                        "subCaption": "Last Week",
                        "showBorder": "0",
                        "xAxisName": "Day",
                        "yAxisName": "Time (In Sec)",
                        "numberSuffix": "s",
                        "baseFontColor": "#333333",
                        "baseFont": "Helvetica Neue,Arial",
                        "paletteColors": "#0075c2",
                        "bgColor": "#ffffff",
                        "canvasBgColor": "#ffffff",
                        "captionFontSize": "14",
                        "subcaptionFontSize": "14",
                        "subcaptionFontBold": "0",
                        "showBorder": "0",
                        "showPlotBorder": "0",
                        "showXAxisLine": "1",
                        "showLegend": "0",
                        "showShadow": "0",
                        "showCanvasBorder": "0",
                        "showAlternateHGridColor": "0",
                        "usePlotGradientColor": "0",
                        "divlineColor": "#999999",
                        "divlineThickness": "1",
                        "divLineIsDashed": "1",
                        "divLineDashLen": "1",
                        "divLineGapLen": "1",
                        "xAxisLineThickness": "1",
                        "xAxisLineColor": "#999999",
                        "toolTipColor": "#ffffff",
                        "toolTipBorderThickness": "0",
                        "toolTipBgColor": "#000000",
                        "toolTipBgAlpha": "80",
                        "toolTipBorderRadius": "2",
                        "toolTipPadding": "5"
                    },
                    "categories": [
                        {
                            "category": [
                                {"label": "Mon"},
                                {"label": "Tue"},
                                {"label": "Wed"},
                                {"label": "Thu"},
                                {"label": "Fri"},
                                {"label": "Sat"},
                                {"label": "Sun"}
                            ]
                        }
                    ],
                    "dataset": [
                        {
                            "seriesname": "Loading Time",
                            "allowDrag": "0",
                            "data": [
                                {"value": "6"},
                                {"value": "5.8"},
                                {"value": "5"},
                                {"value": "4.3"},
                                {"value": "4.1"},
                                {"value": "3.8"},
                                {"value": "3.2"}
                            ]
                        }
                    ]
                }
            }).render();
        } else if (i == 1) {
            var js = jQuery.parseJSON(data);
            var datas = [];
            for (var i = 0; i < js.length; i++) {
                datas.push({"label": js[i].Nom_Formato, "value": js[i].Cantidad});
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
        } else if (i == 2) {

        }
    }
});
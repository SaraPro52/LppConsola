$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var c = 0;
    var ob = new $.Luna("Area", $("#tablaarea"));
    ob.Vivo("Area");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla:1,delimitador:[],datos:[],elegir:[0,1,2],id:0,opSelect:4}]'];
    selector[0] = $("#tablaarea");
    datos[0] = {nombre: "Area", worker: true};
    ob.TablaEspa(selector[0]);
    ajax(0, datos[0]);
    var men = "";
    $("#btnArea").on('click', function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs");
        var selec = $(".select");
        var input, selet;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        for (var i = 0; i < selec.length; i++) {
            console.log(selec[i]);
            if (selec[i].value == "A0") {
                selet = $(selec[i]);
                selet.focus().after("<div class='remove'><font color='red'>seleccione una opcion</font><div>");
            } else {
                boo++;
            }
        }

        if (boo == 3) {
            console.log("campos");
            btnarea();
        }
    });
    function btnarea() {
        //CentroFormacion
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla:0,delimitador:[],datos:["",' + $("#areaC").val() + ',' + $("#areaL").val() + '],elegir:[0,1,2],id:0,opSelect:4}]'];
        selector[1] = $("#tablaarea");
        datos[1] = {nombre: "Area", worker: true};
        ob.limpiarTabla(selector[1]);
        men = $("#areaC").val();
        ajax(1, datos[1]);
    }
    $(document).on('click', '.botonArea', function (e) {
        switch (this.value) {
            case "m":
                selector = $("#selecAreafun");
                ob.ajax(objet, selector);
                console.log("DinamicoM" + this.id);
                break;
        }
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
            jso[2] = ['Crud_Controller', '[{opcion:5,tabla:10,delimitador:[],datos:[],elegir:[2,3],id:0,opSelect:4}]'];
            selector[2] = $("#CentroFormacion");
            datos[2] = {nombre: "Select", worker: true};
            ajax(2, datos[2]);
        }
        if (i == 1) {
            if (data[0].length == data[i]) {
                men = "La area" + men + " no se ingreso.";
            } else if (data[0] < data[i]) {
                men = "La area " + men + "se ingreso correctamente";
            }
            $.notify({
                icon: 'ti-gift',
                message: men + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
});
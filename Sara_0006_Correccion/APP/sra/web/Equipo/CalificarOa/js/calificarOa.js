function calificarPV(idLista, idRol, idNotifi) {
    var selector = [], hilo = [], jso = [], data = [], datos = [], men = "", estado = "";
    $("#iFecha").datepicker({
        minDate: 'today',
     
    });
    $("#clone").hide();
    var ob = new $.Luna("Producto virtual", $("#divContainer"));
    ob.Vivo("CalificarOA2");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:15,tipo:2,elegir:[0,1,4],delimitador:"[{colum:3,operador:0,valor1:' + idLista + '}]",id:0,opSelect:6}]'];
    selector[0] = $("#clone");
    datos[0] = {nombre: "calificar", worker: true};
    ajax(0, datos[0]);
    var fecha = "yyyy-MM-dd";
    $("#TipodeFecha").hide();
    $("#Aprueba").change(function () {
        document.getElementById('noAprueba').checked = false;
        if (idRol == 2) {
            $("#TipodeFecha").show();
            $("#TextFecha").text("fecha limite de certificacion");
        } else if (idRol == 3) {
            $("#TipodeFecha").hide();
            $("#TextFecha").text("");
        }
    });

    $("#noAprueba").change(function () {
        document.getElementById('Aprueba').checked = false;
        $("#TipodeFecha").show();
        $("#TextFecha").text("fecha limite de correcion");
    });
    $("#btnEvaluar").click(function () {
        var campo = "";
        var observacionIndi = [];
        var infoItems = [];
        var cc = 0;
        $("input:checkbox:checked").each(function () {
            campo = $(this).val();
            if (campo !== "on") {
                infoItems.push("1¤" + $("#" + campo).val() + "¤" + campo);

            }
        });

        $("input:checkbox:not(:checked)").each(function () {
            campo = $(this).val();
            if (campo !== "on") {
                infoItems.push("0¤" + $("#" + campo).val() + "¤" + campo);
                cc++;
            }
        });
        var resultado = 3;
        if (cc > 0) {
            resultado = 0;
        } else {
            resultado = 1;
        }
        if ($("#iFecha").val() == "") {
            console.log("Null");
        } else {
            fecha = $("#iFecha").val();
        }
        jso[1] = ['EvaluacionGeneral_Controller', '[{opcion:1,idNoti:' + idNotifi + ',infoEva:["' + $("#areaObservacion").val() + '","' + resultado + '","' + idVersion + '","' + idLista + '","' + idUser + '","' + fecha + '"],infoItem:[' + infoItems + ']}]'];
        selector[1] = null;
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
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
            $("#clone").show();
        } else if (i == 1) {
            jso[2] = ['Equipo_Controller', '[{opcion:2,ti:' + $("#tis").text() + '}]'];
            datos[2] = {caso: "Consultar productos virtuales"};
            ajax(2);
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        } else if (i == 2) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
        }
    }
}
    
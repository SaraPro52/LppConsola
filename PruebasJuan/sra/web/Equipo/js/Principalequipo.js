$(document).on('ready', function () {
    var hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("equipo", "");
    ob.Vivo("PricipalEquipo");

    jso[0] = ['Equipo_Controller', '[{opcion:2}]'];
    datos[0] = {caso: "Consultar productos virtuales"};
    ajax(0);

    $(document).on('click', '.Notify', function (e) {
        ajax(0);
    });
    $('.menu li').click(function (e) {
        casoUso = "text" + this.value;
        casoUso = $("#" + casoUso).text();
        jso[0] = ['Equipo_Controller', '[{opcion:' + this.value + '}]'];
        if (this.value == 2) {
            casoUso = "Consultar productos virtuales";
        }
//        } else if (this.value == 5) {
//            jso[0] = ['sesion_controller', '[{opcion:2}]'];
//        }
        datos[0] = {caso: casoUso, en: this.value};
        ajax(0);
    });

    function ajax(i) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i == 0) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
            if (datos[i].en == 0) {
                $("#cssUsuario").attr("href", "assets/css/paper-dashboardEquipo.css");
            }
        }
    }
});

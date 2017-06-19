function cargaF(ti, rol) {
    var hilo = [], jso = [], data = [], datos = [];
    console.log("Vivo??AdminiPricipal");
    var casoUso = "Deshabilitar Usuarios";
    jso[0] = ['Administrador_Controller', '[{opcion:1,ti:' + rol + '}]'];
    datos[0] = {caso: "Deshabilitar Usuarios"};
    ajax(0);

    $(document).on('click', '.Notify', function (e) {
        jso[0] = ['Administrador_Controller', '[{opcion:1,ti:' + rol + '}]'];
        datos[0] = {caso: "Deshabilitar Usuarios"};
        ajax(0);
    });
    $('.menu li').click(function (e) {
        if (this.value == 7) {
            jso[2] = ['principal', '[{opcion:2,se:' + ti + '}]'];
           // ajax(2);
        } else {
            casoUso = "text" + this.value;
            casoUso = $("#" + casoUso).text();
            jso[1] = ['Administrador_Controller', '[{opcion:' + this.value + ',ti:' + rol + '}]'];
            datos[1] = {caso: casoUso};
            ajax(1);
        }
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
        if ((i == 0) || (i == 1)) {
            $("#CasoNombre").text(datos[i].caso);
            $("#cuerpo").empty();
            $("#cuerpo").append(data[i]);
            if (datos[i].en == 0) {
                $("#cssUsuario").attr("href", "assets/css/paper-dashboardEquipo.css");
            }
        } else if (i == 2) {
            $("#estru").empty();
            $("#estru").append(data[i]);
        }
    }
}

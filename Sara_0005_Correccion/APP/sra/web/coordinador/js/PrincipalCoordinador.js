function cargaC(idRol, ti) {
    var hilo = [], jso = [], data = [], datos = [];
    console.log("Vivo??coordinador");
    var casoUso = "Consultar Estadisticas";
    jso[0] = ['coordinador_Controller', '[{opcion:1,ti:' + idRol + '}]'];
    datos[0] = {caso: "Habilitar Producto Virtual"};
    ajax(0);
    $(document).on('click', '.Notify', function (e) {
        jso[0] = ['coordinador_Controller', '[{opcion:1,ti:' + idRol + '}]'];
        datos[0] = {caso: "Habilitar Producto Virtual"};
        ajax(0);
    });
    $('.menu li').click(function (e) {
        if (this.value == 5) {
            jso[2] = ['principal', '[{opcion:2,se:' + ti + '}]'];
           // ajax(2);    
        } else {
            jso[1] = ['coordinador_Controller', '[{opcion:' + this.value + ',ti:' + idRol + '}]'];
            casoUso = "text" + this.value;
            casoUso = $("#" + casoUso).text();
             datos[1] = {caso: casoUso, en: this.value};
            if (this.value == 1) {
                casoUso = "Habilitar Producto Virtual";
                datos[1] = {caso: casoUso};
            }
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
            if (datos[i].en == 4) {
                $("#cssUsuario").attr("href", "assets/css/paper-dashboardCoordinador.css");
            }
        } else if (i == 2) {
            $("#estru").empty();
            $("#estru").append(data[i]);
        }
    }
}
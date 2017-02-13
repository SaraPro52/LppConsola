function cargaI(idRol, ti,js) {
    var hilo = [], jso = [], data = [], datos = [], casoUso = "";
    console.log("Vivo??Instrutor");
    jso[0] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
    datos[0] = {caso: "Notificaciones producto virtual"};
    ajax(0);
    $(document).on('click', '.Notify', function (e) {
        jso[0] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
        datos[0] = {caso: "Notificaciones producto virtual",tipo:2};
        ajax(0);
    });

    $('.menu li').click(function (e) {
        if (this.value == 7) {
            jso[2] = ['sesion_controller', '[{opcion:2,se:' + ti + '}]'];
            ajax(2);
        } else {
            jso[1] = ['Instrutor_Controller', '[{opcion:' + this.value + ',ti:' + idRol + '}]'];
            casoUso = "text" + this.value;
            datos[1] = {caso: $("#" + casoUso).text(),tipo:4};
            if (this.value == 3) {
                datos[1] = {caso: "Notificaciones de los  productos virtuales",tipo:3};
            }else if (this.value==1){
                datos[1] = {caso: "Subir producto virtual",tipo:1};
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
            if (datos[i].tipo == 4) {
                $("#cssUsuario").attr("href", "assets/css/paper-dashboardEquipo.css");
            }
        } else if (i == 2) {
            $("#estru").empty();
            $("#estru").append(data[i]);
        }
    }
}
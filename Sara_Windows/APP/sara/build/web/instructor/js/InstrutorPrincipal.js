function cargaI(idRol, ti, js) {
    var hilo = [], jso = [], data = [], datos = [], casoUso = "";
    console.log("Vivo??Instrutor");
    jso[0] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
    datos[0] = {caso: "Notificaciones de los Productos Virtuales"};
    ajax(0);
    $(document).on('click', '.Notify', function (e) {
        jso[0] = ['Instrutor_Controller', '[{opcion:3,ti:' + idRol + '}]'];
        datos[0] = {caso: "Notificaciones de los Productos Virtuales", tipo: 2};
        ajax(0);
    });
    $('.menu li').click(function (e) {
        jso[1] = ['Instrutor_Controller', '[{opcion:' + this.value + ',ti:' + idRol + '}]'];
        casoUso = "text" + this.value;
        datos[1] = {caso: $("#" + casoUso).text(), tipo: 4};
        if (this.value == 3) {
            datos[1] = {caso: "Notificaciones de los Productos Virtuales", tipo: 3};
        } else if (this.value == 1) {
            datos[1] = {caso: "Subir un Producto Virtual", tipo: 1};
        } else if (this.value == 0) {
            datos[1] = {caso: "Consultar Productos Virtuales", tipo: 1};
        } else if (this.value == 2) {
            datos[1] = {caso: "Correguir Productos Virtuales", tipo: 1};
        } else if (this.value == 6) {
            datos[1] = {caso: "Agregar una Version al Producto Virtual", tipo: 1};
        }
        ajax(1);
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
                $("#cssUsuario").attr("href", "assets/css/paper-dashboardInstructor.css");
            }
        } else if (i == 2) {
            $("#estru").empty();
            $("#estru").append(data[i]);
        }
    }
}
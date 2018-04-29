$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], funcionario = 0;
    var ob = new $.Luna("usuarios", selector[0]);
    ob.Vivo("Asignar Roles");
    jso[0] = ['Funcionario_Controller', '[{opcion:6,asignarRol:[2,' + idCentro + ',0,0]}]'];
    selector[0] = $("#tablaARoles");
    datos[0] = {nombre: "AsignarRol"};
    ajax(0, datos[0]);

    ob.TablaEspa(selector[0]);
    $(document).on('click', '.modificarRol', function (e) {
        var arr = this.id.split("$$");
        funcionario = arr[0];
        $("#nomFun").val(arr[1]);
        $("#divModificarROl").show();
    });


    $("#btnModificarRol").click(function () {
        if ($("#selectRol").val() != "A0") {
            jso[2] = ['Funcionario_Controller', '[{opcion:6,asignarRol:[1,' + idCentro + ',' + funcionario + ',' + $("#selectRol").val() + ']}]'];
            datos[2] = {nombre: "btn"};
            ajax(2, datos[2]);
        } else {
            alert("Selecione un rol para el funcionario");
        }
    });

    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i, datos);
        };
    }
    function peticionCompleta(i, datos) {
        if (i == 0) {
            jso[1] = ['Funcionario_Controller','[{opcion:6,asignarRol:[0,0,0,0]}]'];
            selector[1] = $("#selectRol");
            datos[1] = {nombre: "Select"};
            ajax(1, datos[1]);
        } else if (i == 2) {
            var daMen = data[i];
            alert(daMen);
            if (daMen[0] != null) {
                estado = ("success");
                men = "El funcionario " +  $("#nomFun").val() + " se le a asignado el rol";
            } else {
                estado = ("error");
                men = "El funcionario  " + $("#nomFun").val() + " no se le asignado el rol";
            }
            $("#divModificarROl").hide();
            $.notify(men, estado); 
        }
    }

});
    
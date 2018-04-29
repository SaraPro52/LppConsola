$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "";
    var ob = new $.Luna("Carga masiva", null);
    ob.Vivo("Carga masiva");
    //peticon
    jso[0] = ['CargueMasivo_Controller', '[{opcion:2}]'];
    selector[0] = $("#selectTable");
    datos[0] = {nombre: "SelectArray"};
    ajax(0, datos[0]);

    var options = {
        beforeSend: function () {
            $("#percent").show();
            $("#progressbox").show();
            $("#progressbar").width('0%');
            $("#message").empty();
            $("#percent").html("0%");
            $("#formularioss").show();
        },
        uploadProgress: function (event, position, total, percentComplete) {
            $("#progressbar").width(percentComplete + '%');
            $("#percent").html(percentComplete + '%');
            if ((percentComplete > 1) && (percentComplete < 101)) {
                $("#message").html("<font color='blue'>Cargando el archivo... espera</font>");
            }
        },
        success: function () {
            var path = $("#myfile").val();
            var filename = path.replace(/C:\\fakepath\\/, '');
            jso[5] = ['CargueMasivo_Controller', '[{opcion:1,archivo:' + filename + ',tabla:' +  $("#selectTable option:selected").text() + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn"};
            ajax(5, datos[5]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#formCargaM").ajaxForm(options);

    $('.input-file').change(function () {
        var nomArh = document.getElementById("myfile").files[0].name;
        ;
        var ex = nomArh.split(".");
        nomArh = ex[ex.length - 1];
        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (nomArh != "csv") {
            $("#myfile").val('');
            $("#myfile").notify(
                    "El archivo no es de tipo .csv", 'warn',
                    {position: "right"}
            );
        }
        if (siezekiloByte > $(this).attr('size')) {
            $(this).val('');
            $("#myfile").notify(
                    "El archivo supera el limite de 25 mb", 'warn',
                    {position: "right"}
            );
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
        if (i == 5) {
            var daMen = data[i].split("$$");
            men = $("#selectTable option:selected").text();
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La carga de datos en la tabla " + men + " a sido " + daMen[1];
            } else {
                estado = ("error");
                men = "La carga de datos en la tabla " + men + " a sido " + daMen[1];
            }
            $.notify(men, estado);
            $("#myfile").val("");
        }
    }
});

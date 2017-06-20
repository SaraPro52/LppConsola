$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "";
    var ob = new $.Luna("Ciudade", $("#tablaCiudad"));
    ob.Vivo("Ciudad");
    //peticon
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:6,tipo:1,elegir:[0,1],delimitador:[],id:0,opSelect:4}]'];
    selector[0] = $("#selectTable");
    datos[0] = {nombre: "Select"};
    ob.TablaEspa(selector[0]);
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
            $("#contenedor").show();
            $("#formularioss").hide();
            jso[5] = ['ProductoVirtual_Controller', '[{opcion:3,correccion:[' + idUser + ',' + idver + '],archivoNom:\"' + $("#myfile").val() + '\",idNot:' + idNot + ',url:' + url + '}]'];
            selector[5] = null;
            datos[5] = {nombre: "btn"};
            $("#formularioss").show();
            ajax(5, datos[5]);
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);

    $('.input-file').change(function () {
        var nomArh = $(this).val();
        var ex = nomArh.split(".");
        nomArh = ex[ex.length - 1];

        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (ex == "csv") {
            $(this).val('');
            $(".inputNotifi").notify(
                    "El archivo no es de tipo .csv", 'warn',
                    {position: "right"}
            );
        }
        if (siezekiloByte > $(this).attr('size')) {
            $(this).val('');
            $(".inputNotifi").notify(
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
        if (i == 1) {
            if (data[0].length == data[i].length) {
                men = "La tabla " + men + " No se le ingresaron los datos.";
                estado = ("error");
            } else if (data[0].length < data[i].length) {
                men = "La tabla " + men + " se le ingresaron correctamente los datos";
                estado = ("success");
            }
            $.notify(men, estado);
        }
    }
});

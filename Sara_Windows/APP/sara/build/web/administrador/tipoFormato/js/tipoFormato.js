$(document).on('ready', function () {
    var selector = [], hilo = [], jso = [], data = [], datos = [], estado = "", men = "", idTipoFormato = 0;
    var ob = new $.Luna("tipode formato", null);
    ob.Vivo("Tipo de formato");
    jso[0] = ['Modificar_Controller', '[{opcion:6,TipoFormatoAdmin:[0,0,0,0]}]'];
    selector[0] = $("#tablaTipoFormato");
    ob.TablaEspa(selector[0]);
    datos[0] = {nombre: "consultaTipoFormatos"};
    ajax(0, datos[0]);


    $(document).on('click', '.btnModificarTipoFor', function (e) {
        var valors = this.id.split("$$");
        idTipoFormato = valors[0];
        $("#formato").val(valors[1]);
        $("#desFormato").val(valors[2]);
        $("#btnAccionFormato").val("Modificar formato");
    });


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
            men = $("#formato").val();
            if ($("#btnAccionFormato").val() == "Modificar formato") {
                jso[4] = ['Modificar_Controller', '[{opcion:6,TipoFormatoAdmin:[2,' + idTipoFormato + ',' + $("#formato").val() + ',' + filename + ']}]']
                datos[4] = {nombre: "btn"};
                ajax(4, datos[4]);
            } else {
                jso[3] = ['Modificar_Controller', '[{opcion:6,TipoFormatoAdmin:[1,0,' + $("#formato").val() + ',' + filename + ']}]'];
                datos[3] = {nombre: "btn"};
                ajax(3, datos[3]);
            }
        },
        error: function () {
            $("#message").html("<font color='red'>Error: al subir el archivo</font>");
        }
    };
    $("#UploadForm").ajaxForm(options);


    $('.input-file').change(function () {
        var nomArh = document.getElementById("myfile").files[0].name;
        ;
        var ex = nomArh.split(".");
        nomArh = ex[ex.length - 1];
        var sizeByte = this.files[0].size;
        var siezekiloByte = parseInt(sizeByte / 1024);
        if (nomArh == "png") {

        } else {
            $("#myfile").val('');
            $("#myfile").notify(
                    "El archivo no es de tipo png", 'warn',
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
        if (i == 3) {//agregar tipo de formato
            $("#formato").val("");
            $("#myfile").val("");
            $("#btnCentro").html("Agregar formato");
            if (data[3].length > data[0].length) {
                selector[1] = $("#tablaTipoFormato");
                datos[7] = {nombre: "consultaTipoFormatos"};
                ob.cargarTabla(data[i], selector[1], datos[7]);
                estado = ("success");
                men = "Tipo de formato " + men + " se a guardado correctamente";

            } else {
                estado = ("error");
                men = "Tipo de formato " + men + " no se a agregado";
            }
            $.notify(men, estado);
        } else if (i == 4) {//Modificar formato
            try {
                var response = jQuery.parseJSON(data[i]);
                if (typeof response == 'object') {
                    selector[1] = $("#tablaTipoFormato");
                    datos[7] = {nombre: "consultaTipoFormatos"};
                    ob.cargarTabla(data[i], selector[1], datos[7]);
                    estado = ("success");
                    men = "Tipo de formato " + men + " se a modificado correctamente";
                }
            } catch (e) {
                estado = ("error");
                men = "Tipo de formato " + men + " no se a modificado";
            }
            $("#formato").val("");
            $("#myfile").val("");
            $("#btnCentro").html("Agregar formato");
            $.notify(men, estado);
        }
    }
});

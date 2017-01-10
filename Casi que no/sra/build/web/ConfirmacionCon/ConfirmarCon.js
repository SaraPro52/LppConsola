$(document).ready(function () {
    var fun = '<%= session.getAttribute("fun")%>';
    $("#btnContra").click(function () {
        if ($("#cont1").val() == $("#cont2").val()) {
            var objeto = {opcion: 3, url: "Funcionario_Controller", con: $('#cont1').val(), id: fun};
            $.ajax({
                url: objeto.url,
                type: "POST",
                async: true,
                cache: false,
                datatype: 'json',
                data: objeto,
                success: function (json) {
                    console.log(json);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus + errorThrown + " Disculpa.");
                }
            });
            $("#con1").html("");
            $("#con2").html("");
            location.replace('index.jsp?c=2');
        }
    });
});



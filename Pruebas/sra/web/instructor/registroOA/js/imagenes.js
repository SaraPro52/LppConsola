$(document).on('ready', function () {
   
    $("#btnEnviar").on("click",function () {
        var formData = new FormData(document.getElementById("formuploadajax"));
        formData.append("dato", "valor");
        console.log(formData.getPrototypeOf());
        formData.append(f.attr("name"), $(this)[0].files[0]);
        $.ajax({
            url: "narchivos",
            type: "post",
            dataType: "html",
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        })
                .done(function (res) {
                    $("#mensaje").html("Respuesta: " + res);
        });
        
    });
});
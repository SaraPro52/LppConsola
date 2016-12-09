$(document).ready(function(){
   $("#btnContra").on("Click",function(){
       if($("#con1").val() == $("#con2").val()){
           alert($("#con1").val());
           var peti = {contra : $("#con1").val()};
           $.ajax({
                url:"ActivacionCuenta_Controller",
                type:"POST",
                async: true,
                cache: false,
                datatype: 'json',
                data: peti,
                success: function (json) {
                    console.log(json);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus + errorThrown + " Disculpa.");
                }
           });
           $("#con1").html("");$("#con2").html("");
       }
   });
});



<%-- 
    Document   : ConfirmarCon
    Created on : 9/11/2016, 09:15:58 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <h2>Confirmar Contraseña</h2>
        </header>
        <section>
            <article>
                <form>
                    <label>Contraseña</label>
                    <input type="password" id="cont1" name="cont1">
                    <label>Confirmar Contraseña</label>
                    <input type="password" id="cont2" name="cont2">
                    <input type="button" id="btnContra" value="Cambiar Clave">
                </form>
            </article>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script>
        $(document).ready(function(){
            var fun = '<%= session.getAttribute("fun")%>';
            $("#btnContra").click(function(){
                if($("#cont1").val() == $("#cont2").val()){
                    var objeto = {opcion: 2, url: "Crud_Controller",tabla: "18",elegir: [""], actualizar: "[{'8':'"+$('#cont1').val()+"'}]", id: fun, opSelect: 2};
                    $.ajax({
                         url:objeto.url,
                         type:"POST",
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
                    $("#con1").html("");$("#con2").html("");
                    location.replace('index.jsp?c=2');
                }
            });
         });
    </script>
</html>

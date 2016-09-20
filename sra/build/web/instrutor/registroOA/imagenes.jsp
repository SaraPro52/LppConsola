<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="instrutor/registroOA/js/imagenes.js"></script>
    </head>
    <body>
        <form enctype="multipart/form-data" id="formuploadajax" method="post" action="archivoscontroller">
        
            Nombre: <input type="text" name="nombre" placeholder="Escribe tu nombre">
            <br />
            <input  type="file" id="archivo1" name="archivo1"/>
        <br />
            <input  type="file" id="archivo2" name="archivo2"/>
            <br />
            <button id="btnEnviar" >Aceptar</button>

        </form>
    </body>
</html>
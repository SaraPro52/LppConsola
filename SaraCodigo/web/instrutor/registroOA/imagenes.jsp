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
        <form  id="UploadForm" action="imagencontroller" method="post" enctype="multipart/form-data">
            
            <input type="file" size="60" id="myfile" name="myfile">
            <input type="submit" value="Ajax ¿enserio?"> 
            <div id="progressbox">
                <div id="progressbar"></div>
                <div id="precent"></div>
            </div>
            <br/>
            <div id="message"></div>
        </form>
    </body>
</html>

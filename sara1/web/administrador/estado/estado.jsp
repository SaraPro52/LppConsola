<%-- 
    Document   : estado
    Created on : 26/07/2016, 10:22:29 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Estado</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/estiloEstado.css"> 
    </head>
    <body>
        <header>
            <div id="logo">
                <img src="imagen/jeje.png" width="300px" height="85px">
            </div>
        </header>
        <div id="contenedor">
            <form id = "formulario" method="post" action="estadoServlet">
                <p>Añadir estado</p>
                <p>
                    <input type="text" name="Estado">
                    <input type="hidden" name="Opcion" value="1">

                </p>
                <p>
                    <input type="submit" id="btnEstado" value="Guardar estado" class="btn btn-info">
                </p>
            </form>
        </div>	
        <div id="footer">
            <footer id="derechos">
                <p>
                    Desarrollado por: Equipo de desarrollo SARApro
                </p>
                <p>
                    Reservados todos los derechos
                </p>
                <p>
                    2016
                </p>
            </footer>
        </div>
    </body>
</html>

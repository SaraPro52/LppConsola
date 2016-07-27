<%-- 
    Document   : estado
    Created on : 27/07/2016, 09:03:57 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form id = "formulario" method="post" action="../../estadosservlet">

            <input type="text" name="Estado">
            <input type="hidden" name="Opcion" value="1">
            <input type="submit" id="btnEstado" value="Guardar estado">
        </form>
    </body>
</html>

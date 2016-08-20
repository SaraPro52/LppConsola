<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="equipocontroller" method="post">
            <label id="Basura">Casos de uso Equipos...</label>
            <select name="Opcion" value="Blanco">
                <option value="1">Lista de chequeo</option>
            </select>
            <input type="submit" name="btnenviar" value="Aceptar">
        </form>
    </body>
</html>

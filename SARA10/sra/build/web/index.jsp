<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <title>Inicio de sesion</title>
    </head>
    <body>
        <form action="sesion_controller" method="post">
            <select name="Opcion" value="blanco" >
                <option value="0">Administrador</option>
                <option value="1">Coordinador</option>
                <option value="2">Equipo tecnico</option>
                <option value="3">Equipo pedagogico</option>
                <option value="4">Instrutor</option>
                <option value="5">Subir oa</option>
                <option value="6">Modificar</option>
                <option value="7">Imagenes</option>
            </select>
            <input type="submit" name="btnenviar" value="Aceptar">
        </form>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/sesion.js"></script>        
    </body>
</html>

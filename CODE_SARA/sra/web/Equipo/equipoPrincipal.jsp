<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
       
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="Equipo/js/Principalequipo.js"></script>
        <title>Principal equipo</title>
    </head>
    <body class="col-md-12">
        <aside class="col-md-2">
            <ul class="nav nav-pills nav-stacked col" id="seleciona" >
                <li class="active"><a href="#">Pagina principal</a></li>
                <li value="aa"><a href="#">Crear lista de chequeo</a></li>
                <li><a href="#">Modificar Lista</a></li>
                <li><a href="#">Evalular OA</a></li>
            </ul>
        </aside>
        <form action="equipocontroller" method="post">
            <label >Casos de uso Equipos...</label>
            <select name="Opcion" value="Blanco">
                <option value="1">Lista de chequeo</option>
                <option value="2">Modificar lista de chequeo</option>
            </select>
            <input type="submit" name="btnenviar" value="Aceptar">
        </form>
    </body>
</html>

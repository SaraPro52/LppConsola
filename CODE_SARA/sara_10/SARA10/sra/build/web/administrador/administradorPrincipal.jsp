<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <title>Pagina pricipal administrador</title>
    </head>
    <body class="col-md-12">
        <form class="col-md-8" action="Administrador_Controller" method="post">
            <label for="Opcion">Seleciona el caso de uso ;)</label>
            <select class="" name="Opcion" value="blanco" >
                <option value="1">Estados de funcionario</option>
                <option value="2">Estados de version</option>
                <option value="3">Areas</option>
                <option value="4">Ciudad</option>
                <option value="5">Registrar funcionario</option>
                <option value="6">Principal instrutor</option>
                <option value="7">Modificar Lista</option>
                <option value="8">Listar Objetos</option>
                <option value="11">Registro OA</option>
            </select>
            <input type="submit" class="btn btn-info" name="btnenviar" value="Aceptar">
        </form>    
        <article class="col-md-10 col-md-offset-2">
        </article>
        <article class="col-md-10 col-md-offset-1">
            <table id="tablaAdmi" class="table table-hover ">
                <thead>
                <th>#</th>
                <th>Nombre</th>
                <th>Cargo</th>
                <th>Area</th>
                <th>Estado</th>
                <th>Inhabilitar</th>
                </thead>
                <tbody>
                </tbody>
            </table>
        </article>        
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/admiPrincipal.js"></script>
</html>

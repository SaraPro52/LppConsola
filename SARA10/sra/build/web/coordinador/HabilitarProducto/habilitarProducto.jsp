<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <title>Habilitar Producto</title>
    </head>
    <body>
        <section>
            <label class="col-md-12 col-md-offset-3"><h2>Habilitar producto virtual</h2></label>
            <br>
            <article class="col-md-8 col-md-offset-1" id="tabla">
                <table class="table table-striped" id="tablaAprobar">
                    <thead>
                        <tr>
                            <th> # </th>
                            <th>Nombre producto</th>
                            <th>Numero version</th>
                            <th>Fecha de vigencia</th>  
                            <th></th>   
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
            <article class="col-md-12" id="lista">
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="coordinador/HabilitarProducto/js/HabilitarProducto.js"></script>
</html>

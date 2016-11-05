<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <title>JSP Page</title>
    </head>
    <body>
        <article class="col-md-8 col-md-offset-1" id="tabla">
            <table class="table table-striped" id="tablaNotificacion">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Contenido</th>
                        <th>Fecha de envio</th>
                        <th>Detalles PV</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </article>

    </body>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script src="instructor/Correcion/js/Correcion.js" type="text/javascript"></script>
</html>

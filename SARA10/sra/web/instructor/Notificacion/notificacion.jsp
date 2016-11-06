<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <body>
        <article class="col-md-8 col-md-offset-1" id="tabla">
            <table class="table table-striped" id="tablaNotificacion">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Contenido</th>
                        <th>Fecha de envio</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </article>
    </body>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script src="instructor/Notificacion/js/notificacion.js" type="text/javascript"></script>
</html>

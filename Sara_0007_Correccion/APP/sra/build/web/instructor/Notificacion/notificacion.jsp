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
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <section class="col-md-12">
                            <article class="col-md-10 col-md-offset-1"  style="margin-top: 3%;">
                                <table class="table table-striped" id="tablaNotificacion">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Nombre del producto virtual</th>
                                            <th>N° Versión</th>
                                            <th>Contenido</th>
                                            <th>Fecha de envío</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script src="instructor/Notificacion/js/notificacion.js" type="text/javascript"></script>
</html>

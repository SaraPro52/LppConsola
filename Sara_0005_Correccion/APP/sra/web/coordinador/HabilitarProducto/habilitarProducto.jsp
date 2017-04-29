<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
         <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <section>
                            <article class="col-md-8 col-md-offset-1" id="tabla" style="margin-top: 3%;">
                                <table class="table table-striped" id="tablaAprobar">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Nombre producto</th>
                                            <th>Número versión</th>
                                            <th></th>   
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </article>
                            <article class="col-md-12" id="lista">
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="coordinador/HabilitarProducto/js/HabilitarProducto.js"></script>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
         <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
        <title>Asignar roles</title>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <section class="col-md-12">

                            <label class="col-md-12 col-md-offset-3"><h2>Asignar roles</h2></label>
                            <br>
                            <article class="col-md-8 col-md-offset-1" id="tabla">
                                <table class="table table-striped" id="tablaARoles">
                                    <thead>
                                        <tr>
                                            <th> # </th>
                                            <th>Nombre Funcionario</th>
                                            <th>Cargo</th>
                                            <th>Area</th>  
                                            <th>Centro</th>
                                            <th>Ciudad</th>
                                            <th>Rol</th>
                                            <th>Asignar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="bus">
                                    </tbody>
                                </table>
                            </article>
                            <article class="col-md-12" id="lista">
                        </section>
                    </div>
                </div>
            </div>


    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="coordinador/AsignarRoles/js/asignarRoles.js"></script>
</html>

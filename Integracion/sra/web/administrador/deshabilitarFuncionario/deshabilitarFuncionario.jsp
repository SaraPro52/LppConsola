<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deshabilitar Funcionario</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="contenedor">
                        <section>
                            <article class="col-md-10 col-md-offset-1"> 
                                <table id="tablaAdmi" class="table table-hover ">
                                    <thead>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Cargo</th>
                                    <th>Area</th>
                                    <th>Estado</th>
                                    <th>Deshabilitar</th>
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
    </div>
    <input type="hidden" id="ajaxComplet">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/deshabilitarFuncionario/js/admiPrincipal.js"></script>
</html>
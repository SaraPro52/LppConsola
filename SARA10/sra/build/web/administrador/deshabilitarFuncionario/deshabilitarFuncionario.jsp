<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deshabilitar Funcionario</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    </head>
    <body>
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
    </body>
    <input type="hidden" id="ajaxComplet">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/deshabilitarFuncionario/js/admiPrincipal.js"></script>

</html>

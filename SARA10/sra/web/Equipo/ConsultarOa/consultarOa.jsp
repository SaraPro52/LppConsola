<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ConsultarOa</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">

    </head>
    <body>
        <section>
            <article class="col-md-8 col-md-offset-1" id="tabla">
                <table class="table table-striped" id="tablaConsultarOa">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre producto</th>
                            <th>Nombre estado</th>   
                            <th>Numero version</th>   
                            <th>Fecha vigencia</th>   
                            <th>Evaluar</th>   
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
            <article class="col-md-12" id="lista">
        </section>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Lista de chequeo para evaluar Producto virtual</h4>
                    </div>
                    <div class="modal-body">
                        <article  id="tabla">
                            <table class="table table-striped" id="tablaListaChequeo">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre de lista</th>
                                        <th>Descripcion</th>
                                        <th>Fecha</th>
                                        <th>Escojer</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </article>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="Equipo/ConsultarOa/js/consultarOa.js"></script>
</html>

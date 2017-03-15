<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedorFormulario col-md-10" style="margin-left:9%">
                            <div class="form-group contenedorInsert">
                                <section>
                                    <article class="col-md-6">
                                        <label for="EstadoC">Nombre de la ciudad</label>
                                        <input required type="text" class="form-control inputs" name="Ciudad" id="Ciudad" placeholder="Digita nombre de la ciudad">
                                        <button type="button" id="btnCiudad" class="btn btn-primary"  name="button"> Guardar Ciudad</button>
                                    </article>

                                    <article class="col-md-10 col-offset-2s">
                                        <table id="tablaCiudad" class=" display table table-hover">
                                            <thead>
                                                <tr class="active">
                                                    <td>#</td>
                                                    <td>Nombre</td>
                                                    <td>Modificar</td>
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
            </div>
        </div>
    </body>
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script> 
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="administrador/ciudad/js/ciudad.js"></script>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link rel="stylesheet" href="css/freelancer.css" media="screen" title="no title" charset="utf-8">
        <title>Ciudades</title>
    </head>
    <body>
        <section class="col-md-12">
            <article class="col-md-8">
                <label><h3>Ciudades</h3></label>
                <form id = "formularioEstado">
                    <div class="form-group col-xs-12 floating-label-form-group controls">   
                        <label>Ciudad</label>
                        <input type="text"  name="Ciudad" id="Ciudad" placeholder="Ciudad" required data-validation-required-message="Ingresa la ciudad.">
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="col-md-8"><button type="button" id="btnCiudad"  class="btn btn-block">Guardar Ciudad</button> </div>
                </form>

            </article>
            <article class="col-md-6 col-offset-2s">
                <table id="tablaCiudad" class="display table table-hover">
                    <thead>
                        <tr class="active">
                            <td>#</td>
                            <td>Nombre</td>
                            <td>Actualizar</td>
                            <td>Descartar</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="administrador/ciudad/js/ciudad.js"></script>
</html>

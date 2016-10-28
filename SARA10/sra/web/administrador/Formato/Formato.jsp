<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link rel="stylesheet" href="css/freelancer.css" media="screen" title="no title" charset="utf-8">
    </head>
    <body>
        <section class="row">
            <form id="FormCategoria" novalidate>
                <label class="col-md-12 col-md-offset-4"><h3>Formatos</h3></label>
                <br>
                <article id="formulario">  
                    <div class="row control-group col-md-6 col-md-offset-2">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label class="col-md-12">Nombre del formato:</label>
                            <input type="text" class="form-control" placeholder="Nombre del formato" id="formato"  required data-validation-required-message="Ingresa el nombre del formato.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>

                    <div class="row control-group col-md-6 col-md-offset-2">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label class="col-md-12">Descripcion del formato:</label>
                            <input type="text" class="form-control" placeholder="descripcion del formato:" id="descripcion"  required data-validation-required-message="Ingresa la descripcion del formato.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </article>
                <div class="col-md-4 col-md-offset-2">   
                    <button type="button" class="btn btn-block" id="btnformato"  name="button">Guardar formato</button>
                </div>
            </form>
        </section>   
        <article class="col-md-9">
            <table id="tablaformato" class="table table-hover">
                <thead>
                    <tr class="active">
                        <td>#</td>
                        <td >Nombre formato</td>
                        <td>Descripcion del formato</td>
                        <td></td>
                        <td></td>   
                    </tr>
                </thead>
                <tbody id="tablabody">
                </tbody>
            </table>
        </article>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="administrador/Formato/js/Formato.js"></script>
</html>
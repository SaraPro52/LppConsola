<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
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
                        <div class="contenedorFormulario col-md-10">
                            <div class="form-group contenedorInsert">
                                <div class="col-md-6">
                                    <label for="formato">Nombre del Formato</label>
                                    <input required placeholder="Nombre del Formato" type="text" class="form-control inputs" name="formato" id="formato" required="true">
                                </div>
                                <div class="col-md-6">
                                    <label for="descripcion">Descripción Formato</label>
                                    <input required type="text" placeholder="Descripción Formato"  class="form-control inputs" id="descripcion" name="descripcion" required="true">
                                </div> 
                                <div class="col-md-12 col-md-offset-1 espacio">
                                    <button type="button" class="btn btn-info espacio" id="btnformato"  name="button">Guardar formato</button>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <article style="margin-left:8%;" class="col-md-8 ">
                    <table id="tablaformato" class="table table-hover">
                        <thead>
                            <tr class="active">
                                <td>Numero </td>
                                <td>Nombre formato</td>
                                <td>Descripcion del formato</td>
                            </tr>
                        </thead>
                        <tbody id="tablabody">
                        </tbody>
                    </table>
                </article>
                </body>
                <script type="text/javascript" charset="utf8" src="assets/js/jquery-1.10.2.js"></script>
                <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
                <script type="text/javascript" charset="utf8" src="js/notify.js"></script> 
                <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
                <script type="text/javascript" charset="utf8" src="administrador/Formato/js/Formato.js"></script>
                </html>
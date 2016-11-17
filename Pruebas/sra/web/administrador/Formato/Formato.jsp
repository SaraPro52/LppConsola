<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <article class="col-md-12">
                                <form id = "formularioEstado">
                                    <label for="formato">Nombre del formato</label>
                                    <input  placeholder="Nombre del formato" type="text"  name="formato" id="formato" required="true">
                                    <label for="descripcion">descripcion formato</label>
                                    <textarea placeholder="descripcion formato" id="descripcion" name="descripcion" required="true"></textarea>
                                    <button type="button" class="btn btn-info" id="btnformato"  name="button">Guardar formato</button>
                                </form>
                            </article>
                            <article class="col-md-10 ">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script> 
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/Formato/js/Formato.js"></script>
</html>
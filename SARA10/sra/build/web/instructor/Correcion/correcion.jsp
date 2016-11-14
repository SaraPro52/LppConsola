<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">


                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Coreguir producto virtual</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="modalInfo"></div>
                                    <form enctype="multipart/form-data" id="formuploadajax" method="post" action="narchivos">
                                        <input  type="file" id="archivo2" name="archivo2"/><br/>
                                        <button id="btnEnviar" >Aceptar</button>
                                    </form>
                                </div>
                                </article>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="contenedor">
                            <article class="col-md-8 col-md-offset-1" id="tabla">
                                <table class="table table-striped" id="tablaNotificacion">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Contenido</th>
                                            <th>Fecha de envio</th>
                                            <th>¿Correguir?</th>
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
        </div>
    </body>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script src="instructor/Correcion/js/Correcion.js" type="text/javascript"></script>
</html>

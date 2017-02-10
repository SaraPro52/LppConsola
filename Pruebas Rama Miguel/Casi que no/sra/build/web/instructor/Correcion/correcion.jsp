<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row"> 
                    <div id="Clona">
                        <label  id="textitem"></label>
                        <textarea class="form-control" id="observacionItem" readonly="true"></textarea>
                    </div>
                    <article id="formularioss">
                        <p id="NomLista"></p>
                        <p id="FechaEvaluacion"></p>
                         <label>Items de lista de chequeo</label>
                        <div id="Respuestaitem"></div>    
                         <label>Observacion general del producto</label>
                         <textarea id="ObservacionGeneral" class="form-control" cols="60" rows="8" readonly="true"></textarea>
                        <div class="form-group">
                            <label for="Documento">Adjuntar OA</label>
                            <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                                <input required type="file" class="form-control-file inputs" id="myfile" name="myfile" aria-describedby="fileHelp">
                                <input type="submit" class=" btn btn-info  col-md-6"  value="Correguir produto virtual" id="correguir_oa">
                                <div id="progressbox">
                                    <div id="progressbar"></div>
                                    <div id="percent">0%</div>
                                </div>
                                <br />
                                <div id="message"></div>
                            </form>
                        </div>
                    </article>

                    <div class="col-md-12">
                        <div class="contenedor">
                            <article style="margin-top: 3%;" class="col-md-8 col-md-offset-1" id="tabla">
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
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="instructor/Correcion/js/Correcion.js" type="text/javascript"></script>
</html>

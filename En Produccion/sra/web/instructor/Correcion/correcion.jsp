<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row"> 
                    <div id="Clona" class="col-md-12">
                        <label  id="textitem" class="col-md-12"></label>
                        <textarea class="form-control" id="observacionItem" readonly="true"></textarea>
                    </div>
                    <article id="formularioss"  style="display: none;"  >
                        <br/>
                        <p id="NomLista" class="col-md-12 col-md-offset-1"></p>
                        <p id="FechaEvaluacion" class="col-md-12 col-md-offset-1"></p>
                        <label class="col-md-12 col-md-offset-1">Items de lista de chequeo</label>
                        <div id="Respuestaitem" class="col-md-8 col-md-offset-1"></div>    
                        <label class="col-md-8 col-md-offset-1">Observacion general del producto</label>
                        <div class="col-md-8 col-md-offset-1">
                            <textarea id="ObservacionGeneral" class="form-control" cols="60" rows="8" readonly="true"></textarea>
                        </div>                         
                        <div class="form-group">
                            <label for="" class="col-md-10 col-md-offset-1">Adjuntar correcion de producto virtual</label>
                            <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                                <input required type="file" class="form-control-file inputs col-md-offset-1" id="myfile" name="myfile" aria-describedby="fileHelp">
                                <input type="submit" class=" btn btn-info  col-md-4 col-md-offset-1"  value="Correguir produto virtual" id="correguir_oa">
                                <div id="progressbox" class="col-md-12 col-md-offset-1">
                                    <div id="progressbar"></div>
                                    <div id="percent">0%</div>
                                </div>
                                <br />
                                <div id="message" class="col-md-12 col-md-offset-1"></div>
                                <br/>
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

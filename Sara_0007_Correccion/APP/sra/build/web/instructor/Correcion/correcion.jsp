<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div id="Clona" class="col-md-12">
                    <label  id="textitem" class="col-md-12"></label>
                    <textarea class="form-control" id="observacionItem" readonly="true"></textarea>
                </div>
                <article id="formularioss"  style="display: none;">
                    <br/>
                    <p id="NomLista" class="col-md-12 col-md-offset-1"></p>
                    <p id="FechaEvaluacion" class="col-md-12 col-md-offset-1"></p>
                    <label class="col-md-12 col-md-offset-1">Items de lista de chequeo:</label>
                    <div id="Respuestaitem" class="col-md-8 col-md-offset-1"></div>
                    <label class="col-md-8 col-md-offset-1">Observación general del producto virtual:</label>
                    <div class="col-md-8 col-md-offset-1">
                        <textarea id="ObservacionGeneral" class="form-control" cols="60" rows="8" readonly="true"></textarea>
                    </div>
                    <div class="col-md-12 col-md-offset-1" >
                        <label for="" class="col-md-10">Adjuntar correción de producto virtual</label>
                        <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                            <div class="col-md-offset-1">
                                <input type="file" size="26120" id="myfile" class="inputs input-file" name="myfile">
                            </div>
                            <input type="submit" class=" btn btn-info  col-md-4 col-md-offset-1"  value="Correguir producto virtual" id="correguir_oa">
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
                        <article  class="col-md-12 " id="tabla">
                            <table class="table table-striped" id="tablaNotificacion">
                                <thead >
                                    <tr >
                                        <th >N°</th>
                                        <th >Nombre del producto</th>
                                        <th >N° versión</th>
                                        <th >Contenido</th>
                                        <th >Fecha de envío</th>
                                        <th >Descargar</th>
                                        <th >Corregir</th>
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
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="instructor/Correcion/js/Correcion.js" type="text/javascript"></script>
</div>

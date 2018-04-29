<div class="content">
    <div class="container-fluid">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
        <div class="row">
            <div class="col-md-12">
                <div class="contenedorFormulario col-md-10"style="margin-top: 3%;">

                    <label class="col-md-8 col-md-offset-1">Nombre del formato:</label>
                    <div class="col-md-8 col-md-offset-1">
                        <input required class="form-control inputs" type="text" id="formato">
                    </div>

                    <label for="" class="col-md-10">Adjuntar imagen de formato</label>
                    <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                        <div class="col-md-offset-1">
                            <input type="file" size="26120" id="myfile" class="inputs input-file" name="myfile">
                        </div>
                        <input type="submit" class=" btn btn-info  col-md-4 col-md-offset-1"  value="Agregar formato" id="btnAccionFormato">
                        <div id="progressbox" class="col-md-12 col-md-offset-1">
                            <div id="progressbar"></div>
                            <div id="percent">0%</div>
                        </div>
                        <br />
                        <div id="message" class="col-md-12 col-md-offset-1"></div>
                        <br/>
                    </form>
                    <table id="tablaTipoFormato" class="table table-hover">
                        <thead>
                            <tr class="active">
                                <td>N°</td>
                                <td>Nombre</td>
                                <td>Url</td>
                                <td>Modificar tipo de formato</td>
                            </tr>
                        </thead>
                        <tbody id="tablabody">
                        </tbody>
                    </table>  
                </div>
            </div>
        </div>
        <script type="text/javascript" charset="utf8" type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.form.js"></script>
        <script type="text/javascript" charset="utf8" src="js/notify.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
        <script type="text/javascript" charset="utf8" src="administrador/tipoFormato/js/tipoFormato.js"></script>
    </div>
</div>
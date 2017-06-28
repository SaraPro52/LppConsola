<div class="content">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="contenedorFormulario col-md-10" style="margin-left:9%">
                    <div class="form-group contenedorInsert">
                        <section>
                            <form id="formCargaM" action="archivos" method="post" enctype="multipart/form-data">
                                <div class="col-md-6 col-md-offset-3">
                                    <div class="col-md-12">
                                        <label for="selectTable">Tabla a cargar</label>
                                        <select class="form-control" id="selectTable">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="archivocsv">Archivo a cargar</label>
                                        <input type="file" size="26120" id="myfile" class="inputs input-file" name="myfile">
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" name="button" class="btn btn-info">Guardar informacion</button>
                                    </div>
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.form.js"></script>
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="administrador/cargaM/js/cargaM.js"></script>
</div>
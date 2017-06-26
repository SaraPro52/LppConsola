<div class="content">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="contenedorFormulario col-md-10"style="margin-top: 3%;">
                    <div class="form-group contenedorInsert">
                        <div class="col-md-12">
                            <label>Programa de Formación</label>
                            <input required type="text" id="nomPro" class="form-control inputs" placeholder="Digite el programa de formacion">
                        </div>
                        <div class="col-md-12" style="margin-top:3%;">
                            <label>Centro de Formación</label>
                            <select class="form-control select" id="SelecCentro">
                                <option value="A0">Seleccionar...</option>
                            </select>
                        </div>
                        <div class="col-md-12" style="margin-top:3%;">
                            <label>Nivel de Formación</label>
                            <select class="form-control select" id="nivel">
                                <option value="A0">Seleccionar...</option>>
                                <option value="Tecnico">Técnico</option>
                                <option value="Tecnologo">Tecnólogo</option>
                                <option value="Especialidad">Especialidad</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Temas</label>
                            <select  id="MultTemasFormacion" class="MultTemasFormacion"  multiple='multiple' title="Busca un tema..">
                                <option>Null</option>
                            </select>
                        </div>
                        <div class="col-md-6" id="multiselectAreas" style="display: none;">
                            <label>Áreas</label>
                            <select  id="MultAreas" class="MultAreas"  multiple='multiple' title="Busca una area..">
                            </select>
                        </div>
                        <button id="btnPrograma" type="button" class="btn btn-primary">Guardar Programa</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" charset="utf8" type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/notify.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/jquery.multi-select.js"></script>
        <script type="text/javascript" src="js/jquery.quicksearch.js"></script>
        <script type="text/javascript" charset="utf8" src="administrador/programa/js/programa.js"></script>
    </div>
</div>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

                        <div class="contenedorFormulario col-md-10">
                            <div class="form-group contenedorInsert">
                                <div class="col-md-12">
                                    <label>Programa de Formación</label>
                                    <input required type="text" id="nomPro" class="form-control inputs" placeholder="Digite el programa de formacion">
                                </div>

                                <div class="col-md-12" style="margin-top:3%;">
                                    <label>Centro de Formación</label>
                                    <select class="form-control select" id="SelecCentro">
                                        <option value="A0">Seleciona...</option>
                                    </select>
                                </div>
                                <div class="col-md-12" style="margin-top:3%;">
                                    <label>Nivel de Formación</label>
                                    <select class="form-control select" id="nivel">
                                        <option value="A0">seleccione.....</option>>
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
            </div>
    </body>
    <script type="text/javascript" charset="utf8" src="assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script>
    <script type="text/javascript" src="js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="js/jquery.quicksearch.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="administrador/programa/js/programa.js"></script>
</html>

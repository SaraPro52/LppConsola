<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedorFormulario col-md-10">
                            <div class="form-group contenedorInsert">
                                <div class="col-md-12">
                                    <label>Programa de formación</label>
                                    <input type="text" id="nomPro" class="form-control" placeholder="Ej: Diseño multimedia">
                                </div>


                                <div class="col-md-12">
                                    <div class="col-md-6" style="margin-top:3%;">
                                        <label>Centro de formacion</label>
                                        <select id="SelecCentro">
                                            <option value="A0">Seleciona...</option>
                                        </select>

                                        <div>
                                            <label>Áreas</label>
                                        </div>
                                        <select class="Mult" id="MultAreas"></select>
                                    </div>
                                    <div class="col-md-6" style="margin-top:3%;">
                                        <label>Nivel de Formación</label>
                                        <select id="nivel">
                                            <option value="Tecnico">Técnico</option>
                                            <option value="Tecnologo">Tecnólogo</option>
                                            <option value="Especialidad">Especialidad</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">

                                        <label>Temas</label>
                                        <select id="MultTemas"></select>
                                    </div>
                                </div>
                                <button id="btnPrograma" type="button" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>    
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script src="js/notify.js"></script> 
    <script src="js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/programa/js/programa.js"></script>
</html>
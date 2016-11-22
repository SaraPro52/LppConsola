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
                                <label>Centro de formacion</label>
                                <select id="SelecCentro">
                                    <option value="A0">Seleciona...</option>
                                </select>
                                <label class="Mult">Areas</label>
                                <select class="Mult" id="MultAreas"></select>
                                <label>Temas</label>
                                <select id="MultTemas"></select>
                                <label>Programa de formación</label>
                                <input type="text" id="nomPro" class="form-control" placeholder="Ej: Diseño multimedia">
                                <select id="nivel">
                                    <option value="Tecnico">Tecnico</option>
                                    <option value="Tecnologo">Tecnologo</option>
                                </select>
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
    <script src="assets/js/bootstrap-notify.js"></script> 
    <script src="js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/programa/js/programa.js"></script>
</html>
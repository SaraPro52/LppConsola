<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Areas</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
    </head>
    <body>
        <div class="content" style="margin-left: 10%;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedorFormulario col-md-10">

                            <div class="col-md-6">
                                <label>Líder del área</label>
                                <input required placeholder="Lider del Área" type="text" class="form-control inputs"  name="areaL" id="areaL" >
                            </div>
                            <div class="col-md-6">
                                <label>Nombre del área</label>
                                <input required  placeholder="Nombre del Área"type="text" class="form-control inputs"  name="areac" id="areaC">
                            </div>
                            <div class="col-md-6">
                                <label>Centro de formación</label>
                                <select required class="form-control select" id="CentroFormacion">
                                    <option value="A0">Seleccionar...</option>
                                </select>
                            </div>
                            <div class="col-md-6"> 
                                <button type="button" class="btn btn-info" id="btnArea" style="margin-bottom:2%" name="button">Guardar área</button>    
                            </div>
                            <div class="col-md-10 col-md-offset-1">
                                <table id="tablaarea" class="table table-hover">
                                    <thead>
                                        <tr class="active">
                                            <td>N°</td>
                                            <td >Nombre área</td>
                                            <td>Lider de área</td>
                                            <td>Modificar lider</td>
                                        </tr>
                                    </thead>
                                    <tbody id="tablabody">
                                    </tbody>
                                </table>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="administrador/area/js/area.js"></script>
</html>